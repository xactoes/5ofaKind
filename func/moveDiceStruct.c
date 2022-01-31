#include <gb/gb.h>

#include "../func/diceStruct.h"

void moveDiceStruct(struct DiceStruct * diSprite, unsigned int x, unsigned int y){
	move_sprite(diSprite->spriteID[0], x, y);
	move_sprite(diSprite->spriteID[1], x + 8, y);
	move_sprite(diSprite->spriteID[2], x, y + 8);
	move_sprite(diSprite->spriteID[3], x + 8, y + 8);
}
