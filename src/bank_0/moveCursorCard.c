#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/hideDi.h"
#include "../bank_1/cursor.h"
#include "../bank_1/dice.h"
#include "../bank_2/drawBackground.h"

#pragma bank 0

BANKREF(moveCursorCard)
void moveCursorCard() BANKED
{
	hideDiAll();
    drawCursor(SCREEN_CARD);

    SHOW_SPRITES;

    switch(joypad()){
        case J_LEFT:
            moveCursorCardLeft();
            drawCursor(SCREEN_CARD);
            waitpadup();
            break;

        case J_RIGHT:
            moveCursorCardRight();
            drawCursor(SCREEN_CARD);
            waitpadup();
            break;

		case J_UP:
            moveCursorCardUp();
            drawCursor(SCREEN_CARD);
            waitpadup();
            break;

		case J_DOWN:
			moveCursorCardDown();
			drawCursor(SCREEN_CARD);
			waitpadup();
			break;

        case J_A:
			//moveCursorCardA();
			waitpadup();
            break;

        case J_B:
            //moveCursorCardBSelect();
            // SWITCH TO PLAY VIEW
			screen = SCREEN_PLAY;
         	drawBackground(SCREEN_PLAY);
			move_sprite(ARROW_RIGHT, 0, 0);
            move_sprite(ARROW_LEFT, 0, 0);
            move_sprite(ARROW_UP, 0, 0);
			HIDE_SPRITES;
            waitpadup();
            break;

        case J_SELECT:
			//moveCursorCardBSelect();
            // SWITCH TO PLAY VIEW
			screen = SCREEN_PLAY;
            drawBackground(SCREEN_PLAY);
            move_sprite(ARROW_RIGHT, 0, 0);
            move_sprite(ARROW_LEFT, 0, 0);
            move_sprite(ARROW_UP, 0, 0);
            HIDE_SPRITES;
            waitpadup();
            break;
    }
}
