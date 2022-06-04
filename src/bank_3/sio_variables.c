#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#pragma bank 3

BANKREF(scoreSplit)
uint8 scoreSplit[2];

BANKREF(scorePaired)
uint16 scorePaired;

BANKREF(scoreName)
uint8 scoreName[8];