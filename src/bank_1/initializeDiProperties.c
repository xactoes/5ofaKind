#include <gb/gb.h>

#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(initializeDiProperties)
void initializeDiProperties(uint8 diPosition) BANKED
{
    assignDiFace(diPosition);

    dice[diPosition].isHeld = 0;

    initializeDiSprites(diPosition);

    diSpriteFlip();
}
