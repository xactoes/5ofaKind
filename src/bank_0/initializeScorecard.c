#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/displayUpdates.h"
#include "../sram/save_variables.h"

#pragma bank 0

BANKREF(initializeScorecard)
void initializeScorecard() BANKED
{
	for(uint8 index = 0; index != 15; index++)
	{
		scorecard[index] = SCORE_NULL;
		scorecardCompare[index] = SCORE_NULL_COMPARE;
	}
	scorecardInitialized = 1;
}
