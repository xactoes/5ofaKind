#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/soundEffects.h"

#pragma bank 1

BANKREF(moveCursorCardUp)
void moveCursorCardUp() BANKED
{
	// NOT AT TOP ALREADY
    if(cursorCardY > CEILING_UPPER){
        // WITHIN UPPER CARD
        if(cursorCardY < FLOOR_UPPER){
            cursorIndex -= 1;
            cursorCardY -= GAP_Y_SMALL;
            soundCursorMove();
        }
        // AT TOP OF LOWER CARD
        else if(cursorCardY == CEILING_LOWER){
            cursorIndex -= 4;
            cursorCardY -= GAP_Y_BIG;
            soundCursorMove();
        }
        // IF NOT AT THE BOTTOM SECTION
        else if(cursorCardY < Y_KIND_FIVE){
            cursorIndex -= 1;
            cursorCardY -= GAP_Y_SMALL;
            soundCursorMove();
        }
        // AT FIVE KIND
        else if(cursorCardY == Y_KIND_FIVE){
            cursorIndex -= 4;
            cursorCardY -= GAP_Y_SMALL;
            soundCursorMove();
        }
        // AT 5 KIND BONUS
        else if(cursorCardY == FLOOR_LOWER_BOTTOM){
            cursorIndex -= 1;
            cursorCardY -= GAP_Y_SMALL;
            soundCursorMove();
        }
    }
}
