#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/hideDi.h"
#include "../bank_1/cursor.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(moveCursorGameA)
void moveCursorGameA() BANKED
{
	if(cursorGameY == ROW_SELECT){
		if(cursorGameX == X_ROLL){
			for(uint8 position = 0; position != DICE_COUNT; position++){
				// ROLL DICE
				//diceRoll(position);
			}
		}
		else if(cursorGameX == X_HOLD){
			// MOVE TO DI ROW
			cursorGameX = X_DI_ONE;
			cursorGameY = ROW_DI;
			drawCursor(SCREEN_PLAY);
		}
		else if(cursorGameX == X_CARD){
			// SWITCH TO CARD VIEW
			hideDiAll();
			screen = SCREEN_CARD;
			//spritesBkgLoad(SCREEN_CARD);
			move_sprite(ARROW_RIGHT, 0, 0);
			move_sprite(ARROW_LEFT, 0, 0);
			move_sprite(ARROW_UP, 0, 0);
			HIDE_SPRITES;
		}
	}
	else if(cursorGameY == ROW_DI){
		if(cursorGameX == X_DI_ONE){
			// TOGGLE DI ONE
			toggleDi(0, 1);
		}
		if(cursorGameX == X_DI_TWO){
			// TOGGLE DI TWO
			toggleDi(1, 1);
		}
		if(cursorGameX == X_DI_THREE){
			// TOGGLE DI THREE
			toggleDi(2, 1);
		}
		if(cursorGameX == X_DI_FOUR){
			// TOGGLE DI FOUR
			toggleDi(3, 1);
		}
		if(cursorGameX == X_DI_FIVE){
			// TOGGLE DI FIVE
			toggleDi(4, 1);
		}
	}
}
