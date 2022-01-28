#include "../func/dice_tools.h"
#include "../func/glob_vars.h"
#include "../func/logicGame.h"

#include "../res/maps.h"

//this function did something, idk what
//i have repurposed it to return the amount of rolls left
unsigned int rollsCheck(){
    //if the game is over
    if(viewGame == 0 && viewEnd == 1){
        return 0;
    }
    //else if game is still going
    else if(viewGame == 1 && viewEnd == 0){
        //if scorecard has changed or the scoreBuf indicates that a bonus was chosen
        if(scorecardChangeA != scorecardChangeB || scoreBuf == 100){
            //report that scorecard has been selected so the turn and rolls needs to be reset
            return 255;
        }
        //if rolls are disabled
        else if(rollsLeft == 0){
            //if scorecard changed
            //report 0 rolls left which disabled in rollsEnabled() the ability to roll
            return 0;
        }
        //if any rolls remain (cheating incl.)
        else if(rollsLeft >= 0){
            //report rolls left
            return rollsLeft;
        }
    }
}
