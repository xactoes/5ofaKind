#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/info.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(selectionIsLegal)
uint16 selectionIsLegal() BANKED
{
	currentTurn();
	uint16 legal = 0;
	if(rolls == MAX_ROLLS)
	{
		legal = 0;
	}
	// CHECK IF A SELECTION NEEDS TO BE MADE THIS TURN
	else
	{
		uint8 turnsPassed = 0;
		for(uint8 marked; marked != 14; marked++)
		{
			if(scorecard[marked] != 255)
			{
				turnsPassed++;
			}
		}
		// IF EVERYTHING HAS BEEN SELECTED
		if(turnsPassed == 14)
		{
			// printf("%u\n", fiveOfaKindBonusIsLegal());
			// AND BONUS 5K IS ILLEGAL
			if(!fiveOfaKindBonusIsLegal())
			{
				legal = 0;
				//screen = SCREEN_END;
			}
		}
		else
		{
			legal = 1;
		}
	}
	return legal;
}
