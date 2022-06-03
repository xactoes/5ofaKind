#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/displayUpdates.h"
#include "../bank_0/vblDelay.h"
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
        case Y_LINK_SEND:
            linkBlankExit();

            for(uint8 k = 0; k != 25; k++)
            {
                // SET & SEND SCORE
                sioScore = highScore[k];
                sioSendScore(sioScore);

                // SET & SEND NAME
                for(uint8 j = 0; j != 8; j++)
                {
                    sioName[j] = namesArray[k][j];
                }
                sioSendName(sioName);

                linkSyncing();

                // WAIT 2 SEC WHILE SCORES SYNC ON RECEIVING
                vblDelay(120);

                linkFinished();
            }
            break;

        case Y_LINK_RECEIVE:
            linkBlankExit();

            for(uint8 k = 0; k != 25; k++)
            {
                // RECEIVE SCORE AND NAME
                sioReceiveScore();
                sioReceiveName();
                
                linkSyncing();

                // SYNC
                sortNamesAndScores();

                linkFinished();
            }
            break;
    }
    linkExit();
    
    DISABLE_RAM_MBC1;
}