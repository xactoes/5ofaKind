#include <gb/gb.h>

#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

#include "../func/screens.h"

#include "../res/Sprites.h"
#include "../res/backgroundData.h"
#include "../res/maps.h"

void options(){
    //set cursor positions
    unsigned int optionsPos[2] = {24, 48};

    //hide screen while setting up
    HIDE_BKG;
    HIDE_SPRITES;

    //setup background
    set_bkg_data(0, 128, backgroundData);
    set_bkg_tiles(0, 0, 20, 18, optionsMap);
    //display background
    SHOW_BKG;

    //setup cursor sprite
    set_sprite_data(0, 8, Sprites);
	set_sprite_tile(cursorLeft, 5);
    //move cursor to position
    move_sprite(cursorLeft, optionsPos[0], optionsPos[1]);
    //display sprites
    SHOW_SPRITES;

    indexOptions = 0;

    while(viewOptions){
        if(viewNameInput){
            nameInput();
        }
        switch(joypad()){
            case J_DOWN:
                //if not at the bottom, move it down one
                if(indexOptions >= 0 && indexOptions < 2){
                    optionsPos[1] += 16;
                    indexOptions++;
                    move_sprite(cursorLeft, optionsPos[0], optionsPos[1]);
                }
                waitpadup();
                break;
            case J_UP:
                //if not at the top, move it up one
                if(indexOptions > 0 && indexOptions <= 2){
                    optionsPos[1] -= 16;
                    indexOptions--;
                    move_sprite(cursorLeft, optionsPos[0], optionsPos[1]);
                }
                waitpadup();
                break;
            case J_A:
                switch(indexOptions){
                    case 0:
                        //clear screen of cursor
                        HIDE_SPRITES;
                        move_sprite(20, 0, 0);

                        //move into sub option of nameInput()
                        viewNameInput = 1;
                        waitpadup();
                        break;
                    case 1:
                        //audioToggle();
                        waitpadup();
                        break;
                    case 2:
                        //resetDataPrompt();
                        waitpadup();
                        break;
                }
                break;
            case J_B:
                //clear screen of cursor
                HIDE_SPRITES;
                move_sprite(20, 0, 0);

                //tell main() that we are switching screens from options to title
                viewOptions = 0;
                viewTitle = 1;
                waitpadup();
                break;
        }
    }
}
