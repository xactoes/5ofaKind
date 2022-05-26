#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"

#pragma bank 0

BANKREF(moveCursorNameInput)
void moveCursorNameInput() BANKED
{
	switch(joypad())
	{
		case J_LEFT:
			if(cursorNameX > X_LEFT_NAME)
			{
				cursorNameX -= GAP_X_NAME;
			}
			drawCursor(screen);
			waitpadup();
			break;
		case J_RIGHT:
			if(cursorNameX < X_RIGHT_NAME)
			{
				cursorNameX += GAP_X_NAME;
			}
			drawCursor(screen);
			waitpadup();
			break;
		case J_UP:
			if(cursorNameY > Y_TOP_NAME)
			{
				cursorNameY -= GAP_Y_NAME;
			}
			drawCursor(screen);
			waitpadup();
			break;
		case J_DOWN:
			if(cursorNameY < Y_BOTTOM_NAME)
			{
				cursorNameY += GAP_Y_NAME;
			}
			drawCursor(screen);
			waitpadup();
			break;
		case J_SELECT:
			if(screen < SCREEN_NAME_INPUT_2)
			{
				screen++;
				bkgDrawn = 0;
			}
			else if(screen == SCREEN_NAME_INPUT_2)
			{
				screen -= 2;
				bkgDrawn = 0;
			}
			waitpadup();
			break;
	}
}
