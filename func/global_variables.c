#include </opt/gbdk/include/gbdk/bcd.h>

//global variables
//#include "../func/global_variables.h"


#include "../func/diceStruct.h"

unsigned int i;
unsigned int j;
unsigned int k;
unsigned int cursorIndex;
unsigned int currentFace[4];
unsigned int cursorPosition[2];
unsigned int diceValues[5] = {0, 0, 0, 0, 0};
unsigned int diFaceBuf;
unsigned int len;
unsigned int match5;
unsigned int rollsLeft;
unsigned int scoreBuf;
unsigned int scoresSet;
unsigned int smStraightContinue;
unsigned int turn;
unsigned int turnsPassed;
//255 used as a NULL value
unsigned int scorecard[15] = {255, 255, 255, 255, 255,
						255, 255, 255, 255, 255,
						255, 255, 255, 255, 255};
//used for funky logic with BCD
//511 used as a NULL value
unsigned int scorecardSummed[15] = {511, 511, 511, 511, 511,
								511, 511, 511, 511, 511,
								511, 511, 511, 511, 511};
unsigned char buf[10];
unsigned char endGame;
unsigned char quickSwitch;
unsigned char upperRegion;
unsigned char viewMode;
unsigned char bonus5;
unsigned char rollsEnabled = 1;
unsigned char scorecardChangeA;
unsigned char scorecardChangeB;
const unsigned int diSpacing = 24;
const unsigned int diStartPosition[2] = {48, 72};
const unsigned int cursor = 20;
const unsigned int rollPosY = 72;
const unsigned int heldPosY = 88;


BCD upperScoreBCD = MAKE_BCD(00000000);
BCD upperScoreBuf = MAKE_BCD(00000000);
BCD lowerScoreBCD = MAKE_BCD(00000000);
BCD lowerScoreBuf = MAKE_BCD(00000000);
BCD totalScoreBCD = MAKE_BCD(00000000);
BCD totalScoreAdd = MAKE_BCD(00000000);
BCD compareBCD = MAKE_BCD(00000000);
BCD numOptBCD = MAKE_BCD(00000000);
BCD turnBCD = MAKE_BCD(00000000);
BCD rollBCD = MAKE_BCD(00000000);
