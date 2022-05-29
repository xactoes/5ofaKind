#ifndef CURSOR_H
#define CURSOR_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

// Y - TITLE
#define Y_PLAY			96
#define Y_SCORES		104
#define Y_LINK			112
#define Y_OPTIONS		120

// X - TITLE
#define X_TITLE			48

// GAP - TITLE
#define GAP_Y_TITLE		8

// Y - OPTIONS
#define Y_NAME_INPUT	48
#define Y_AUDIO			64
#define Y_RESET			80

// X - options
#define X_OPTIONS		24

// GAP - OPTIONS
#define GAP_Y_OPTIONS	16

// Y - NAME INPUT
#define Y_TOP_NAME		72
#define Y_BOTTOM_NAME	120

// X - NAME INPUT
#define X_LEFT_NAME		12
#define X_RIGHT_NAME	156

// GAP - NAME INPUT
#define GAP_X_NAME		16
#define GAP_Y_NAME		16

// Y - PLAY
#define ROW_SELECT 		144
#define ROW_DI      	136

// X - PLAY
#define X_ROLL        	16
#define X_HOLD        	64
#define X_CARD        	112
#define X_DI_ONE      	48
#define X_DI_TWO      	72
#define X_DI_THREE    	96
#define X_DI_FOUR     	120
#define X_DI_FIVE     	144

// GAP - PLAY
#define GAP_SELECT		48
#define GAP_DI			24

// Y - CARD
#define FLOOR_UPPER			64
#define FLOOR_LOWER_MIDDLE  112
#define FLOOR_LOWER_BOTTOM  128
#define CEILING_UPPER       48
#define CEILING_LOWER       96

#define Y_ONES      		48
#define Y_TWOS            	56
#define Y_THREES          	64
#define Y_FOURS           	48
#define Y_FIVES           	56
#define Y_SIXES           	64

#define Y_KIND_THREE      96
#define Y_KIND_FOUR       104
#define Y_FULL_HOUSE      112
#define Y_SM_STRAIGHT     96
#define Y_LG_STRAIGHT     104
#define Y_CHANCE          112
#define Y_KIND_FIVE       120
#define Y_KIND_FIVE_BONUS 128

// X - CARD
#define SIDE_LEFT			16
#define SIDE_RIGHT			88

// GAP - CARD
#define GAP_X				72
#define GAP_Y_SMALL			8
#define GAP_Y_BIG			32

extern void initializeCursorSprites() BANKED;
BANKREF_EXTERN(initializeCursorSprites)

extern void drawCursor(uint8);

// TITLE
extern void moveCursorTitle();
extern void moveCursorLink() BANKED;
BANKREF_EXTERN(moveCursorLink)
extern void moveCursorOptions();
extern void moveCursorScores();
extern void  moveCursorNameInput();

// PLAY
extern void moveCursorGame();
extern void moveCursorGameLeft() BANKED;
BANKREF_EXTERN(moveCursorGameLeft)
extern void moveCursorGameRight() BANKED;
BANKREF_EXTERN(moveCursorGameRight)
extern void moveCursorGameA() BANKED;
BANKREF_EXTERN(moveCursorGameA)
extern void moveCursorGameB() BANKED;
BANKREF_EXTERN(moveCursorGameB)
extern void moveCursorGameSelect() BANKED;
BANKREF_EXTERN(moveCursorGameSelect)

// START MENU
extern void moveCursorStart() BANKED;
BANKREF_EXTERN(moveCursorStart)

// CARD
extern void moveCursorCard();
extern void moveCursorCardLeft() BANKED;
BANKREF_EXTERN(moveCursorCardLeft)
extern void moveCursorCardRight() BANKED;
BANKREF_EXTERN(moveCursorCardRight)
extern void moveCursorCardUp() BANKED;
BANKREF_EXTERN(moveCursorCardUp)
extern void moveCursorCardDown() BANKED;
BANKREF_EXTERN(moveCursorCardDown)
extern void moveCursorCardA(uint8) BANKED;
BANKREF_EXTERN(moveCursorCardA)
extern void moveCursorCardBSelect() BANKED;
BANKREF_EXTERN(moveCursorCardBSelect)
extern void moveCursorCardStart() BANKED;
BANKREF_EXTERN(moveCursorCardStart)

// END
extern void moveCursorEnd();


#endif
