#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/init_b0.h"

#pragma bank 1

BANKREF(loadMenu)
void loadMenu() BANKED
{
	bkgDrawn = 0;
	titleInitialized = 0;
	cursorTitleX = 48;
	cursorTitleY = 96;
	screen = SCREEN_TITLE;
}
