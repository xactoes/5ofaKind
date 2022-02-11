#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//sprites
#include "../res/Sprites.h"

//backgrounds
#include "../res/maps.h"

void title(){

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
    //set cursor position
    titlePosL[0] = 48;
    titlePosL[1] = 96;
    //move cursor to position
    move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
    //move_sprite(cursorRight, titlePosR[0], titlePosR[1]);
    //display sprites
    SHOW_SPRITES;

    indexTitle = 0;

    //while on the title screen, listen for navigation and selection input
    while(viewTitle){
        switch(joypad()){

            //menu navigation

            case J_DOWN:
                //if not at bottom, move it down one
                if(indexTitle >= 0 && indexTitle < 3){
                    titlePosL[1] += 8;
                    indexTitle++;
                }
                move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
                waitpadup();
                break;

            case J_UP:
                //if not at top, move it up one
                if(indexTitle > 0 && indexTitle <= 3){
                    titlePosL[1] -= 8;
                    indexTitle--;
                }
                move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
                waitpadup();
                break;

            //menu selection
            case J_A:
                //clear sprites off screen
                HIDE_SPRITES;
                move_sprite(20, 0, 0);

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
                        viewTitle = 0;
                        viewScores = 1;
                        waitpadup();
                        break;
                    case 2:
                        viewTitle = 0;
                        viewLink = 1;
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
