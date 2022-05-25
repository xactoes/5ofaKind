#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"

#pragma bank 1

BANKREF(initializeBCDscores)
void initializeBCDscores() BANKED
{
	for(uint8 i = 0; i != 24; i++)
	{
		// SETS to 0
		bcd_sub(&highScoreBCD[i], &highScoreBCD[i]);
		uint2bcd(highScore[i], &highScoreBCD[i]);
	}

	// BUFFER
	bcd_sub(&highScoreBCD[24], &highScoreBCD[24]);
	uint2bcd(highScore[24], &highScoreBCD[24]);
}
