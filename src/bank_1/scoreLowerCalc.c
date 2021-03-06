#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_1/score.h"
#include "../bank_1/dice.h"

#pragma bank 1
BANKREF(scoreLowerCalc)
uint8 scoreLowerCalc(uint8 index) BANKED
{
	uint8 tempScore = 0;

	switch(index)
	{
		// 3 of a Kind
		case 6:
			tempScore = threeOfaKind();
			break;
		// 4 of a Kind
		case 7:
			tempScore = fourOfaKind();
			break;
		// Full House
		case 8:
			tempScore = fullHouse();
			break;
		// Small Straight
		case 9:
			tempScore = smallStraight();
			break;
		// Large Straight
		case 10:
			tempScore = largeStraight();
			break;
		// Chance
		case 11:
			tempScore = chance();
			break;
		// 5 of a Kind
		case 12:
			tempScore = fiveOfaKind();
			break;
		// 5 of a Kind Bonus
		case 13:
			tempScore = fiveOfaKindBonus();
			break;
	}

	return tempScore;
}
