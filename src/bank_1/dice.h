#ifndef STRUCT_DI
#define STRUCT_DI

#include <gb/gb.h>

#include "../bank_0/global_defines.h"

#include "../bank_1/struct_Sprite.h"
#include "../bank_1/struct_Coordinates.h"

extern struct Di
{
    uint8               face;
    uint8               isHeld;
    struct Sprite       sprite[4];
    struct Coordinates  screenCoordinates;
} Di;

extern struct Di dice[5];
BANKREF_EXTERN(dice)

extern void initializeDiProperties(uint8) BANKED;
BANKREF_EXTERN(initializeDiProperties)

extern void initializeDiSprites(uint8) BANKED;
BANKREF_EXTERN(initializeDiSprites)

extern void assignDiFace(uint8) BANKED;
BANKREF_EXTERN(assignDiFace)


#endif
