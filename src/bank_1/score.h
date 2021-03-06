#ifndef SCORE_H
#define SCORE_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern uint8 bonusTally() BANKED;
BANKREF_EXTERN(bonusTally)
extern uint8 offsetScore(uint16*, uint8) BANKED;
BANKREF_EXTERN(offsetScore)

extern void scoreUpper(uint8) BANKED;
BANKREF_EXTERN(scoreUpper)
extern uint8 scoreUpperCalc(uint8) BANKED;
BANKREF_EXTERN(scoreUpperCalc)
extern uint8 scoreBonusUpperCalc() BANKED;
BANKREF_EXTERN(scoreBonusUpperCalc)

extern void scoreLower(uint8) BANKED;
BANKREF_EXTERN(scoreLower)
extern uint8 scoreLowerCalc(uint8) BANKED;
BANKREF_EXTERN(scoreLowerCalc)

// LOWER CARD
extern uint8 threeOfaKind() BANKED;
BANKREF_EXTERN(threeOfaKind)
extern uint8 fourOfaKind() BANKED;
BANKREF_EXTERN(fourOfaKind)
extern uint8 fullHouse() BANKED;
BANKREF_EXTERN(fullHouse)
extern uint8 smStraightLogicA() BANKED;
BANKREF_EXTERN(smStraightLogicA)
extern uint8 smStraightLogicB() BANKED;
BANKREF_EXTERN(smStraightLogicB)
extern uint8 smallStraight() BANKED;
BANKREF_EXTERN(smallStraight)
extern uint8 largeStraight() BANKED;
BANKREF_EXTERN(largeStraight)
extern uint8 chance() BANKED;
BANKREF_EXTERN(chance)
extern uint8 fiveOfaKind() BANKED;
BANKREF_EXTERN(fiveOfaKind)
extern uint8 fiveOfaKindBonus() BANKED;
BANKREF_EXTERN(fiveOfaKindBonus)
extern uint8 fiveOfaKindBonusIsLegal() BANKED;
BANKREF_EXTERN(fiveOfaKindBonusIsLegal)

extern void bcdDisplayScoreUpper() BANKED;
BANKREF_EXTERN(bcdDisplayScoreUpper)
extern void bcdDisplayScoreUpperTotal() BANKED;
BANKREF_EXTERN(bcdDisplayScoreUpperTotal)

extern void bcdDisplayScoreLower() BANKED;
BANKREF_EXTERN(bcdDisplayScoreLower)
extern void bcdDisplayScoreLowerTotal() BANKED;
BANKREF_EXTERN(bcdDisplayScoreLowerTotal)

extern void bcdDisplayScoreTotal(uint8) BANKED;
BANKREF_EXTERN(bcdDisplayScoreTotal)

extern void bcdCleanup() BANKED;
BANKREF_EXTERN(bcdCleanup)
extern void bufferClear() BANKED;
BANKREF_EXTERN(bufferClear)

#endif
