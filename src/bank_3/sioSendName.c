#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/vblDelay.h"
#include "../bank_3/sio.h"

#pragma bank 3

BANKREF(sioSend)
void sioSendName(uint8* varName) BANKED
{    
    for(int8 i = 0; i < 8; i++)
    {
         _io_out = varName[i];

        // send _io_out
        send_byte(); 

        //printf("Sending...\n");
        // Wait for Send
        while(_io_status == IO_SENDING);

        // GIVE RECEIVING END TIME TO PROCESS
        vblDelay(300);
    }
}