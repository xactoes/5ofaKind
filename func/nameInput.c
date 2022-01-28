#include <gb/gb.h>
#include <string.h>

#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

#include "../res/Sprites.h"

#include "../res/maps.h"


unsigned int nameCursorCol;
unsigned int nameCursorRow;
unsigned int nameCursorX = 12;
unsigned int nameCursorY = 72;

unsigned int inputMode;
unsigned int setX;
unsigned int setY;

unsigned int setCol = 0;
unsigned int setRow = 0;

unsigned char backgroundScrolled;

//unsigned char workInitialized;

void nameInput(){
    //make save variables accessible as they can be written to in this function
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

    //copies currentName into tempName
    memcpy(tempName, currentName, sizeof(tempName));

    //hide screen objects during setup
    HIDE_BKG;
    HIDE_SPRITES;

    if(backgroundScrolled == 0){
        //switch map and offset to the right by 4
        set_bkg_tiles(0, 0, 20, 18, nameInputMap);
        scroll_bkg(-4, 0);
        backgroundScrolled = 1;
    }

    //display current player name on top of drawn map
    for(i = 0; i != 8; i++){
        set_bkg_tile_xy(i + 6, 3, tempName[i]);
    }

    //setup ^ cursor for this screen
    set_sprite_data(0, 8, Sprites);
    set_sprite_tile(nameCursor, 7);
    move_sprite(nameCursor, nameCursorX, nameCursorY);

    //setup done, display screen
    SHOW_BKG;
    SHOW_SPRITES;

    while(viewNameInput){
        switch(joypad()){
            case J_LEFT:
                if(nameCursorCol > 0){
                    if(nameCursorRow != 4){
                        nameCursorCol--;
                        nameCursorX -= 16;
                    }
                    else if(nameCursorRow == 4){
                        nameCursorCol--;
                        nameCursorX -= 48;
                    }
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_RIGHT:
                if(nameCursorCol < 9){
                    if(nameCursorRow != 4){
                        nameCursorCol++;
                        nameCursorX += 16;
                    }
                    else if(nameCursorRow == 4 && nameCursorCol < 2){
                        nameCursorCol++;
                        nameCursorX += 48;
                    }
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_UP:
                if(nameCursorRow > 0 && nameCursorRow != 4){
                    nameCursorRow--;
                    nameCursorY -= 16;
                }
                else if(nameCursorRow == 4){
                    nameCursorRow = 3;
                    nameCursorCol = 0;
                    nameCursorX = 12;
                    nameCursorY = 120;
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_DOWN:
                if(nameCursorRow < 3){
                    nameCursorRow++;
                    nameCursorY += 16;
                }
                else if(nameCursorRow == 3){
                    nameCursorCol = 0;
                    nameCursorRow = 4;
                    nameCursorX = 36;
                    nameCursorY = 136;
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_A:
                if(nameCursorRow == 4){
                    inputMode = nameCursorCol;
                    setX = 0;
                    setY = 6;
                    setCol = 0;
                    setRow = 0;
                    for(i = 0; i != 40; i++){
                        set_bkg_tile_xy(setX, setY, inputArray[(40 * inputMode) + (10 * setRow) + setCol]);
                        if(setX == 18){
                            setX = 0;
                            setY += 2;
                            setCol = 0;
                            setRow++;
                        }
                        else{
                            setX += 2;
                            setCol++;
                        }
                    }
                }
                else{
                    if(tempName[0] == 0x00){
                        for(i = 0; i != 7; i++){
                        tempName[i] = tempName[i + 1];
                        }
                        tempName[7] = inputArray[(40 * inputMode) + (10 * nameCursorRow) + nameCursorCol];
                        for(i = 0; i != 8; i++){
                            set_bkg_tile_xy(i + 6, 3, tempName[i]);
                        }
                    }
                    else{
                        tempName[7] = inputArray[(40 * inputMode) + (10 * nameCursorRow) + nameCursorCol];
                        for(i = 0; i != 8; i++){
                            set_bkg_tile_xy(i + 6, 3, tempName[i]);
                        }
                    }
                }
                waitpadup();
                break;
            case J_B:
                for(i = 7; i != 0; i--){
                        tempName[i] = tempName[i - 1];
                }
                tempName[0] = 0x00;
                for(i = 0; i != 8; i++){
                    set_bkg_tile_xy(i + 6, 3, tempName[i]);
                }
                waitpadup();
                break;
            case J_SELECT:
                setX = 0;
                setY = 6;
                setCol = 0;
                setRow = 0;
                if(inputMode < 1){
                    inputMode++;
                }
                else{
                    inputMode = 0;
                }
                for(i = 0; i != 40; i++){
                    set_bkg_tile_xy(setX, setY, inputArray[(40 * inputMode) + (10 * setRow) + setCol]);
                    if(setX == 18){
                        setX = 0;
                        setY += 2;
                        setCol = 0;
                        setRow++;
                    }
                    else{
                        setX += 2;
                        setCol++;
                    }
                }
                waitpadup();
                break;
            case J_START:
                //copies tempName into currentName
                memcpy(currentName, tempName, sizeof(currentName));

                //hide screen objects while cleaning up
                HIDE_BKG;
                HIDE_SPRITES;

                //fix background back to non-scrolled position
                scroll_bkg(4, 0);

                //mark background as not scrolled
                backgroundScrolled = 0;

                //hide sprite offscreen
                move_sprite(nameCursor, 0, 0);

                //mark variable to indicate a save has been initialized with a player
                //chosen name for next startup check by checkName() in main()
                saveInitialized = 1;

                //leave name input
                viewNameInput = 0;
                //leave options
                viewOptions = 0;
                //enter into title again
                viewTitle = 1;
                waitpadup();
                break;
        }

    }
}
