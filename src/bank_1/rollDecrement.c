#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/info.h"

#pragma bank 1

BANKREF(rollDecrement)
void rollDecrement() BANKED
{
	if(!rolls)
	{
		rolls = 0;
	}
	else
	{
		rolls --;
	}
	bcdDisplayRolls();
}
