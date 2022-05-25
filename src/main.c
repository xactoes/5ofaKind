#include <gb/gb.h>

#include "./bank_0/global_defines.h"
#include "./bank_0/global_variables.h"

#include "./bank_0/loadSprites.h"
#include "./bank_0/init_b0.h"
#include "./bank_0/dice_b0.h"
#include "./bank_0/drawBackground.h"

#include "./bank_1/cursor.h"
#include "./bank_1/dice.h"
#include "./bank_1/info.h"

#include <stdio.h>
#include "./bank_0/vblDelay.h"

void main(){

    if(!bootInitialized)
    {
        screen = SCREEN_TITLE;
        loadSprites();
        //initializeScorecard();  // MOVE TO GAME INITIALIZE LATER
        bootInitialized = 1;
    }

    DISPLAY_ON;
    SHOW_SPRITES;

    while(screen == SCREEN_SPLASH)
    {
        //
    }

    while(bootInitialized)
    {
        while(screen == SCREEN_TITLE)
        {
            if(!titleInitialized)
            {
                initializeCursorSprites();
                initializeTitle();
                //initializeBCDscores();
                SHOW_SPRITES;
            }
            drawBackground(SCREEN_TITLE);
            moveCursorTitle();
            SHOW_BKG;
        }

        while(screen == SCREEN_OPTIONS)
        {
            drawBackground(SCREEN_OPTIONS);
            moveCursorOptions();
            SHOW_SPRITES;
            SHOW_BKG;
        }

        while(screen == HIGH_SCORE_0 || screen == HIGH_SCORE_1 || screen == HIGH_SCORE_2 || screen == HIGH_SCORE_3)
        {
            drawBackground(screen);
            moveCursorScores();
            SHOW_SPRITES;
            SHOW_BKG;
        }

        while(gameActive())
        {
            while(screen == SCREEN_PLAY)
            {
                if(!diceInitialized)
                {
                    initializeDice();
                }
                drawBackground(SCREEN_PLAY);
                refreshDicePosition();
                moveCursorGame();
            }
            while(screen == SCREEN_CARD)
            {
                drawBackground(SCREEN_CARD);
                moveCursorCard();
            }
        }

        while(screen == SCREEN_END)
        {
            drawBackground(SCREEN_END);
            moveCursorEnd();
        }
        while(screen == SCREEN_CREDITS)
        {
            //
        }
    }
}
