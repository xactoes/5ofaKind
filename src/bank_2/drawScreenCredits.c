#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/vblDelay.h"
#include "../bank_2/screens.h"

#pragma bank 2

BANKREF(drawScreenCredits)
void drawScreenCredits() BANKED
{
	SHOW_BKG;
	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	set_bkg_tiles(0, 0, 20, 18, creditsMapTemp);

	vblDelay(180);
	HIDE_BKG;

	screen = SCREEN_TITLE;
}
