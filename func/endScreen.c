#include <gb/gb.h>
#include </opt/gbdk/include/gbdk/bcd.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

#include "../func/logicScore.h"

//backgrounds
#include "../res/backgroundData.h"
#include "../res/maps.h"


void endScreen(){
    if(scoreSaved != 1){
        scoreSaved = 0;
    }
    while(endScreenScrolled != 1){
        HIDE_BKG;

        set_bkg_data(0, 128, backgroundData);

        //scroll_bkg(0, 112);

        set_bkg_tiles(0, 0, 20, 18, endScreenMap);


        //will use above code later for displaying name, but not right now
        for(i = 0; i != 24; i++){
            move_sprite(i, 0, 0);
        }

        endScreenScrolled = 1;

        SHOW_BKG;
    }

    //eneable ram to grab player name and save score
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

    for(i = 7; i != -1; i--){
        // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
        set_bkg_tile_xy(i + 5, 6, currentName[i]);
    }


    if(scoreSaved == 0){
        saveScore();
    }


    switch(joypad()){
        case J_START:
            viewEnd = 0;
            viewGame = 0;
            viewGame = 1;
            waitpadup();
            break;
        case J_A:
            viewEnd = 0;
            waitpadup();
            break;
        case J_B:
            viewEnd = 0;
            viewGame = 0;
            viewTitle = 1;
            waitpadup();
            break;
    }

}
