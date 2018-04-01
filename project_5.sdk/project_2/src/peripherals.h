/*

 * peripherals.h
 *
 *  Created on: 17-Feb-2018
 *      Author: HIMAN
*/

#ifndef SRC_PERIPHERALS_H_
#define SRC_PERIPHERALS_H_

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
#define	zero_zero	0
#define	zero_one	1
#define	one_zero	2
#define	one_one		3
#define KP			1
#define KI			2
#define KD			4


void PID_Control(void);
int isbutton_pressed(enum _GPIO_btns btnslct);


#endif // SRC_PERIPHERALS_H_
