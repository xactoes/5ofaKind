#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(smallStraight)
uint8 smallStraight() BANKED
{
	uint8 tempScore;

	if(smStraightLogicB()){
		tempScore = 30;
	}
	else{
		tempScore = 0;
	}
	return tempScore;
}
