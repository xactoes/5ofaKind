#include "../func/glob_vars.h"
#include "../func/logicScore.h"


unsigned int turnCheck(){
    //turn (less bonus tally) is not greater than the amount of options marked
    if(turn - bonusTally <= scorecardMarked()){
        //if scorecard has been changed
       if(rollsCheck() == 255){
            scorecardChangeA = 0;
            scorecardChangeB = 0;
            //and the current turn is not yet 13
            if(turn < 13){
                //time for a new turn
                turn++;
                return 1;
            }
            //otherwise if the turn is at the minimum turn 13
            else if(turn == 13){
                //if bonus had been selected even once
                if(bonusTally > 0){
                    //a new turn is allowed
                    turn++;
                    return 1;
                }
                else{
                    viewGame = 0;
                    viewPlay = 0;
                    viewCard = 0;
                    viewEnd = 1;
                    return 0;
                }
            }
            else{
                return 0;
            }
        }
    }
    else return 0;
}
