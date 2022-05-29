#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_0/displayUpdates.h"
#include "../bank_1/score.h"
#include "../sram/save_variables.h"

void highScoreDisplay(uint8 currentScreen)
{
	uint8 len, offset;

	bufferClear();

	sortNamesAndScores();

	switch(currentScreen)
	{
		case HIGH_SCORE_0:
			set_bkg_tile_xy(2, 4, 0x11);

			set_bkg_tile_xy(2, 6, 0x12);

			set_bkg_tile_xy(2, 8, 0x13);

			set_bkg_tile_xy(2, 10, 0x14);

			set_bkg_tile_xy(2, 12, 0x15);

			set_bkg_tile_xy(2, 14, 0x16);

			for(uint8 i = 0; i != 6; i++)
			{
				offset = offsetScore(highScore, i);

				bcd_sub(&highScoreBCD, &highScoreBCD);
				uint2bcd(highScore[i], &highScoreBCD);

				len = bcd2text(&highScoreBCD, 0x10, buf);

				set_bkg_tiles(11 + offset, 4+(2*i), len-offset, 1, buf+offset);
			}

			// PRINTS NAMES
			for(int8 i = 7; i != -1; i--){
                for(uint8 j = 0; j != 6; j++){
                    set_bkg_tile_xy(i + 4, (j + 2) * 2, namesArray[j][i]);
                }
            }

			break;

		case HIGH_SCORE_1:
			set_bkg_tile_xy(2, 4, 0x17);

			set_bkg_tile_xy(2, 6, 0x18);

			set_bkg_tile_xy(2, 8, 0x19);

			set_bkg_tile_xy(1, 10, 0x11);
			set_bkg_tile_xy(2, 10, 0x10);

			set_bkg_tile_xy(1, 12, 0x11);
			set_bkg_tile_xy(2, 12, 0x11);

			set_bkg_tile_xy(1, 14, 0x11);
			set_bkg_tile_xy(2, 14, 0x12);

			for(uint8 i = 6; i != 12; i++)
			{
				offset = offsetScore(highScore, i);

				bcd_sub(&highScoreBCD, &highScoreBCD);
				uint2bcd(highScore[i], &highScoreBCD);

				len = bcd2text(&highScoreBCD, 0x10, buf);

				set_bkg_tiles(11 + offset, 4+(2*(i-6)), len - offset, 1, buf + offset);
			}

			// PRINTS NAMES
			for(int8 i = 7; i != -1; i--){
                for(uint8 j = 6; j < 12; j++){
                    set_bkg_tile_xy(i + 4, (j - 6 + 2) * 2, namesArray[j][i]);
                }
            }

			set_bkg_tile_xy(1, 16, 0x7D);
			set_bkg_tile_xy(3, 16, 0x11);

			set_bkg_tile_xy(16, 16, 0x13);
			set_bkg_tile_xy(18, 16, 0x7E);
			break;

		case HIGH_SCORE_2:
			set_bkg_tile_xy(1, 4, 0x11);
			set_bkg_tile_xy(2, 4, 0x13);

			set_bkg_tile_xy(1, 6, 0x11);
			set_bkg_tile_xy(2, 6, 0x14);

			set_bkg_tile_xy(1, 8, 0x11);
			set_bkg_tile_xy(2, 8, 0x15);

			set_bkg_tile_xy(1, 10, 0x11);
			set_bkg_tile_xy(2, 10, 0x16);

			set_bkg_tile_xy(1, 12, 0x11);
			set_bkg_tile_xy(2, 12, 0x17);

			set_bkg_tile_xy(1, 14, 0x11);
			set_bkg_tile_xy(2, 14, 0x18);

			for(uint8 i = 12; i != 18; i++)
			{
				offset = offsetScore(highScore, i);

				bcd_sub(&highScoreBCD, &highScoreBCD);
				uint2bcd(highScore[i], &highScoreBCD);

				len = bcd2text(&highScoreBCD, 0x10, buf);

				set_bkg_tiles(11 + offset, 4+(2*(i-12)), len - offset, 1, buf + offset);
			}

			// PRINTS NAMES
			for(int8 i = 7; i != -1; i--){
                for(uint8 j = 12; j < 18; j++){
                    set_bkg_tile_xy(i + 4, (j - 12 + 2) * 2, namesArray[j][i]);
                }
            }

			set_bkg_tile_xy(1, 16, 0x7D);
			set_bkg_tile_xy(3, 16, 0x12);

			set_bkg_tile_xy(16, 16, 0x14);
			set_bkg_tile_xy(18, 16, 0x7E);

			break;
		case HIGH_SCORE_3:
			set_bkg_tile_xy(1, 4, 0x11);
			set_bkg_tile_xy(2, 4, 0x19);

			set_bkg_tile_xy(1, 6, 0x12);
			set_bkg_tile_xy(2, 6, 0x10);

			set_bkg_tile_xy(1, 8, 0x12);
			set_bkg_tile_xy(2, 8, 0x11);

			set_bkg_tile_xy(1, 10, 0x12);
			set_bkg_tile_xy(2, 10, 0x12);

			set_bkg_tile_xy(1, 12, 0x12);
			set_bkg_tile_xy(2, 12, 0x13);

			set_bkg_tile_xy(1, 14, 0x12);
			set_bkg_tile_xy(2, 14, 0x14);

			for(uint8 i = 18; i != 24; i++)
			{
				offset = offsetScore(highScore, i);

				bcd_sub(&highScoreBCD, &highScoreBCD);
				uint2bcd(highScore[i], &highScoreBCD);

				len = bcd2text(&highScoreBCD, 0x10, buf);

				set_bkg_tiles(11 + offset, 4+(2*(i-18)), len - offset, 1, buf + offset);
			}

			// PRINTS NAMES
			for(int8 i = 7; i != -1; i--){
                for(uint8 j = 18; j < 24; j++){
                    set_bkg_tile_xy(i + 4, (j - 18 + 2) * 2, namesArray[j][i]);
                }
            }

			set_bkg_tile_xy(1, 16, 0x7D);
			set_bkg_tile_xy(3, 16, 0x13);

			set_bkg_tile_xy(16, 16, 0x00);
			set_bkg_tile_xy(18, 16, 0x00);

			break;
	}
}
