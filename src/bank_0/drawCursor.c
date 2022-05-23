#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank_0

BANKREF(drawCursor)
void drawCursor(uint8 screen) BANKED
{
	SHOW_SPRITES;
}
