#include <gbdk/bcd.h>

#include "../func/diceStruct.h"

//toggle variables
//variables used to switch between screens
unsigned char viewTitle     = 0;
unsigned char viewGame      = 0;
unsigned char viewScores    = 0;
unsigned char viewLink      = 0;
unsigned char viewOptions   = 0;
unsigned char viewNameInput = 0;
unsigned char viewPlay      = 0;
unsigned char viewCard      = 0;
unsigned char viewSwitch    = 0;
unsigned char viewEnd       = 0;

//non-screen toggle variables
unsigned char bonus5;
unsigned char upperRegion;
unsigned char rollRequest;
unsigned char turnRequest;
unsigned char scoreCheckRequest;
unsigned char scoreSaved;
unsigned char bonusFail;


//variables for sprites
//0 - 19 are used by diceStruct for the dice
const unsigned int cursorLeft   = 20;
const unsigned int cursorRight  = 21;
const unsigned int nameCursor   = 22;

//variables for tracking cursor-highlighted options
unsigned int indexTitle;
unsigned int indexOptions;
unsigned int indexCursor;

//temp variables to hold data until it is ready to overwrite saved data
unsigned char tempName[8];

//incrementing variables
unsigned int bonusTally     = 0;
unsigned int turn;

//decrementing variables
unsigned int initRolls      = 3;   //DO NOT SET TO 240 OR HIGHER

//misc variables
unsigned int i;
unsigned int j;
unsigned int k;

//initialized arrays with self-chosen NULL values
//255 used as a NULL value
unsigned int scorecard[15] =        {255, 255, 255, 255, 255,
                                    255, 255, 255, 255, 255,
                                    255, 255, 255, 255, 255};
//used for funky logic with BCD
//511 used as a NULL value
unsigned int scorecardSummed[15] = {511, 511, 511, 511, 511,
                                    511, 511, 511, 511, 511,
                                    511, 511, 511, 511, 511};

//variables that might go into options later
unsigned char quickSwitch   = 0;

//buffer variables
unsigned int diFaceBuf;
unsigned char buf[10];
unsigned char scorecardChangeA;
unsigned char scorecardChangeB;
unsigned int scoreBuf;

//misc constant variables
const unsigned int diSpacing = 24;
const unsigned int diStartPosition[2] = {48, 72};
const unsigned int rollPosY = 72;
const unsigned int heldPosY = 104;

const unsigned char inputArray[120] = {
    //page 0
    0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A,
    0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34,
    0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x00, 0x20, 0x01, 0x1F,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19,
    //page 1
    0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A,
    0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54,
    0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x00, 0x7D, 0x7E, 0x7F,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19,
    //page 2
    0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B,
    0x0C, 0x0D, 0x0E, 0x0F, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x3C,
    0x3B, 0x3D, 0x3E, 0x3F, 0x40, 0x5B, 0x5D, 0x5C, 0x5E, 0x5F,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19,
};

//BCD variables
BCD upperScoreBonus = MAKE_BCD(00000000);
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




unsigned int currentFace[4];
unsigned int cursorPosition[2];
unsigned int diceValues[5] = {0, 0, 0, 0, 0};

unsigned int endScreenScrolled;
unsigned int len;
unsigned int match5;
unsigned int rollsLeft;
unsigned int scoresSet;
unsigned int smStraightContinue;
unsigned int titlePosL[2];
unsigned int titlePosR[2];
unsigned int trackUpperBonusAdd;
