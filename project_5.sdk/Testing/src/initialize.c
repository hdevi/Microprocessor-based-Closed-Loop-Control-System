/*
 * initialize.c
 *
 *  Created on: 17-Feb-2018
 *      Author: HIMAN
 */

#include "test.h"
/****************************************************************************/
/**
 * Initializes the System
 *
 * This function is executed once at start-up and after resets.  It initializes
 * the peripherals and registers the interrupt handler(s)
 *****************************************************************************/

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
			xil_printf("Connection Failed For GPIO to INTC\n");
			return XST_FAILURE;

		}

		// connect the GPIO handler to the interrupt
		status = XIntc_Connect(&IntrptCtlrInst, GPIO_SEN_INTERRUPT_ID,(XInterruptHandler)PULSECOUNT_Handler,(void *)0);
				if (status != XST_SUCCESS)
				{
					xil_printf("Connection Failed For PERIPHERAL to INTC\n");
					return XST_FAILURE;

				}

				// connect the GPIO handler to the interrupt
						status = XIntc_Connect(&IntrptCtlrInst, AXI_TIMER_INTERRUPT_ID,(XInterruptHandler)SECONDS_Handler,(void *)0);
								if (status != XST_SUCCESS)
								{
									xil_printf("Connection Failed For PERIPHERAL to INTC\n");
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

