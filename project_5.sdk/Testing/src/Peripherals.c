/*
 * Peripherals.c
 *
 *  Created on: 17-Feb-2018
 *      Author: HIMAN
 */


#include "peripherals.h"
#include "test.h"

u8 PID_MAGNITUDE, PID_SELECT, MOTOR_MAGNITUDE;
uint8_t  btns, msk;
volatile uint8_t switches;
u8 kp=0,kd=0,ki=0;
int Error,add_const;
uint8_t speed;
uint8_t magnitude;

void PERIPHERAL_Handler()
{

  if(isbutton_pressed(BTNC))
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

    case zero_zero: 	//Kp is selected
      xil_printf("KP is selected\n");
      SET_LED(KP);
      switch(PID_MAGNITUDE)
      {
	case zero_zero:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 1;
	  if(isbutton_pressed(BTND))
	    kp = kp - 1;
	  break;
	case zero_one:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 5;
	  if(isbutton_pressed(BTND))
	    kp = kp - 5;
	  break;
	case one_zero:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 10;
	  if(isbutton_pressed(BTND))
	    kp = kp - 10;
	  break;
	case one_one:
	  if(isbutton_pressed(BTNU))
	    kp = kp + 10;
	  if(isbutton_pressed(BTND))
	    kp = kp - 10;
	  break;
      }
      break;

	case zero_one:		//Ki is selected
	xil_printf("KI is selected\n");
	SET_LED(KI);
	switch(PID_MAGNITUDE)
	{
	  case zero_zero:
	    if(isbutton_pressed(BTNU))
	      ki = ki + 1;
	    if(isbutton_pressed(BTND))
	      ki = ki - 1;
	    break;
	  case zero_one:
	    if(isbutton_pressed(BTNU))
	      ki = ki + 5;
	    if(isbutton_pressed(BTND))
	      ki= ki - 5;
	    break;
	  case one_zero:
	    if(isbutton_pressed(BTNU))
	      ki = ki + 10;
	    if(isbutton_pressed(BTND))
	      ki = ki - 10;
	    break;
	  case one_one:
	    if(isbutton_pressed(BTNU))
	      ki = ki + 10;
	    if(isbutton_pressed(BTND))
	      ki = ki - 10;
	    break;
	}
	break;


	  case one_zero:		//Kd is selected
	  xil_printf("KD is selected\n");
	  SET_LED(KD);
	  switch(PID_MAGNITUDE)
	  {
	    case zero_zero:
	      if(isbutton_pressed(BTNU))
		kd = kd + 1;
	      if(isbutton_pressed(BTND))
		kd = kd - 1;
	      break;
	    case zero_one:
	      if(isbutton_pressed(BTNU))
		kd = kd + 5;
	      if(isbutton_pressed(BTND))
		kd= kd - 5;
	      break;
	    case one_zero:
	      if(isbutton_pressed(BTNU))
		kd = kd + 10;
	      if(isbutton_pressed(BTND))
		kd = kd - 10;
	      break;
	    case one_one:
	      if(isbutton_pressed(BTNU))
		kd = kd + 10;
	      if(isbutton_pressed(BTND))
		kd = kd - 10;
	      break;
	  }
	  break;

	    case one_one:		//kd is selected
	    xil_printf("KD is selected\n");
	    SET_LED(KD);
	    switch(PID_MAGNITUDE)
	    {
	      case zero_zero:
		if(isbutton_pressed(BTNU))
		  kd = kd + 1;
		if(isbutton_pressed(BTND))
		  kd = kd - 1;
		break;
	      case zero_one:
		if(isbutton_pressed(BTNU))
		  kd = kd + 5;
		if(isbutton_pressed(BTND))
		  kd= kd - 5;
		break;
	      case one_zero:
		if(isbutton_pressed(BTNU))
		  kd = kd + 10;
		if(isbutton_pressed(BTND))
		  kd = kd - 10;
		break;
	      case one_one:
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

    case zero_zero: 	//Increment motor speed by 1
      magnitude = 1;
      xil_printf("\nMagnitude is 1");
      break;
    case zero_one:
      xil_printf("\nMagnitude is 5");
      magnitude = 5;	//Increment motor speed  by 5
      break;
    case one_one:
      xil_printf("\nMagnitude is 10");
      magnitude = 10;		//Increment  motor speed by 10
      break;
  }


  xil_printf("KP = %d | KI = %d | KD == %d\n",kp,ki,kd);
  XGpio_InterruptClear(&SWITCHBUTTON_inst, SWITCHES_ENABLE_MASK);
}









