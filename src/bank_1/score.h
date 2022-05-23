#ifndef SCORE_H
#define SCORE_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void scoreUpper(uint8) BANKED;
BANKREF_EXTERN(scoreUpper)
extern uint8 scoreUpperCalc(uint8) BANKED;
BANKREF_EXTERN(scoreUpperCalc)

extern void scoreLower(uint8) BANKED;
BANKREF_EXTERN(scoreLower)
extern uint8 scoreLowerCalc(uint8) BANKED;
BANKREF_EXTERN(scoreLowerCalc)

extern uint8 threeOfaKind() BANKED;
BANKREF_EXTERN(threeOfaKind)

extern void bcdDisplayScoreUpper() BANKED;
BANKREF_EXTERN(bcdDisplayScoreUpper)
extern void bcdDisplayScoreUpperTotal() BANKED;
BANKREF_EXTERN(bcdDisplayScoreUpperTotal)

extern void bcdDisplayScoreLower() BANKED;
BANKREF_EXTERN(bcdDisplayScoreLower)

extern void bcdCleanup() BANKED;
BANKREF_EXTERN(bcdCleanup)
extern void bufferClear() BANKED;
BANKREF_EXTERN(bufferClear)

#endif
