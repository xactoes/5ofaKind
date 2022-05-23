#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/dice_b0.h"

#pragma bank 0

BANKREF(rollDice)
void rollDice() BANKED
{
	for(uint8 position = 0; position != DICE_COUNT; position++)
	{
		rollDi(position);
	}
}
