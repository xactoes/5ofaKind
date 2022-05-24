#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/info.h"

#pragma bank 1

BANKREF(selectionIsLegal)
uint16 selectionIsLegal() BANKED
{
	currentTurn();
	uint16 legal = 0;
	if(rolls == MAX_ROLLS)
	{
		legal = 0;
	}
	else
	{
		legal = 1;
	}

	return legal;
}
