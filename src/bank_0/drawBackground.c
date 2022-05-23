#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"
#include "../bank_2/drawScreens.h"

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
			break;
		case SCREEN_CARD:
			drawScreenCard();
			SHOW_BKG;
			if(!bcdCleaned)
			{
				bcdDisplayScoreUpper(cursorIndex);
				bcdCleaned = 1;
			}
			bcdCleanup();
			break;
		case SCREEN_END:
			break;
		case SCREEN_CREDITS:
			break;
	}
}
