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
    // WAITING
    receive_byte();
    while(_io_status == IO_RECEIVING)
    {
        linkWaiting();
    }

    // REPLY BACK
    if(_io_in == WAITING)
    {
        _io_out = CONNECTED;
        send_byte();
        while(_io_status == IO_SENDING);
    }

    // BEGIN TRANSFER
    for(int8 i = 0; i < 8; i++)
    {
        // UPDATE SCREEN WHEN CONNECTED
        linkConnected();

        // receive _io_in
        receive_byte(); 

        // Wait for Receive
        while(_io_status == IO_RECEIVING);

        // If RECEIVED
        if(_io_status == IO_IDLE)
        {
            // UPDATE SCREEN
            linkSyncing();
            scoreName[i] = _io_in;
	        namesArray[24][i] = scoreName[i];
        }

        // REPLY THAT IT HAS BEEN RECEIVED
        _io_out = FINISHED;
        send_byte();
        while(_io_status == IO_SENDING)
        {
            linkWaiting();
        }
    }
}