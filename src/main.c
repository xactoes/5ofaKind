#include <gb/gb.h>
#include <stdio.h>

#include "./bank_0/global_defines.h"
#include "./bank_1/dice.h"


void main(){
    DISPLAY_ON;
    SHOW_BKG;
    SHOW_SPRITES;

    printf("%u\n", dice[0].face);
    printf("%u\n", dice[0].screenCoordinates.x);
}

    // //checks for name save data and loads it in
    // checkName();
    // checkScore();
    //
    //
    // viewTitle = 1;
    //
    // while(1){
    //     //title screen
    //     if(viewTitle){
    //         title();
    //     }
    //
    //     //game being played
    //     if(viewGame){
    //         game();
    //     }
    //
    //     //high score menu
    //     if(viewScores){
    //         highScores();
    //     }
    //
    //     //transfer data screen
    //     if(viewLink){
    //         linkTransfer();
    //     }
    //
    //     //options screen
    //     if(viewOptions){
    //         options();
    //     }
    // }
// }
