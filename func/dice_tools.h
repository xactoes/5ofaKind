#ifndef DICE_TOOLS_H
#define DICE_TOOLS_H

#include "../func/diceStruct.h"

extern void initDi(struct DiceStruct * diSprite, unsigned int spot);
extern void moveDiceStruct(struct DiceStruct * diSprite, unsigned int x, unsigned int y);
extern void setDiFace(struct DiceStruct * diSprite);
extern void setDiceValues();
extern void diceToRoll();
extern void rollDi();

#endif
