#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#pragma bank 1

BANKREF(moveCursorGameB)
void moveCursorGameB() BANKED
{
	if(cursorGameY == ROW_DI){
		cursorGameX = X_HOLD;
		cursorGameY = ROW_SELECT;
	}
	else{
		cursorGameX = X_ROLL;
		cursorGameY = ROW_SELECT;
	}
}
