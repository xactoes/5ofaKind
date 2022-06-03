#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_2/screens.h"
#include "../bank_3/screens_link.h"

#pragma bank 3

BANKREF(drawScreenLink)
void drawScreenLink() BANKED
{
	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	set_bkg_tiles(0, 0, 20, 18, linkMap);
}
