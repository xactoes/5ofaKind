#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 0

BANKREF(rollDi)
void rollDi(uint8 position) BANKED
{
	if(dice[position].isHeld == 0)
	{
		assignDiFace(position);
		assignDiSprites(position);
	}
}
