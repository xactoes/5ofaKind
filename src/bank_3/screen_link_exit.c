#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_3/screens_link.h"

#pragma bank 3

BANKREF(linkExit)
void linkExit() BANKED
{
    set_bkg_tile_xy(1, 16, 0x30);
    set_bkg_tile_xy(2, 16, 0x52);
    set_bkg_tile_xy(3, 16, 0x45);
    set_bkg_tile_xy(4, 16, 0x53);
    set_bkg_tile_xy(5, 16, 0x53);

    set_bkg_tile_xy(7, 16, 0x22);

    set_bkg_tile_xy(9, 16, 0x54);
    set_bkg_tile_xy(10, 16, 0x4F);

    set_bkg_tile_xy(12, 16, 0x25);
    set_bkg_tile_xy(13, 16, 0x38);
    set_bkg_tile_xy(14, 16, 0x29);
    set_bkg_tile_xy(15, 16, 0x34);
}