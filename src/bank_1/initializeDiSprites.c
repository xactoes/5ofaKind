#include <gb/gb.h>

#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(initializeDiSprites)
void initializeDiSprites(uint8 position) BANKED
{
	uint8 spriteNumber;
	uint16 dix, diy;

	dix = DI_X + (DI_SPACE * position);
	diy = DI_Y;

    for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
    {
		// SETS OAM ADDRESS
		spriteNumber = (4 * position) + i;
        dice[position].sprite[i].address = spriteNumber;

		// MARKS WHETHER TO SHOW SPRITE
		dice[position].sprite[i].isVisible	= 1;

		// ASSIGN ON SCREEN POSITIONS
		switch(i)
		{
			case 0:
				dice[position].sprite[i].screen.x = dix;
				dice[position].sprite[i].screen.y = diy;
				break;
			case 1:
				dice[position].sprite[i].screen.x = dix + DI_SPRITE_OFFSET;
				dice[position].sprite[i].screen.y = diy;
				break;
			case 2:
				dice[position].sprite[i].screen.x = dix;
				dice[position].sprite[i].screen.y = diy + DI_SPRITE_OFFSET;
				break;
			case 3:
				dice[position].sprite[i].screen.x = dix + DI_SPRITE_OFFSET;
				dice[position].sprite[i].screen.y = diy + DI_SPRITE_OFFSET;
				break;
		}
    }
}
