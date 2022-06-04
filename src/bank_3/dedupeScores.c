#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/displayUpdates.h"
#include "../sram/save_variables.h"

#pragma bank 3

BANKREF(dedupeScores)
void dedupeScores() BANKED
{
    uint8 counter;
    // FOR EACH SCORE
    for(uint8 i = 0; i != 24; i++)
    {
        // COMPARE WITH ALL SCORES AFTER IT
        for(uint8 j = i + 1; j != 25; j++)
        {
            counter = 0;
            for(uint8 k = 0; k != 8; k++)
            {
                // IF CHARACTER K IS THE SAME
                if(namesArray[i][k] == namesArray[j][k])
                {
                    // INCREMENT COUNTER
                    counter ++;
                }
            }
            
            // IF NAMES ARE IDENTICAL
            if(counter == 8)
            {
                // CHECK IF SCORES ARE THE SAME THEN ERASE ENTRY
                if(highScore[i] == highScore[j])
                {
                    highScore[j] = 0;

                    for(uint8 k = 0; k != 8; k++)
                    {
                        namesArray[j][k] = 0x00;
                    }
                }
            }
        }
        sortNamesAndScores();
    }
}