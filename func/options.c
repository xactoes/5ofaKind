#include <gb/gb.h>

#include "../func/screens.h"

void options(){

    waitpadup();
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);
    //copies currentName into tempName
    memcpy(tempName, currentName, sizeof(tempName));

    //call nameInput screen
    nameInput();
    //copies playerName into storedName
    memcpy(currentName, tempName, sizeof(storedName));
    SHOW_BKG;
    SHOW_SPRITES;
    move_sprite(cursorLeft, titlePosL[0], titlePosL[1]);
    move_sprite(cursorRight, titlePosR[0], titlePosR[1]);

    while(viewOptions){
        if(viewNameInput){
            nameInput();
        }
        switch(joypad()){
            case J_DOWN:
            case J_UP:
            case J_A:
                switch(indexOptions){
                    case 0:
                        viewNameInput = 1;
                        waitpadup();
                        break;
                    case 1:
                        waitpadup();
                        break;
                }
            case J_B:
        }
    }
}
