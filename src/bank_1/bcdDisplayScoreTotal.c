#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bcdDisplayScoreTotal)
void bcdDisplayScoreTotal() BANKED
{
	uint16 scorecardBuf;
	uint8 len;

	bufferClear();

	bcd_sub(&totalScore, &totalScore);

	for(uint8 index = 0; index != 14; index++)
	{
		if(scorecard[index] != 255)
		{
			scorecardBuf += scorecard[index];
		}
	}

	uint2bcd(scorecardBuf, &totalScore);
	len = bcd2text(&lowerScore, 0x10, buf);

	switch(screen)
	{
		case SCREEN_PLAY:
			if(scorecardBuf < 10)
			{
				set_bkg_tiles(18, 2, len-7, 1, buf+7);
			}
			else if(scorecardBuf < 100)
			{
				set_bkg_tiles(17, 2, len-6, 1, buf+6);
			}
			else if(scorecardBuf < 1000)
			{
				set_bkg_tiles(16, 2, len-5, 1, buf+5);
			}
			else if(scorecardBuf < 10000)
			{
				set_bkg_tiles(15, 2, len-4, 1, buf+4);
			}
			break;
		case SCREEN_CARD:
			if(scorecardBuf < 10)
			{
				set_bkg_tiles(18, 16, len-7, 1, buf+7);
			}
			else if(scorecardBuf < 100)
			{
				set_bkg_tiles(17, 16, len-6, 1, buf+6);
			}
			else if(scorecardBuf < 1000)
			{
				set_bkg_tiles(16, 16, len-5, 1, buf+5);
			}
			else if(scorecardBuf < 10000)
			{
				set_bkg_tiles(15, 16, len-4, 1, buf+4);
			}
			break;
	}
}
