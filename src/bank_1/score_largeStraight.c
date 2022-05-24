#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(largeStraight)
uint8 largeStraight() BANKED
{
	uint8 tempScore;

	diceSort();

	if(diceSorted[0] == (diceSorted[1] - 1) && diceSorted[1] == (diceSorted[2] - 1) && diceSorted[2] == (diceSorted[3] - 1) && diceSorted[3] == (diceSorted[4] - 1)){
		tempScore = 40;
	}
	else{
		tempScore = 0;
	}
	return tempScore;
}
