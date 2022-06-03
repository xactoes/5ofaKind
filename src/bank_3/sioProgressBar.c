#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 3

BANKREF(progressBar)
void progressBar(uint8 progress) BANKED
{
    set_bkg_tile_xy(4, 10, 0x3B);
    set_bkg_tile_xy(15, 10, 0x3D);

    for(uint8 i = 5; i != 15; i++)
    {
        set_bkg_tile_xy(i, 10, 0x0D);
    }

    if(progress >= 10)
    {
        set_bkg_tile_xy(5, 10, 0x03);
    }
    if(progress >= 20)
    {
        set_bkg_tile_xy(6, 10, 0x03);
    }
    if(progress >= 30)
    {
        set_bkg_tile_xy(7, 10, 0x03);
    }
    if(progress >= 40)
    {
        set_bkg_tile_xy(8, 10, 0x03);
    }
    if(progress >= 50)
    {
        set_bkg_tile_xy(9, 10, 0x03);
    }
    if(progress >= 60)
    {
        set_bkg_tile_xy(10, 10, 0x03);
    }
    if(progress >= 70)
    {
        set_bkg_tile_xy(11, 10, 0x03);
    }
    if(progress >= 80)
    {
        set_bkg_tile_xy(12, 10, 0x03);
    }
    if(progress >= 90)
    {
        set_bkg_tile_xy(13, 10, 0x03);
    }
    if(progress == 100)
    {
        set_bkg_tile_xy(14, 10, 0x03);
    }
}