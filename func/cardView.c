#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//functions
#include "../func/betterDelay.h"
#include "../func/scoreDisplay.h"


void cardView(unsigned char map[]){
	HIDE_SPRITES;
    for(i = 0; i != 36; i++){
		if(quickSwitch == 0){
			betterDelay(1);
		}
        scroll_bkg(0, 4);
        if(i == 10){
            set_bkg_submap(0, 32, 20, 4, map, 20);
        }
    }
    for(i = 0; i != 20; i++){
		scroll_sprite(i, 0, -88);
	}
	cursorIndex = 8;
	cursorPosition[0] = 16;
	cursorPosition[1] = 48;
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
	upperRegion = 1;
	quickSwitch = 0;
    viewMode = 1;
	scoreDisplay();
	SHOW_SPRITES;
}
