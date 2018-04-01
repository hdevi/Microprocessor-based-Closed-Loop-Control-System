/*
 * test.h
 *
 *  Created on: 17-Feb-2018
 *      Author: HIMAN
 */

#ifndef SRC_TEST_H_
#define SRC_TEST_H_

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
#include <math.h>
#include "stdbool.h"

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
XIntc 		   IntrptCtlrInst;
XGpio		   MOTORSENSOR_inst;
XGpio 		   LED_inst;
XGpio 		   SWITCHBUTTON_inst;


//Function Declarations
int do_init(void);
int Initialize_GPIOS(void);
int Initiaize_INTERRUPTS(void);
int AXI_Timer_initialize(void);
int Initialize_PWM(void);
void PERIPHERAL_Handler();
void PULSECOUNT_Handler();
void SECONDS_Handler();
void PMDIO_putnum(PmodOLEDrgb* InstancePtr, int32_t num, int32_t radix);
void PMDIO_puthex(PmodOLEDrgb* InstancePtr, uint32_t num);
void PMDIO_itoa(int32_t value, char *string, int32_t radix);
void display_rotary(void);

#endif /* SRC_TEST_H_ */
