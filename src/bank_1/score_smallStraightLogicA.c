#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(smStraightLogicA)
uint8 smStraightLogicA() BANKED
{
	diceSort();

	if(diceSorted[0] == diceSorted[1]){
		if(diceSorted[1] == diceSorted[2]){
			return 0;
		}
		else if(diceSorted[2] == diceSorted[3]){
			return 0;
		}
		else if(diceSorted[3] == diceSorted[4]){
			return 0;
		}
		else{
			return 1;
		}
	}
	else if(diceSorted[1] == diceSorted[2]){
		if(diceSorted[2] == diceSorted[3]){
			return 0;
		}
		else if(diceSorted[3] == diceSorted[4]){
			return 0;
		}
		else{
			return 2;
		}
	}
	else if(diceSorted[2] == diceSorted[3]){
		if(diceSorted[3] == diceSorted[4]){
			return 0;
		}
		else{
			return 3;
		}
	}
	else{
		return 4;
	}
}
