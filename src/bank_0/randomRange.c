#include <gb/gb.h>
#include <rand.h>

#include "../bank_0/global_defines.h"

uint8 randomRange(uint8 rangeStart, uint8 rangeEnd)
{
	uint8 randomResult, rangeSize;

	// Get size of range
	rangeSize = rangeEnd - rangeStart + 1;

	// SEED RNG WITH DIV_REG
	initrand(DIV_REG);

	// Takes a random number and converts it to 0 - 255
	randomResult = 127 - rand();
	// Converts number to a number within rangeSize
	randomResult = (randomResult % (rangeSize));
	// Moves number linearly to rangeStart and rangeEnd
	randomResult = randomResult + rangeStart;

	return randomResult;
}
