#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bonusTally)
uint8 bonusTally() BANKED
{
	uint16 tally;
	if(scorecard[13] != 255)
	{
		tally = (scorecard[13] / 100);
	}
	else
	{
		tally = 0;
	}
	return tally;
}
