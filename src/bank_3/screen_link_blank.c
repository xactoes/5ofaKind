#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 3

BANKREF(linkBlank)
void linkBlank() BANKED
{
    for(uint8 i = 9; i < 19; i++)
    {
        set_bkg_tile_xy(i, 14, 0x00);
    }
}