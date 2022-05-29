#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/displayUpdates.h"
#include "../sram/save_variables.h"

void resetData()
{
	for(uint8 i = 0; i != 25; i++)
	{
		// SET SCORES TO 0
		if(highScore[i] != 0)
		{
			highScore[i] = 0;
			for(uint8 j = 0; j != 8; j++)
			{
				namesArray[i][j] = 0x00;
			}
		}

		currentName[i] = 0x00;
	}
	sortNamesAndScores();
}
