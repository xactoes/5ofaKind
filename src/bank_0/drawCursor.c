#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

void drawCursor(uint8 screenLocal)
{
	uint8 cursor1, cursor2, cursor3;
	cursor1 = ARROW_RIGHT;
	cursor2 = ARROW_LEFT;
	cursor3 = ARROW_UP;

    switch(screenLocal){
        // TITLE SCREEN
        case SCREEN_TITLE:
            move_sprite(cursor1, cursorTitleX, cursorTitleY);
            break;

		// OPTIONS SCREEN
		case SCREEN_OPTIONS:
			move_sprite(cursor1, cursorOptionsX, cursorOptionsY);
			break;

		// NAME INPUT SCREENS
		case SCREEN_NAME_INPUT_0:
			cursorNameX1 = 44;
			cursorNameY1 = 128;
			cursorNameX2 = 76;
			cursorNameY2 = 128;
			move_sprite(cursor3, cursorNameX, cursorNameY);
			move_sprite(cursor1, cursorNameX1, cursorNameY1);
			move_sprite(cursor2, cursorNameX2, cursorNameY2);
			break;
		case SCREEN_NAME_INPUT_1:
			move_sprite(cursor3, cursorNameX, cursorNameY);
			move_sprite(cursor1, cursorNameX1, cursorNameY1);
			move_sprite(cursor2, cursorNameX2, cursorNameY2);
			break;
		case SCREEN_NAME_INPUT_2:
			move_sprite(cursor3, cursorNameX, cursorNameY);
			move_sprite(cursor1, cursorNameX1, cursorNameY1);
			move_sprite(cursor2, cursorNameX2, cursorNameY2);
			break;

        // LINK SCREENS
        case SCREEN_LINK:
            move_sprite(cursor2, 0, 0);
            move_sprite(cursor3, 0, 0);
            move_sprite(cursor1, cursorLinkX, cursorLinkY);
            break;

        // GAME PLAY SCREEN
        case SCREEN_PLAY:
            // IF PLAY OPTION SELECTED
            if(cursorGameY == ROW_SELECT){
                // HIDE ARROW UP
                move_sprite(cursor3, 0, 0);

                // SWITCH BACK TO MOVING SELECT_ROW CURSORS
                move_sprite(cursor1, cursorGameX, cursorGameY);
                move_sprite(cursor2, cursorGameX + 40, cursorGameY);
            }

            // IF DI TOGGLE SELECTED
            else if(cursorGameY == ROW_DI){
                move_sprite(cursor3, cursorGameX, cursorGameY);

                // KEEP cursor1 AND cursor2 ON "HOLD"
                move_sprite(cursor1, X_HOLD, ROW_SELECT);
                move_sprite(cursor2, X_HOLD + 40, ROW_SELECT);
            }
            break;

        // SCORECARD SCREEN
        case SCREEN_CARD:
            // HIDE LEFT AND UP ARROWS
            move_sprite(cursor2, 0, 0);
            move_sprite(cursor3, 0, 0);

            // DISPLAY ARROW RIGHT
            move_sprite(cursor1, cursorCardX, cursorCardY);
            break;

        // FALLBACK TO TITLE SCREEN
        default:
            move_sprite(cursor1, cursorTitleX, cursorTitleY);
            break;
    }
	SHOW_SPRITES;
}
