#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"

void spriteFlip(){
	for(i = 1; i <= 17; i = i + 4){
        set_sprite_prop(i, S_FLIPX);
	}

	for(i = 2; i <= 18; i = i + 4){
        set_sprite_prop(i, S_FLIPY);
	}

	for(i = 3; i <= 19; i = i + 4){
        set_sprite_prop(i, S_FLIPX | S_FLIPY);
	}
}
