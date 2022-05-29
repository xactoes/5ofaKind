#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_0/dice_b0.h"

#pragma bank 1

BANKREF(moveCursorGameSelect)
void moveCursorGameSelect() BANKED
{
	// SWITCH TO CARD VIEW
	hideDiAll();
	screen = SCREEN_CARD;
	bkgDrawn = 0;
	move_sprite(ARROW_RIGHT, 0, 0);
	move_sprite(ARROW_LEFT, 0, 0);
	move_sprite(ARROW_UP, 0, 0);
	HIDE_SPRITES;
}
