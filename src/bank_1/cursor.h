#ifndef CURSOR_H
#define CURSOR_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

// Y
#define ROW_SELECT 		144
#define ROW_DI      	138

// X
#define X_ROLL        	16
#define X_HOLD        	64
#define X_CARD        	112
#define X_DI_ONE      	56
#define X_DI_TWO      	80
#define X_DI_THREE    	104
#define X_DI_FOUR     	128
#define X_DI_FIVE     	152

#define GAP_SELECT		48
#define GAP_DI			24

extern void drawCursor(uint8) BANKED;
BANKREF_EXTERN(drawCursor)

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


#endif
