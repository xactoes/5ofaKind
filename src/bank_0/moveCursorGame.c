#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/dice_b0.h"
#include "../bank_0/drawBackground.h"
#include "../bank_1/cursor.h"
#include "../bank_1/dice.h"

void moveCursorGame()
{
    drawCursor(SCREEN_PLAY);

    SHOW_SPRITES;

    switch(joypad()){
        case J_LEFT:
            moveCursorGameLeft();
            drawCursor(SCREEN_PLAY);
            waitpadup();
            break;

        case J_RIGHT:
            moveCursorGameRight();
            drawCursor(SCREEN_PLAY);
            waitpadup();
            break;

        case J_A:
			moveCursorGameA();
            waitpadup();
            break;

        case J_B:
            moveCursorGameB();
            drawCursor(SCREEN_PLAY);
            waitpadup();
            break;

        case J_SELECT:
            // SWITCH TO CARD VIEW
            moveCursorGameSelect();
            waitpadup();
            break;
    }
}
