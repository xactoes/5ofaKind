#include <gb/gb.h>
#include "../bank_1/dice.h"

#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 1

BANKREF(initializeDiProperties)
void initializeDiProperties(uint8 position) BANKED
{
    // NEW initializeDiSprites call
    initializeDiSprites(position);

    assignDiFace(position);
    assignDiSprites(position);

    dice[position].isHeld = 0;

    //OLD initializeDiSprites call

    diSpriteFlip();
}
