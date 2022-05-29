#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

void drawDi(uint8 position)
{
	for(uint8 num = 0; num != DI_SPRITE_COUNT; num++)
	{
		if(dice[position].sprite[num].isVisible)
		{
			move_sprite(dice[position].sprite[num].address, dice[position].sprite[num].screen.x, dice[position].sprite[num].screen.y);
		}
		else
		{
			move_sprite(dice[position].sprite[num].address, 0, 0);
		}
	}
}
