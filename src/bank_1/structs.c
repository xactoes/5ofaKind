#include <gb/gb.h>

#include "../bank_1/struct_Coordinates.h"
#include "../bank_1/struct_Sprite.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(Sprite)
struct Sprite;

BANKREF(Coordinates)
struct Coordinates;

BANKREF(Di)
struct Di;

BANKREF(dice)
struct Di dice[5];
