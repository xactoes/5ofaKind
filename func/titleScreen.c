#include </opt/gbdk/include/gb/gb.h>
#include <stdio.h>
#include <string.h>

//global variables
#include "../func/global_variables.h"
#include "../sram/saveVars.h"

//functions
#include "../func/nameInput.h"

//sprites
#include "../res/Sprites.h"

//backgrounds
#include "../res/maps.h"

/* add in a made by text in bottom of screen */

unsigned char playerName[8];

void titleScreen(){
    HIDE_BKG;
    HIDE_SPRITES;
    set_bkg_data(0, 93, splashScreen_data);
    set_bkg_tiles(0, 0, 20, 18, splashScreen_map);


    set_sprite_data(0, 7, Sprites);
	set_sprite_tile(20, 5);
    set_sprite_tile(21, 6);

    titlePosL[0] = 64;
    titlePosL[1] = 96;
    titlePosR[0] = 104;
    titlePosR[1] = titlePosL[1];

    move_sprite(20, titlePosL[0], titlePosL[1]);
    move_sprite(21, titlePosR[0], titlePosR[1]);

    SHOW_BKG;
    SHOW_SPRITES;

    //checks if a player name has ever been set
    if(saveInitialized != 1){
        //printf("no saveInitialized");
        for(i = 0; i != 8; i ++){
            playerName[i] = inputArray[26];
        }
        ENABLE_RAM_MBC1;
        SWITCH_RAM_MBC1(0);
        memcpy(storedName, playerName, sizeof(storedName));
        //DISABLE_RAM_MBC1;
    }

    while(gameStart == 0){
        switch(joypad()){
            case J_DOWN:
                if(titleIndex == 0){
                    titlePosL[0] = 40;
                    titlePosL[1] += 8;
                    titlePosR[0] = 136;
                    titlePosR[1] = titlePosL[1];
                    titleIndex++;
                }
                else if(titleIndex == 1){
                    titlePosL[0] = 48;
                    titlePosL[1] += 8;
                    titlePosR[0] = 120;
                    titlePosR[1] = titlePosL[1];
                    titleIndex++;
                }
                else if(titleIndex == 2){
                    titlePosL[0] = 56;
                    titlePosL[1] += 8;
                    titlePosR[0] = 120;
                    titlePosR[1] = titlePosL[1];
                    titleIndex++;
                }
                move_sprite(20, titlePosL[0], titlePosL[1]);
                move_sprite(21, titlePosR[0], titlePosR[1]);
                waitpadup();
                break;
            case J_UP:
                if(titleIndex == 1){
                    titlePosL[0] = 64;
                    titlePosL[1] -= 8;
                    titlePosR[0] = 104;
                    titlePosR[1] = titlePosL[1];
                    titleIndex--;
                }
                else if(titleIndex == 2){
                    titlePosL[0] = 40;
                    titlePosL[1] -= 8;
                    titlePosR[0] = 136;
                    titlePosR[1] = titlePosL[1];
                    titleIndex--;
                }
                else if(titleIndex == 3){
                    titlePosL[0] = 48;
                    titlePosL[1] -= 8;
                    titlePosR[0] = 120;
                    titlePosR[1] = titlePosL[1];
                    titleIndex--;
                }
                move_sprite(20, titlePosL[0], titlePosL[1]);
                move_sprite(21, titlePosR[0], titlePosR[1]);
                waitpadup();
                break;
            case J_A:
                if(titleIndex == 0){
                    gameStart = 1;
                    HIDE_SPRITES;
                    move_sprite(21, 0, 0);
                    waitpadup();
                }
                else if(titleIndex == 3){
                    //optionsMenu = 1;
                    HIDE_SPRITES;
                    HIDE_BKG;
                    move_sprite(20, 0, 0);
                    move_sprite(21, 0, 0);
                    nameInputMenu = 1;
                    waitpadup();
                    ENABLE_RAM_MBC1;
                    SWITCH_RAM_MBC1(0);
                    //copies storedName into playerName
                    memcpy(playerName, storedName, sizeof(playerName));
                    nameInput();
                    //copies playerName into storedName
                    memcpy(storedName, playerName, sizeof(storedName));
                    //memcpy(saveInitialized, workInitialized, sizeof(saveInitialized));
                    //DISABLE_RAM_MBC1;
                    SHOW_BKG;
                    SHOW_SPRITES;
                    move_sprite(20, titlePosL[0], titlePosL[1]);
                    move_sprite(21, titlePosR[0], titlePosR[1]);
                }
                break;
        }
    }
}
