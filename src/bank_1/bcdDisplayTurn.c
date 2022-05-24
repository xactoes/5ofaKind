#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/info.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bcdDisplayTurn)
void bcdDisplayTurn() BANKED
{
	uint8 len;

	bufferClear();

	uint2bcd(currentTurn(), &turnBCD);
	len = bcd2text(&turnBCD, 0x10, buf);
	if(currentTurn() < 10)
	{
		set_bkg_tiles(9, 5, len-7, 1, buf+7);
	}
	else
	{
		set_bkg_tiles(8, 5, len-6, 1, buf+6);
	}
}
