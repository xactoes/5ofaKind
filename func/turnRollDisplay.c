#include <gb/gb.h>
#include <gbdk/bcd.h>

//global variables
#include "../func/glob_vars.h"

//backgrounds
#include "../res/maps.h"


void rollDisplay(){
	len = 0;
	bcd_sub(&rollBCD, &rollBCD);
	for(i = 0; i != 10; i++){
		buf[i] = 0;
	}
    uint2bcd(rollsLeft, &rollBCD);
    len = bcd2text(&rollBCD, 0x10, buf);
    set_bkg_tiles(11, 5, len, 1, buf);

    //cleanup excess zeroes
    set_bkg_tile_xy(11, 5, 0x2C); // L
    set_bkg_tile_xy(12, 5, 0x45); // e
    set_bkg_tile_xy(13, 5, 0x46); // f
    set_bkg_tile_xy(14, 5, 0x54); // t
    set_bkg_tile_xy(15, 5, 0x1A); // :

    if(rollsLeft < 100){
        set_bkg_tile_xy(16, 5, 0x00); // blank
    }
    if(rollsLeft < 10){
        set_bkg_tile_xy(17, 5, 0x00); // blank
    }
}


void turnDisplay(){
	len = 0;
	bcd_sub(&turnBCD, &turnBCD);
	for(i = 0; i != 10; i++){
		buf[i] = 0;
	}
	uint2bcd(turn, &turnBCD);
	len = bcd2text(&turnBCD, 0x10, buf);
	set_bkg_tiles(2, 5, len, 1, buf);

	//cleanup excess zeroes
	set_bkg_tile_xy(2, 5, 0x34); // T
	set_bkg_tile_xy(3, 5, 0x55); // u
	set_bkg_tile_xy(4, 5, 0x52); // r
	set_bkg_tile_xy(5, 5, 0x4E); // n
	set_bkg_tile_xy(6, 5, 0x1A); // :

    if(turn < 100){
        set_bkg_tile_xy(7, 5, 0x00); // blank
    }
    if(turn < 10){
        set_bkg_tile_xy(8, 5, 0x00); // blank
    }
}


void turnRollDisplay(){
	rollDisplay();
    turnDisplay();
}
