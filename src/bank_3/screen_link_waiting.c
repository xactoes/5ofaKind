#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_3/screens_link.h"

#pragma bank 3

BANKREF(linkWaiting)
void linkWaiting() BANKED
{
    linkBlank();

    set_bkg_tile_xy(9, 14, 0x03);
    set_bkg_tile_xy(10, 14, 0x03);
    set_bkg_tile_xy(11, 14, 0x03);
    set_bkg_tile_xy(12, 14, 0x03);
    set_bkg_tile_xy(13, 14, 0x03);
    set_bkg_tile_xy(14, 14, 0x03);
    set_bkg_tile_xy(15, 14, 0x03);
    set_bkg_tile_xy(16, 14, 0x03);
    set_bkg_tile_xy(17, 14, 0x03);
    set_bkg_tile_xy(18, 14, 0x03);
}