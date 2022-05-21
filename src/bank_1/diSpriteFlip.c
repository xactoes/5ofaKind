#include <gb/gb.h>

#include "../bank_0/global_defines.h"

#pragma bank 1

BANKREF(diSpriteFlip)
void diSpriteFlip() BANKED
{
	for(uint8 i = 1; i <= 17; i = i + 4)
	{
        set_sprite_prop(i, S_FLIPX);
	}

	for(uint8 i = 2; i <= 18; i = i + 4)
	{
        set_sprite_prop(i, S_FLIPY);
	}

	for(uint8 i = 3; i <= 19; i = i + 4)
	{
        set_sprite_prop(i, S_FLIPX | S_FLIPY);
	}
}
