#ifndef INIT_B1_H
#define INIT_B1_H

#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"

extern void initializeBCDscores() BANKED;
BANKREF_EXTERN(initializeBCDscores)

#endif
