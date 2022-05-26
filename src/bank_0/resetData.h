#ifndef RESET_DATA_H
#define RESET_DATA_H

#include <gb/gb.h>

#pragma bank 0

extern void resetData() BANKED;
BANKREF_EXTERN(resetData)

#endif
