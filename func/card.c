#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//functions
#include "../func/betterDelay.h"
#include "../func/logicScore.h"


void card(unsigned char map[]){
    if(viewSwitch){
        //hide sprites (dice and cursor) while setting up
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

        //BEGIN SPRITE SETUP
        //move dice offscreen
        for(i = 0; i != 20; i++){
            scroll_sprite(i, 0, -88);
        }

        //setup cursor position
        indexCursor = 8;
        cursorPosition[0] = 16;
        cursorPosition[1] = 48;
        move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
        //END SPRITE SETUP

        //now actually show all the sprites
        SHOW_SPRITES;

        upperRegion = 1;     //this is really important

        //turn quickSwitch off again
        quickSwitch = 0;

        //tell outer while loops that the view no longer needs to be switched
        viewSwitch = 0;

        //show_score
        scoreDisplay();
    }
    else return;
}
