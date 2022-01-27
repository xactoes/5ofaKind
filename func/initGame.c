#include <gb/gb.h>

#include "../func/dice_tools.h"
#include "../func/glob_vars.h"
#include "../func/scoreDisplay.h"
#include "../func/spriteFlip.h"
#include "../func/turnRollDisplay.h"

#include "../res/Sprites.h"
#include "../res/backgroundData.h"
#include "../res/maps.h"

#include "../sram/save_vars.h"

void initGame(){
    set_sprite_data(0, 7, Sprites);
	set_sprite_tile(cursor, 5);
	set_bkg_data(0, 128, backgroundData);
    set_bkg_tiles(0, 0, 20, 32, backgroundMap);

    //sets player name on screen
    for(i = 7; i != -1; i--){
        // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
        set_bkg_tile_xy(i + 2, 2, currentName[i]);
    }

    viewMode = 0;

    SHOW_BKG;

    initDi(&Di1, 1);
    initDi(&Di2, 2);
    initDi(&Di3, 3);
    initDi(&Di4, 4);
    initDi(&Di5, 5);
    spriteFlip();


	cursorIndex = 0;
	cursorPosition[0] = 16;
	cursorPosition[1] = 144;
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);

	scoreDisplay();

	rollsLeft = cheatRolls;
	turn = 1;

    turnRollDisplay();
}
