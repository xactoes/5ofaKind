#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"


#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 1

BANKREF(bcdDisplayScoreUpper)
void bcdDisplayScoreUpper() BANKED{
	uint8 len = 0;
    uint8 buf[10];

    for(uint8 i = 0; i != 10; i++)
	{
        buf[i] = 0;
    }

	for(uint8 index = 0; index != 15; index++)
	{
		if(scorecard[index] != 255){
			scorecardCompare[index] = scorecard[index];

			uint2bcd(scorecardCompare[index], &upperScoreBuf);

			len = bcd2text(&upperScoreBuf, 0x10, buf);

            switch(index)
			{
        		//1's
        		case 0:
        			set_bkg_tiles(2, 4, len, 1, buf);
        			break;
        		//2's
        		case 1:
        			set_bkg_tiles(2, 5, len, 1, buf);
        			break;
        		//3's
        		case 2:
        			set_bkg_tiles(2, 24, len, 1, buf);
        			break;
        		//4's
        		case 3:
        			set_bkg_tiles(11, 22, len, 1, buf);
        			break;
        		//5's
        		case 4:
        			set_bkg_tiles(11, 23, len, 1, buf);
        			break;
        		//6's
        		case 5:
        			set_bkg_tiles(11, 24, len, 1, buf);
        			break;
        	}
            bcdCleanup();
		}
	}
}
