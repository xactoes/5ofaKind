#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/resetData.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"
#include "../bank_1/soundEffects.h"

void moveCursorOptions()
{
	switch(joypad())
	{
		case J_UP:
			if(cursorOptionsY > Y_NAME_INPUT)
			{
				soundCursorMove();
				cursorOptionsY -= GAP_Y_OPTIONS;
			}
			drawCursor(SCREEN_OPTIONS);
			waitpadup();
			break;
		case J_DOWN:
			if(cursorOptionsY < Y_RESET)
			{
				soundCursorMove();
				cursorOptionsY += GAP_Y_OPTIONS;
			}
			drawCursor(SCREEN_OPTIONS);
			waitpadup();
			break;
		case J_A:
			if(cursorOptionsY == Y_NAME_INPUT)
			{
				soundCursorMove();
				move_sprite(ARROW_RIGHT, 0, 0);
				move_sprite(ARROW_LEFT, 0, 0);
				move_sprite(ARROW_UP, 0, 0);
				drawCursor(SCREEN_NAME_INPUT_0);
				screen = SCREEN_NAME_INPUT_0;
			}
			else if(cursorOptionsY == Y_AUDIO)
			{
				//soundCursorMove();
			}
			else if(cursorOptionsY == Y_RESET)
			{
				soundCursorMove();
				ENABLE_RAM_MBC1;
				SWITCH_RAM_MBC1(0);
				resetData();
				DISABLE_RAM_MBC1;
			}
			break;
		case J_B:
			soundCursorMove();
			loadMenu();
			waitpadup();
			break;
	}
}
