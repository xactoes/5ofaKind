#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"

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
				newGame();
				HIDE_SPRITES;
				HIDE_BKG;
			}
			else if(cursorTitleY == Y_LINK)
			{
				screen = SCREEN_LINK;
				move_sprite(ARROW_RIGHT, 0, 0);
				move_sprite(ARROW_LEFT, 0, 0);
				move_sprite(ARROW_UP, 0, 0);
				HIDE_SPRITES;
				HIDE_BKG;
			}
			else if(cursorTitleY == Y_OPTIONS)
			{
				screen = SCREEN_OPTIONS;
				move_sprite(ARROW_RIGHT, 0, 0);
				move_sprite(ARROW_LEFT, 0, 0);
				move_sprite(ARROW_UP, 0, 0);
				drawCursor(SCREEN_OPTIONS);
				HIDE_SPRITES;
				HIDE_BKG;
			}
			else if(cursorTitleY == Y_SCORES)
			{
				screen = HIGH_SCORE_0;
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
