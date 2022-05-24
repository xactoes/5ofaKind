#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(diceSort)
void diceSort() BANKED
{
	uint8 temp;
	uint8 leastDi;

	for(uint8 i = 0; i != 5; i++)
	{
		diceSorted[i] = dice[i].face;
	}

	for(uint8 currDi = 0; currDi != 4; currDi++)
	{
		leastDi = currDi;
		for(uint8 nextDi = currDi + 1; nextDi != 5; nextDi++)
		{
			if(diceSorted[nextDi] < diceSorted[leastDi])
			{
				leastDi = nextDi;

				temp = diceSorted[leastDi];
				diceSorted[leastDi] = diceSorted[currDi];
				diceSorted[currDi] = temp;
			}

		}
	}
}
