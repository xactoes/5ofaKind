#ifndef DISPLAY_UPDATES_H
#define DISPLAY_UPDATES_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void nameInputDisplay(uint8, uint8*) BANKED;
BANKREF_EXTERN(nameInputDisplay)

extern void sortNamesAndScores() BANKED;
BANKREF_EXTERN(sortNamesAndScores)

#endif
