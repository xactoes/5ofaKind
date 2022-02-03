#include "../func/dice_tools.h"
#include "../func/glob_vars.h"
#include "../func/logicGame.h"
#include "../res/maps.h"

#include <stdio.h>
#include "../func/betterDelay.h"

//this function did something, idk what
//i have repurposed it to return the amount of rolls left
unsigned int rollsCheck(){
    //if the game is over
    if(viewGame == 0 && viewEnd == 1){
        return 0;
    }
    //else if game is still going
    else if(viewGame == 1 && viewEnd == 0){
        //if scorecard has changed OR
        //bonus has been selectd and (turns - bonus) are less than or equal to the minimal turn count (13)
        if(scorecardChangeA != scorecardChangeB || (scorecard[7] != 255 && (turn - scorecard[7]/100) <= 13 && scoreBuf == 100) && turnRequest == 1){
            //scoreBuf = 0;
            turnRequest = 0;
            //report that scorecard has been selected so the turn and rolls needs to be reset
            return 255;
        }
        else if(scorecardChangeA != scorecardChangeB || (scorecard[7] != 255 && (turn - scorecard[7]/100) <= 13 && rollRequest == 1)){
            rollRequest = 0;
            return rollsLeft;
        }
        //otherwise if scorecard hasn't changed AND
        //bonus has been selected AND
        //turns - bonus are greater than minimal turn count
        else if(scorecardChangeA == scorecardChangeB && scorecard[7] != 255 && (turn - scorecard[7]/100) > 13 && scoreBuf == 0){
            printf("test16\n");
            betterDelay(1000);
            //end the game
            viewGame = 0;
            viewEnd = 1;
            //disable rolls
            return 0;
        }
        //if any rolls remain (cheating incl.)
        else if(rollsLeft >= 0){
            //report rolls left
            return rollsLeft;
        }
    }
    else{
        return 0;
    }
}
