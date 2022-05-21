#ifndef STRUCT_COORDINATES_H
#define STRUCT_COORDINATES_H

#include <gb/gb.h>

#include "../bank_0/global_defines.h"

extern struct Coordinates
{
    uint16 x;
    uint16 y;
};
BANKREF_EXTERN(Coordinates)

#endif
