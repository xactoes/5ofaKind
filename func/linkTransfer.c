#include <gb/gb.h>
#include "../res/maps.h"
#include "../res/backgroundData.h"
#include "../func/glob_vars.h"

void linkTransfer(){

        //hide screen while setting up
        HIDE_BKG;
        HIDE_SPRITES;

        //setup background
        set_bkg_data(0, 93, backgroundData);
        set_bkg_tiles(0, 0, 20, 18, linkTransferErrorMap);
        //display background
        SHOW_BKG;

    while(viewLink){
        switch(joypad()){
            case J_A:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
            case J_B:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
            case J_START:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
            case J_SELECT:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
            case J_UP:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
            case J_DOWN:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
            case J_LEFT:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
            case J_RIGHT:
                viewTitle = 1;
                viewLink = 0;
                waitpadup();
                break;
        }
    }

}
