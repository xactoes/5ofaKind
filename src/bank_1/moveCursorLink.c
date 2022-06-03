#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/misc.h"
#include "../bank_1/cursor.h"
#include "../bank_1/soundEffects.h"
#include "../bank_3/sio.h"

uint8 linkOption;

#pragma bank 1

BANKREF(moveCursorLink)
void moveCursorLink() BANKED
{
	switch(joypad()){
		case J_A:
			soundCursorMove();
			linkOption = cursorLinkX;
			sioConnect(linkOption);
			waitpadup();
			break;
		case J_B:
			soundCursorMove();
			loadMenu();
			cursorLinkX = X_LINK_SCREEN;
			cursorLinkY = Y_LINK_SEND;
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_UP:
			if(cursorLinkY != Y_LINK_SEND)
			{
				soundCursorMove();
				cursorLinkY = Y_LINK_SEND; 
				drawCursor(SCREEN_LINK);
			}
			waitpadup();
			break;
		case J_DOWN:
			if(cursorLinkY != Y_LINK_RECEIVE)
				{
					soundCursorMove();
					cursorLinkY = Y_LINK_RECEIVE;
					drawCursor(SCREEN_LINK);
				}
			waitpadup();
			break;
	}
}
