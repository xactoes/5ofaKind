#include <gb/gb.h>
#include <string.h>

#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../sram/save_variables.h"

uint8 nameCursorCol, nameCursorRow;
uint8 nameCursorX = 12;
uint8 nameCursorY = 72;

uint8 inputMode, setX, setY;

uint8 setCol = 0;
uint8 setRow = 0;

void nameInput(){


    //copies currentName into tempName
    memcpy(tempName, currentName, 8);

    //hide screen objects during setup
    HIDE_BKG;
    HIDE_SPRITES;



    // while(viewNameInput){
    //     switch(joypad()){
    //

    //
    //         case J_START:
    //             //copies tempName into currentName
    //             memcpy(currentName, tempName, sizeof(currentName));
	//
    //             //hide screen objects while cleaning up
    //             HIDE_BKG;
    //             HIDE_SPRITES;
	//
    //             //fix background back to non-scrolled position
    //             scroll_bkg(4, 0);
	//
    //             //mark background as not scrolled
    //             backgroundScrolled = 0;
	//
    //             //hide sprite offscreen
    //             move_sprite(nameCursor, 0, 0);
	//
    //             //mark variable to indicate a save has been initialized with a player
    //             //chosen name for next startup check by checkName() in main()
    //             saveInitialized = 1;
	//
    //             //leave name input
    //             viewNameInput = 0;
    //             //leave options
    //             viewOptions = 0;
    //             //enter into title again
    //             viewTitle = 1;
    //             waitpadup();
    //             break;
    //     }
	//
    // }
    DISABLE_RAM_MBC1;
}
