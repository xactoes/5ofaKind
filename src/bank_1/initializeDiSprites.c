#include <gb/gb.h>

#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(initializeDiSprites)
void initializeDiSprites(uint8 diPosition) BANKED
{
	uint8 spriteNumber;
	uint16 dix, diy;
    for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
    {
		spriteNumber = (4 * diPosition) + i;
        dice[diPosition].sprite[i].address 		= spriteNumber;
		dice[diPosition].sprite[i].isVisible	= 1;
    }
}
