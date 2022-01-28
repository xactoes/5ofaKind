#include "../func/betterDelay.h"
#include "../func/dice_tools.h"
#include "../func/diceStruct.h"
#include "../func/glob_vars.h"

void rollDice(){
    //roll each of the five dice that are in in play
    for(j = 0; j != 5; j++){
        //with a .1 second (6 frame) delay between each roll
        betterDelay(6);
        if(j == 0){
            if(Di1.inPlay == 1){
                diFaceSet(&Di1);
            }
        }
        else if(j == 1){
            if(Di2.inPlay == 1){
                diFaceSet(&Di2);
            }
        }
        else if(j == 2){
            if(Di3.inPlay == 1){
                diFaceSet(&Di3);
            }
        }
        else if(j == 3){
            if(Di4.inPlay == 1){
                diFaceSet(&Di4);
            }
        }
        else if(j == 4){
            if(Di5.inPlay == 1){
                diFaceSet(&Di5);
            }
        }
    }
    //remove one from rollsLeft
    rollsLeft--;
}
