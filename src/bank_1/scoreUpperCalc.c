#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 1
BANKREF(scoreUpperCalc)
uint8 scoreUpperCalc(uint8 index) BANKED
{
    uint8 tempScore;
    for(uint8 position = 0; position != 5; position++){
        if(dice[position].face == index){
            tempScore += dice[position].face;
        }
    }
    return tempScore;
}
