#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

//functions
#include "../func/betterDelay.h"
#include "../func/logicGame.h"
#include "../func/dice_tools.h"
#include "../func/logicScore.h"

#include <stdio.h>


void play(unsigned char map[]){
    if(viewSwitch){
        //hide sprites (dice and cursor) while setting up
        HIDE_SPRITES;

        //setup background
        for(i = 0; i != 36; i++){
            if(bonusFail == 0){
                if(quickSwitch == 0){
                betterDelay(1);
                }
                scroll_bkg(0, -4);
                if(i == 10){
                    set_bkg_submap(0, 0, 20, 4, map, 20);
                }
            }
        }

        ENABLE_RAM_MBC1;
        SWITCH_RAM_MBC1(0);

        //display player name
        for(i = 7; i != -1; i--){
            // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
            set_bkg_tile_xy(i + 2, 2, currentName[i]);
        }

        DISABLE_RAM_MBC1;

        //BEGIN SPRITE SETUP
        if(bonusFail == 0){
            //move dice onto screen again
            for(i = 0; i != 20; i++){
                scroll_sprite(i, 0, heldPosY);
            }
        }
        else{
            bonusFail = 0;
        }

        //setup cursor position
        indexCursor = 0;
        cursorPosition[0] = 16;
        cursorPosition[1] = 144;
        move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
        //END SPRITE SETUP

        //now actually show all the sprites
        SHOW_SPRITES;

        //turn quickSwitch off again
        quickSwitch = 0;

        //tell outer while loops that the view no longer needs to be switched
        viewSwitch = 0;

        //display the score
        scoreDisplay();

        //display the rolls left and current turn
        turnRollDisplay();
    }
    else return;
}
