#include <gb/gb.h>
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#pragma bank 0

BANKREF(initializeTitle)
void initializeTitle() BANKED
{
	drawCursor(SCREEN_TITLE);
	titleInitialized = 1;
}
