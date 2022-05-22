#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 0

BANKREF(showDi)
void showDi(uint8 diPosition) BANKED
{
	for(uint8 num; num != DI_SPRITE_COUNT; num++)
	{
		dice[diPosition].sprite[num].isVisible = 1;
	}
}
