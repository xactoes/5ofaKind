#ifndef STRUCT_SPRITE_H
#define STRUCT_SPRITE_H

#include <gb/gb.h>

#include "../bank_0/global_defines.h"

#include "../bank_1/struct_Coordinates.h"

extern struct Sprite
{
    uint8   address;
    uint8   isVisible;
    struct Coordinates screen;
};
BANKREF_EXTERN(Sprite)

#endif
