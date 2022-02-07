#include <gb/gb.h>
#include </opt/gbdk/include/gbdk/bcd.h>

#include "../func/dice_tools.h"
#include "../func/glob_vars.h"
#include "../func/logicScore.h"
#include "../func/spriteFlip.h"
#include "../func/logicGame.h"

#include "../res/Sprites.h"
#include "../res/backgroundData.h"
#include "../res/maps.h"

#include "../sram/save_vars.h"

#include "../func/betterDelay.h"
#include <stdio.h>

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

    //display player name
    for(i = 7; i != -1; i--){
        // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
        set_bkg_tile_xy(i + 2, 2, currentName[i]);
    }

    DISABLE_RAM_MBC1;

    //reset scorecard to null values
    for(i = 0; i != 15; i++){
        scorecard[i] = 255;
        scorecardSummed[i] = 511;
    }

    bcd_sub(&upperScoreBCD, &upperScoreBCD);
    bcd_sub(&upperScoreBuf, &upperScoreBuf);
    bcd_sub(&lowerScoreBCD, &lowerScoreBCD);
    bcd_sub(&lowerScoreBuf, &lowerScoreBuf);
    bcd_sub(&totalScoreBCD, &totalScoreBCD);
    bcd_sub(&totalScoreAdd, &totalScoreAdd);
    bcd_sub(&compareBCD, &compareBCD);
    bcd_sub(&numOptBCD, &numOptBCD);
    bcd_sub(&turnBCD, &turnBCD);
    bcd_sub(&rollBCD, &rollBCD);

    scorecardChangeA = 0;
    scorecardChangeB = 0;
    bonusFail = 0;
    endScreenScrolled = 0;
    scoreSaved = 0;
    bonusTally = 0;

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
