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


	set_bkg_tile_xy(2, 5, 0x12); // 2
	set_bkg_tile_xy(3, 5, 0x07); // '
	set_bkg_tile_xy(4, 5, 0x53); // s
	set_bkg_tile_xy(5, 5, 0x1A); // :
	set_bkg_tile_xy(6, 5, 0x00); // blank
	set_bkg_tile_xy(7, 5, 0x00); // blank


	set_bkg_tile_xy(2, 6, 0x13); // 3
	set_bkg_tile_xy(3, 6, 0x07); // '
	set_bkg_tile_xy(4, 6, 0x53); // s
	set_bkg_tile_xy(5, 6, 0x1A); // :
	set_bkg_tile_xy(6, 6, 0x00); // blank
	set_bkg_tile_xy(7, 6, 0x00); // blank


	set_bkg_tile_xy(11, 4, 0x14); // 4
	set_bkg_tile_xy(12, 4, 0x07); // '
	set_bkg_tile_xy(13, 4, 0x53); // s
	set_bkg_tile_xy(14, 4, 0x1A); // :
	set_bkg_tile_xy(15, 4, 0x00); // blank
	set_bkg_tile_xy(16, 4, 0x00); // blank


	set_bkg_tile_xy(11, 5, 0x15); // 5
	set_bkg_tile_xy(12, 5, 0x07); // '
	set_bkg_tile_xy(13, 5, 0x53); // s
	set_bkg_tile_xy(14, 5, 0x1A); // :
	set_bkg_tile_xy(15, 5, 0x00); // blank
	set_bkg_tile_xy(16, 5, 0x00); // blank


	set_bkg_tile_xy(11, 6, 0x16); // 6
	set_bkg_tile_xy(12, 6, 0x07); // '
	set_bkg_tile_xy(13, 6, 0x53); // s
	set_bkg_tile_xy(14, 6, 0x1A); // :
	set_bkg_tile_xy(15, 6, 0x00); // blank
	set_bkg_tile_xy(16, 6, 0x00); // blank
}
