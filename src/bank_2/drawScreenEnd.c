#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_2/screens.h"

#pragma bank 2

BANKREF(drawScreenEnd)
void drawScreenEnd() BANKED
{
	hideDiAll();
	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	if(!bkgDrawn)
	{
		set_bkg_tiles(0, 0, 20, 18, endMap);
		bkgDrawn = 1;
	}
	screen = SCREEN_CARD;
}
