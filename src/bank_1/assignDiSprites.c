#include <gb/gb.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/data_sprites.h"
#include "../bank_1/dice.h"

#pragma bank 1

BANKREF(assignDiSprites)
void assignDiSprites(uint8 diPosition) BANKED
{
	switch(dice[diPosition].face)
	{
		case 1:
			for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
			{
				for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
				{
					set_sprite_tile(dice[diPosition].sprite[j].address, diFace1[j]);
				}
			}
			break;

		case 2:
			for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
			{
				for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
				{
					set_sprite_tile(dice[diPosition].sprite[j].address, diFace2[j]);
				}
			}
			break;

		case 3:
			for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
			{
				for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
				{
					set_sprite_tile(dice[diPosition].sprite[j].address, diFace3[j]);
				}
			}
			break;

		case 4:
			for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
			{
				for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
				{
					set_sprite_tile(dice[diPosition].sprite[j].address, diFace4[j]);
				}
			}
			break;

		case 5:
			for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
			{
				for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
				{
					set_sprite_tile(dice[diPosition].sprite[j].address, diFace5[j]);
				}
			}
			break;

		case 6:
			for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
			{
				for(uint8 j = 0; j != DI_SPRITE_COUNT; j++)
				{
					set_sprite_tile(dice[diPosition].sprite[j].address, diFace6[j]);
				}
			}
			break;
	}
}
