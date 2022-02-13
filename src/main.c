#include <gb/gb.h>

#include "../func/screens.h"
#include "../func/save_tools.h"
#include "../func/glob_vars.h"


void main(){
    //start sound settings
    //set in this order
    NR52_REG  = 0x80; //1000 0000 in binary, turns on sound
    NR50_REG  = 0x77; // sets volumes for left & right channels to max
    NR51_REG  = 0xFF; //1111 1111 in binary, selects channels to use (1 bit per left & right, x4 channels)


    DISPLAY_ON;

    //checks for name save data and loads it in
    checkName();
    checkScore();


    viewTitle = 1;

    while(1){
        //title screen
        if(viewTitle){
            title();
        }

        //game being played
        if(viewGame){
            game();
        }

        //high score menu
        if(viewScores){
            highScores();
        }

        //transfer data screen
        if(viewLink){
            linkTransfer();
        }

        //options screen
        if(viewOptions){
            options();
        }
    }
}
