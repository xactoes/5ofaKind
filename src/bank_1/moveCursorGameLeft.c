#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#pragma bank 1

BANKREF(moveCursorGameLeft)
void moveCursorGameLeft() BANKED
{
	if(cursorGameY == ROW_SELECT && cursorGameX > X_ROLL)
	{
		cursorGameX -= GAP_SELECT;
	}
	else if(cursorGameY == ROW_DI && cursorGameX > X_DI_ONE)
	{
		cursorGameX -= GAP_DI;
	}
}
