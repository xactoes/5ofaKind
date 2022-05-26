#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"

#pragma bank 0

BANKREF(moveCursorOptions)
void moveCursorOptions() BANKED
{
	switch(joypad())
	{
		case J_UP:
			if(cursorOptionsY > Y_NAME_INPUT)
			{
				cursorOptionsY -= GAP_Y_OPTIONS;
			}
			drawCursor(SCREEN_OPTIONS);
			waitpadup();
			break;
		case J_DOWN:
			if(cursorOptionsY < Y_RESET)
			{
				cursorOptionsY += GAP_Y_OPTIONS;
			}
			drawCursor(SCREEN_OPTIONS);
			waitpadup();
			break;
		case J_A:
			if(cursorOptionsY == Y_NAME_INPUT)
			{
				move_sprite(ARROW_RIGHT, 0, 0);
				move_sprite(ARROW_LEFT, 0, 0);
				move_sprite(ARROW_UP, 0, 0);
				drawCursor(SCREEN_NAME_INPUT_0);
				screen = SCREEN_NAME_INPUT_0;
				//drawBackground(SCREEN_NAME_INPUT_0);
			}
			else if(cursorOptionsY == Y_AUDIO)
			{
				//
			}
			else if(cursorOptionsY == Y_RESET)
			{
				//
			}
			break;
		case J_B:
			loadMenu();
			waitpadup();
			break;
	}
}
