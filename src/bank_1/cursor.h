#ifndef CURSOR_H
#define CURSOR_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

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

extern void drawCursor(uint8) BANKED;
BANKREF_EXTERN(drawCursor)

// PLAY
extern void moveCursorGame() BANKED;
BANKREF_EXTERN(moveCursorGame)
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

// CARD
extern void moveCursorCard() BANKED;
BANKREF_EXTERN(moveCursorCard)
extern void moveCursorCardLeft() BANKED;
BANKREF_EXTERN(moveCursorCardLeft)
extern void moveCursorCardRight() BANKED;
BANKREF_EXTERN(moveCursorCardRight)
extern void moveCursorCardUp() BANKED;
BANKREF_EXTERN(moveCursorCardUp)
extern void moveCursorCardDown() BANKED;
BANKREF_EXTERN(moveCursorCardDown)
extern void moveCursorCardA() BANKED;
BANKREF_EXTERN(moveCursorCardA)
extern void moveCursorCardBSelect() BANKED;
BANKREF_EXTERN(moveCursorCardBSelect)
extern void moveCursorCardStart() BANKED;
BANKREF_EXTERN(moveCursorCardStart)


#endif
