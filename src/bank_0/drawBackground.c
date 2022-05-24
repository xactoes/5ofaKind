#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/info.h"
#include "../bank_1/score.h"
#include "../bank_2/drawScreens.h"

#include "../bank_0/vblDelay.h"

#pragma bank 0

BANKREF(drawBackground)
void drawBackground(uint8 screen) BANKED
{
	switch(screen)
	{
		case SCREEN_SPLASH:
			break;
		case SCREEN_TITLE:
			drawScreenTitle();
			break;
		case SCREEN_PLAY:
			drawScreenPlay();
			if(!bcdCleaned)
			{
				bcdDisplayTurn();
				bcdDisplayRolls();
				bcdCleaned = 1;
				SHOW_BKG;
			}
			break;
		case SCREEN_CARD:
			drawScreenCard();
			if(!bcdCleaned)
			{
				bcdDisplayScoreUpper();
				bcdDisplayScoreLower();
				bcdCleaned = 1;
				SHOW_BKG;
			}
			break;
		case SCREEN_END:
			break;
		case SCREEN_CREDITS:
			break;
	}
}
