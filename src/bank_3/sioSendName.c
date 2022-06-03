#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/vblDelay.h"
#include "../bank_3/sio.h"
#include "../bank_3/screens_link.h"

#pragma bank 3

BANKREF(sioSend)
void sioSendName(uint8* varName) BANKED
{    
    linkWaiting();
    vblDelay(120);

    for(uint8 i = 0; i < 8; i++)
    {
        _io_out = varName[i];

        // send _io_out
        send_byte(); 

        linkConnected();

        // Wait for Send
        while(_io_status == IO_SENDING);

        if(_io_status == IO_IDLE)
        {
            linkSyncing();
            vblDelay(5);
        }
    }
}