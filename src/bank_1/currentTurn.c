#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"

#pragma bank 1

BANKREF(currentTurn)
uint16 currentTurn() BANKED
{
	uint16 newTurn = 1;

	for(uint8 marked; marked != 13; marked++)
	{
		if(scorecard[marked] != 255)
		{
			newTurn++;
		}
	}

	if(scorecard[12] == 50 && scorecard[13] != 255)
	{
		uint16 bonusTally;
		if(scorecard[13] != 255)
		{
			bonusTally = (scorecard[13] / 100);
		}
		else
		{
			bonusTally = 0;
		}

		if(bonusTally == 0 && scorecard[13] > 0)
		{
			newTurn += 1;
		}
		else
		{
			newTurn += bonusTally;
		}
	}

	if(newTurn > turn)
	{
		turn = newTurn;
		rolls = MAX_ROLLS;
	}

	return turn;
}
