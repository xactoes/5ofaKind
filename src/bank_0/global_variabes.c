#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"

// INIT
uint8 bootInitialized		= 0;
uint8 titleInitialized		= 0;
uint8 scorecardInitialized	= 0;
uint8 gameInitialized		= 0;
uint8 turnInitialized		= 0;
uint8 diceInitialized 		= 0;
uint8 bkgDrawn				= 0;
uint8 bcdCleaned			= 0;

// CURSOR POSITION
uint8 cursorGameX			= 16;
uint8 cursorGameY			= 144;
uint8 cursorCardX			= 16;
uint8 cursorCardY			= 48;
uint8 cursorTitleX			= 48;
uint8 cursorTitleY			= 96;
uint8 cursorOptionsX		= 24;
uint8 cursorOptionsY		= 48;

// IDENTIFIERS
uint8 screen				= 0;
uint8 cursorIndex			= 0;
uint16 rolls				= MAX_ROLLS;
uint16 turn 				= 1;

// SCORE
uint16 scorecard[15];
uint16 scorecardCompare[15];
uint8 buf[10];
uint8 diceSorted[5];
uint16 highScore[25];

// BCD
BCD upperScore			= MAKE_BCD(00000000);
BCD upperScoreBuf 		= MAKE_BCD(00000000);
BCD lowerScore			= MAKE_BCD(00000000);
BCD lowerScoreBuf		= MAKE_BCD(00000000);
BCD turnBCD				= MAKE_BCD(00000000);
BCD totalScore			= MAKE_BCD(00000000);
BCD highScoreBCD[25];
