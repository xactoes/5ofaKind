#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/info.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(bcdDisplayRolls)
void bcdDisplayRolls() BANKED
{
	uint8 len;
	BCD rollsBCD = MAKE_BCD(00000000);

	bufferClear();

	uint2bcd(rolls, &rollsBCD);
	len = bcd2text(&rollsBCD, 0x10, buf);
	if(rolls < 10)
	{
		set_bkg_tiles(18, 5, len-7, 1, buf+7);
	}
	else if(rolls < 100)
	{
		set_bkg_tiles(17, 5, len-6, 1, buf+6);
	}
	else
	{
		set_bkg_tiles(16, 5, len-5, 1, buf+5);
	}
}
