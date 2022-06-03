#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/vblDelay.h"
#include "../bank_3/sio.h"
#include "../bank_3/screens_link.h"

#pragma bank 3

BANKREF(sioSendScore)
void sioSendScore(uint16 varScore) BANKED
{
    linkWaiting();
    vblDelay(120);

    scoreSplit[0] = (uint8) (varScore >> 8);
    scoreSplit[1] = (uint8) varScore;

    for(int8 i = 0; i < 2; i++)
    {
        _io_out = scoreSplit[i];

        // send _io_out
        send_byte(); 

        // Wait for Send
        linkConnected();
        while(_io_status == IO_SENDING);
        
        if(_io_status == IO_IDLE)
        {
            linkSyncing();
            vblDelay(5);
        }
    }
}