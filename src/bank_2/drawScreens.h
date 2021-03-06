#ifndef DRAW_SCREENS_H
#define DRAW_SCREENS_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void drawScreenTitle() BANKED;
BANKREF_EXTERN(drawScreenTitle)

extern void drawScreenOptions() BANKED;
BANKREF_EXTERN(drawScreenOptions)

extern void drawScreenHighScore() BANKED;
BANKREF_EXTERN(drawScreenHighScore)

extern void drawScreenNameInput() BANKED;
BANKREF_EXTERN(drawScreenNameInput)

extern void drawScreenPlay() BANKED;
BANKREF_EXTERN(drawScreenPlay)

extern void drawScreenCard() BANKED;
BANKREF_EXTERN(drawScreenCard)

extern void drawScreenStartMenu() BANKED;
BANKREF_EXTERN(drawScreenStartMenu)

extern void drawScreenEnd() BANKED;
BANKREF_EXTERN(drawScreenEnd)

extern void drawScreenCredits() BANKED;
BANKREF_EXTERN(drawScreenCredits)

#endif
