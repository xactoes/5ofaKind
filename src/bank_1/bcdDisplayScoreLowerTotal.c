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

	set_bkg_tiles(15, 15, len-4, 1, buf+4);
}
