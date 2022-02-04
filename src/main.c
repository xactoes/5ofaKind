#include <gb/gb.h>

#include "../func/screens.h"
#include "../func/save_tools.h"
#include "../func/glob_vars.h"


void main(){
    DISPLAY_ON;

    //checks for name save data and loads it in
    checkName();
    scoreSetup();


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
            //linkTransfer();
        }

        //options screen
        if(viewOptions){
            options();
        }
    }
}
