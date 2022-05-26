#include <gb/gb.h>
#include <string.h>

#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_2/screens.h"
#include "../sram/save_variables.h"

#pragma bank 2

//checks if a player name has ever been set
BANKREF(checkName)
void checkName() BANKED
{
    //already enabled but good practice to ensure it is enabled
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);
    if(saveInitialized != 1){
        for(uint8 i = 0; i != 8; i ++){
            //set each character to blank (memory location 0x00)
            tempName[i] = nameInputMap[26];
        }
        //store tempName into currentName for use in future games
        memcpy(currentName, tempName, sizeof(currentName));
    }
    else if(saveInitialized == 1){
        ENABLE_RAM_MBC1;
        SWITCH_RAM_MBC1(0);
        memcpy(tempName, currentName, 8);
    }
    SHOW_SPRITES;
}
