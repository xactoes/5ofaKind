#include <gb/gb.h>
#include <string.h>
#include <stdio.h>

#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

#include "../func/betterDelay.h"

//checks if a player name has ever been set
void checkName(){
    SHOW_SPRITES;
    if(saveInitialized != 1){
        for(i = 0; i != 8; i ++){
            //set each character to blank (memory location 0x00)
            tempName[i] = inputArray[26];
        }
        //already enabled but good practice to ensure it is enabled
        ENABLE_RAM_MBC1;
        SWITCH_RAM_MBC1(0);

        //store tempName into storedName for use in future games
        memcpy(currentName, tempName, sizeof(currentName));
    }
}
