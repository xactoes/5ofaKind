#include <gb/gb.h>
#include </opt/gbdk/include/gbdk/bcd.h>

#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

#include "../func/save_tools.h"

#include "../func/logicScore.h"

#include "../res/backgroundData.h"
#include "../res/maps.h"

unsigned int scoreIndex;

void drawScores(unsigned int index){
    switch(index){
        case 0:
            len = bcd2text(&hiScore01, 0x10, buf);
            set_bkg_tiles(11, 4, len, 1, buf);
            len = bcd2text(&hiScore02, 0x10, buf);
            set_bkg_tiles(11, 6, len, 1, buf);
            len = bcd2text(&hiScore03, 0x10, buf);
            set_bkg_tiles(11, 8, len, 1, buf);
            len = bcd2text(&hiScore04, 0x10, buf);
            set_bkg_tiles(11, 10, len, 1, buf);
            len = bcd2text(&hiScore05, 0x10, buf);
            set_bkg_tiles(11, 12, len, 1, buf);
            len = bcd2text(&hiScore06, 0x10, buf);
            set_bkg_tiles(11, 14, len, 1, buf);
            break;
        case 1:
            len = bcd2text(&hiScore07, 0x10, buf);
            set_bkg_tiles(11, 4, len, 1, buf);
            len = bcd2text(&hiScore08, 0x10, buf);
            set_bkg_tiles(11, 6, len, 1, buf);
            len = bcd2text(&hiScore09, 0x10, buf);
            set_bkg_tiles(11, 8, len, 1, buf);
            len = bcd2text(&hiScore10, 0x10, buf);
            set_bkg_tiles(11, 10, len, 1, buf);
            len = bcd2text(&hiScore11, 0x10, buf);
            set_bkg_tiles(11, 12, len, 1, buf);
            len = bcd2text(&hiScore12, 0x10, buf);
            set_bkg_tiles(11, 14, len, 1, buf);
            break;
        case 2:
            len = bcd2text(&hiScore13, 0x10, buf);
            set_bkg_tiles(11, 4, len, 1, buf);
            len = bcd2text(&hiScore14, 0x10, buf);
            set_bkg_tiles(11, 6, len, 1, buf);
            len = bcd2text(&hiScore15, 0x10, buf);
            set_bkg_tiles(11, 8, len, 1, buf);
            len = bcd2text(&hiScore16, 0x10, buf);
            set_bkg_tiles(11, 10, len, 1, buf);
            len = bcd2text(&hiScore17, 0x10, buf);
            set_bkg_tiles(11, 12, len, 1, buf);
            len = bcd2text(&hiScore18, 0x10, buf);
            set_bkg_tiles(11, 14, len, 1, buf);
            break;
        case 3:
            len = bcd2text(&hiScore19, 0x10, buf);
            set_bkg_tiles(11, 4, len, 1, buf);
            len = bcd2text(&hiScore20, 0x10, buf);
            set_bkg_tiles(11, 6, len, 1, buf);
            len = bcd2text(&hiScore21, 0x10, buf);
            set_bkg_tiles(11, 8, len, 1, buf);
            len = bcd2text(&hiScore22, 0x10, buf);
            set_bkg_tiles(11, 10, len, 1, buf);
            len = bcd2text(&hiScore23, 0x10, buf);
            set_bkg_tiles(11, 12, len, 1, buf);
            len = bcd2text(&hiScore24, 0x10, buf);
            set_bkg_tiles(11, 14, len, 1, buf);
            break;
    }
    for(i = 11; i != 14; i++){
        for(j = 4; j != 16; j += 2){
            set_bkg_tile_xy(i, j, 0x00); // blank
        }
    }
}

void highScores(){
    //make save variables accessible as they can be written to in this function
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

    //hide screen objects during setup
    HIDE_BKG;
    HIDE_SPRITES;


    set_bkg_data(0, 128, backgroundData);
    set_bkg_tiles(0, 0, 20, 18, scoreMap1);


    for(i = 0; i != 25; i++){
        if(scoreTrue[i] != 1){
            if(hiScores[i] > 0 && hiScores[i] != 65535){
                scoreTrue[i] = 1;
            }
            else{
                scoreTrue[i] = 0;
                hiScores[i] = 0;

            }
        }
        else{
            if(hiScores[i] == 0 || hiScores[i] == 65535){
                scoreTrue[i] = 0;
                hiScores[i] = 0;
            }
        }
   }

    //sort the scores
    sortScores();


    //score array assignment
    assignScoreBCD();

    scoreIndex = 0;

    drawScores(scoreIndex);

    SHOW_BKG;

    while(viewScores){
        switch(joypad()){
            case J_LEFT:
                if(scoreIndex == 1){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap1);
                    scoreIndex -= 1;
                    drawScores(scoreIndex);
                    SHOW_BKG;
                }
                else if(scoreIndex == 2){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap2);
                    scoreIndex -= 1;
                    drawScores(scoreIndex);
                    SHOW_BKG;
                }
                else if(scoreIndex == 3){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap3);
                    scoreIndex -= 1;
                    drawScores(scoreIndex);
                    SHOW_BKG;
                }
                waitpadup();
                break;
            case J_RIGHT:
                if(scoreIndex == 0){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap2);
                    scoreIndex += 1;
                    drawScores(scoreIndex);
                    SHOW_BKG;
                }
                else if(scoreIndex == 1){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap3);
                    scoreIndex += 1;
                    drawScores(scoreIndex);
                    SHOW_BKG;
                }
                else if(scoreIndex == 2){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap4);
                    scoreIndex += 1;
                    drawScores(scoreIndex);
                    SHOW_BKG;
                }
                waitpadup();
                break;
            case J_B:
                viewScores = 0;
                viewTitle = 1;
                waitpadup();
                break;
        }
    }
}
