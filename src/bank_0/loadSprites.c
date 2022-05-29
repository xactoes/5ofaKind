#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/data_sprites.h"

void loadSprites()
{
	set_sprite_data(0, SPRITES_SIZE, sprites);
}
