#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 0

BANKREF(drawDi)
void drawDi(uint8 diPosition) BANKED
{
	for(uint8 num; num != DI_SPRITE_COUNT; num++)
	{
		if(dice[diPosition].sprite[num].isVisible)
		{
			move_sprite(dice[diPosition].sprite[num].address, dice[diPosition].sprite[num].screen.x, dice[diPosition].sprite[num].screen.y);
		}
		else
		{
			move_sprite(dice[diPosition].sprite[num].address, 0, 0);
		}
	}
}
