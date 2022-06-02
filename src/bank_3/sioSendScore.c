#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/vblDelay.h"
#include "../bank_3/sio.h"
#include "../bank_3/screens_link.h"

#pragma bank 3

BANKREF(sioSendScore)
void sioSendScore(uint16 varScore) BANKED
{
    scoreSplit[0] = (uint8) (varScore >> 8);
    scoreSplit[1] = (uint8) varScore;

    // WAITING
    _io_out = WAITING;

    // SEND 
    send_byte();
    while(_io_status == IO_SENDING);

    // RECEIVE
    receive_byte();

    if(_io_in == CONNECTED)
    {
        for(int8 i = 0; i < 2; i++)
        {
            _io_out = scoreSplit[i];

            // send _io_out
            send_byte(); 

            // Wait for Send
            while(_io_status == IO_SENDING);

            // CHECK FOR CONFIRMATION OF RECEIPT
            receive_byte();
            while(_io_status == IO_RECEIVING);
            if(_io_in == FINISHED)
            {
                vblDelay(30);
            }
        }
    }
}