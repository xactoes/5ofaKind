#ifndef GLOBAL_DEFINES_H
#define GLOBAL_DEFINES_H

// SHORTHAND VARIABLE TYPES
typedef unsigned char   uint8;
typedef unsigned int    uint16;

typedef char            int8;
typedef int             int16;
typedef long            int32;
typedef long long       int64;

#define MAX_SPRITE_COUNT    40
#define MAX_ROLLS			300

// DICE
#define DICE_COUNT          5
#define DI_SPRITE_COUNT     4
#define DI_X				48
#define DI_Y				72
#define DI_SPRITE_OFFSET	8
#define DI_SPACE			24
#define DI_HELD_OFFSET		32

#define SPRITES_SIZE		8

// CURSOR
#define ARROW_RIGHT			20
#define ARROW_LEFT			21
#define ARROW_UP			22

// SCREENS
#define SCREEN_SPLASH		0
#define SCREEN_TITLE		10
#define SCREEN_PLAY			20
#define SCREEN_CARD			30
#define SCREEN_END			40
#define SCREEN_CREDITS		50

// SCORE
#define SCORE_NULL			255
#define SCORE_NULL_COMPARE	511

#endif
