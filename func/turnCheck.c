#include "../func/glob_vars.h"
#include "../func/logicScore.h"
#include "../func/logicGame.h"

#include <stdio.h>
#include "../func/betterDelay.h"

unsigned int turnCheck(){
    turnRequest = 1;
    if(rollsCheck() == 255){
        //turn (less bonus tally) is not greater than the amount of options marked
        if(turn - bonusTally <= 12){
            if(turn < 13){
                //time for a new turn
                turn++;
                return 1;
            }
            else if(turn == 13){
                if(bonusTally == 0){
                    viewGame = 0;
                    viewPlay = 0;
                    viewCard = 0;
                    viewEnd = 1;
                    printf("test1\n");
                    betterDelay(1000);
                    return 0;
                }
                else{
    //                     printf("test2\n");
    //                     betterDelay(1000);
                    turn++;
                    return 1;
                }
            }
            //otherwise if the turn is at the minimum turn 13
            else if(turn > 13){
                //if five of a kind is 0 by the end of minimal turns
                if(bonusTally == 0){
                    printf("test13\n");
                    betterDelay(1000);
                    viewGame = 0;
                    viewPlay = 0;
                    viewCard = 0;
                    viewEnd = 1;
                    return 0;
                }
                //if bonus or five of a kind had been selected even once
                else if(bonusTally > 0){
                    if((turn - bonusTally) <= 12){
                        //a new turn is allowed
                        turn++;
                        return 1;
                    }
                    else{
                        printf("test10\n");
                        betterDelay(1000);
                        viewGame = 0;
                        viewPlay = 0;
                        viewCard = 0;
                        viewEnd = 1;
                        return 0;
                    }
                }
                else{
                    printf("test11\n");
                    betterDelay(1000);
                    viewGame = 0;
                    viewPlay = 0;
                    viewCard = 0;
                    viewEnd = 1;
                    return 0;
                }
            }
            else{
                printf("test12\n");
                betterDelay(1000);
                viewGame = 0;
                viewPlay = 0;
                viewCard = 0;
                viewEnd = 1;
                return 0;
            }
        }
        else if(turn - bonusTally > 12 ){
            printf("test4\n");
            betterDelay(1000);
            viewGame = 0;
            viewPlay = 0;
            viewCard = 0;
            viewEnd = 1;
            return 0;
        }
        else{
            printf("test5\n");
            betterDelay(1000);
            viewGame = 0;
            viewPlay = 0;
            viewCard = 0;
            viewEnd = 1;
            return 0;
        }
    }
    else return 0;
}
