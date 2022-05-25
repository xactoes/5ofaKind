#ifndef DICE_B0_H
#define DICE_B0_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void drawDi(uint8) BANKED;
BANKREF_EXTERN(drawDi)

extern void hideDi(uint8) BANKED;
BANKREF_EXTERN(hideDi)
extern void hideDiAll() BANKED;
BANKREF_EXTERN(hideDiAll)

extern void showDi(uint8) BANKED;
BANKREF_EXTERN(showDi)
extern void showDiAll() BANKED;
BANKREF_EXTERN(showDiAll)

extern void rollDi(uint8) BANKED;
BANKREF_EXTERN(rollDi)
extern void rollDiAll() BANKED;
BANKREF_EXTERN(rollDiAll)

#endif
