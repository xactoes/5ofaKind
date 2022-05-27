#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../sram/save_variables.h"

#pragma bank 0

BANKREF(sortNamesAndScores)
void sortNamesAndScores() BANKED
{
	uint8 index1, index2;
	uint16 sTemp, maxScore;
	uint8 nTemp[1][8];

    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

	for(index1 = 0; index1 != 24; index1++)
	{
		maxScore = index1;

		for(index2 = index1 + 1; index2 != 25; index2++)
		{
			// IF LATTER IS > THAN FORMER, THEN SWAP
			if(highScore[index2] > highScore[index1])
			{
				maxScore = index2;
				// SWAP SCORES
				sTemp = highScore[index1];
				highScore[index1] = highScore[index2];
				highScore[index2] = sTemp;

				// SWAP NAMES
				for(uint8 i = 0; i != 8; i++)
				{
					nTemp[0][i] = namesArray[index1][i];
					namesArray[index1][i] = namesArray[index2][i];
					namesArray[index2][i] = nTemp[0][i];
				}
			}
		}
	}
	scoreSaved = 1;
}
