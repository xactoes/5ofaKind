#include <gb/gb.h>
#include "../bank_0/global_defines.h"

void vblDelay(uint16 loops)
{
	uint16 tick;
	for(tick = 0; tick != loops; tick++){
		wait_vbl_done();
	}
}
