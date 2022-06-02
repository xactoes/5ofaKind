#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 3

BANKREF(linkBlank)
void linkBlank() BANKED
{
    for(uint8 i = 10; i < 19; i++)
    {
        set_bkg_tile_xy(i, 16, 0x00);
    }
}