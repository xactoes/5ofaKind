#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 3

BANKREF(linkBlankExit)
void linkBlankExit() BANKED
{
    for(uint8 i = 1; i < 19; i++)
    {
        set_bkg_tile_xy(i, 16, 0x00);
    }
}