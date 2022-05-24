#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(fiveOfaKindBonusIsLegal)
uint8 fiveOfaKindBonusIsLegal() BANKED
{
	uint8 legal;

	if(scorecard[12] == 50)
	{
		if(scorecard[13] != 0)
		{
			if(scorecard[13] != 1000)
			{
				legal = 100;
			}
		}
	}

	return legal;
}
