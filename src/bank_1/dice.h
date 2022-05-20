#ifndef STRUCT_DI
#define STRUCT_DI

#include <gb/gb.h>

#include "../bank_0/global_defines.h"

#include "../bank_1/struct_Sprite.h"
#include "../bank_1/struct_Coordinates.h"

struct Di
{
    uint8   face;
    uint8   isHeld;
    Sprite  sprite[4];
    Coordinates screenCoordinates;
} Di;

extern struct Di dice[5];

#endif
