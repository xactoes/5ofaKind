#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_0/drawBackground.h"
#include "../bank_1/cursor.h"
#include "../bank_1/dice.h"
#include "../bank_1/info.h"
#include "../bank_1/soundEffects.h"

void moveCursorCard()
{
	hideDiAll();
    drawCursor(SCREEN_CARD);

    SHOW_SPRITES;

    switch(joypad()){
        case J_LEFT:
            moveCursorCardLeft();
            drawCursor(SCREEN_CARD);
			bcdCleaned = 0;
            waitpadup();
            break;

        case J_RIGHT:
            moveCursorCardRight();
            drawCursor(SCREEN_CARD);
			bcdCleaned = 0;
            waitpadup();
            break;

		case J_UP:
            moveCursorCardUp();
            drawCursor(SCREEN_CARD);
			bcdCleaned = 0;
            waitpadup();
            break;

		case J_DOWN:
			moveCursorCardDown();
			drawCursor(SCREEN_CARD);
			bcdCleaned = 0;
			waitpadup();
			break;

        case J_A:
			if(selectionIsLegal())
			{
				if(scorecard[cursorIndex] != 255)
				{
					soundInvalid();
				}
				else
				{
					soundCursorMove();
				}
				moveCursorCardA(cursorIndex);
			}
			else
			{
				soundInvalid();
			}
			bcdCleaned = 0;
			waitpadup();
            break;

        case J_B:
            moveCursorCardBSelect();
            waitpadup();
            break;

        case J_START:
            // SHOW START MENU
            moveCursorStart();
            waitpadup();
            break;

        case J_SELECT:
			moveCursorCardBSelect();
            waitpadup();
            break;
    }
}
