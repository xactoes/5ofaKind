#ifndef SCORE_H
#define SCORE_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void scoreUpper(uint8) BANKED;
BANKREF_EXTERN(scoreUpper)

extern uint8 scoreUpperCalc(uint8) BANKED;
BANKREF_EXTERN(scoreUpperCalc)

extern void bcdDisplayScoreUpper(uint8) BANKED;
BANKREF_EXTERN(bcdDisplayScoreUpper)

extern void bcdDisplayScoreUpperTotal() BANKED;
BANKREF_EXTERN(bcdDisplayScoreUpperTotal)

extern void bcdCleanup() BANKED;
BANKREF_EXTERN(bcdCleanup)

extern void bufferClear() BANKED;
BANKREF_EXTERN(bufferClear)

#endif
