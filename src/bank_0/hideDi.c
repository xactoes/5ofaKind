#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 0

BANKREF(hideDi)
void hideDi(uint8 position) BANKED
{
	for(uint8 num; num != DI_SPRITE_COUNT; num++)
	{
		dice[position].sprite[num].isVisible = 0;
	}
}
