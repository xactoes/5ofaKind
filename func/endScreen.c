#include <gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//backgrounds
#include "../res/backgroundData.h"
#include "../res/maps.h"

void endScreen(){
    while(endScreenScrolled != 1){
        HIDE_BKG;

        set_bkg_data(0, 128, backgroundData);

        scroll_bkg(0, 112);

        set_bkg_tiles(0, 0, 20, 18, endScreenMap);
        /*
        for(i = 7; i != -1; i--){
            // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
            set_bkg_tile_xy(i + 2, 2, storedName[i]);
        }
        */
        //will use above code later for displaying name, but not right now
        for(i = 0; i != 24; i++){
            move_sprite(i, 0, 0);
        }

        endScreenScrolled = 1;

        SHOW_BKG;
    }

    switch(joypad()){
        case J_START:
            viewEnd = 0;
            waitpadup();
            break;
        case J_A:
            viewEnd = 0;
            waitpadup();
            break;
        case J_B:
            viewEnd = 0;
            viewTitle = 1;
            waitpadup();
            break;
    }

}
