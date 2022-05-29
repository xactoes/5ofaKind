#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"


#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 1

BANKREF(scoreBonusUpperCalc)
uint8 scoreBonusUpperCalc() BANKED
{
	uint8 bonusCheck = 0;
	uint8 bonusValue = 0;

	if(scorecard[14] != 35)
	{
		for(uint8 i = 0; i != 6; i++)
		{
			if(scorecard[i] != 255)
			{
				bonusCheck += scorecard[i];
			}
		}
		if(bonusCheck >= 63)
		{
			bonusValue = 35;
		}
		else
		{
			bonusValue = 0;
		}
	}

	return bonusValue;
}
