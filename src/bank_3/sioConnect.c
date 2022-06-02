#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/displayUpdates.h"
#include "../bank_1/cursor.h"
#include "../bank_3/sio.h"
#include "../bank_3/screens_link.h"
#include "../sram/save_variables.h"

#pragma bank 3

BANKREF(sioConnect)
void sioConnect(uint8 linkOption) BANKED
{
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

    uint16 sioScore;
    uint8 sioName[8];

    switch(linkOption)
    {
        case X_HOST:
            for(uint8 i = 0; i != 25; i++)
            {
                // SEND SCORE
                sioScore = highScore[i];
                sioSendScore(sioScore);

                // SEND NAME
                for(uint8 j = 0; j != 8; j++)
                {
                    sioName[j] = namesArray[i][j];
                }
                sioSendName(sioName);

                // RECEIVE SCORE
                sioReceiveScore();

                // RECEIVE NAME
                sioReceiveName();

                linkBlank();

                // SORT
                sortNamesAndScores();

            }
            break;

        case X_JOIN:
            for(uint8 i = 0; i != 25; i++)
            {
                // RECEIVE SCORE
                sioReceiveScore();

                // RECEIVE NAME
                sioReceiveName();

                linkBlank();
                
                // SORT
                sortNamesAndScores();

                // SEND SCORE
                sioScore = highScore[i];
                sioSendScore(sioScore);

                // SEND NAME
                for(uint8 j = 0; j != 8; j++)
                {
                    sioName[j] = namesArray[i][j];
                }
                sioSendName(sioName);

            }
            break;
    }
    DISABLE_RAM_MBC1;
}