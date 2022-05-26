#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bcdDisplayScoreLowerTotal)
void bcdDisplayScoreLowerTotal() BANKED
{
	uint16 scorecardBuf;
	uint8 len;

	bufferClear();

	bcd_sub(&lowerScore, &lowerScore);

	for(uint8 index = 6; index != 14; index++)
	{
		if(scorecard[index] != 255)
		{
			scorecardBuf += scorecard[index];
		}
	}
	uint2bcd(scorecardBuf, &lowerScore);

	len = bcd2text(&lowerScore, 0x10, buf);

	if(scorecardBuf < 10)
	{
		set_bkg_tiles(18, 15, len-7, 1, buf+7);
	}
	else if(scorecardBuf < 100)
	{
		set_bkg_tiles(17, 15, len-6, 1, buf+6);
	}
	else if(scorecardBuf < 1000)
	{
		set_bkg_tiles(16, 15, len-5, 1, buf+5);
	}
	else
	{
		set_bkg_tiles(15, 15, len-4, 1, buf+4);
	}
}
