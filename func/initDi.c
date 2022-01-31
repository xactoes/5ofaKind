#include "../func/dice_tools.h"
#include "../func/diceStruct.h"
#include "../func/glob_vars.h"

//function that allows for more automated setup of dice metasprites
void initDi(struct DiceStruct * diSprite, unsigned int spot){
	for(i = 0; i != 4; i++){
        unsigned int spriteNumber;

        //assigns Di position on screen (1-5)
        diSprite->position = spot;

        //preps sprite number to evaluate location in memory
		spriteNumber = (4 * (spot - 1) ) + i;

        //assigns di to be made up of 4 sprites at addresses evaluated above
        diSprite->spriteID[i] = spriteNumber;

        //initializes di to be in proper x, y pixel coordinates on screen
		diSprite->x = diStartPosition[0] + ( (diSprite->position - 1) * diSpacing);
		diSprite->y = diStartPosition[1];
	}
	//puts di in play
	diSprite->inPlay = 1;

	//moves di to screen
    moveDiceStruct(diSprite, diSprite->x, diSprite->y);

    //calls function to setup face of di
    diFaceSet(diSprite);
}
