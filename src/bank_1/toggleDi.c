#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(toggleDi)
void toggleDi(uint8 position, uint8 held) BANKED
{
	dice[position].isHeld = held;
	refreshDicePosition();
}
