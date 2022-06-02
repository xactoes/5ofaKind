#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/misc.h"
#include "../bank_1/cursor.h"
#include "../bank_3/sio.h"

uint8 linkOption;

#pragma bank 1

BANKREF(moveCursorLink)
void moveCursorLink() BANKED
{
	switch(joypad()){
		case J_A:
			linkOption = cursorLinkX;
			sioConnect(linkOption);
			waitpadup();
			break;
		case J_B:
			loadMenu();
			cursorLinkX = X_HOST;
			cursorLinkY = Y_LINK_SCREEN;
			bkgDrawn = 0;
			waitpadup();
			break;
		case J_START:
			break;
		case J_LEFT:
			if(cursorLinkX != X_HOST)
			{
				cursorLinkX = X_HOST;
				drawCursor(SCREEN_LINK);
			}
			waitpadup();
			break;
		case J_RIGHT:
			if(cursorLinkX != X_JOIN)
				{
					cursorLinkX = X_JOIN;
					drawCursor(SCREEN_LINK);
				}
			waitpadup();
			break;
	}
}
