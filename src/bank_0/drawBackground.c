#include <gb/gb.h>
#include <string.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/displayUpdates.h"
#include "../bank_1/info.h"
#include "../bank_1/score.h"
#include "../bank_2/drawScreens.h"
#include "../bank_2/screens.h"
#include "../sram/save_variables.h"

#pragma bank 0

BANKREF(drawBackground)
void drawBackground(uint8 screen) BANKED
{
	bcdCleaned = 0;
	switch(screen)
	{
		case SCREEN_SPLASH:
			break;
		case SCREEN_TITLE:
			drawScreenTitle();
			SHOW_BKG;
			break;
		case SCREEN_OPTIONS:
			drawScreenOptions();
			SHOW_BKG;
			break;
		case HIGH_SCORE_0:
			if(!bkgDrawn)
			{
				drawScreenHighScore();
				highScoreDisplay(HIGH_SCORE_0);
				bkgDrawn = 1;
				SHOW_BKG;
			}
			break;
		case HIGH_SCORE_1:
			if(!bkgDrawn)
			{
				drawScreenHighScore();
				highScoreDisplay(HIGH_SCORE_1);
				bkgDrawn = 1;
				SHOW_BKG;
			}
			break;
		case HIGH_SCORE_2:
			if(!bkgDrawn)
			{
				drawScreenHighScore();
				highScoreDisplay(HIGH_SCORE_2);
				bkgDrawn = 1;
				SHOW_BKG;
			}
			break;
		case HIGH_SCORE_3:
			if(!bkgDrawn)
			{
				drawScreenHighScore();
				highScoreDisplay(HIGH_SCORE_3);
				bkgDrawn = 1;
				SHOW_BKG;
			}
			break;
		case SCREEN_NAME_INPUT_0:
			if(!bkgDrawn)
			{
				drawScreenNameInput();
				nameInputDisplay(SCREEN_NAME_INPUT_0, nameInputCharArray);
				bkgDrawn = 1;
			}
			break;
		case SCREEN_NAME_INPUT_1:
			if(!bkgDrawn)
			{
				drawScreenNameInput();
				nameInputDisplay(SCREEN_NAME_INPUT_1, nameInputCharArray);
				bkgDrawn = 1;
			}
			break;
		case SCREEN_NAME_INPUT_2:
			if(!bkgDrawn)
			{
				drawScreenNameInput();
				nameInputDisplay(SCREEN_NAME_INPUT_2, nameInputCharArray);
				bkgDrawn = 1;
			}
			break;
		case SCREEN_LINK:
			if(!bkgDrawn)
			{
				drawScreenLink();
				bkgDrawn = 1;
				SHOW_BKG;
			}
			break;
		case SCREEN_PLAY:
			drawScreenPlay();
			if(!bcdCleaned)
			{
				// DISPLAY PLAYER NAME
				ENABLE_RAM_MBC1;
			    SWITCH_RAM_MBC1(0);
			    for(int8 i = 7; i != -1; i--){
			        // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
			        set_bkg_tile_xy(i + 2, 2, currentName[i]);
			    }
			    DISABLE_RAM_MBC1;

				// DISPLAY TURN AND ROLLS
				bcdDisplayTurn();
				bcdDisplayRolls();
				if(rolls < 10){
					set_bkg_tile_xy(17, 5, 0x00);
				}

				// DISPLAY SCORE
				bcdDisplayScoreTotal(SCREEN_PLAY);
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
				bcdDisplayScoreTotal(SCREEN_CARD);
				bcdCleaned = 1;
				SHOW_BKG;
			}
			break;
		case SCREEN_START:
			drawScreenStartMenu();
			SHOW_BKG;
			break;
		case SCREEN_END:
			drawScreenEnd();
			bcdDisplayScoreTotal(SCREEN_END);
			SHOW_BKG;
			break;
		case SCREEN_CREDITS:
			break;
	}
}
