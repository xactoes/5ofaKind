#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_1/screens.h"

#pragma bank 1

BANKREF(drawScreenCard)
void drawScreenCard() BANKED
{
	hideDiAll();
	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	if(!bkgDrawn){
		set_bkg_tiles(0, 0, 20, 18, cardMap);
		bkgDrawn = 1;
	}
	bcdDisplayScoreUpper();
	screen = SCREEN_CARD;
}
