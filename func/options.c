#include <gb/gb.h>

void options(){
    nameInputMenu = 1;
    waitpadup();
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);
    //copies currentName into tempName
    memcpy(tempName, currentName, sizeof(tempName));

    //call nameInput screen
    nameInput();
    //copies playerName into storedName
    memcpy(currentName, tempName, sizeof(storedName));
    //memcpy(saveInitialized, workInitialized, sizeof(saveInitialized));
    //DISABLE_RAM_MBC1;
    SHOW_BKG;
    SHOW_SPRITES;
    move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
    move_sprite(cursorRight, titlePosR[0], titlePosR[1]);

    while(viewOptions){
        switch(joypad()){
            case J_DOWN:
            case J_UP:
            case J_A:
            case J_B:
        }
    }
}
