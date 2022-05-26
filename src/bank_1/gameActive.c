#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/info.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(gameActive)
uint8 gameActive() BANKED
{
	uint8 active = 0;

	if(screen == SCREEN_PLAY || screen == SCREEN_CARD)
	{
		if(currentTurn() < 14)
		{
			active = 1;
		}
		else
		{
			if(currentTurn() - bonusTally() == 14)
			{
				active = 0;
				screen = SCREEN_END;
			}
			else
			{
				active = 1;
			}
		}
	}

	return active;
}
