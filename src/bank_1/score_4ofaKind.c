#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(fourOfaKind)
uint8 fourOfaKind() BANKED
{
	uint8 tempScore = 0;

	diceSort();

	if(diceSorted[0] == diceSorted[1] && diceSorted[1] == diceSorted[2] && diceSorted[2] == diceSorted[3])
	{
		for(uint8 i = 0; i != 5; i++)
		{
			tempScore += diceSorted[i];
		}
	}
	else if(diceSorted[1] == diceSorted[2] && diceSorted[2] == diceSorted[3] && diceSorted[3] == diceSorted[4])
	{
		for(uint8 i = 0; i != 5; i++)
		{
			tempScore += diceSorted[i];
		}
	}
	else
	{
		tempScore = 0;
	}
	return tempScore;
}
