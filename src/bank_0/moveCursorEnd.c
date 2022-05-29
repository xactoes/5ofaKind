#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/misc.h"

void moveCursorEnd()
{
	//writeScore();

	switch(joypad())
	{
		case J_B:
			bkgDrawn = 0;
			loadMenu();
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
