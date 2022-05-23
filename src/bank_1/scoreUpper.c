#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(scoreUpper)
void scoreUpper(uint8 index) BANKED{
    // CHECKS IF IT IS A VALID RANGE OF CHOICES ON SCORECARD
    if(index >= 0 && index <= 5){
        if(scorecard[index] == 255){
            scorecard[index] = (uint16) scoreUpperCalc(index + 1);
            // UPDATE LOCAL SCORE
            bcdDisplayScoreUpper();
        }
    }

    // BEEP



    // DRAW BONUS UPPER

    // DRAW TOTAL UPPER

    // DRAW GRAND TOTAL

    // CLEAN UP BCD (REDRAW NECESSARY TEXT)
    //displayCleanUpBCD(SCREEN_GAME_SCORECARD);
}
