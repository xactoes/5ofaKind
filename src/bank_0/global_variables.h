#ifndef GLOBAL_VARIABLES_H
#define GLOBAL_VARIABLES_H

#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"

// INIT
extern uint8 bootInitialized;
extern uint8 titleInitialized;
extern uint8 scorecardInitialized;
extern uint8 gameInitialized;
extern uint8 turnInitialized;
extern uint8 diceInitialized;
extern uint8 bkgDrawn;
extern uint8 bcdCleaned;

// CURSOR POSITION
extern uint8 cursorGameX;
extern uint8 cursorGameY;
extern uint8 cursorCardX;
extern uint8 cursorCardY;
extern uint8 cursorTitleX;
extern uint8 cursorTitleY;

// IDENTIFIERS
extern uint8 screen;
extern uint8 cursorIndex;

// SCORE
extern uint16 scorecard[];
extern uint16 scorecardCompare[];
extern uint8 buf[];
extern uint8 diceSorted[];

// BCD
extern BCD upperScore;
extern BCD upperScoreBuf;
extern BCD lowerScore;
extern BCD lowerScoreBuf;

#endif
