#include <gb/gb.h>
#include "./bank_0/global_defines.h"
#include "./bank_0/global_variables.h"
#include "./bank_0/loadSprites.h"
#include "./bank_0/init_b0.h"
#include "./bank_0/dice_b0.h"
#include "./bank_0/drawBackground.h"
#include "./bank_0/resetData.h"
#include "./bank_1/cursor.h"
#include "./bank_1/dice.h"
#include "./bank_1/info.h"
#include "./bank_1/soundEffects.h"
#include "./sram/save_variables.h"


void main(){

    NR52_REG = AUDIO_ON;
    NR50_REG = MAX_VOLUME;
    NR51_REG = CHANNEL_ON_ALL;

    if(!bootInitialized)
    {
        screen = SCREEN_TITLE;
        loadSprites();
        bootInitialized = 1;
    }

    ENABLE_RAM_MBC1;
	SWITCH_RAM_MBC1(0);
    if(saveInitialized != 1)
    {
        resetData();
        saveInitialized = 1;
    }
    DISABLE_RAM_MBC1;

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

        while(screen == SCREEN_NAME_INPUT_0 || screen == SCREEN_NAME_INPUT_1 || screen == SCREEN_NAME_INPUT_2)
        {
            drawBackground(screen);
            if(!backgroundScrolled)
            {
                scroll_bkg(-4, 0);
                backgroundScrolled = 1;
            }
            moveCursorNameInput();
            SHOW_SPRITES;
            SHOW_BKG;
        }

        while(screen == SCREEN_LINK)
        {
            drawBackground(screen);
            moveCursorLink();
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
            while(screen == SCREEN_START)
            {
                moveCursorStart();
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
