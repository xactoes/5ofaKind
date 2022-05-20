#include <gb/gb.h>

#include "../bank_0/global_defines.h"

#include "../bank_1/struct_Coordinates.h"

struct Sprite
{
    uint8   address;
    uint8   isVisible;
    Coordinates screenCoordinates;
};
