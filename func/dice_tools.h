#ifndef DICE_TOOLS_H
#define DICE_TOOLS_H

#include "../func/diceStruct.h"

void initDi(struct DiceStruct * diSprite, unsigned int spot);
void moveDiceStruct(struct DiceStruct * diSprite, unsigned int x, unsigned int y);
void setDiFace(struct DiceStruct * diSprite);
void setDiceValues();
void diceToRoll();

#endif
