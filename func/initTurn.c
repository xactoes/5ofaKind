#include <gb/gb.h>
#include "../func/glob_vars.h"
#include "../func/dice_tools.h"

void initTurn(){
    rollsLeft = initRolls;
    scorecardChangeA = 0;
    scorecardChangeB = 0;
    if(Di1.inPlay == 0){
        Di1.inPlay = 1;
        for(i = 0; i != 4; i++){
            scroll_sprite(i, 0, -16);
        }
    }
    if(Di2.inPlay == 0){
        Di2.inPlay = 1;
        for(i = 4; i != 8; i++){
            scroll_sprite(i, 0, -16);
        }
    }
    if(Di3.inPlay == 0){
        Di3.inPlay = 1;
        for(i = 8; i != 12; i++){
            scroll_sprite(i, 0, -16);
        }
    }
    if(Di4.inPlay == 0){
        Di4.inPlay = 1;
        for(i = 12; i != 16; i++){
            scroll_sprite(i, 0, -16);
        }
    }
    if(Di5.inPlay == 0){
        Di5.inPlay = 1;
        for(i = 16; i != 20; i++){
            scroll_sprite(i, 0, -16);
        }
    }
}
