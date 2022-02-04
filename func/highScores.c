#include <gb/gb.h>
#include </opt/gbdk/include/gbdk/bcd.h>

#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

#include "../res/backgroundData.h"
#include "../res/maps.h"

unsigned int scoreIndex;

void drawScores(unsigned int index){
    for(j = 0; j != 6; j++){
        unsigned int name = index * 6 + i;
        //display player name
        for(i = 7; i != -1; i--){
            // i + 2 aligns it to the right by going from 7+2= 9 first, then back to 8, 7, and so on
            set_bkg_tile_xy(i + 5, 2 + (i * 2), namesArray[index][i]);
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

    //score array assignment
    uint2bcd(hiScore[0], &hiScore01);
    uint2bcd(hiScore[1], &hiScore02);
    uint2bcd(hiScore[2], &hiScore03);
    uint2bcd(hiScore[3], &hiScore04);
    uint2bcd(hiScore[4], &hiScore05);
    uint2bcd(hiScore[5], &hiScore06);
    uint2bcd(hiScore[6], &hiScore07);
    uint2bcd(hiScore[7], &hiScore08);
    uint2bcd(hiScore[8], &hiScore09);
    uint2bcd(hiScore[9], &hiScore10);
    uint2bcd(hiScore[10], &hiScore11);
    uint2bcd(hiScore[11], &hiScore12);
    uint2bcd(hiScore[12], &hiScore13);
    uint2bcd(hiScore[13], &hiScore14);
    uint2bcd(hiScore[14], &hiScore15);
    uint2bcd(hiScore[15], &hiScore16);
    uint2bcd(hiScore[16], &hiScore17);
    uint2bcd(hiScore[17], &hiScore18);
    uint2bcd(hiScore[18], &hiScore19);
    uint2bcd(hiScore[19], &hiScore20);
    uint2bcd(hiScore[20], &hiScore21);
    uint2bcd(hiScore[21], &hiScore22);
    uint2bcd(hiScore[22], &hiScore23);
    uint2bcd(hiScore[23], &hiScore24);


    hiScoreBuf = MAKE_BCD(00000000);
    bcd_add(&hiScoreBuf, &totalScoreBCD);
    len = bcd2text(&hiScoreBuf, 0x10, buf);


    SHOW_BKG;

    scoreIndex = 0;

    while(viewScores){
        switch(joypad()){
            case J_LEFT:
                if(scoreIndex == 1){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap1);
                    scoreIndex -= 1;
                    SHOW_BKG;
                }
                else if(scoreIndex == 2){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap2);
                    scoreIndex -= 1;
                    SHOW_BKG;

                }
                else if(scoreIndex == 3){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap3);
                    scoreIndex -= 1;
                    SHOW_BKG;
                }
                waitpadup();
                break;
            case J_RIGHT:
                if(scoreIndex == 0){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap2);
                    scoreIndex += 1;
                    SHOW_BKG;
                }
                else if(scoreIndex == 1){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap3);
                    scoreIndex += 1;
                    SHOW_BKG;

                }
                else if(scoreIndex == 2){
                    HIDE_BKG;
                    set_bkg_tiles(0, 0, 20, 18, scoreMap4);
                    scoreIndex += 1;
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
