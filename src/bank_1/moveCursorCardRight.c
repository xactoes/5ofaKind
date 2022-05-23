#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#pragma bank 1

BANKREF(moveCursorCardRight)
void moveCursorCardRight() BANKED
{
	// IF CURSOR IS IN THE TOP
    if(cursorCardY <= FLOOR_UPPER){
        if(cursorCardX < SIDE_RIGHT){
            cursorIndex += 3;
            cursorCardX += GAP_X;
        }
    }
    // IF CURSOR IS IN THE BOTTOM
    else if(cursorCardY > FLOOR_UPPER){
        // ABOVE 5 KIND
        if(cursorCardY <= FLOOR_LOWER_MIDDLE){
            if(cursorCardX < SIDE_RIGHT){
                cursorIndex += 3;
                cursorCardX += GAP_X;
            }
        }
    }
}
