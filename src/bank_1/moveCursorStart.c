#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_0/drawBackground.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"

#pragma bank 1

BANKREF(moveCursorStart)
void moveCursorStart() BANKED
{
	screen = SCREEN_START;
	bkgDrawn = 0;
	move_sprite(ARROW_RIGHT, 0, 0);
	move_sprite(ARROW_LEFT, 0, 0);
	move_sprite(ARROW_UP, 0, 0);
	HIDE_SPRITES;

	drawBackground(SCREEN_START);

	while(screen == SCREEN_START)
	{
		if((joypad() & J_SELECT) && (joypad() & J_START))
		{
			loadMenu();
			waitpadup();
		}
		switch(joypad())
		{
			case J_B:
				// SWITCH TO CARD VIEW
				hideDiAll();
				screen = SCREEN_CARD;
				bkgDrawn = 0;
				move_sprite(ARROW_RIGHT, 0, 0);
				move_sprite(ARROW_LEFT, 0, 0);
				move_sprite(ARROW_UP, 0, 0);
				HIDE_SPRITES;
				waitpadup();
				break;
		}
	}
}
