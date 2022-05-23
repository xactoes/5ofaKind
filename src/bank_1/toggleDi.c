#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(toggleDi)
void toggleDi(uint8 position, uint8 held) BANKED
{
	dice[position].isHeld = held;

	for(uint8 num; num != DI_SPRITE_COUNT; num++)
	{
		if(held)
		{
			move_sprite(dice[position].sprite[num].address, dice[position].sprite[num].screen.x, dice[position].sprite[num].screen.y + DI_HELD_OFFSET);
		}
		else
		{
			move_sprite(dice[position].sprite[num].address, dice[position].sprite[num].screen.x, dice[position].sprite[num].screen.y);
		}

	}
}
