#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 0

BANKREF(moveCursorTitle)
void moveCursorTitle() BANKED
{
	switch(joypad())
	{
		case J_UP:
			if(cursorTitleY > Y_PLAY)
			{
				cursorTitleY -= GAP_Y_TITLE;
			}
			drawCursor(SCREEN_TITLE);
			waitpadup();
			break;
		case J_DOWN:
			if(cursorTitleY < Y_OPTIONS)
			{
				cursorTitleY += GAP_Y_TITLE;
			}
			drawCursor(SCREEN_TITLE);
			waitpadup();
			break;
		case J_A:
			if(cursorTitleY == Y_PLAY)
			{
				screen = SCREEN_PLAY;
				move_sprite(ARROW_RIGHT, 0, 0);
				move_sprite(ARROW_LEFT, 0, 0);
				move_sprite(ARROW_UP, 0, 0);
				HIDE_SPRITES;
				HIDE_BKG;
			}
			waitpadup();
			break;
		case J_START:
			break;
	}
}