#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/soundEffects.h"

#pragma bank 1

BANKREF(moveCursorGameRight)
void moveCursorGameRight() BANKED
{
	if(cursorGameY == ROW_SELECT && cursorGameX < X_CARD)
	{
		cursorGameX += GAP_SELECT;
		soundCursorMove();
	}
	else if(cursorGameY == ROW_DI && cursorGameX < X_DI_FIVE)
	{
		cursorGameX += GAP_DI;
		soundCursorMove();
	}
}
