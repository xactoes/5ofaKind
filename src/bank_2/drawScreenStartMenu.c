#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_2/screens.h"

#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 2

BANKREF(drawScreenStartMenu)
void drawScreenStartMenu() BANKED
{
	hideDiAll();

	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	if(!bkgDrawn)
	{
		set_bkg_tiles(0, 0, 20, 18, startMap);
		bkgDrawn = 1;
	}
	screen = SCREEN_START;
}
