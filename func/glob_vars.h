#ifndef GLOB_VARS_H
#define GLOB_VARS_H

#include </opt/gbdk/include/gbdk/bcd.h>

//variables used to switch between screens
extern unsigned char viewTitle;
extern unsigned char viewGame;
extern unsigned char viewScores;
extern unsigned char viewLink;
extern unsigned char viewOptions;
extern unsigned char viewNameInput;
extern unsigned char viewPlay;
extern unsigned char viewCard;
extern unsigned char viewSwitch;
extern unsigned char viewEnd;


extern unsigned char upperRegion;

//variables for sprites
//0 - 19 are used by diceStruct for the dice
extern const unsigned int cursorLeft;
extern const unsigned int cursorRight;
extern const unsigned int nameCursor;

//variables for tracking cursor-highlighted options
extern unsigned int indexTitle;
extern unsigned int indexOptions;
extern unsigned int indexCursor;

//temp variables to hold data until it is ready to overwrite saved data
extern unsigned char tempName[8];

//incrementing variables
extern unsigned int bonusTally;

//decrementing variables
extern unsigned int initRolls;

//misc variables
extern unsigned int i;
extern unsigned int j;
//extern unsigned int k;





extern unsigned int currentFace[4];
extern unsigned int cursorPosition[2];
extern unsigned int diceValues[5];
extern unsigned int diFaceBuf;
extern unsigned int endScreenScrolled;
extern unsigned int len;
extern unsigned int match5;
extern unsigned int rollsLeft;
extern unsigned int scoreBuf;
extern unsigned int scoresSet;
extern unsigned int smStraightContinue;
extern unsigned int titlePosL[2];
extern unsigned int titlePosR[2];
extern unsigned int titleIndex;
extern unsigned int trackUpperBonusAdd;
extern unsigned int trueTurnOffset;
extern unsigned int turn;
extern unsigned int turnsPassed;
extern unsigned int scorecard[15];
extern unsigned int scorecardSummed[15];	//used for funky logic with BCD


extern unsigned char bonus5;
extern unsigned char buf[10];
extern unsigned char endGame;
extern unsigned char gameOn;
extern unsigned char gameStart;
extern unsigned char nameInputMenu;
extern unsigned char quickSwitch;
extern unsigned char scorecardChangeA;
extern unsigned char scorecardChangeB;
extern unsigned char titleView;
extern unsigned char viewMode;

extern const unsigned int diSpacing;
extern const unsigned int diStartPosition[2];
extern const unsigned int cursor;
extern const unsigned int rollPosY;
extern const unsigned int heldPosY;

extern const unsigned char inputArray[80];

extern BCD upperScoreBCD;
extern BCD upperScoreBuf;
extern BCD lowerScoreBCD;
extern BCD lowerScoreBuf;
extern BCD totalScoreBCD;
extern BCD totalScoreAdd;
extern BCD compareBCD;
extern BCD numOptBCD;
extern BCD turnBCD;
extern BCD rollBCD;

#endif