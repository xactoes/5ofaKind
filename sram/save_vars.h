#ifndef SAVE_VARS_H
#define SAVE_VARS_H

#include <gbdk/bcd.h>

extern unsigned char currentName[8];
extern unsigned char saveInitialized;

extern unsigned char namesArray[25][8];
extern unsigned int hiScores[25];
extern unsigned char scoreTrue[25];

extern BCD hiScore01, hiScore02, hiScore03, hiScore04, hiScore05, hiScore06, hiScore07, hiScore08, hiScore09, hiScore10, hiScore11, hiScore12, hiScore13, hiScore14, hiScore15, hiScore16, hiScore17, hiScore18, hiScore19, hiScore20, hiScore21, hiScore22, hiScore23, hiScore24, hiScoreBuf;

#endif
