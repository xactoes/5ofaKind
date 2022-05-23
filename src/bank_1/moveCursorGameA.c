#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_1/cursor.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(moveCursorGameA)
void moveCursorGameA() BANKED
{
	if(cursorGameY == ROW_SELECT){
		if(cursorGameX == X_ROLL){
			rollDice();
		}
		else if(cursorGameX == X_HOLD){
			// MOVE TO DI ROW
			cursorGameX = X_DI_ONE;
			cursorGameY = ROW_DI;
			drawCursor(SCREEN_PLAY);
		}
		else if(cursorGameX == X_CARD){
			moveCursorGameSelect();
		}
	}
	else if(cursorGameY == ROW_DI){
		if(cursorGameX == X_DI_ONE){
			// TOGGLE DI ONE
			if(dice[0].isHeld == 0)
			{
				toggleDi(0, 1);
			}
			else
			{
				toggleDi(0, 0);
			}
		}
		if(cursorGameX == X_DI_TWO){
			// TOGGLE DI TWO
			if(dice[1].isHeld == 0)
			{
				toggleDi(1, 1);
			}
			else
			{
				toggleDi(1, 0);
			}
		}
		if(cursorGameX == X_DI_THREE){
			// TOGGLE DI THREE
			if(dice[2].isHeld == 0)
			{
				toggleDi(2, 1);
			}
			else
			{
				toggleDi(2, 0);
			}
		}
		if(cursorGameX == X_DI_FOUR){
			// TOGGLE DI FOUR
			if(dice[3].isHeld == 0)
			{
				toggleDi(3, 1);
			}
			else
			{
				toggleDi(3, 0);
			}
		}
		if(cursorGameX == X_DI_FIVE){
			// TOGGLE DI FIVE
			if(dice[4].isHeld == 0)
			{
				toggleDi(4, 1);
			}
			else
			{
				toggleDi(4, 0);
			}
		}
	}
}
