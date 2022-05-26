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
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(9, 10, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(8, 10, len-6, 1, buf+6);
					}
					break;
				// 4 of a Kind
				case 7:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(9, 11, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(8, 11, len-6, 1, buf+6);
					}
					break;
				// Full House
				case 8:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(9, 12, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(8, 12, len-6, 1, buf+6);
					}
					break;
				// Small Straight
				case 9:
				if(scorecard[index] < 10)
					{
						set_bkg_tiles(18, 10, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(17, 10, len-6, 1, buf+6);
					}
					break;
				// Large Straight
				case 10:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(18, 11, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(17, 11, len-6, 1, buf+6);
					}
					break;
				// Chance
				case 11:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(18, 12, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(17, 12, len-6, 1, buf+6);
					}
					break;
				// 5 of a Kind
				case 12:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(17, 13, len-6, 1, buf+6);
					}
					else
					{
						set_bkg_tiles(17, 13, len-6, 1, buf+6);
					}
					break;
				// 5 of a Kind Bonus
				case 13:
				if(scorecard[index] < 100)
				{
					set_bkg_tiles(18, 14, len-7, 1, buf+7);
				}
				else if(scorecard[index] < 1000)
				{
					set_bkg_tiles(16, 14, len-5, 1, buf+5);

				}
				else
				{
					set_bkg_tiles(15, 14, len-4, 1, buf+4);
				}
				break;
			}
		}
		bcdDisplayScoreLowerTotal();
	}
}
