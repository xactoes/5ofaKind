#include <gb/gb.h>
#include <string.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"
#include "../sram/save_variables.h"

#pragma bank 0

BANKREF(moveCursorNameInput)
void moveCursorNameInput() BANKED
{
	uint8 tileX, tileY;

	//make save variables accessible as they can be written to in this function
	ENABLE_RAM_MBC1;
	SWITCH_RAM_MBC1(0);

	for(uint8 i = 0; i != 8; i++){
		set_bkg_tile_xy(i + 6, 3, tempName[i]);
	}

	switch(joypad())
	{
		// UPDATE NAME INPUT
		case J_A:
			tileX = (cursorNameX-4)/8 - 1;
			tileY = ((cursorNameY)/8) - 3;

			if(tempName[0] == 0x00)
			{
				for(uint8 i = 0; i != 7; i++)
				{
	                tempName[i] = tempName[i + 1];
                }
	            tempName[7] = get_bkg_tile_xy(tileX, tileY);
			}
			waitpadup();
			break;

		// BACKSPACE
		case J_B:
		for(uint8 i = 7; i != 0; i--)
		{
            tempName[i] = tempName[i - 1];
        }
        tempName[0] = 0x00;
        waitpadup();
        break;

		// NAVIGATE CHARACTER MAP
		case J_LEFT:
			if(cursorNameX > X_LEFT_NAME)
			{
				cursorNameX -= GAP_X_NAME;
			}
			waitpadup();
			break;
		case J_RIGHT:
			if(cursorNameX < X_RIGHT_NAME)
			{
				cursorNameX += GAP_X_NAME;
			}
			waitpadup();
			break;
		case J_UP:
			if(cursorNameY > Y_TOP_NAME)
			{
				cursorNameY -= GAP_Y_NAME;
			}
			waitpadup();
			break;
		case J_DOWN:
			if(cursorNameY < Y_BOTTOM_NAME)
			{
				cursorNameY += GAP_Y_NAME;
			}
			waitpadup();
			break;

		// SWITCH SCREEN MAPS
		case J_SELECT:
			if(screen < SCREEN_NAME_INPUT_2)
			{
				screen++;
				cursorNameX1 += 40;
				cursorNameX2 += 40;
				bkgDrawn = 0;
			}
			else if(screen == SCREEN_NAME_INPUT_2)
			{
				screen = SCREEN_NAME_INPUT_0;
				cursorNameX1 -= 80;
				cursorNameX2 -= 80;
				bkgDrawn = 0;
			}
			waitpadup();
			break;

		case J_START:
			//copies tempName into currentName
           	memcpy(currentName, tempName, sizeof(currentName));

           //hide screen objects while cleaning up
           HIDE_BKG;
           HIDE_SPRITES;

           //fix background back to non-scrolled position
           scroll_bkg(4, 0);

           //mark background as not scrolled
           backgroundScrolled = 0;

           //hide sprite offscreen
           move_sprite(ARROW_RIGHT, 0, 0);
		   move_sprite(ARROW_LEFT, 0, 0);
		   move_sprite(ARROW_UP, 0, 0);

           //mark variable to indicate a save has been initialized with a player
           //chosen name for next startup check by checkName() in main()
           saveInitialized = 1;
           //enter into title again
           loadMenu();
           waitpadup();
           break;

	}
	// UPDATE CURSOR POSITION ON SCREEN
	drawCursor(screen);

	// // DISPLAY NAME
	// for(uint8 i = 0; i != 8; i++)
	// {
	// 	set_bkg_tile_xy(i + 6, 3, tempName[i]);
	// }

    DISABLE_RAM_MBC1;
}
