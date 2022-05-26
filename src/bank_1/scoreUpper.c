#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 1

BANKREF(scoreUpper)
void scoreUpper(uint8 index) BANKED{
    // CHECKS IF IT IS A VALID RANGE OF CHOICES ON SCORECARD
    if(index >= 0 && index <= 5)
    {
        if(scorecard[index] == 255)
        {
            scorecard[index] = (uint16) scoreUpperCalc(index + 1);
        }
    }
    
    // UPPER BONUS
    if(scorecard[14] != 35)
    {
        scorecard[14] = (uint16) scoreBonusUpperCalc();
    }

    // UPDATE LOCAL SCORE
    bcdDisplayScoreUpper();
}
