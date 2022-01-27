#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

//functions
#include "../func/betterDelay.h"
#include "../func/scoreDisplay.h"
#include "../func/turnRollDisplay.h"


void playView(unsigned char map[]){
	HIDE_SPRITES;
    for(i = 0; i != 36; i++){
		if(quickSwitch == 0){
			betterDelay(1);
		}
        scroll_bkg(0, -4);
        if(i == 10){
            set_bkg_submap(0, 0, 20, 4, map, 20);
        }
    }
    for(i = 7; i != -1; i--){
        // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
        set_bkg_tile_xy(i + 2, 2, currentName[i]);
    }
    for(i = 0; i != 20; i++){
		scroll_sprite(i, 0, 88);
	}
	cursorIndex = 0;
	cursorPosition[0] = 16;
	cursorPosition[1] = 144;
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
	quickSwitch = 0;
	viewMode = 0;
	scoreDisplay();
    turnRollDisplay();
	SHOW_SPRITES;
}
