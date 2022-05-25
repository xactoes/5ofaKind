#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"

#pragma bank 1

BANKREF(offsetScore)
uint8 offsetScore(uint16* array, uint8 index) BANKED
{
	uint8 offset;
	
	if(array[index] < 10)
	{
		offset = 7;
	}
	else if(array[index] < 100)
	{
		offset = 6;
	}
	else if(array[index] < 1000)
	{
		offset = 5;
	}
	else if(array[index] < 10000)
	{
		offset = 4;
	}
	else if(array[index] < 100000)
	{
		offset = 3;
	}
	else if(array[index] < 1000000)
	{
		offset = 2;
	}
	else if(array[index] < 10000000)
	{
		offset = 1;
	}
	else
	{
		offset = 0;
	}

	return offset;
}
