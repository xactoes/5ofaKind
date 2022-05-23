#ifndef HIDE_DI_H
#define HIDE_DI_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern void hideDi(uint8) BANKED;
BANKREF_EXTERN(hideDi)

extern void hideDiAll() BANKED;
BANKREF_EXTERN(hideDiAll)

#endif
