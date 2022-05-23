#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bcdDIsplayScoreLower)
void bcdDisplayScoreLower() BANKED
{
	uint8 len = 0;

	bufferClear();

	for(uint8 index = 6; index != 14; index++)
	{
		if(scorecard[index] != 255)
		{
			scorecardCompare[index] = scorecard[index];
			uint2bcd(scorecardCompare[index], &upperScoreBuf);
			len = bcd2text(&upperScoreBuf, 0x10, buf);

			switch(index)
			{
				// 3 of a Kind
				case 6:
					set_bkg_tiles(8, 10, len-6, 1, buf+6);
					break;
				// 4 of a Kind
				case 7:
					set_bkg_tiles(8, 11, len-6, 1, buf+6);
					break;
				// 5 of a Kind
				case 12:
					set_bkg_tiles(17, 13, len-6, 1, buf+6);
					break;
			}
		}
		bcdDisplayScoreLowerTotal();
	}
}
