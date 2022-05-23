#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 1

BANKREF(initializeCursorSprites)
void initializeCursorSprites() BANKED
{
	set_sprite_tile(ARROW_RIGHT, 5);
	set_sprite_tile(ARROW_LEFT, 6);
	set_sprite_tile(ARROW_UP, 7);
}
