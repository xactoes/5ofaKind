#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/vblDelay.h"
#include "../bank_3/sio.h"
#include "../sram/save_variables.h"

#pragma bank 3

BANKREF(sioReceiveName)
void sioReceiveName() BANKED
{
    for(int8 i = 0; i < 8; i++)
    {
        // receive _io_in
        receive_byte(); 

        // Wait for Receive
        while(_io_status == IO_RECEIVING);

        // If RECEIVED
        if(_io_status == IO_IDLE)
        {
            scoreName[i] = _io_in;
	        namesArray[24][i] = scoreName[i];
        }
    }
}