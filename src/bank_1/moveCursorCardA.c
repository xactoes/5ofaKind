#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(moveCursorCardA)
void moveCursorCardA(uint8 index) BANKED
{
	scoreUpper(index);
}
