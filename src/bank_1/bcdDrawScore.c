#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"

#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 1

BANKREF(bcdDrawScore)
void bcdDrawScore(uint8 index, uint8 len, uint8 buf) BANKED
{


	switch(index){
		//1's
		case 0:
			set_bkg_tiles(2, 22, len, 1, buf);
			set_bkg_tile_xy(2, 22, 0x11); // 1
			set_bkg_tile_xy(3, 22, 0x07); // '
			set_bkg_tile_xy(4, 22, 0x53); // s
			set_bkg_tile_xy(5, 22, 0x1A); // :
			set_bkg_tile_xy(6, 22, 0x00); // blank
			set_bkg_tile_xy(7, 22, 0x00); // blank
				vblDelay(120);
			break;
		//2's
		case 1:
			set_bkg_tiles(2, 23, len, 1, buf);
			set_bkg_tile_xy(2, 23, 0x12); // 2
			set_bkg_tile_xy(3, 23, 0x07); // '
			set_bkg_tile_xy(4, 23, 0x53); // s
			set_bkg_tile_xy(5, 23, 0x1A); // :
			set_bkg_tile_xy(6, 23, 0x00); // blank
			set_bkg_tile_xy(7, 23, 0x00); // blank
			break;
		//3's
		case 2:
			set_bkg_tiles(2, 24, len, 1, buf);
			set_bkg_tile_xy(2, 24, 0x13); // 3
			set_bkg_tile_xy(3, 24, 0x07); // '
			set_bkg_tile_xy(4, 24, 0x53); // s
			set_bkg_tile_xy(5, 24, 0x1A); // :
			set_bkg_tile_xy(6, 24, 0x00); // blank
			set_bkg_tile_xy(7, 24, 0x00); // blank
			break;
		//4's
		case 3:
			set_bkg_tiles(11, 22, len, 1, buf);
			set_bkg_tile_xy(11, 22, 0x14); // 4
			set_bkg_tile_xy(12, 22, 0x07); // '
			set_bkg_tile_xy(13, 22, 0x53); // s
			set_bkg_tile_xy(14, 22, 0x1A); // :
			set_bkg_tile_xy(15, 22, 0x00); // blank
			set_bkg_tile_xy(16, 22, 0x00); // blank
			break;
		//5's
		case 4:
			set_bkg_tiles(11, 23, len, 1, buf);
			set_bkg_tile_xy(11, 23, 0x15); // 5
			set_bkg_tile_xy(12, 23, 0x07); // '
			set_bkg_tile_xy(13, 23, 0x53); // s
			set_bkg_tile_xy(14, 23, 0x1A); // :
			set_bkg_tile_xy(15, 23, 0x00); // blank
			set_bkg_tile_xy(16, 23, 0x00); // blank
			break;
		//6's
		case 5:
			set_bkg_tiles(11, 24, len, 1, buf);
			set_bkg_tile_xy(11, 24, 0x16); // 6
			set_bkg_tile_xy(12, 24, 0x07); // '
			set_bkg_tile_xy(13, 24, 0x53); // s
			set_bkg_tile_xy(14, 24, 0x1A); // :
			set_bkg_tile_xy(15, 24, 0x00); // blank
			set_bkg_tile_xy(16, 24, 0x00); // blank
			break;
	}
}
