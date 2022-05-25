#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"

#pragma bank 1

BANKREF(bufferClear)
void bufferClear() BANKED
{
    for(uint8 i = 0; i != 10; i++)
	{
        buf[i] = 0;
    }
}
