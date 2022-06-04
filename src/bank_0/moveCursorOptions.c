#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/resetData.h"
#include "../bank_1/cursor.h"
#include "../bank_1/misc.h"
#include "../bank_1/soundEffects.h"
#include "../sram/save_variables.h"

void moveCursorOptions()
{
	switch(joypad())
	{
		case J_UP:
			if(cursorOptionsY > Y_NAME_INPUT)
			{
				soundCursorMove();
				cursorOptionsY -= GAP_Y_OPTIONS;
			}
			drawCursor(SCREEN_OPTIONS);
			waitpadup();
			break;
		case J_DOWN:
			if(cursorOptionsY < Y_RESET)
			{
				soundCursorMove();
				cursorOptionsY += GAP_Y_OPTIONS;
			}
			drawCursor(SCREEN_OPTIONS);
			waitpadup();
			break;
		case J_A:
			if(cursorOptionsY == Y_NAME_INPUT)
			{
				bkgDrawn = 0;
				soundCursorMove();
				move_sprite(ARROW_RIGHT, 0, 0);
				move_sprite(ARROW_LEFT, 0, 0);
				move_sprite(ARROW_UP, 0, 0);
				drawCursor(SCREEN_NAME_INPUT_0);
				screen = SCREEN_NAME_INPUT_0;
			}
			else if(cursorOptionsY == Y_AUDIO)
			{
				ENABLE_RAM_MBC1;
				SWITCH_RAM_MBC1(0);
				if(audioState == 1)
				{
					audioState = 0;
					NR52_REG = AUDIO_OFF;
					NR50_REG = MIN_VOLUME;
					NR51_REG = CHANNEL_OFF_ALL;
				}
				else
				{
					audioState = 1;
					NR52_REG = AUDIO_ON;
					NR50_REG = MAX_VOLUME;
					NR51_REG = CHANNEL_ON_ALL;
				}
				DISABLE_RAM_MBC1;
				soundCursorMove();
				waitpadup();
			}
			else if(cursorOptionsY == Y_RESET)
			{
				soundCursorMove();
				ENABLE_RAM_MBC1;
				SWITCH_RAM_MBC1(0);
				resetData();
				DISABLE_RAM_MBC1;
			}
			break;
		case J_B:
			soundCursorMove();
			loadMenu();
			waitpadup();
			break;
	}
}
