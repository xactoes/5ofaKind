#include "../func/glob_vars.h"
#include "../func/logicGame.h"
#include <stdio.h>

unsigned int rollsEnabled(){
    //if less than or equal to minimum turns in a game (not counting turns spent on bonus 5ofaKind)
    if(turn - bonusTally <= 13){
        //if no rolls left
        if(!rollsCheck()){
            //disable rolls
            return 0;
        }
        //otherwise enable rolls
        else{
            return 1;
        }
    }
    //otherwise, if game is done
    else if(turn - bonusTally > 13){
        //disable rolls
        return 0;
    }
}
