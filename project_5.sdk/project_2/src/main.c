/*
 * main.c
 *
 *  Created on: 20-Feb-2018
 *      Author: HIMAN
 */


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "platform.h"
#include "xparameters.h"
#include "xstatus.h"
#include "microblaze_sleep.h"
#include "PmodOLEDrgb.h"
#include "PmodENC.h"
#include "xgpio.h"
#include "xintc.h"
#include "pwm_tmrctr.h"
#include "xtmrctr.h"
#include "xil_printf.h"
#include <math.h>
#include "stdbool.h"

/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
#include "semphr.h"

// Clock frequencies
#define CPU_CLOCK_FREQ_HZ        XPAR_CPU_CORE_CLOCK_FREQ_HZ
#define AXI_CLOCK_FREQ_HZ        XPAR_CPU_M_AXI_DP_FREQ_HZ

// AXI timer parameters
#define AXI_TIMER_0_DEVICE_ID     XPAR_AXI_TIMER_0_DEVICE_ID
#define AXI_TIMER_0_BASEADDR      XPAR_AXI_TIMER_0_BASEADDR
#define AXI_TIMER_0_HIGHADDR 	  XPAR_AXI_TIMER_0_HIGHADDR

#define AXI_TIMER_1_DEVICE_ID     XPAR_AXI_TIMER_1_DEVICE_ID
#define AXI_TIMER_1_BASEADDR      XPAR_AXI_TIMER_1_BASEADDR
#define AXI_TIMER_1_HIGHADDR 	  XPAR_AXI_TIMER_1_HIGHADDR

#define AXI_TIMER_2_DEVICE_ID     XPAR_AXI_TIMER_2_DEVICE_ID
#define AXI_TIMER_2_BASEADDR      XPAR_AXI_TIMER_2_BASEADDR
#define AXI_TIMER_2_HIGHADDR 	  XPAR_AXI_TIMER_2_HIGHADDR

// GPIO parameters
#define GPIO_SWBUT_DEVICE_ID		XPAR_AXI_GPIO_0_DEVICE_ID
#define GPIO_BUT_INPUT_CHANNEL		1
#define GPIO_SW_INPUT_CHANNEL		2
#define SWITCHES_ENABLE_MASK 		0x003f

#define GPIO_LED_DEVICE_ID		    XPAR_AXI_GPIO_1_DEVICE_ID
#define GPIO_LED_OUTPUT_CHANNEL		1

#define GPIO_DIRSEN_DEVICE_ID		XPAR_AXI_GPIO_2_DEVICE_ID
#define GPIO_DIR_OUTPUT_CHANNEL		1
#define GPIO_SEN_INPUT_CHANNEL		2

// OLEDrgb parameters
#define RGBDSPLY_DEVICE_ID        XPAR_PMODOLEDRGB_0_DEVICE_ID
#define RGBDSPLY_GPIO_BASEADDR    XPAR_PMODOLEDRGB_0_AXI_LITE_GPIO_BASEADDR
#define RGBDSPLY_GPIO_HIGHADDR    XPAR_PMODOLEDRGB_0_AXI_LITE_GPIO_HIGHADD
#define RGBDSPLY_SPI_BASEADDR     XPAR_PMODOLEDRGB_0_AXI_LITE_SPI_BASEADDR
#define RGBDSPLY_SPI_HIGHADDR     XPAR_PMODOLEDRGB_0_AXI_LITE_SPI_HIGHADDR

// PmodENC parameters
#define PMODENC_DEVICE_ID       XPAR_PMODENC_0_DEVICE_ID
#define PMODENC_BASEADDR        XPAR_PMODENC_0_S00_AXI_BASEADDR
#define PMODENC_HIGHADDR        XPAR_PMODENC_0_S00_AXI_HIGHADDR

// Interrupt Controller parameters
#define INTC_DEVICE_ID			XPAR_INTC_0_DEVICE_ID
#define FIT_INTERRUPT_ID		XPAR_MICROBLAZE_0_AXI_INTC_FIT_TIMER_0_INTERRUPT_INTR
#define GPIO_SWBUT_INTERRUPT_ID		XPAR_MICROBLAZE_0_AXI_INTC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define GPIO_SEN_INTERRUPT_ID		XPAR_MICROBLAZE_0_AXI_INTC_AXI_GPIO_2_IP2INTC_IRPT_INTR
#define AXI_TIMER_INTERRUPT_ID		XPAR_MICROBLAZE_0_AXI_INTC_AXI_TIMER_2_INTERRUPT_INTR

// WatchDOG Timer parameters


#define TmrCtrNumber            0
#define TmrCtrNumber2            0

// Microblaze peripheral instances
XTmrCtr        AXITimerInst;                                            // PWM timer instance
XTmrCtr        AXITimerInst2;
PmodOLEDrgb    pmodOLEDrgb_inst;                                       //PmodOLEDrgb instance
PmodENC        pmodENC_inst;                                            //PmodENC_inst
XIntc 	       IntrptCtlrInst;
XGpio	       MOTORSENSOR_inst;
XGpio 	       LED_inst;
XGpio 	       SWITCHBUTTON_inst;


//Function Declarations
int do_init(void);
int Initialize_GPIOS(void);
int Initiaize_INTERRUPTS(void);
int AXI_Timer_initialize(void);
int Initialize_PWM(void);
void PMDIO_putnum(PmodOLEDrgb* InstancePtr, int32_t num, int32_t radix);
void PMDIO_puthex(PmodOLEDrgb* InstancePtr, uint32_t num);
void PMDIO_itoa(int32_t value, char *string, int32_t radix);
void PERIPHERAL_Handler(void);
void PULSECOUNT_Handler();
void SECONDS_Handler();


enum _GPIO_btns {BTNR, BTNL, BTND, BTNU, BTNC};

//DIR outputs
#define GPIO_SET_DIR_0				1

//LED mask
#define GPIO_LED_MASK			0x0000FFFF


//Push Button Masks
#define GPIO_BTNR_MASK 			8
#define GPIO_BTNL_MASK			4
#define GPIO_BTND_MASK			16
#define GPIO_BTNU_MASK			2
#define GPIO_BTNC_MASK			1
#define GPIO_ALLBTNS_MASK		31

//Switches masks
#define	SWITCHES_5_4 0x0030
#define	SWITCHES_3_2 0xc
#define	SWITCHES_1_0 0x0003

//Macros for switches
#define	SELECT_KP	0
#define	SELECT_KI	1
#define	SELECT_KD	2

#define	INCDEC_BY_1	0
#define	INCDEC_BY_5	1
#define	INCDEC_BY_10	2

#define KP_SETLED			1
#define KI_SETLED			2
#define KD_SETLED			4

#define TIMER_ID	1
#define DELAY_10_SECONDS	10000UL
#define DELAY_1_SECOND		1000UL
#define TIMER_CHECK_THRESHOLD	9


/*static TaskHandle_t xcontrolMotorInput;
static TaskHandle_t xcontrolPID;*/
static TaskHandle_t xdisplay;
static TaskHandle_t xreadParameter;
//static TaskHandle_t xcontrolMotorOutput;
static TaskHandle_t xmaster;

static QueueHandle_t xdisplayQueue;
static QueueHandle_t xInputQueue;
static QueueHandle_t xOutputQueue;
static QueueHandle_t xControlQueue;
static QueueHandle_t xPeripheralQueue;
static SemaphoreHandle_t xSemaphore;

unsigned char PID_MAGNITUDE, PID_SELECT, MOTOR_MAGNITUDE;
unsigned char  btns, msk;
volatile unsigned char switches;
unsigned char kp,kd,ki;
int Error,add_const;
unsigned char speed,magnitude;
int flag;
volatile int count, oldcount;
unsigned int pulse;
unsigned char conv,duty;
//uint16_t RotaryIncr =1,RotaryCnt,OldRotaryCnt = 0xFFFF;
//bool RotaryNoNeg = false;
unsigned int drpm,arpm;

//void PID_Control(void);
void PERIPHERAL_Handler(void);
void PULSECOUNT_Handler();
void SECONDS_Handler();
int isbutton_pressed(enum _GPIO_btns btnslct);
unsigned char GET_SWITCHES(void);
void SET_LED(short unsigned int ledval);

/*static void controlMotorInputTask(void *pvParameters);
static void controlPIDTask(void *pvParameters);*/
static void displayTask(void *pvParameters);
static void readParameterTask(void *pvParameters);
//static void controlMotorOutputTask(void *pvParameters);
void masterTask (void *pvParameters);

unsigned char kp = 0,ki = 0,kd = 0;
volatile int count = 0,oldcount = 0;




int main(void)
{
  //Initialization of Platform
  init_platform();

  uint32_t sts;
  //Initialize the System and Peripherals
  sts = do_init();
  if (XST_SUCCESS != sts)
    {
      xil_printf(" System Initialization failed\n");
      exit(1);
    }


  XGpio_InterruptGlobalEnable(&SWITCHBUTTON_inst);
  XGpio_InterruptEnable(&SWITCHBUTTON_inst, SWITCHES_ENABLE_MASK);
  XGpio_InterruptGlobalEnable(&MOTORSENSOR_inst);
  XGpio_InterruptEnable(&MOTORSENSOR_inst, 0xffff);

  microblaze_enable_interrupts();

  //WDT Expired Event
  //Initialize FreeRTOS

  //Creation of Master Thread
  xTaskCreate(masterTask,
	      (const char *)"Master",
	      configMINIMAL_STACK_SIZE,
	      NULL,
	      tskIDLE_PRIORITY,
	      &xmaster);

  //Start FreeRTOS
  vTaskStartScheduler();
  for( ;; );

   //Cleanup Platform
   cleanup_platform();



  return 0;
}



int do_init()
{
  int status;

  // initialize the PMod544IO driver and the PmodENC and PmodCLP
  status = pmodENC_initialize(&pmodENC_inst, PMODENC_BASEADDR);
  if (status == XST_FAILURE)
    {
      xil_printf("ENC failed\n");
      return XST_FAILURE;
    }

  // Initialize the OLED display
  OLEDrgb_begin(&pmodOLEDrgb_inst, RGBDSPLY_GPIO_BASEADDR, RGBDSPLY_SPI_BASEADDR);

  status = Initialize_GPIOS();
  if (status == XST_FAILURE)
    {
      xil_printf("Oops....GPIO INITIALIZATION failed\n");
      return XST_FAILURE;
    }

  // Initialize the AXI Timer
  status = AXI_Timer_initialize();
  if (status != XST_SUCCESS)
    {
      xil_printf("Oops....INTERRUPTS INITIALIZATION failed\n");
      return XST_FAILURE;
    }

  status = Initiaize_INTERRUPTS();
  if (status == XST_FAILURE)
    {
      xil_printf("Oops....INTERRUPTS INITIALIZATION failed\n");
      return XST_FAILURE;
    }

  status = Initialize_PWM();
  if (status != XST_SUCCESS)
    {
      xil_printf("GPIO 0 failed\n");
      return XST_FAILURE;
    }

  OLEDrgb_Clear(&pmodOLEDrgb_inst);
  OLEDrgb_SetFontColor(&pmodOLEDrgb_inst,OLEDrgb_BuildRGB(220,20,60));
  OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 0);
  OLEDrgb_PutString(&pmodOLEDrgb_inst, "RC:");
  OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 7, 0);
  OLEDrgb_PutString(&pmodOLEDrgb_inst, "DC:");
  OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 2);
  OLEDrgb_PutString(&pmodOLEDrgb_inst, "kp:");
  OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 5, 2);
  OLEDrgb_PutString(&pmodOLEDrgb_inst, "ki:");
  OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 10, 2);
  OLEDrgb_PutString(&pmodOLEDrgb_inst, "kd:");
  OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 5);
  OLEDrgb_PutString(&pmodOLEDrgb_inst, "DRPM:");
  OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 7);
  OLEDrgb_PutString(&pmodOLEDrgb_inst, "ARPM:");

  return XST_SUCCESS;
}

int Initialize_GPIOS()
{
  int status;
  // initialize the GPIO instances
  status = XGpio_Initialize(&MOTORSENSOR_inst, GPIO_DIRSEN_DEVICE_ID);
  if (status != XST_SUCCESS)
    {
      xil_printf("GPIO 2 failed\n");
      return XST_FAILURE;
    }
  XGpio_SetDataDirection(&MOTORSENSOR_inst, GPIO_DIR_OUTPUT_CHANNEL, 0);
  //XGpio_SetDataDirection(&MOTORSENSOR_inst, GPIO_SEN_INPUT_CHANNEL, 1);

  // initialize the GPIO instances
  status = XGpio_Initialize(&LED_inst, GPIO_LED_DEVICE_ID);
  if (status != XST_SUCCESS)
    {
      xil_printf("GPIO 1 failed\n");
      return XST_FAILURE;
    }
  XGpio_SetDataDirection(&LED_inst, GPIO_LED_OUTPUT_CHANNEL, 0);

  // initialize the GPIO instances
  status = XGpio_Initialize(&SWITCHBUTTON_inst, GPIO_SWBUT_DEVICE_ID);
  if (status != XST_SUCCESS)
    {
      xil_printf("GPIO 0 failed\n");
      return XST_FAILURE;
    }
  XGpio_SetDataDirection(&SWITCHBUTTON_inst, GPIO_BUT_INPUT_CHANNEL, 0x1F);
  XGpio_SetDataDirection(&SWITCHBUTTON_inst, GPIO_SW_INPUT_CHANNEL, 0xFFFF);

  return XST_SUCCESS;
}

int Initialize_PWM(void)
{
  uint32_t status;        //Status from Xilinx Library calls

  //Initialize the PWM
  status = PWM_Initialize(&AXITimerInst, AXI_TIMER_0_DEVICE_ID,false, AXI_CLOCK_FREQ_HZ);
  if(status != XST_SUCCESS)
    {
      xil_printf("Failed to initialize PWM\n");
      return XST_FAILURE;
    }

  //Start the PWM
  status =  PWM_Start(&AXITimerInst);
  if(status != XST_SUCCESS)
    {
      xil_printf("\nFailed to start the PWM");
      return XST_FAILURE;
    }
  return XST_SUCCESS;
}

int Initiaize_INTERRUPTS()
{
  int status;

  // initialize the interrupt controller
  status = XIntc_Initialize(&IntrptCtlrInst, INTC_DEVICE_ID);
  if (status != XST_SUCCESS)
    {
      xil_printf("Interrupt Controller Initialization failed\n");
      return XST_FAILURE;
    }


  // connect the GPIO handler to the interrupt
  status = XIntc_Connect(&IntrptCtlrInst, GPIO_SWBUT_INTERRUPT_ID,(XInterruptHandler)PERIPHERAL_Handler,(void *)0);
    if (status != XST_SUCCESS)
      {
        xil_printf("Connection Failed For PULSE_Handler to INTC\n");
        return XST_FAILURE;

      }

  // connect the GPIO handler to the interrupt
 status = XIntc_Connect(&IntrptCtlrInst, GPIO_SEN_INTERRUPT_ID,(XInterruptHandler)PULSECOUNT_Handler,(void *)0);
  if (status != XST_SUCCESS)
    {
      xil_printf("Connection Failed For PULSE_Handler to INTC\n");
      return XST_FAILURE;

    }

  // connect the GPIO handler to the interrupt
 status = XIntc_Connect(&IntrptCtlrInst, AXI_TIMER_INTERRUPT_ID,(XInterruptHandler)SECONDS_Handler,(void *)0);
  if (status != XST_SUCCESS)
    {
      xil_printf("Connection Failed For SECONDS_Handler to INTC\n");
      return XST_FAILURE;

    }

  // start the interrupt controller such that interrupts are enabled for
  // all devices that cause interrupts.
  status = XIntc_Start(&IntrptCtlrInst, XIN_REAL_MODE);
  if (status != XST_SUCCESS)
    {
      xil_printf("INTC START failed\n");
      return XST_FAILURE;
    }

  // enable the GPIO interrupt
  XIntc_Enable(&IntrptCtlrInst, GPIO_SWBUT_INTERRUPT_ID);

  // enable the GPIO interrupt
  XIntc_Enable(&IntrptCtlrInst, AXI_TIMER_INTERRUPT_ID);

  // enable the GPIO interrupt
  XIntc_Enable(&IntrptCtlrInst, GPIO_SEN_INTERRUPT_ID);

  return XST_SUCCESS;
}

int AXI_Timer_initialize(void)
{

  uint32_t status;				// status from Xilinx Lib calls
  u32		ctlsts;		// control/status register or mask
  u32		ctlsts2;

  status = XTmrCtr_Initialize(&AXITimerInst,AXI_TIMER_0_DEVICE_ID);
  if (status != XST_SUCCESS) {
      xil_printf("AXI Timer INITIALIZATION Failed\n");
      return XST_FAILURE;
  }

  status = XTmrCtr_Initialize(&AXITimerInst2,AXI_TIMER_2_DEVICE_ID);
  if (status != XST_SUCCESS) {
      xil_printf("AXI Timer 2 INITIALIZATION Failed\n");
      return XST_FAILURE;
  }
  status = XTmrCtr_SelfTest(&AXITimerInst, TmrCtrNumber);
  if (status != XST_SUCCESS) {
      return XST_FAILURE;
  }
  status = XTmrCtr_SelfTest(&AXITimerInst2, TmrCtrNumber2);
  if (status != XST_SUCCESS) {
      return XST_FAILURE;
  }
  ctlsts = XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_EXT_GENERATE_MASK | XTC_CSR_LOAD_MASK |XTC_CSR_DOWN_COUNT_MASK ;
  XTmrCtr_SetControlStatusReg(AXI_TIMER_0_BASEADDR, TmrCtrNumber,ctlsts);
  ctlsts2 = XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_LOAD_MASK |XTC_CSR_DOWN_COUNT_MASK |XTC_CSR_ENABLE_INT_MASK ;
  XTmrCtr_SetControlStatusReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2,ctlsts2);

  //Set the value that is loaded into the timer counter and cause it to be loaded into the timer counter
  // Frquency is increased to 400 kHz from 4 Khz to see if hardware can detect the pwm signal
  XTmrCtr_SetLoadReg(AXI_TIMER_0_BASEADDR, TmrCtrNumber, 24998);
  XTmrCtr_LoadTimerCounterReg(AXI_TIMER_0_BASEADDR, TmrCtrNumber);
  ctlsts = XTmrCtr_GetControlStatusReg(AXI_TIMER_0_BASEADDR, TmrCtrNumber);
  ctlsts &= (~XTC_CSR_LOAD_MASK);
  XTmrCtr_SetControlStatusReg(AXI_TIMER_0_BASEADDR, TmrCtrNumber, ctlsts);

  ctlsts = XTmrCtr_GetControlStatusReg(AXI_TIMER_0_BASEADDR, TmrCtrNumber);
  ctlsts |= XTC_CSR_ENABLE_TMR_MASK;
  XTmrCtr_SetControlStatusReg(AXI_TIMER_0_BASEADDR, TmrCtrNumber, ctlsts);


  XTmrCtr_SetLoadReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2, 99999998);
  XTmrCtr_LoadTimerCounterReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2);
  ctlsts2 = XTmrCtr_GetControlStatusReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2);
  ctlsts2 &= (~XTC_CSR_LOAD_MASK);
  XTmrCtr_SetControlStatusReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2, ctlsts2);

  ctlsts2 = XTmrCtr_GetControlStatusReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2);
  ctlsts2 |= XTC_CSR_ENABLE_TMR_MASK;
  XTmrCtr_SetControlStatusReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2, ctlsts2);

  XTmrCtr_Enable(AXI_TIMER_0_BASEADDR, TmrCtrNumber);
  XTmrCtr_Enable(AXI_TIMER_2_BASEADDR, TmrCtrNumber2);

  return XST_SUCCESS;

}

void PMDIO_putnum(PmodOLEDrgb* InstancePtr, int32_t num, int32_t radix)
{
  char  buf[16];

  PMDIO_itoa(num, buf, radix);
  OLEDrgb_PutString(InstancePtr,buf);

  return;
}

void PMDIO_puthex(PmodOLEDrgb* InstancePtr, uint32_t num)
{
  char  buf[9];
  int32_t   cnt;
  char  *ptr;
  int32_t  digit;

  ptr = buf;
  for (cnt = 7; cnt >= 0; cnt--) {
      digit = (num >> (cnt * 4)) & 0xF;

      if (digit <= 9)
	{
	  *ptr++ = (char) ('0' + digit);
	}
      else
	{
	  *ptr++ = (char) ('a' - 10 + digit);
	}
  }

  *ptr = (char) 0;
  OLEDrgb_PutString(InstancePtr,buf);

  return;
}

void PMDIO_itoa(int32_t value, char *string, int32_t radix)
{
  char tmp[33];
  char *tp = tmp;
  int32_t i;
  uint32_t v;
  int32_t  sign;
  char *sp;

  if (radix > 36 || radix <= 1)
    {
      return;
    }

  sign = ((10 == radix) && (value < 0));
  if (sign)
    {
      v = -value;
    }
  else
    {
      v = (uint32_t) value;
    }

  while (v || tp == tmp)
    {
      i = v % radix;
      v = v / radix;
      if (i < 10)
	{
	  *tp++ = i+'0';
	}
      else
	{
	  *tp++ = i + 'a' - 10;
	}
    }
  sp = string;

  if (sign)
    *sp++ = '-';

  while (tp > tmp)
    *sp++ = *--tp;
  *sp = 0;

  return;
}



void PERIPHERAL_Handler(void)
{
  BaseType_t xHigherPriorityTaskWoken;
      xHigherPriorityTaskWoken = pdFALSE;

  /*if(isbutton_pressed(BTNC))
    {
      xil_printf("BTNC\n");
      kp = 0;
      kd = 0;
      ki = 0;
      PWM_SetParams(&AXITimerInst, 4*10^3 ,0);
      exit(1);
    }
  switches = GET_SWITCHES();

  PID_SELECT = (switches & SWITCHES_3_2) >> 2;

  PID_MAGNITUDE = (switches & SWITCHES_5_4)>> 4;

  switch(PID_SELECT)
  {

    case SELECT_KP: 	//Kp is selected
      xil_printf("KP is selected\n");
      SET_LED(KP_SETLED);
      switch(PID_MAGNITUDE)
      {
	case INCDEC_BY_1:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 1;
	  if(isbutton_pressed(BTND))
	    kp = kp - 1;
	  break;
	case INCDEC_BY_5:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 5;
	  if(isbutton_pressed(BTND))
	    kp = kp - 5;
	  break;
	case INCDEC_BY_10:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 10;
	  if(isbutton_pressed(BTND))
	    kp = kp - 10;
	  break;

	default:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 10;
	  if(isbutton_pressed(BTND))
	    kp = kp - 10;
	  break;
      }
      break;

	case SELECT_KI:		//Ki is selected
	  xil_printf("KI is selected\n");
	  SET_LED(KI_SETLED);
	  switch(PID_MAGNITUDE)
	  {
	    case INCDEC_BY_1:
	      if(isbutton_pressed(BTNU))
		ki = ki + 1;
	      if(isbutton_pressed(BTND))
		ki = ki - 1;
	      break;
	    case INCDEC_BY_5:
	      if(isbutton_pressed(BTNU))
		ki = ki + 5;
	      if(isbutton_pressed(BTND))
		ki= ki - 5;
	      break;
	    case INCDEC_BY_10:
	      if(isbutton_pressed(BTNU))
		ki = ki + 10;
	      if(isbutton_pressed(BTND))
		ki = ki - 10;
	      break;
	    default:
	      if(isbutton_pressed(BTNU))
		ki = ki + 10;
	      if(isbutton_pressed(BTND))
		ki = ki - 10;
	      break;
	  }
	  break;


	    case SELECT_KD:		//Kd is selected
	      xil_printf("KD is selected\n");
	      SET_LED(KD_SETLED);
	      switch(PID_MAGNITUDE)
	      {
		case INCDEC_BY_1:
		  if(isbutton_pressed(BTNU))
		    kd = kd + 1;
		  if(isbutton_pressed(BTND))
		    kd = kd - 1;
		  break;
		case INCDEC_BY_5:
		  if(isbutton_pressed(BTNU))
		    kd = kd + 5;
		  if(isbutton_pressed(BTND))
		    kd= kd - 5;
		  break;
		case INCDEC_BY_10:
		  if(isbutton_pressed(BTNU))
		    kd = kd + 10;
		  if(isbutton_pressed(BTND))
		    kd = kd - 10;
		  break;
		default:
		  if(isbutton_pressed(BTNU))
		    kd = kd + 10;
		  if(isbutton_pressed(BTND))
		    kd = kd - 10;
		  break;
	      }
	      break;

		default:		//kd is selected
		  xil_printf("KD is selected\n");
		  SET_LED(KD_SETLED);
		  switch(PID_MAGNITUDE)
		  {
		    case INCDEC_BY_1:
		      if(isbutton_pressed(BTNU))
			kd = kd + 1;
		      if(isbutton_pressed(BTND))
			kd = kd - 1;
		      break;
		    case INCDEC_BY_5:
		      if(isbutton_pressed(BTNU))
			kd = kd + 5;
		      if(isbutton_pressed(BTND))
			kd= kd - 5;
		      break;
		    case INCDEC_BY_10:
		      if(isbutton_pressed(BTNU))
			kd = kd + 10;
		      if(isbutton_pressed(BTND))
			kd = kd - 10;
		      break;
		    default:
		      if(isbutton_pressed(BTNU))
			kd = kd + 10;
		      if(isbutton_pressed(BTND))
			kd = kd - 10;
		      break;
		  }
		  break;
  }

  MOTOR_MAGNITUDE = (switches & SWITCHES_1_0);
  switch(MOTOR_MAGNITUDE)
  {

    case INCDEC_BY_1: 	//Increment motor speed by 1
      magnitude = 1;
      xil_printf("\nMagnitude is 1");
      break;
    case INCDEC_BY_5:
      xil_printf("\nMagnitude is 5");
      magnitude = 5;	//Increment motor speed  by 5
      break;
    case INCDEC_BY_10:
      xil_printf("\nMagnitude is 10");
      magnitude = 10;		//Increment  motor speed by 10
      break;
  }


  xil_printf("KP = %d | KI = %d | KD == %d\n",kp,ki,kd);
  XGpio_InterruptClear(&SWITCHBUTTON_inst, SWITCHES_ENABLE_MASK);
*/
      xil_printf("Inside Handler\n");
  xSemaphoreGiveFromISR(xSemaphore,&xHigherPriorityTaskWoken);
  portYIELD_FROM_ISR(&xHigherPriorityTaskWoken);

}

void PULSECOUNT_Handler()
{

    if(XGpio_DiscreteRead(&MOTORSENSOR_inst,GPIO_SEN_INPUT_CHANNEL) == 1)
	{
	   count++;
	}
	XGpio_InterruptClear(&MOTORSENSOR_inst, 0xffff );

}


void SECONDS_Handler()
{
	 /*BaseType_t xHigherPriorityTaskWoken;
         xHigherPriorityTaskWoken = pdFALSE;
	        u32	ctlsts2;
			ctlsts2 = XTmrCtr_GetControlStatusReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2);
			ctlsts2 |= XTC_CSR_INT_OCCURED_MASK;
			XTmrCtr_SetControlStatusReg(AXI_TIMER_2_BASEADDR, TmrCtrNumber2, ctlsts2);

			if(oldcount != count)
			{
				drpm = 150 * duty;
				arpm = count * 60;

				OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 5);
				OLEDrgb_PutString(&pmodOLEDrgb_inst, "     ");
				OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 5);
				PMDIO_putnum(&pmodOLEDrgb_inst, drpm, 10);

				OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 7);
				OLEDrgb_PutString(&pmodOLEDrgb_inst, "     ");
				OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 4, 7);
				PMDIO_putnum(&pmodOLEDrgb_inst, arpm, 10);

				oldcount = count;
			}
			xil_printf("Rotary = %d \tDuty = %d\nDRPM: %d\tARPM: %d\n",conv,duty,drpm,arpm);
			xil_printf("**************************************************************************");
			count = 0;
			xSemaphoreGiveFromISR(xSemaphore,&xHigherPriorityTaskWoken);
			portYIELD_FROM_ISR(&xHigherPriorityTaskWoken);*/

}

/*int isbutton_pressed(enum _GPIO_btns btnslct)
{
		unsigned char  msk,btns;
		unsigned int val;
		val = XGpio_DiscreteRead(&SWITCHBUTTON_inst,GPIO_BUT_INPUT_CHANNEL);
		btns = (val & GPIO_ALLBTNS_MASK);

		switch (btnslct)
		{
			case BTNR:
				msk = GPIO_BTNR_MASK;
				break;
			case BTNL:
				msk = GPIO_BTNL_MASK;
				break;
			case BTND:
				msk = GPIO_BTND_MASK;
				break;
			case BTNU:
				msk = GPIO_BTNU_MASK;
				break;
			case BTNC:
				msk = GPIO_BTNC_MASK;
				break;

			default: msk = 0;
			break;

		}
		return (msk == btns)? 1 : 0;
}*/

/*unsigned char GET_SWITCHES(void)
{
	u16 switches;
	switches = XGpio_DiscreteRead(&SWITCHBUTTON_inst,GPIO_SW_INPUT_CHANNEL);
	return (u8) switches;
}*/

/*void SET_LED(short unsigned int ledval)
{
	u32 val;
	val = ledval & GPIO_LED_MASK;
	XGpio_DiscreteWrite(&LED_inst,GPIO_LED_OUTPUT_CHANNEL,val);
}*/

void masterTask (void *pvParameters)
{
  const TickType_t x1second = pdMS_TO_TICKS( DELAY_1_SECOND );

      vTaskDelay( x1second );

      //Create Tasks
     /* xTaskCreate (controlMotorInputTask,
		   (const char *) "Motorip",
		   configMINIMAL_STACK_SIZE,
		   NULL,
		   tskIDLE_PRIORITY + 1,
		   &xcontrolMotorInput);

      xTaskCreate (controlMotorOutputTask,
		   (const char *) "Motorop",
		   configMINIMAL_STACK_SIZE,
		   NULL,
		   tskIDLE_PRIORITY + 1,
		   &xcontrolMotorOutput);

      xTaskCreate (controlPIDTask,
		   (const char *) "PID",
		   configMINIMAL_STACK_SIZE,
		   NULL,
		   tskIDLE_PRIORITY + 1,
		   &xcontrolPID);*/

      xTaskCreate (displayTask,
		   (const char *) "Display",
		   configMINIMAL_STACK_SIZE,
		   NULL,
		   tskIDLE_PRIORITY + 1,
		   &xdisplay);

      xTaskCreate (readParameterTask,
		   (const char *) "ReadParam",
		   configMINIMAL_STACK_SIZE,
		   NULL,
		   tskIDLE_PRIORITY + 1,
		   &xreadParameter);

      //Create Semaphores
      xSemaphore = xSemaphoreCreateBinary();
      if (xSemaphore == NULL)
	{
	  xil_printf ("Insufficient Heap Memory\n");
	  exit (1);
	}

      //Create Message Queues
      xdisplayQueue = xQueueCreate(1, sizeof(char));
      /* Check the queue was created. */
      configASSERT(xdisplayQueue);

      xInputQueue = xQueueCreate(1, sizeof(char));
      /* Check the queue was created. */
      configASSERT(xInputQueue);

      xOutputQueue = xQueueCreate(1, sizeof(char));
      /* Check the queue was created. */
      configASSERT(xOutputQueue);

      xControlQueue = xQueueCreate(1, sizeof(char));
      /* Check the queue was created. */
      configASSERT(xControlQueue);

      xPeripheralQueue = xQueueCreate(1, sizeof(char));
      /* Check the queue was created. */
      configASSERT(xPeripheralQueue);
for(;;);

      //Enable WDT interrupt and Start WDT


  /*vTaskDelete(&xcontrolMotorInput);
  vTaskDelete(&xcontrolMotorOutput);
  vTaskDelete(&xcontrolPID);
  vTaskDelete(&xreadParameter);
  vTaskDelete(&xdisplay);*/
}




static void displayTask(void *pvParameters)
{
  const TickType_t x1second = pdMS_TO_TICKS( DELAY_1_SECOND );
  while(1)
    {
      vTaskDelay( x1second );
      xil_printf("Inside dispalyTask\n");
    }
  //Receive from Input Queue
  //Receive from display Queue
}
static void readParameterTask(void *pvParameters)
{
  const TickType_t x1second = pdMS_TO_TICKS( DELAY_1_SECOND );

  while(1)
    {
      vTaskDelay( x1second );
      xSemaphoreTake(xSemaphore,pdMS_TO_TICKS(500));
      xil_printf("Inside readParameterTask\n");
      xPortGetFreeHeapSize();

    }
  //Read Rotary Encoder
  //Read Switches
  //Read Buttons
  //Send to Peripheral Queue(Update Message to controlPIDTask)
  //Send to display Queue(Update control Message and setpoint to displayTask)
}

