#include "../func/glob_vars.h"
#include "../func/logicScore.h"
#include "../func/logicGame.h"

// #include <stdio.h>
// #include "../func/betterDelay.h"

unsigned int turnCheck(){
    if(rollsCheck() == 250){
        //turn (less bonus tally) is not greater than the amount of options marked
        if(turn - bonusTally <= 12){
            if(turn < 13){
                //time for a new turn
                turn++;
                return 1;
            }
            else if(turn == 13){
                //checks if 5 of a kind was obtained
                //if it wasnt, the game ends
                if(bonusTally == 0){
//                     printf("test1\n");
//                     betterDelay(1000);
                    viewGame = 0;
                    viewPlay = 0;
                    viewCard = 0;
                    viewEnd = 1;
                    return 0;
                }
                //executes it was obtained and increments the turn
                else if(bonusTally == turn - scorecardMarked()){
                    turn++;
                    return 1;
                }
                else return 0;
            }
            //otherwise if the turn is at the minimum turn 13
            else if(turn > 13){
                //if five of a kind is 0 by the end of minimal turns
                if(bonusTally == 0){
//                     printf("test13\n");
//                     betterDelay(1000);
                    viewGame = 0;
                    viewPlay = 0;
                    viewCard = 0;
                    viewEnd = 1;
                    return 0;
                }
                //if bonus or five of a kind had been selected even once
                else if(bonusTally > 0){
                    if((turn - bonusTally) <= scorecardMarked()){
//                         printf("testA\n");
//                         betterDelay(1000);
                        //a new turn is allowed
                        turn++;
                        return 1;
                    }
                    else{
//                         printf("test10\n");
//                         betterDelay(1000);
                        viewGame = 0;
                        viewPlay = 0;
                        viewCard = 0;
                        viewEnd = 1;
                        return 0;
                    }
                }
                else{
//                     printf("test11\n");
//                     betterDelay(1000);
                    viewGame = 0;
                    viewPlay = 0;
                    viewCard = 0;
                    viewEnd = 1;
                    return 0;
                }
            }
            else{
//                 printf("test12\n");
//                 betterDelay(1000);
                viewGame = 0;
                viewPlay = 0;
                viewCard = 0;
                viewEnd = 1;
                return 0;
            }
        }
        else if(turn - bonusTally > 12 ){
//             printf("testC\n");
//             betterDelay(1000);
            viewGame = 0;
            viewPlay = 0;
            viewCard = 0;
            viewEnd = 1;
            return 0;
        }
        else{
//             printf("test5\n");
//             betterDelay(1000);
            viewGame = 0;
            viewPlay = 0;
            viewCard = 0;
            viewEnd = 1;
            return 0;
        }
    }
    else if(rollsCheck() == 240){
//         printf("testG\n");
//         betterDelay(1000);
        viewGame = 0;
        viewPlay = 0;
        viewCard = 0;
        viewEnd = 1;
        return 0;
    }
    else return 0;
}
