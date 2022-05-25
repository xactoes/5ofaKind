#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(highScoreDisplay)
void highScoreDisplay(uint8 currentScreen) BANKED
{
	uint8 len;

	bufferClear();

	switch(currentScreen)
	{
		case HIGH_SCORE_0:
			for(uint8 i = 0; i != 6; i++)
			{
				len = bcd2text(&highScoreBCD[i], 0x10, buf);
				set_bkg_tiles(5, 5, len, 1, buf);
			}
			break;
		case HIGH_SCORE_1:
			for(uint8 i = 6; i != 12; i++)
			{
				//
			}
			break;
		case HIGH_SCORE_2:
			for(uint8 i = 12; i != 18; i++)
			{
				//
			}
			break;
		case HIGH_SCORE_3:
			for(uint8 i = 18; i != 24; i++)
			{
				//
			}
			break;
	}
}
