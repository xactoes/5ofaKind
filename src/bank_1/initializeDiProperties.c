#include <gb/gb.h>

#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(initializeDiProperties)
void initializeDiProperties(uint8 position) BANKED
{
    assignDiFace(position);
    assignDiSprites(position);

    dice[position].isHeld = 0;

    initializeDiSprites(position);

    diSpriteFlip();
}
