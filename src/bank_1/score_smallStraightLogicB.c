#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(smStraightLogicB)
uint8 smStraightLogicB() BANKED
{
	diceSort();

	if(smStraightLogicA() == 1){
		if(diceSorted[1] == (diceSorted[2] - 1) && diceSorted[2] == (diceSorted[3] - 1) && diceSorted[3] == (diceSorted[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightLogicA() == 2){
		if(diceSorted[0] == (diceSorted[1] - 1) && diceSorted[1] == (diceSorted[3] - 1) && diceSorted[3] == (diceSorted[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightLogicA() == 3){
		if(diceSorted[0] == (diceSorted[1] - 1) && diceSorted[1] == (diceSorted[2] - 1) && diceSorted[2] == (diceSorted[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightLogicA() == 4){
		if(diceSorted[0] == (diceSorted[1] - 1) && diceSorted[1] == (diceSorted[2] - 1) && diceSorted[2] == (diceSorted[3] - 1)){
			return 1;
		}
		else if(diceSorted[1] == (diceSorted[2] - 1) && diceSorted[2] == (diceSorted[3] - 1) && diceSorted[3] == (diceSorted[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else return 0;
}
