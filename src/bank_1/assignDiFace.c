#include <gb/gb.h>

#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/randomRange.h"

#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(assignDiFace)
void assignDiFace(uint8 position) BANKED
{
    if(!diceInitialized)
    {
        dice[position].face = 1;
    }

    else
    {
        dice[position].face = randomRange(1, 6);
    }
}
