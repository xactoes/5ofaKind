#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(fiveOfaKindBonus)
uint8 fiveOfaKindBonus() BANKED
{
	uint8 tempScore;

	switch(scorecard[13])
	{
		case 0:
			tempScore = 0;
			break;
		default:
			if(scorecard[12] == 50)
			{
				if(diceSorted[0] == diceSorted[1] && diceSorted[1] == diceSorted[2] && diceSorted[2] == diceSorted[3] && diceSorted[3] == diceSorted[4])
				{
					tempScore = 50;
				}
				else
				{
					tempScore = 0;
				}
			}
			break;
	}
	return tempScore;
}
