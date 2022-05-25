#ifndef INFO_H
#define INFO_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern uint16 currentTurn() BANKED;
BANKREF_EXTERN(currentTurn)
extern uint16 rollDecrement() BANKED;
BANKREF_EXTERN(rollDecrement)
extern uint16 selectionIsLegal() BANKED;
BANKREF_EXTERN(selectionIsLegal)
extern uint8 gameActive() BANKED;
BANKREF_EXTERN(gameActive)

extern void bcdDisplayTurn() BANKED;
BANKREF_EXTERN(bcdDisplayTurn)
extern void bcdDisplayRolls() BANKED;
BANKREF_EXTERN(bcdDisplayRolls)

#endif
