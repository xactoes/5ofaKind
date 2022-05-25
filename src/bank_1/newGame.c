#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/init_b0.h"

#pragma bank 1

BANKREF(newGame)
void newGame() BANKED
{
	scorecardInitialized	= 0;
	gameInitialized			= 0;
	turnInitialized			= 0;
	diceInitialized 		= 0;
	bkgDrawn				= 0;
	bcdCleaned				= 0;

	//RESET ALL VARIABLES
	cursorGameX			= 16;
	cursorGameY			= 144;
	cursorCardX			= 16;
	cursorCardY			= 48;

	cursorIndex			= 0;
	rolls				= MAX_ROLLS;
	turn 				= 1;

	bcd_sub(&upperScore, &upperScore);
	bcd_sub(&upperScoreBuf, &upperScoreBuf);
	bcd_sub(&lowerScore, &lowerScore);
	bcd_sub(&lowerScoreBuf, &lowerScoreBuf);
	bcd_sub(&turnBCD, &turnBCD);
	bcd_sub(&totalScore, &totalScore);

	initializeScorecard();
	gameActive();
	screen = SCREEN_PLAY;
}
