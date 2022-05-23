#include <gb/gb.h>

#pragma bank 1

BANKREF(bcdCleanup)
void bcdCleanup() BANKED
{
	set_bkg_tile_xy(2, 4, 0x11); // 1
	set_bkg_tile_xy(3, 4, 0x07); // '
	set_bkg_tile_xy(4, 4, 0x53); // s
	set_bkg_tile_xy(5, 4, 0x1A); // :
	set_bkg_tile_xy(6, 4, 0x00); // blank
	set_bkg_tile_xy(7, 4, 0x00); // blank


	set_bkg_tile_xy(2, 23, 0x12); // 2
	set_bkg_tile_xy(3, 23, 0x07); // '
	set_bkg_tile_xy(4, 23, 0x53); // s
	set_bkg_tile_xy(5, 23, 0x1A); // :
	set_bkg_tile_xy(6, 23, 0x00); // blank
	set_bkg_tile_xy(7, 23, 0x00); // blank


	set_bkg_tile_xy(2, 24, 0x13); // 3
	set_bkg_tile_xy(3, 24, 0x07); // '
	set_bkg_tile_xy(4, 24, 0x53); // s
	set_bkg_tile_xy(5, 24, 0x1A); // :
	set_bkg_tile_xy(6, 24, 0x00); // blank
	set_bkg_tile_xy(7, 24, 0x00); // blank


	set_bkg_tile_xy(11, 22, 0x14); // 4
	set_bkg_tile_xy(12, 22, 0x07); // '
	set_bkg_tile_xy(13, 22, 0x53); // s
	set_bkg_tile_xy(14, 22, 0x1A); // :
	set_bkg_tile_xy(15, 22, 0x00); // blank
	set_bkg_tile_xy(16, 22, 0x00); // blank


	set_bkg_tile_xy(11, 23, 0x15); // 5
	set_bkg_tile_xy(12, 23, 0x07); // '
	set_bkg_tile_xy(13, 23, 0x53); // s
	set_bkg_tile_xy(14, 23, 0x1A); // :
	set_bkg_tile_xy(15, 23, 0x00); // blank
	set_bkg_tile_xy(16, 23, 0x00); // blank


	set_bkg_tile_xy(11, 24, 0x16); // 6
	set_bkg_tile_xy(12, 24, 0x07); // '
	set_bkg_tile_xy(13, 24, 0x53); // s
	set_bkg_tile_xy(14, 24, 0x1A); // :
	set_bkg_tile_xy(15, 24, 0x00); // blank
	set_bkg_tile_xy(16, 24, 0x00); // blank
}
