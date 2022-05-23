#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/cursor.h"

#pragma bank 0

BANKREF(drawCursor)
void drawCursor(uint8 screen) BANKED
{
	uint8 cursor1, cursor2, cursor3;

    switch(screen){
        // TITLE SCREEN
        case SCREEN_TITLE:
            cursor1 = ARROW_RIGHT;
            move_sprite(cursor1, cursorTitleX, cursorTitleY);
            break;

        // GAME PLAY SCREEN
        case SCREEN_PLAY:
            // PLAY OPTION SELECT
            cursor1 = ARROW_RIGHT;
            cursor2 = ARROW_LEFT;

            // DI TOGGLE SELECT
            cursor3 = ARROW_UP;

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
            // SCORE OPTION SELECT
            cursor1 = ARROW_RIGHT;

            // HIDE LEFT AND UP ARROWS
            move_sprite(cursor2, 0, 0);
            move_sprite(cursor3, 0, 0);

            // DISPLAY ARROW RIGHT
            move_sprite(cursor1, cursorCardX, cursorCardY);
            break;

        // FALLBACK TO TITLE SCREEN
        default:
            cursor1 = ARROW_RIGHT;
            move_sprite(cursor1, cursorTitleX, cursorTitleY);
            break;
    }
}
