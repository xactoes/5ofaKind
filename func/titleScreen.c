#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//sprites
#include "../res/Sprites.h"

//backgrounds
#include "../res/maps.h"

/* add in a made by text in bottom of screen */

void titleScreen(){

    //hide screen while setting up
    HIDE_BKG;
    HIDE_SPRITES;

    //setup background
    set_bkg_data(0, 93, titleData);
    set_bkg_tiles(0, 0, 20, 18, titleMap);
    //display background
    SHOW_BKG;

    //setup cursor sprites
    set_sprite_data(0, 8, Sprites);
	set_sprite_tile(cursorLeft, 5);
    set_sprite_tile(cursorRight, 6);
    //set cursor positions
    titlePosL[0] = 64;
    titlePosL[1] = 96;
    titlePosR[0] = 104;
    titlePosR[1] = titlePosL[1];
    //move cursors to position
    move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
    move_sprite(cursorRight, titlePosR[0], titlePosR[1]);
    //display sprites
    SHOW_SPRITES;

    indexTitle = 0;

    //while on the title screen, listen for navigation and selection input
    while(viewTitle == 1){
        switch(joypad()){

            //menu navigation

            case J_DOWN:
                //if not at bottom, move it down one
                if(indexTitle >= 0 && indexTitle < 3){
                    if(indexTitle == 0){
                        titlePosL[0] = 40;
                        titlePosR[0] = 136;
                    }
                    else if(indexTitle == 1){
                        titlePosL[0] = 48;
                        titlePosR[0] = 120;
                    }
                    else if(indexTitle == 2){
                        titlePosL[0] = 48;
                        titlePosR[0] = 112;
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
                //if not at top, move it up one
                if(indexTitle > 0 && indexTitle <= 3){
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
                        titlePosR[0] = 112;
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
}
