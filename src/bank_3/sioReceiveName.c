#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/vblDelay.h"
#include "../bank_3/sio.h"
#include "../bank_3/screens_link.h"
#include "../sram/save_variables.h"

#pragma bank 3

BANKREF(sioReceiveName)
void sioReceiveName() BANKED
{
    linkWaiting();

    // BEGIN TRANSFER
    for(uint8 i = 0; i < 8; i++)
    {
        // receive _io_in
        receive_byte(); 

        // Wait for Receive
        while(_io_status == IO_RECEIVING);
        linkConnected();

        // If RECEIVED
        if(_io_status == IO_IDLE)
        {
            // UPDATE SCREEN
            linkSyncing();
	        namesArray[24][i] =_io_in;
        }
    }
}