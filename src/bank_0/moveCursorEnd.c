#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/misc.h"

#pragma bank 0

BANKREF(moveCursorEnd)
void moveCursorEnd() BANKED
{
	//writeScore();

	switch(joypad())
	{
		case J_B:
			//loadMenu();
			waitpadup();
			break;
		case J_A:
			newGame();
			waitpadup();
			break;
		case J_START:
			newGame();
			waitpadup();
			break;
	}
}
