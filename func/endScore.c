#include <gb/gb.h>
#include </opt/gbdk/include/gbdk/bcd.h>
#include <string.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"
#include "../func/logicScore.h"

void endScore(){
    unsigned int startX = 6;
    hiScoreBuf = MAKE_BCD(00000000);
    bcd_add(&hiScoreBuf, &totalScoreBCD);
    len = bcd2text(&hiScoreBuf, 0x10, buf);
    scoreSaved = 1;

    //copies currentName into tempName
    for(i = 0; i != 8; i++){
        namesArray[24][i] = currentName[i];
    }


    hiScores[24] = 0;
    for(i = 0; i != 15; i++){
        if(scorecard[i] != 255){
            hiScores[24] += (uint32_t)scorecard[i];
        }
        else{
            hiScores[24] = hiScores[24];
        }
    }

    //less than 8 digits
    if(hiScores[24] < 10000000){
        //less than 7 digits
        if(hiScores[24] < 1000000){
            //less than 6 digits
            if(hiScores[24] < 100000){
                //less than 5 digits
                if(hiScores[24] < 10000){
                    //less than 4 digits
                    if(hiScores[24] < 1000){
                        //less than 3 digits
                        if(hiScores[24] < 100){
                            //2 digits or 1 digit
                            //shift left 3 tiles
                            set_bkg_tiles(startX - 3, 10, len, 1, buf);
                            //erase leading 0
                            set_bkg_tile_xy(startX - 3, 10, 0x00); // blank
                            //less than 2 digits
                            if(hiScores[24] < 10){
                                set_bkg_tile_xy(startX - 3, 10, 0x00); // blank
                                set_bkg_tile_xy(startX - 2, 10, 0x00); // blank
                                set_bkg_tile_xy(startX - 1, 10, 0x00); // blank
                                set_bkg_tile_xy(startX, 10, 0x00); // blank
                                set_bkg_tile_xy(startX + 1, 10, 0x00); // blank
                                set_bkg_tile_xy(startX + 2, 10, 0x00); // blank
                                set_bkg_tile_xy(startX + 3, 10, 0x00); // blank
                                }
                            else{
                                set_bkg_tile_xy(startX - 3, 10, 0x00); // blank
                                set_bkg_tile_xy(startX - 2, 10, 0x00); // blank
                                set_bkg_tile_xy(startX - 1, 10, 0x00); // blank
                                set_bkg_tile_xy(startX, 10, 0x00); // blank
                                set_bkg_tile_xy(startX + 1, 10, 0x00); // blank
                                set_bkg_tile_xy(startX + 2, 10, 0x00); // blank
                            }
                        }
                        //3 digits
                        else{
                            set_bkg_tiles(startX - 2, 10, len, 1, buf);
                            //erase leading 0s
                            set_bkg_tile_xy(startX - 2, 10, 0x00); // blank
                            set_bkg_tile_xy(startX - 1, 10, 0x00); // blank
                            set_bkg_tile_xy(startX, 10, 0x00); // blank
                            set_bkg_tile_xy(startX + 1, 10, 0x00); // blank
                            set_bkg_tile_xy(startX + 2, 10, 0x00); // blank
                        }
                    }
                    //4 digits
                    else{
                        //shift left 2 tiles
                        set_bkg_tiles(startX - 2, 10, len, 1, buf);
                        //erase leading 0
                        set_bkg_tile_xy(startX - 2, 10, 0x00); // blank
                        set_bkg_tile_xy(startX - 1, 10, 0x00); // blank
                        set_bkg_tile_xy(startX, 10, 0x00); // blank
                        set_bkg_tile_xy(startX + 1, 10, 0x00); // blank
                    }
                }
                //5 digits
                else{
                    //shift left 1 tile
                    set_bkg_tiles(startX - 1, 10, len, 1, buf);
                    set_bkg_tile_xy(startX - 1, 10, 0x00); // blank
                    set_bkg_tile_xy(startX, 10, 0x00); // blank
                    set_bkg_tile_xy(startX + 1, 10, 0x00); // blank
                }
            }
            //6 digits
            else{
                //shift left 1 tile
                set_bkg_tiles(startX - 1, 10, len, 1, buf);
                set_bkg_tile_xy(startX - 1, 10, 0x00); // blank
                set_bkg_tile_xy(startX, 10, 0x00); // blank
            }
        }
        //7 digits
        else{
            set_bkg_tiles(startX, 10, len, 1, buf);
            set_bkg_tile_xy(startX, 10, 0x00); // blank
        }
    }
    //8 digits
    else{
        set_bkg_tiles(startX, 10, len, 1, buf);
    }
}
