#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/global_variables.h"

//sprites
#include "../res/Sprites.h"

//backgrounds
#include "../res/splashScreen.h"

void titleScreen(){
    HIDE_BKG;
    HIDE_SPRITES;
    set_bkg_data(0, 93, splashScreen_data);
    set_bkg_tiles(0, 0, 20, 18, splashScreen_map);


    set_sprite_data(0, 7, Sprites);
	set_sprite_tile(20, 5);
    set_sprite_tile(21, 6);

    titlePosL[0] = 64;
    titlePosL[1] = 96;
    titlePosR[0] = 104;
    titlePosR[1] = titlePosR[1];

    move_sprite(20, titlePosL[0], titlePosL[1]);
    move_sprite(21, titlePosR[0], titlePosR[1]);

    SHOW_BKG;
    SHOW_SPRITES;
    while(gameStart == 0){
        switch(joypad()){

        }
    }
}
