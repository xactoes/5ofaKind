#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_2/screens.h"

#pragma bank 2

BANKREF(drawScreenNameInput)
void drawScreenNameInput() BANKED
{
	//HIDE_SPRITES;
	set_bkg_data(0, TILE_COUNT_GAME, gameData);
	set_bkg_tiles(0, 0, 20, 18, nameInputMap);
	SHOW_BKG;
}
