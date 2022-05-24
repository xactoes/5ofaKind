#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(chance)
uint8 chance() BANKED
{
	uint8 tempScore = 0;

	diceSort();

	for(uint8 i = 0; i < 5; i++){
		tempScore += diceSorted[i];
	}

	return tempScore;
}
