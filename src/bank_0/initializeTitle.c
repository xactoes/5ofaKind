#include <gb/gb.h>
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

void initializeTitle()
{
	drawCursor(SCREEN_TITLE);
	titleInitialized = 1;
}
