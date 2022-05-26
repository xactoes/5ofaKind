#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bcdDisplayScoreUpperTotal)
void bcdDisplayScoreUpperTotal() BANKED
{
	uint16 scorecardBuf;
	uint8 len;

	bufferClear();

	bcd_sub(&upperScore, &upperScore);

	for(uint8 index = 0; index != 6; index++)
	{
		if(scorecard[index] != 255)
		{
			scorecardBuf += scorecard[index];
		}
	}

	if(scorecard[14] != 255)
	{
		scorecardBuf += scorecard[14];
	}

	uint2bcd(scorecardBuf, &upperScore);
	len = bcd2text(&upperScore, 0x10, buf);

	if(scorecardBuf < 10)
	{
		set_bkg_tiles(18, 8, len-7, 1, buf+7);
	}
	else if(scorecardBuf < 100)
	{
		set_bkg_tiles(17, 8, len-6, 1, buf+6);
	}
	else
	{
		set_bkg_tiles(16, 8, len-5, 1, buf+5);
	}
}
