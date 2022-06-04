#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_2/screens.h"
#include "../sram/save_variables.h"

#pragma bank 2

BANKREF(drawScreenOptions)
void drawScreenOptions() BANKED
{
	if(!bkgDrawn)
	{
		set_bkg_data(0, TILE_COUNT_GAME, gameData);
		set_bkg_tiles(0, 0, 20, 18, optionsMap);
		bkgDrawn = 1;
	}

	ENABLE_RAM_MBC1;
	SWITCH_RAM_MBC1(0);
	if(audioState == 0)
	{
		set_bkg_tile_xy(10, 6, 0x2F);
		set_bkg_tile_xy(11, 6, 0x26);
		set_bkg_tile_xy(12, 6, 0x26);
	}
	else
	{
		set_bkg_tile_xy(10, 6, 0x2F);
		set_bkg_tile_xy(11, 6, 0x2E);
		set_bkg_tile_xy(12, 6, 0x00);
	}
	wait_vbl_done();
	DISABLE_RAM_MBC1;
}
