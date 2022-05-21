#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_2/screens.h"

#pragma bank 2

BANKREF(drawScreenCard)
void drawScreenCard() BANKED
{
	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	set_bkg_tiles(0, 0, 20, 18, cardMap);
}
