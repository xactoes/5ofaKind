#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_2/screens.h"
#include "../sram/save_variables.h"

#pragma bank 2

BANKREF(drawScreenEnd)
void drawScreenEnd() BANKED
{
	uint16 tempScore = 0;

	hideDiAll();

	//eneable ram to grab player name and save score
	ENABLE_RAM_MBC1;
	SWITCH_RAM_MBC1(0);

	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	if(!bkgDrawn)
	{
		set_bkg_tiles(0, 0, 20, 18, endMap);

		// DISPLAY NAME ON END SCREEN
	    for(int8 i = 7; i >= 0; i--)
		{
	        namesArray[24][i] = currentName[i];
	        // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
	        set_bkg_tile_xy(i + 5, 6, namesArray[24][i]);
	    }
		bkgDrawn = 1;
	}

	if(!scoreSaved){
		for(uint8 score = 0; score != 15; score++)
		{
			if(scorecard[score] != 255)
			{
				tempScore += scorecard[score];
			}
		}
		highScore[24] = tempScore;
        sortNamesAndScores();
    }

	screen = SCREEN_END;
}
