#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/vblDelay.h"
#include "../bank_3/sio.h"
#include "../sram/save_variables.h"
#include <stdio.h>

#pragma bank 3

BANKREF(sioReceiveScore)
void sioReceiveScore() BANKED
{
    for(int8 i = 0; i < 2; i++)
    {
        scorePaired = 0;
        // receive _io_in
        receive_byte(); 

        // Wait for Receive
        while(_io_status == IO_RECEIVING);

        // If RECEIVED
        if(_io_status == IO_IDLE)
        {
            scoreSplit[i] = _io_in;
            switch(i)
            {
                case 0:
                    // convert to uint then bitshift left x 8
                    scorePaired = ((unsigned int) scoreSplit[i]) << 8;
                    break;
                case 1:
                    // convert to uint then add to prior converted byte
                    scorePaired += (unsigned int) scoreSplit[i];
                    break;
                default:
                    // if neither of those, then an error occurred
                    // set i to -1 and start again (goes to 0 at start of next loop)
                    i = -1;
                    break;
            }
        }
        // Else print error
        else
        {
            // Start over
            i = -1;
        }
    }
    highScore[24] = scorePaired;
    printf("%u\n", scorePaired);
    vblDelay(30);
}