#include <gb/gb.h>
#include <gbdk/bcd.h>
#include "../bank_0/global_defines.h"
#include "../bank_0/global_variables.h"
#include "../bank_1/score.h"


#include <stdio.h>
#include "../bank_0/vblDelay.h"

#pragma bank 1

BANKREF(bcdDisplayScoreUpper)
<<<<<<< HEAD
void bcdDisplayScoreUpper() BANKED{
=======
void bcdDisplayScoreUpper(uint8 index) BANKED{
    uint16 scorecardBuf = 0;
>>>>>>> parent of e3770f2 (bcd is started)
	uint8 len = 0;

<<<<<<< HEAD
    for(uint8 i = 0; i != 10; i++)
	{
        buf[i] = 0;
    }

	for(uint8 index = 0; index != 15; index++)
	{
		if(scorecard[index] != 255){
			scorecardCompare[index] = scorecard[index];

			uint2bcd(scorecardCompare[index], &upperScoreBuf);

			len = bcd2text(&upperScoreBuf, 0x10, buf);

            switch(index)
			{
        		//1's
        		case 0:
        			set_bkg_tiles(2, 4, len, 1, buf);
        			break;
        		//2's
        		case 1:
        			set_bkg_tiles(2, 5, len, 1, buf);
        			break;
        		//3's
        		case 2:
        			set_bkg_tiles(2, 24, len, 1, buf);
        			break;
        		//4's
        		case 3:
        			set_bkg_tiles(11, 22, len, 1, buf);
        			break;
        		//5's
        		case 4:
        			set_bkg_tiles(11, 23, len, 1, buf);
        			break;
        		//6's
        		case 5:
        			set_bkg_tiles(11, 24, len, 1, buf);
        			break;
        	}
            bcdCleanup();
=======
	// GIVES BCD(63) TO COMPARE WITH scorecardCompare[14]
	BCD bonusCompare = MAKE_BCD(00000000);
	uint2bcd(63, &bonusCompare);

	if(index >= 0 && index <= 5){
		if(scorecardCompare[index] != scorecard[index]){
			if(scorecard[index] != 255){
				scorecardCompare[index] = scorecard[index];
				uint2bcd(scorecardCompare[index], &upperScoreBuf);

				uint8 len;

				uint8 buf[10];
				for(uint8 i = 0; i != 10; i++){
					buf[i] = 0;
				}

				len = bcd2text(&upperScoreBuf, 0x10, buf);
				bcdDrawScore(index, len, buf);
			}
>>>>>>> parent of e3770f2 (bcd is started)
		}
	}
}


//
// 		}
// 	}
//
// 	scorecardBuf = 0;
//
// 	//returns funky numbers that are indeed 16 bits in binary but i don't
//     //know the conversion for this particular bcd scheme
//     //made another BCD pointer to just make comparisons not need to be translated
//     //printf("%u ", &upperScoreBCD);
//     for(i = 0; i != 11; i++){
//         if(i < 2 || i > 7 && i < 11){
//             if(scorecard[i] != 255){
//                 scorecardBuf += scorecard[i];
//                 if(i == 2){
//                     i = 7;
//                 }
//             }
//         }
//     }
//
//     if(scorecardBuf >= 63){
//         //bcd_sub(&upperScoreBuf, &upperScoreBuf);
//         if(scorecard[14] == 255 || scorecard[14] == 35){
//             scorecard[14] = 35;
//             scorecardSummed[14] = scorecard[14];
//             uint2bcd(scorecardSummed[14], &upperScoreBonus);
//             if(trackUpperBonusAdd == 0){
//                 bcd_add(&upperScoreBCD, &upperScoreBonus);
//                 trackUpperBonusAdd = 1;
//             }
//         }
//     }
//
// 	//add upperScoreBuf INTO upperScoreBCD
// 	bcd_add(&upperScoreBCD, &upperScoreBuf);
//
// }
