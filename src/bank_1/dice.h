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
};

extern struct Di dice[5];
BANKREF_EXTERN(dice)

// FUNCTIONS

extern void initializeDiProperties(uint8) BANKED;
BANKREF_EXTERN(initializeDiProperties)

extern void initializeDiSprites(uint8) BANKED;
BANKREF_EXTERN(initializeDiSprites)

extern void assignDiFace(uint8) BANKED;
BANKREF_EXTERN(assignDiFace)

extern void diSpriteFlip() BANKED;
BANKREF_EXTERN(diSpriteFlip)

extern void assignDiSprites(uint8) BANKED;
BANKREF_EXTERN(assignDiSprites)

// DI FACE MAPS
extern const uint8 diFace1[];
BANKREF_EXTERN(diFace1)
extern const uint8 diFace2[];
BANKREF_EXTERN(diFace2)
extern const uint8 diFace3[];
BANKREF_EXTERN(diFace3)
extern const uint8 diFace4[];
BANKREF_EXTERN(diFace4)
extern const uint8 diFace5[];
BANKREF_EXTERN(diFace5)
extern const uint8 diFace6[];
BANKREF_EXTERN(diFace6)

#endif
