#ifndef SAVE_H
#define SAVE_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void checkName() BANKED;
BANKREF_EXTERN(checkName)

extern void checkScore() BANKED;
BANKREF_EXTERN(checkScore)

#endif
