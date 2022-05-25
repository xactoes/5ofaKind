#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/drawBackground.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"

#pragma bank 0

BANKREF(moveCursorScores)
void moveCursorScores() BANKED
{
	switch(joypad())
	{
		case J_LEFT:
			if(screen > HIGH_SCORE_0)
			{
				screen--;
			}
			waitpadup();
			break;
		case J_RIGHT:
			if(screen < HIGH_SCORE_3)
			{
				screen++;
			}
			waitpadup();
			break;
		case J_B:
			loadMenu();
			waitpadup();
			break;
	}
}
