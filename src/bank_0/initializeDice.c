#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_1/dice.h"

#pragma bank 0

BANKREF(initializeDice)
void initializeDice() BANKED
{
	for(uint8 position = 0; position != DICE_COUNT; position++)
    {
        initializeDiProperties(position);
        drawDi(position);
    }

    diceInitialized = 1;
}
