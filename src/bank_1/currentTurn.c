#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(currentTurn)
uint16 currentTurn() BANKED
{
	uint16 turnsPassed = 0;

	for(uint8 marked = 0; marked != 13; marked++)
	{
		if(scorecard[marked] != 255)
		{
			turnsPassed++;
		}
	}

	if(scorecard[12] == 50 && scorecard[13] != 255)
	{
		if(bonusTally() == 0 && scorecard[13] == 50)
		{
			turnsPassed += 1;
		}
		else
		{
			turnsPassed += bonusTally();
		}
	}

	if(turnsPassed == turn)
	{
		turn = turnsPassed + 1;
		rolls = MAX_ROLLS;
		diceInitialized = 0;
		cursorGameX	= 16;
		cursorGameY	= 144;
	}
	return turn;
}
