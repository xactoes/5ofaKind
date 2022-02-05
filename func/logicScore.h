#ifndef SCOREDISPLAY_H
#define SCOREDISPLAY_H

//display scores
extern void setScoreUpper();
extern void setScoreLower();
extern void setScoreTotal();
extern void scoreDisplay();

//checks how many options have been marked
extern unsigned int scorecardMarked();

//does the logic for the scorecard
extern void logicScorecard();

extern void endScore();
extern void sortScores();
extern void scoreSetup();

#endif
