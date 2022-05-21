#include <gb/gb.h>

#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/randomRange.h"

#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(assignDiFace)
void assignDiFace(uint8 diPosition) BANKED
{
    if(!diceInitialized)
    {
        dice[diPosition].face = 1;
    }

    else
    {
        dice[diPosition].face = randomRange(1, 6);
    }
}
