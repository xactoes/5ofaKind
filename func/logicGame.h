#ifndef LOGICGAME_H
#define LOGICGAME_H

//check whether rolls or turn should be enabled
extern unsigned int rollsCheck();
extern unsigned int turnCheck();
extern unsigned int rollsEnabled();

//initializes a new turn
extern void initTurn();

//two parts of game view
extern void card(unsigned char map[]);
extern void play(unsigned char map[]);

//displays turn and roll info
extern void turnRollDisplay();

#endif
