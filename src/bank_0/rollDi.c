#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

void rollDi(uint8 position)
{
	if(dice[position].isHeld == 0)
	{
		assignDiFace(position);
		assignDiSprites(position);
	}
}
