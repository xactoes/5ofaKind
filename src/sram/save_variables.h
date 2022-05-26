#ifndef SAVE_VARIABLES_H
#define SAVE_VARIABLES_H

#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"

extern uint8 currentName[8];
extern uint8 saveInitialized;

extern uint8 namesArray[25][8];
extern uint16 highScore[25];
extern uint8 scoreLogged[25];

#endif
