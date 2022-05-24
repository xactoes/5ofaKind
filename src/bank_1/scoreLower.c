#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(scoreLower)
void scoreLower(uint8 index) BANKED{
    // CHECKS IF IT IS A VALID RANGE OF CHOICES ON SCORECARD
    if(index >= 6 && index <= 14){
        if(scorecard[index] == 255){
            scorecard[index] = (uint16) scoreLowerCalc(index);
            // UPDATE LOCAL SCORE
            bcdDisplayScoreLower();
        }
    }
}
