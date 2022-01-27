#include </opt/gbdk/include/gb/gb.h>
#include <stdio.h>

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

void titleScreen(){
    HIDE_BKG;
    HIDE_SPRITES;
    set_bkg_data(0, 93, splashScreen_data);
    set_bkg_tiles(0, 0, 20, 18, splashScreen_map);


    set_sprite_data(0, 7, Sprites);
	set_sprite_tile(cursorLeft, 5);
    set_sprite_tile(cursorRight, 6);

    titlePosL[0] = 64;
    titlePosL[1] = 96;
    titlePosR[0] = 104;
    titlePosR[1] = titlePosL[1];

    move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
    move_sprite(cursorRight, titlePosR[0], titlePosR[1]);

    SHOW_BKG;
    SHOW_SPRITES;


    //while on the title screen, listen for navigation and selection input
    while(viewTitle == 1){
        switch(joypad()){

            //menu navigation

            case J_DOWN:
                //if it is at the bottom, do nothing
                if(indexTitle >= 3) return;

                //otherwise, move it down one
                else if(indexTitle >= 0 && indexTitle < 3){
                    if(indexTitle == 0){
                        titlePosL[0] = 40;
                        titlePosR[0] = 136;
                    }
                    else if(indexTitle == 1){
                        titlePosL[0] = 48;
                        titlePosR[0] = 120;
                    }
                    else if(indexTitle == 2){
                        titlePosL[0] = 56;
                        titlePosR[0] = 120;
                    }
                    titlePosL[1] += 8;
                    titlePosR[1] = titlePosL[1];
                    indexTitle++;
                }
                move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
                move_sprite(cursorRight, titlePosR[0], titlePosR[1]);
                waitpadup();
                break;

            case J_UP:
                //if it is at the top, do nothing
                if(indexTitle == 0) return;

                //otherwise, move it up one
                else if(indexTitle > 0 && indexTitle <= 3{
                    if(indexTitle == 1){
                        titlePosL[0] = 64;
                        titlePosR[0] = 104;
                    }
                    else if(indexTitle == 2){
                        titlePosL[0] = 40;
                        titlePosR[0] = 136;
                    }
                    else if(indexTitle == 3){
                        titlePosL[0] = 48;
                        titlePosR[0] = 120;
                    }
                    titlePosL[1] -= 8;
                    titlePosR[1] = titlePosL[1];
                    indexTitle--;
                }
                move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
                move_sprite(cursorRight, titlePosR[0], titlePosR[1]);
                waitpadup();
                break;

            //menu selection
            case J_A:
                //clear sprites off screen
                HIDE_SPRITES;
                move_sprite(20, 0, 0);
                move_sprite(21, 0, 0);

                //hide the background so the next screen can prep its background
                HIDE_BKG;

                //check which option was selected
                switch(indexTitle){
                    case 0:
                        //tell main() that we are switching screens from title to options
                        viewTitle = 0;
                        viewGame = 1;
                        waitpadup();
                        break;
                    case 1:
                        waitpadup();
                        break;
                        waitpadup();
                    case 2:
                        waitpadup();
                        break;
                    case 3:
                        //tell main() that we are switching screens from title to options
                        viewTitle = 0;
                        viewOptions = 1;
                        waitpadup();
                        break;
        }
    }
}
