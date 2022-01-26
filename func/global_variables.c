#include </opt/gbdk/include/gbdk/bcd.h>

//global variables
//#include "../func/global_variables.h"

#include "../func/diceStruct.h"

unsigned int i;
unsigned int j;
unsigned int k;

unsigned int cheatRolls = 300;
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
unsigned int titlePosL[2];
unsigned int titlePosR[2];
unsigned int titleIndex;
//tTO is used ot offset the turn counter (internally) depending on if 5K bonus was chosen
//this allows pre-existing code to still work
unsigned int trueTurnOffset = 0;
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

unsigned char bonus5;
unsigned char buf[10];
unsigned char endGame;
unsigned char gameStart;
unsigned char nameInputMenu;
unsigned char quickSwitch;
unsigned char rollsEnabled = 1;
unsigned char scorecardChangeA;
unsigned char scorecardChangeB;
unsigned char upperRegion;
unsigned char viewMode;

const unsigned int diSpacing = 24;
const unsigned int diStartPosition[2] = {48, 72};
const unsigned int cursor = 20;
const unsigned int rollPosY = 72;
const unsigned int heldPosY = 88;

const unsigned char inputArray[80] = {
    //page 0
    0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A,
    0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34,
    0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x00, 0x20, 0x01, 0x1F,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19,
    //page 1
    0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A,
    0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54,
    0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};




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
