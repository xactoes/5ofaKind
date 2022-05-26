#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_2/screens.h"
#include "../sram/save_variables.h"

#include "../bank_0/vblDelay.h"

#pragma bank 0

BANKREF(nameInputDisplay)
void nameInputDisplay(uint8 currentScreen) BANKED
{
	uint8 tileIndex = 0;

	switch(currentScreen)
	{
		case SCREEN_NAME_INPUT_0:

			for(uint8 j = 6; j != 14; j += 2)
			{
				for(uint8 i = 0; i != 20; i += 2)
				{
					set_bkg_tile_xy(i, j, nameInputCharArray[tileIndex]);
					tileIndex++;
					vblDelay(10);
				}
			}
			break;
		case SCREEN_NAME_INPUT_1:
			break;
		case SCREEN_NAME_INPUT_2:
			break;
	}
}
