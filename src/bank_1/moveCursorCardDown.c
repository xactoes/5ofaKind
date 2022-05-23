#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#pragma bank 1

BANKREF(moveCursorCardDown)
void moveCursorCardDown() BANKED
{
	// NOT AT BOTTOM ALREADY
    if(cursorCardY < FLOOR_LOWER_BOTTOM){
        // WITHIN BOTTOM OF LOWER CARD
        if(cursorCardY > FLOOR_LOWER_MIDDLE){
            cursorIndex += 1;
            cursorCardY += GAP_Y_SMALL;
        }
        // AT 5 KIND
        else if(cursorCardY == Y_KIND_FIVE){
            cursorIndex == 13;
            cursorCardX == SIDE_LEFT;
            cursorCardY += GAP_Y_SMALL;
        }
        // AT FHOUSE/CHANCE
        else if(cursorCardY == FLOOR_LOWER_MIDDLE){
            // FHOUSE
            if(cursorCardX == SIDE_LEFT){
                cursorIndex += 4;
                cursorCardY += GAP_Y_SMALL;
            }
            // CHANCE
            else {
                cursorIndex += 1;
                cursorCardX = SIDE_LEFT;
                cursorCardY += GAP_Y_SMALL;
            }

        }
        // ABOVE 5 KIND BUT IN LOWER CARD
        else if(cursorCardY < FLOOR_LOWER_MIDDLE && cursorCardY >= CEILING_LOWER){
            cursorIndex += 1;
            cursorCardY += GAP_Y_SMALL;
        }
        // AT BOTTOM OF TOP
        else if(cursorCardY == FLOOR_UPPER){
            cursorIndex += 4;
            cursorCardY += GAP_Y_BIG;
        }
        // IN TOP TWO ROWS
        else{
            cursorIndex += 1;
            cursorCardY += GAP_Y_SMALL;
        }
    }
}
