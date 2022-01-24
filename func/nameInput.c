#include </opt/gbdk/include/gb/gb.h>


//global variables
#include "../func/global_variables.h"


//sprites
#include "../res/Sprites.h"

//maps
#include "../res/backgroundData.h"
#include "../res/maps.h"



void nameInput(){

    unsigned int nameCursor = 22;
    unsigned int nameCursorCol;
    unsigned int nameCursorRow;
    unsigned int nameCursorX = 12;
    unsigned int nameCursorY = 72;


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
                    nameCursorCol--;
                    nameCursorX -= 16;
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_RIGHT:
                if(nameCursorCol < 9){
                    nameCursorCol++;
                    nameCursorX += 16;
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_UP:
                if(nameCursorRow > 0){
                    nameCursorRow--;
                    nameCursorY -= 16;
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_DOWN:
                if(nameCursorRow < 3){
                    nameCursorRow++;
                    nameCursorY += 16;
                }
                move_sprite(nameCursor, nameCursorX, nameCursorY);
                waitpadup();
                break;
            case J_A:
                waitpadup();
                break;
            case J_B:
                waitpadup();
                break;
            case J_SELECT:
                waitpadup();
                break;
            case J_START:
                waitpadup();
                break;
        }

    }
}
