#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_2/screens.h"

#pragma bank 2

BANKREF(drawScreenPlay)
void drawScreenPlay() BANKED
{
	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	if(!bkgDrawn)
	{
		set_bkg_tiles(0, 0, 20, 18, playMap);
		bkgDrawn = 1;
		bcdCleaned = 0;
	}
	screen = SCREEN_PLAY;
}
