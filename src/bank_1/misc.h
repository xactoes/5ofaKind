#ifndef MISC_H
#define MISC_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void newGame() BANKED;
BANKREF_EXTERN(newGame)

extern void loadMenu() BANKED;
BANKREF_EXTERN(loadMenu)

#endif
