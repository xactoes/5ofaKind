#include "../func/dice_tools.h"
#include "../func/diceStruct.h"

void setDiFace(DiceStruct * diSprite){
	rollDi();
	for(i = 0; i != 4; i++){
		set_sprite_tile(diSprite->spriteID[i], currentFace[i]);
	}
	diSprite->face = diFaceBuf;
	setDiceValues();
}
