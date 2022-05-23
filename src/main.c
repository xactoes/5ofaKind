#include <gb/gb.h>
#include <stdio.h>

#include "./bank_0/global_defines.h"
#include "./bank_0/global_variables.h"

#include "./bank_0/randomRange.h"
#include "./bank_0/vblDelay.h"
#include "./bank_0/loadSprites.h"
#include "./bank_0/drawDi.h"
#include "./bank_0/hideDi.h"
#include "./bank_0/showDi.h"

#include "./bank_1/cursor.h"
#include "./bank_1/dice.h"

#include "./bank_2/drawBackground.h"

void main(){
    DISPLAY_ON;

    loadSprites();

    initializeCursorSprites();

    drawBackground(SCREEN_PLAY);

    for(uint8 position = 0; position != DICE_COUNT; position++)
    {
        initializeDiProperties(position);
        drawDi(position);
    }
    SHOW_BKG;
    SHOW_SPRITES;

    screen = SCREEN_PLAY;
    while(1)
    {
        while(screen == SCREEN_TITLE)
        {
            //
        }
        while(screen == SCREEN_PLAY)
        {
            refreshDicePosition();
            moveCursorGame();
        }
        while(screen == SCREEN_CARD)
        {
            moveCursorCard();
        }
    }
}
