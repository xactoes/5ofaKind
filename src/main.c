#include <gb/gb.h>
#include <stdio.h>

#include "./bank_0/global_defines.h"
#include "./bank_0/randomRange.h"
#include "./bank_0/vblDelay.h"

#include "./bank_1/dice.h"

#include "./bank_2/drawBackground.h"

void main(){
    DISPLAY_ON;
    SHOW_BKG;
    SHOW_SPRITES;

    // while(1)
    // {
    //     printf("%u\n", randomRange(1, 5));
    //     vblDelay(10);
    // }

    // for(uint8 i = 0; i != DICE_COUNT; i++)
    // {
    //     initializeDiProperties(i);
    //
    //     for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
    //     {
    //         printf("%u ", dice[i].sprite[j].screenCoordinates.x);
    //         printf("%u\n", dice[i].sprite[j].screenCoordinates.y);
    //         vblDelay(30);
    //     }
    // }

    // drawBackground(SCREEN_TITLE);
    drawBackground(SCREEN_PLAY);
    vblDelay(60);
    drawBackground(SCREEN_CARD);
    vblDelay(60);
}
