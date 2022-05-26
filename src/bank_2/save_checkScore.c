#include <gb/gb.h>

#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../sram/save_variables.h"

#pragma bank 2

BANKREF(checkScore)
void checkScore() BANKED
{
    //already enabled but good practice to ensure it is enabled
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);
     if(saveInitialized != 1){
        for(uint8 i = 0; i != 25; i ++){
            //set each character to blank (memory location 0x00)
            scoreLogged[i] = 0x00;
        }
    }
    else return;
}
