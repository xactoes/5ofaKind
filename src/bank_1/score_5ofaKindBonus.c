#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(fiveOfaKindBonus)
uint8 fiveOfaKindBonus() BANKED
{
	uint8 tempScore = 100;
	return tempScore;
}
