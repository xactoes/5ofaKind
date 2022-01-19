#ifndef DICESTRUCT_H
#define DICESTRUCT_H

#include </opt/gbdk/include/gb/gb.h>

typedef struct DiceStruct{
	unsigned int spriteID[4]; //4 sprites per character
	unsigned int x;
	unsigned int y;
    unsigned int position;
	unsigned int face;
	unsigned char inPlay;
} DiceStruct;

extern struct DiceStruct Di1, Di2, Di3, Di4, Di5;

#endif
