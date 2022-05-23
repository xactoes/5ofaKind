#include <gb/gb.h>
#include <stdio.h>

#include "./bank_0/global_defines.h"
#include "./bank_0/randomRange.h"
#include "./bank_0/vblDelay.h"
#include "./bank_0/loadSprites.h"
#include "./bank_0/drawDi.h"
#include "./bank_0/hideDi.h"
#include "./bank_0/showDi.h"

#include "./bank_1/dice.h"

#include "./bank_2/drawBackground.h"

void main(){
    DISPLAY_ON;

    loadSprites();

    drawBackground(SCREEN_PLAY);

    for(uint8 di = 0; di != DICE_COUNT; di++)
    {
        initializeDiProperties(di);
        drawDi(di);
    }

    SHOW_BKG;
    SHOW_SPRITES;
    
    // vblDelay(60);
    // toggleDi(1, 1);
    // vblDelay(60);
    // toggleDi(1, 0);

    // drawBackground(SCREEN_TITLE);
    // vblDelay(60);
    // vblDelay(60);
    // drawBackground(SCREEN_CARD);
    // vblDelay(60);
}
