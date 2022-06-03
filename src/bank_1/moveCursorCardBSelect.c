#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"
#include "../bank_1/soundEffects.h"

#pragma bank 1

BANKREF(moveCursorCardBSelect)
void moveCursorCardBSelect() BANKED
{
	soundCursorMove();
	// SWITCH TO PLAY VIEW
	screen = SCREEN_PLAY;
	bkgDrawn = 0;
	move_sprite(ARROW_RIGHT, 0, 0);
	move_sprite(ARROW_LEFT, 0, 0);
	move_sprite(ARROW_UP, 0, 0);
	HIDE_SPRITES;
}
