#include <gb/gb.h>

#pragma bank 1

BANKREF(soundCursorMove)
void soundCursorMove() BANKED
{
	NR10_REG = 0x70;
	NR11_REG = 0xBF;
	NR12_REG = 0x43;
	NR13_REG = 0xE2;
	NR14_REG = 0x86;
}
