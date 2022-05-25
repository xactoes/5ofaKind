#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#pragma bank 0

BANKREF(moveCursorScores)
void moveCursorScores() BANKED
{
	uint8 screenTracker = screen;

	switch(joypad())
	{
		case J_LEFT:
			if(screenTracker > HIGH_SCORE_0)
			{
				screenTracker--;
			}
			waitpadup();
			break;
		case J_RIGHT:
			if(screenTracker < HIGH_SCORE_3)
			{
				screenTracker++;
			}
			waitpadup();
			break;
		case J_B:
			loadMenu();
			waitpadup();
			break;
	}

	screen = screenTracker;
}
