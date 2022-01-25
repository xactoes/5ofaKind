//#include </opt/gbdk/include/gb/gb.h>
#include <gb/gb.h>
#include <stdio.h>

//global variables
#include "../func/global_variables.h"
#include "../sram/saveVars.h"


//sprites
#include "../res/Sprites.h"

//maps
#include "../res/backgroundData.h"
#include "../res/maps.h"


unsigned int nameCursor = 22;
unsigned int nameCursorCol;
unsigned int nameCursorRow;
unsigned int nameCursorX = 12;
unsigned int nameCursorY = 72;

unsigned int inputMode;
unsigned int setX;
unsigned int setY;

unsigned int setCol = 0;
unsigned int setRow = 0;

extern unsigned char playerName[8];

void nameInput(){
    set_bkg_data(0, 128, backgroundData);
    set_bkg_tiles(0, 0, 20, 18, nameInputMap);
    scroll_bkg(-4, 0);

    set_sprite_data(0, 8, Sprites);
    set_sprite_tile(nameCursor, 7);
    move_sprite(nameCursor, nameCursorX, nameCursorY);

    SHOW_BKG;
    SHOW_SPRITES;
    while(nameInputMenu == 1){
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
                    if(playerName[0] == 0x00){
                        for(i = 0; i != 7; i++){
                        playerName[i] = playerName[i + 1];
                        }
                        playerName[7] = inputArray[(40 * inputMode) + (10 * nameCursorRow) + nameCursorCol];
                        for(i = 0; i != 8; i++){
                            set_bkg_tile_xy(i + 6, 3, playerName[i]);
                        }
                    }
                    else{
                        playerName[7] = inputArray[(40 * inputMode) + (10 * nameCursorRow) + nameCursorCol];
                        for(i = 0; i != 8; i++){
                            set_bkg_tile_xy(i + 6, 3, playerName[i]);
                        }
                    }
                }
                waitpadup();
                break;
            case J_B:
                for(i = 7; i != 0; i--){
                        playerName[i] = playerName[i - 1];
                }
                playerName[0] = 0x00;
                for(i = 0; i != 8; i++){
                    set_bkg_tile_xy(i + 6, 3, playerName[i]);
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
                nameInputMenu = 0;
                HIDE_BKG;
                HIDE_SPRITES;
                move_sprite(nameCursor, 0, 0);
                set_bkg_data(0, 93, splashScreen_data);
                set_bkg_tiles(0, 0, 20, 18, splashScreen_map);
                scroll_bkg(4, 0);
                waitpadup();
                break;
        }

    }
}
