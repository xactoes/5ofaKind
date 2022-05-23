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
<<<<<<< HEAD:src/bank_1/drawScreenCard.c
	if(!bkgDrawn){
		set_bkg_tiles(0, 0, 20, 18, cardMap);
		bkgDrawn = 1;
	}
	bcdDisplayScoreUpper();
=======
	set_bkg_tiles(0, 0, 20, 18, cardMap);
>>>>>>> parent of e3770f2 (bcd is started):src/bank_2/drawScreenCard.c
	screen = SCREEN_CARD;
}
