#include <gb/gb.h>

#include "../func/dice_tools.h"
#include "../func/glob_vars.h"
#include "../func/logicScore.h"
#include "../func/spriteFlip.h"
#include "../func/logicGame.h"

#include "../res/Sprites.h"
#include "../res/backgroundData.h"
#include "../res/maps.h"

#include "../sram/save_vars.h"

void initGame(){
    //hide screen while setting up
    HIDE_BKG;
    HIDE_SPRITES;
    //setup 2-screen background
	set_bkg_data(0, 128, backgroundData);
    set_bkg_tiles(0, 0, 20, 32, backgroundMap);


    //eneable ram to grab player name
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

    //sets player name on screen
    for(i = 7; i != -1; i--){
        // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
        set_bkg_tile_xy(i + 2, 2, currentName[i]);
    }

    //reset scorecard to null values
    for(i = 0; i != 15; i++){
        scorecard[i] = 255;
        scorecardSummed[i] = 511;
    }

    BCD upperScoreBCD = MAKE_BCD(00000000);
    BCD upperScoreBuf = MAKE_BCD(00000000);
    BCD lowerScoreBCD = MAKE_BCD(00000000);
    BCD lowerScoreBuf = MAKE_BCD(00000000);
    BCD totalScoreBCD = MAKE_BCD(00000000);
    BCD totalScoreAdd = MAKE_BCD(00000000);
    BCD compareBCD = MAKE_BCD(00000000);
    BCD numOptBCD = MAKE_BCD(00000000);
    BCD turnBCD = MAKE_BCD(00000000);
    BCD rollBCD = MAKE_BCD(00000000);

    SHOW_BKG;

    //initialie dice sprites (0-19)
    initDi(&Di1, 1);
    initDi(&Di2, 2);
    initDi(&Di3, 3);
    initDi(&Di4, 4);
    initDi(&Di5, 5);

    //flip sprites to make proper metasprites
    spriteFlip();

    //setup cursor (20)
	set_sprite_tile(cursorLeft, 5);
    set_sprite_data(0, 7, Sprites);

    //set cursor position
	indexCursor = 0;
	cursorPosition[0] = 16;
	cursorPosition[1] = 144;
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);

    SHOW_SPRITES;

    //set rollsLeft
	rollsLeft = initRolls;

    //setTurn
	turn = 1;

    //display turn, rolls, and score
    turnRollDisplay();
    scoreDisplay();
}
