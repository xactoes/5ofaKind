#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 0

BANKREF(vblDelay)
void vblDelay(uint16 loops) BANKED
{
	uint16 tick;
	for(tick = 0; tick != loops; tick++){
		wait_vbl_done();
	}
}
