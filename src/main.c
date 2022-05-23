#include <gb/gb.h>
//#include <stdio.h>

#include "./bank_0/global_defines.h"
#include "./bank_0/global_variables.h"

#include "./bank_0/loadSprites.h"
#include "./bank_0/init_b0.h"
#include "./bank_0/dice_b0.h"
#include "./bank_0/drawBackground.h"

#include "./bank_1/cursor.h"
#include "./bank_1/dice.h"

#include "./bank_0/vblDelay.h"

void main(){

    if(!bootInitialized)
    {
        screen = SCREEN_TITLE;
        loadSprites();
        initializeCursorSprites();
        initializeScorecard();  // MOVE TO GAME INITIALIZE LATER
        bootInitialized = 1;
    }

    DISPLAY_ON;
    SHOW_SPRITES;

    while(bootInitialized)
    {
        while(screen == SCREEN_TITLE)
        {
            if(!titleInitialized)
            {
                initializeTitle();
            }
            drawBackground(SCREEN_TITLE);
            moveCursorTitle();
            SHOW_BKG;
        }
        while(screen == SCREEN_PLAY)
        {
            if(!diceInitialized)
            {
                initializeDice();
            }
            drawBackground(SCREEN_PLAY);
            SHOW_BKG;

            refreshDicePosition();
            moveCursorGame();
        }
        while(screen == SCREEN_CARD)
        {
            drawBackground(SCREEN_CARD);
            moveCursorCard();
        }
    }
}
