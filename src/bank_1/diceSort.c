#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#include <stdio.h>
#include "../bank_0/vblDelay.h"
#pragma bank 1

BANKREF(diceSort)
void diceSort() BANKED
{
	uint8 tempDi;
	uint8 minDi;

	for(uint8 i = 0; i != 5; i++)
	{
		diceSorted[i] = dice[i].face;
	}

	for(uint8 currDi = 0; currDi != 4; currDi++)
	{
		// SETS 1ST DI TO KNOWN MINIMUM
		minDi = currDi;

		for(uint8 nextDi = currDi + 1; nextDi != 5; nextDi++)
		{
			// NEXT DI LESS THAN CURRENT DI
			if(diceSorted[nextDi] < diceSorted[minDi])
			{
				// SETS NEW KNOWN MINIMUM
				minDi = nextDi;
				// SWAPS DICE VALUES
				tempDi = diceSorted[minDi];
				diceSorted[minDi] = diceSorted[currDi];
				diceSorted[currDi] = tempDi;
			}
		}
	}
	// for(uint8 i = 0; i != 5; i++)
	// {
	// 	printf("%u\n", diceSorted[i]);
	// }
	// vblDelay(30);
}
