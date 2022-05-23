#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/screens.h"

#pragma bank 1

BANKREF(drawScreenTitle)
void drawScreenTitle() BANKED
{
	set_bkg_data(0, TILE_COUNT_TITLE, titleData);
	if(!bkgDrawn)
	{
		set_bkg_tiles(0, 0, 20, 18, titleMap);
		bkgDrawn = 1;
	}
}
