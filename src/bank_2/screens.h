#ifndef SCREENS_H
#define SCREENS_H

#define TILE_COUNT_TITLE	93
#define TILE_COUNT_GAME		128

#include "../bank_0/global_defines.h"

extern const uint8 titleData[];
BANKREF_EXTERN(titleData)
extern const uint8 titleMap[];
BANKREF_EXTERN(titleMap)

extern const uint8 optionsMap[];
BANKREF_EXTERN(optionsMap)
extern const uint8 highScoreMap[];
BANKREF_EXTERN(highScoreMap)
extern const uint8 nameInputMap[];
BANKREF_EXTERN(nameInputMap)
extern const uint8 nameInputCharArray[];
BANKREF_EXTERN(nameInputCharArray)

extern const uint8 gameData[];
BANKREF_EXTERN(gameData)

extern const uint8 playMap[];
BANKREF_EXTERN(playMap)
extern const uint8 cardMap[];
BANKREF_EXTERN(cardMap)

extern const uint8 endMap[];
BANKREF_EXTERN(endMap)

#endif
