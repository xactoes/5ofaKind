#include <gb/gb.h>
#include <stdio.h>

#include "./bank_0/global_defines.h"
#include "./bank_0/randomRange.h"
#include "./bank_0/vblDelay.h"
#include "./bank_0/loadSprites.h"

#include "./bank_1/dice.h"

#include "./bank_2/drawBackground.h"

void main(){
    DISPLAY_ON;
    SHOW_BKG;
    SHOW_SPRITES;

    loadSprites();

    for(uint8 i = 0; i != DICE_COUNT; i++)
    {
        initializeDiProperties(i);

        assignDiSprites(i);

        // for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
        // {
        //     printf("%u ", dice[i].sprite[j].screen.x);
        //     printf("%u\n", dice[i].sprite[j].screen.y);
        //     vblDelay(30);
        // }
    }

    // drawBackground(SCREEN_TITLE);
    // vblDelay(60);
    // drawBackground(SCREEN_PLAY);
    // vblDelay(60);
    // drawBackground(SCREEN_CARD);
    // vblDelay(60);
}
