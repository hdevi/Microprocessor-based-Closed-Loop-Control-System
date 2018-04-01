/*
 * Test.c
 *
 *  Created on: 17-Feb-2018
 *      Author: HIMAN
 */

#include "test.h"
#include "peripherals.h"

void SET_LED(uint16_t ledval);


int flag;
volatile int count = 0, oldcount = 0;
uint32_t pulse;
u8 conv,duty;
uint16_t RotaryIncr =1,RotaryCnt,OldRotaryCnt = 0xFFFF;
bool RotaryNoNeg = false;
int drpm,arpm;
u8 GET_BTNS(void);
u8 GET_SWITCHES(void);

int main(void)
{
	//u32 switches;
	init_platform();

	//uint16_t led;
	int status;

	int sts = do_init();
	if (sts == XST_FAILURE)
	{
		xil_printf("SOMETHIING WENT WRONG IN INITIALIZATION...check it\n");
		return XST_FAILURE;
	}

	XGpio_InterruptGlobalEnable(&SWITCHBUTTON_inst);
	XGpio_InterruptEnable(&SWITCHBUTTON_inst, SWITCHES_ENABLE_MASK);
	XGpio_InterruptGlobalEnable(&MOTORSENSOR_inst);
	XGpio_InterruptEnable(&MOTORSENSOR_inst, 0xffff);

	microblaze_enable_interrupts();

	 pmodENC_init(&pmodENC_inst, RotaryIncr, RotaryNoNeg);
	 pmodENC_clear_count(&pmodENC_inst);

	XGpio_DiscreteSet(&MOTORSENSOR_inst,GPIO_DIR_OUTPUT_CHANNEL,0);


	xil_printf("Hello!!!\n");



	while(1)
	{


	if(pmodENC_is_button_pressed(&pmodENC_inst))
	    	   {
	    		   xil_printf("Exit");
	    		   status = PWM_SetParams(&AXITimerInst, 4*10^3 ,0);
	    		           		if(status != XST_SUCCESS)
	    		           		{
	    		           			  xil_printf("\nFailed to set PWM parameters");
	    		           			  exit(1);
	    		           		}
	    		   status =  PWM_Stop(&AXITimerInst);
	    		  	     if(status != XST_SUCCESS)
	    		  	     {
	    		  	         xil_printf("\nFailed to start the PWM");
	    		  	         exit(1);
	    		  	     }
	    		   break;
	    	   }
	        	pmodENC_read_count(&pmodENC_inst,&RotaryCnt);


	        	if (RotaryCnt != OldRotaryCnt)
	        	{
	        		conv = RotaryCnt;
	        		duty = 0.39 * conv;


	        		status = PWM_SetParams(&AXITimerInst, 4*10^3 ,duty);
	        		if(status != XST_SUCCESS)
	        		{
	        			  xil_printf("\nFailed to set PWM parameters");
	        			  exit(1);
	        		}

	        		display_rotary();
	        	}
	        	OldRotaryCnt = RotaryCnt;
	       }

	      pmodENC_clear_count(&pmodENC_inst);


	return 0;
}

void SET_LED(uint16_t ledval)
{
	u32 val;
	val = ledval & GPIO_LED_MASK;
	XGpio_DiscreteWrite(&LED_inst,GPIO_LED_OUTPUT_CHANNEL,val);
}


void PULSECOUNT_Handler()
{	if(XGpio_DiscreteRead(&MOTORSENSOR_inst,GPIO_SEN_INPUT_CHANNEL) == 1)
	{
	   count++;
	}
	XGpio_InterruptClear(&MOTORSENSOR_inst, 0xffff );
}

void display_rotary(void)
{

	 	 	 	 	OLEDrgb_SetFontColor(&pmodOLEDrgb_inst,OLEDrgb_BuildRGB(70,130,180));
					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 3, 0);
					OLEDrgb_PutString(&pmodOLEDrgb_inst, "   ");
					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 3, 0);
					PMDIO_putnum(&pmodOLEDrgb_inst, conv, 10);

					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 10, 0);
					OLEDrgb_PutString(&pmodOLEDrgb_inst, "   ");
					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 10, 0);
					PMDIO_putnum(&pmodOLEDrgb_inst, duty, 10);

					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 4);
					OLEDrgb_PutString(&pmodOLEDrgb_inst, " ");
					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 0, 4);
					PMDIO_putnum(&pmodOLEDrgb_inst, 0, 10);

					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 5, 4);
					OLEDrgb_PutString(&pmodOLEDrgb_inst, " ");
					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 5, 4);
					PMDIO_putnum(&pmodOLEDrgb_inst, 0, 10);

					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 9, 4);
					OLEDrgb_PutString(&pmodOLEDrgb_inst, " ");
					OLEDrgb_SetCursor(&pmodOLEDrgb_inst, 9, 4);
					PMDIO_putnum(&pmodOLEDrgb_inst, 0, 10);




}

void SECONDS_Handler()
{
	u32		ctlsts2;
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
			/*xil_printf("Rotary = %d \tDuty = %d\nDRPM: %d\tARPM: %d\n",conv,duty,drpm,arpm);
			xil_printf("/**************************************************************************");*/
			count = 0;

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

int isbutton_pressed(enum _GPIO_btns btnslct)
{
		u8  msk,btns;
		u32 val;
		//btns = GET_BTNS();
		val = XGpio_DiscreteRead(&SWITCHBUTTON_inst,GPIO_BUT_INPUT_CHANNEL);
		btns = (val & GPIO_ALLBTNS_MASK);

		switch (btnslct)
		{
			case BTNR:

				msk = GPIO_BTNR_MASK;
				//xil_printf("HBTNR : %d | %d\n",msk,btns);
				break;
			case BTNL:

				msk = GPIO_BTNL_MASK;
				///xil_printf("HBTNL : %d | %d\n",msk,btns);
				break;
			case BTND:

				msk = GPIO_BTND_MASK;
				//xil_printf("HBTND : %d | %d\n",msk,btns);
				break;
			case BTNU:

				msk = GPIO_BTNU_MASK;
				//xil_printf("HBTNU : %d | %d\n",msk,btns);
				break;
			case BTNC:

				msk = GPIO_BTNC_MASK;
				//xil_printf("HBTNC : %d | %d\n",msk,btns);
				break;

			default: msk = 0;
			break;

		}
		return (msk == btns)? 1 : 0;
}

/*u8 GET_BTNS(void)
{
	u32 val;
	u8 btns;
	val =  XGpio_DiscreteRead(&SWITCHBUTTON_inst,GPIO_BUT_INPUT_CHANNEL);
	btns = (val & GPIO_ALLBTNS_MASK);
	return  btns;
}*/

u8 GET_SWITCHES(void)
{
	u16 switches;
	switches = XGpio_DiscreteRead(&SWITCHBUTTON_inst,GPIO_SW_INPUT_CHANNEL);
	return (u8) switches;
}
