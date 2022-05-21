#include <gb/gb.h>

#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(initializeDiSprites)
void initializeDiSprites(uint8 diPosition) BANKED
{
	uint8 spriteNumber;
	uint16 dix, diy;

	dix = DI_X + (DI_SPACE * diPosition);
	diy = DI_Y;

    for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
    {
		// SETS OAM ADDRESS
		spriteNumber = (4 * diPosition) + i;
        dice[diPosition].sprite[i].address 		= spriteNumber;

		// MARKS WHETHER TO SHOW SPRITE
		dice[diPosition].sprite[i].isVisible	= 1;

		// ASSIGN ON SCREEN POSITIONS
		switch(i)
		{
			case 0:
				dice[diPosition].sprite[i].screenCoordinates.x = dix;
				dice[diPosition].sprite[i].screenCoordinates.y = diy;
				break;
			case 1:
				dice[diPosition].sprite[i].screenCoordinates.x = dix + DI_SPRITE_OFFSET;
				dice[diPosition].sprite[i].screenCoordinates.y = diy;
				break;
			case 2:
				dice[diPosition].sprite[i].screenCoordinates.x = dix;
				dice[diPosition].sprite[i].screenCoordinates.y = diy + DI_SPRITE_OFFSET;
				break;
			case 3:
				dice[diPosition].sprite[i].screenCoordinates.x = dix + DI_SPRITE_OFFSET;
				dice[diPosition].sprite[i].screenCoordinates.y = diy + DI_SPRITE_OFFSET;
				break;
		}
    }
}
