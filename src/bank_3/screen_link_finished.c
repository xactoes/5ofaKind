#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_3/screens_link.h"

#pragma bank 3

BANKREF(linkFinished)
void linkFinished() BANKED
{
    linkBlank();

    set_bkg_tile_xy(9, 14, 0x26);
    set_bkg_tile_xy(10, 14, 0x29);
    set_bkg_tile_xy(11, 14, 0x2E);
    set_bkg_tile_xy(12, 14, 0x29);
    set_bkg_tile_xy(13, 14, 0x33);
    set_bkg_tile_xy(14, 14, 0x28);
    set_bkg_tile_xy(15, 14, 0x25);
    set_bkg_tile_xy(16, 14, 0x24);
}