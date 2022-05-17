#include "../func/glob_vars.h"
#include "../func/logicScore.h"
#include "../func/logicGame.h"

unsigned int rollsEnabled(){
    if(turn > 13){
        //if less than or equal to minimum turns in a game (not counting turns spent on bonus 5ofaKind)
        if((turn - 1) - bonusTally <= 12){
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
        else if((turn - 1) - bonusTally > 12){
            //disable rolls
            return 0;
        }
        else return 0;
    }
    else{
        if(!rollsCheck()){
            return 0;
        }
        else{
            return 1;
        }
    }
}
