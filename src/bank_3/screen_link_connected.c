#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 3

BANKREF(linkConnected)
void linkConnected() BANKED
{
    linkBlank();

    set_bkg_tile_xy(10, 16, 0x01);
    set_bkg_tile_xy(11, 16, 0x01);
    set_bkg_tile_xy(12, 16, 0x01);
    set_bkg_tile_xy(13, 16, 0x01);
    set_bkg_tile_xy(14, 16, 0x01);
    set_bkg_tile_xy(15, 16, 0x01);
    set_bkg_tile_xy(16, 16, 0x01);
    set_bkg_tile_xy(17, 16, 0x01);
    set_bkg_tile_xy(18, 16, 0x01);
    set_bkg_tile_xy(19, 16, 0x01);
}