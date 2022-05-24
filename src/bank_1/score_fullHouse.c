#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(fullHouse)
uint8 fullHouse() BANKED
{
	uint8 tempScore;

	diceSort();

	if(diceSorted[0] == diceSorted[1] && diceSorted[1] == diceSorted[2])
	{
		if(diceSorted[2] != diceSorted[3] && diceSorted[3] == diceSorted[4])
		{
			tempScore = 25;
		}
		else
		{
			tempScore = 0;
		}
	}
	else if(diceSorted[0] == diceSorted[1])
	{
		if(diceSorted[1] != diceSorted[2] && diceSorted[2] == diceSorted[3] && diceSorted[3] == diceSorted[4])
		{
			tempScore = 25;
		}
		else
		{
			tempScore = 0;
		}
	}
	else
	{
		tempScore = 0;
	}
	return tempScore;
}
