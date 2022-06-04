#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/drawBackground.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"
#include "../bank_1/soundEffects.h"
#include "../bank_3/sio.h"

void moveCursorScores()
{
	switch(joypad())
	{
		case J_LEFT:
			if(screen > HIGH_SCORE_0)
			{
				soundCursorMove();
				screen--;
				bkgDrawn = 0;
			}
			waitpadup();
			break;
		case J_RIGHT:
			if(screen < HIGH_SCORE_3)
			{
				soundCursorMove();
				screen++;
				bkgDrawn = 0;
			}
			waitpadup();
			break;
		case J_B:
			dedupeScores();
			soundCursorMove();
			bkgDrawn = 0;
			loadMenu();
			waitpadup();
			break;
	}
}
