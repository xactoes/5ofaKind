#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(refreshDicePosition)
void refreshDicePosition() BANKED
{
	for(uint8 position = 0; position != DICE_COUNT; position++)
	{
		if(dice[position].isHeld)
		{
			for(uint8 num = 0; num != DI_SPRITE_COUNT; num++)
			{
				move_sprite(dice[position].sprite[num].address, dice[position].sprite[num].screen.x, dice[position].sprite[num].screen.y + DI_HELD_OFFSET);
			}
		}
		else
		{
			for(uint8 num = 0; num != DI_SPRITE_COUNT; num++)
			{
				move_sprite(dice[position].sprite[num].address, dice[position].sprite[num].screen.x, dice[position].sprite[num].screen.y);
			}
		}
	}
}
