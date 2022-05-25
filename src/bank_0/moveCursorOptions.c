#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

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
				//
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
