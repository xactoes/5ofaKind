
#include "../func/glob_vars.h"

#include "../func/dice_tools.h"

#include "../func/turnRollDisplay.h"

void initTurn(){
    rollsLeft = initRolls;
    scorecardChangeA = 0;
    scorecardChangeB = 0;
    if(Di1.inPlay == 0){
        Di1.inPlay = 1;
        moveDiceStruct(&Di1, Di1.x, rollPosY);
    }
    if(Di2.inPlay == 0){
        Di2.inPlay = 1;
        moveDiceStruct(&Di2, Di2.x, rollPosY);
    }
    if(Di3.inPlay == 0){
        Di3.inPlay = 1;
        moveDiceStruct(&Di3, Di3.x, rollPosY);
    }
    if(Di4.inPlay == 0){
        Di4.inPlay = 1;
        moveDiceStruct(&Di4, Di4.x, rollPosY);
    }
    if(Di5.inPlay == 0){
        Di5.inPlay = 1;
        moveDiceStruct(&Di5, Di5.x, rollPosY);
    }
}
