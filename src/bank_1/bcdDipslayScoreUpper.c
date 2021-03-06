#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bcdDisplayScoreUpper)
void bcdDisplayScoreUpper() BANKED
{
	uint8 len = 0;

	bufferClear();

	for(uint8 index = 0; index != 6; index++)
	{
		if(scorecard[index] != 255)
		{
			scorecardCompare[index] = scorecard[index];
			uint2bcd(scorecardCompare[index], &upperScoreBuf);
			len = bcd2text(&upperScoreBuf, 0x10, buf);

            switch(index)
			{
        		//1's
        		case 0:
        			set_bkg_tiles(9, 4, len-7, 1, buf+7);
        			break;
        		//2's
        		case 1:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(9, 5, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(8, 5, len-6, 1, buf+6);
					}
        			break;
        		//3's
        		case 2:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(9, 6, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(8, 6, len-6, 1, buf+6);
					}
        			break;
        		//4's
        		case 3:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(18, 4, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(17, 4, len-6, 1, buf+6);
					}
        			break;
        		//5's
        		case 4:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(18, 5, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(17, 5, len-6, 1, buf+6);
					}
        			break;
        		//6's
        		case 5:
					if(scorecard[index] < 10)
					{
						set_bkg_tiles(18, 6, len-7, 1, buf+7);
					}
					else
					{
						set_bkg_tiles(17, 6, len-6, 1, buf+6);
					}
        			break;
        	}
		}
	}

	if(scorecard[14] != 255)
	{
		scorecardCompare[14] = scorecard[14];
		uint2bcd(scorecardCompare[14], &upperScoreBuf);
		len = bcd2text(&upperScoreBuf, 0x10, buf);

		if(scorecard[14] < 10)
		{
			set_bkg_tiles(18, 7, len-7, 1, buf+7);
		}
		else
		{
			set_bkg_tiles(17, 7, len-6, 1, buf+6);
		}
	}
	bcdDisplayScoreUpperTotal();
}
