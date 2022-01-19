#ifndef GLOBAL_VARIABLES_H
#define GLOBAL_VARIABLES_H

#include </opt/gbdk/include/gbdk/bcd.h>

extern unsigned int i;
extern unsigned int j;
extern unsigned int k;
extern unsigned int cursorIndex;
extern unsigned int currentFace[4];
extern unsigned int cursorPosition[2];
extern unsigned int diceValues[5];
extern unsigned int diFaceBuf;
extern unsigned int len;
extern unsigned int match5;
extern unsigned int rollsLeft;
extern unsigned int scoreBuf;
extern unsigned int scoresSet;
extern unsigned int turn;
extern unsigned int turnsPassed;
extern unsigned int scorecard[15];
extern unsigned int scorecardSummed[15];	//used for funky logic with BCD
extern unsigned char buf[10];
extern unsigned char quickSwitch;
extern unsigned char upperRegion;
extern unsigned char viewMode;
extern unsigned char bonus5;
extern unsigned char rollsEnabled;
extern unsigned char scorecardChangeA;
extern unsigned char scorecardChangeB;
extern const unsigned int diSpacing;
extern const unsigned int diStartPosition[2];
extern const unsigned int cursor;
extern const unsigned int rollPosY;
extern const unsigned int heldPosY;

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
