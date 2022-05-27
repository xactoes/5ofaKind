#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/misc.h"

#pragma bank 1

BANKREF(moveCursorLink)
void moveCursorLink() BANKED
{
	switch(joypad()){
		case J_A:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_B:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_START:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_SELECT:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_UP:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_DOWN:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_LEFT:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_RIGHT:
			loadMenu();
			bkgDrawn = 0;
			waitpadup();
			break;
	}
}
