#include </opt/gbdk/include/gb/gb.h>
#include </opt/gbdk/include/gbdk/bcd.h>


//global variables
#include "../func/glob_vars.h"

#include "../func/betterDelay.h"
#include "../func/logicScore.h"

#include <stdio.h>


void setScoreUpper(){
    unsigned int scorecardBuf = 0;
	len = 0;
	uint2bcd(63, &compareBCD);
	//resets upper buffer to zero
	bcd_sub(&upperScoreBuf, &upperScoreBuf);
	for(i = 0; i != 10; i++){
		buf[i] = 0;
	}
	if(indexCursor >= 8 && indexCursor <= 10 || indexCursor >= 16 && indexCursor <= 18){
		if(scorecardSummed[indexCursor - 8] != scorecard[indexCursor - 8]){
			if(scorecard[indexCursor - 8] != 255 /*&& scorecard[indexCursor - 8] != 0*/){
				//ones twos threes
				if(indexCursor <= 11){
					//printf("upper check: %u\n", scorecard[i]);
					scorecardSummed[indexCursor - 8] = scorecard[indexCursor - 8];
					//number and where to store it as a BCD value
					uint2bcd(scorecardSummed[indexCursor - 8], &upperScoreBuf);
					//printf("sum: %u\n", scorecardSummed[indexCursor - 8]);
					//printf("card: %u\n", scorecard[indexCursor - 9]);
				}
				//fours fives sixes
				else if(indexCursor >= 16 && indexCursor <= 18){
					//printf("indexCursor: %u\n", indexCursor);
					scorecardSummed[indexCursor - 8] = scorecard[indexCursor - 8];
					//number and where to store it as a BCD value
					uint2bcd(scorecardSummed[indexCursor - 8], &upperScoreBuf);
				}
				//for displaying the scores totals next to their option individually
				//resets number option buffer to zero
				bcd_sub(&numOptBCD, &numOptBCD);
                uint2bcd(scorecard[indexCursor - 8], &numOptBCD);
				len = bcd2text(&numOptBCD, 0x10, buf);
				switch(indexCursor){
					//1's
					case 8:
						set_bkg_tiles(2, 22, len, 1, buf);
						set_bkg_tile_xy(2, 22, 0x11); // 1
						set_bkg_tile_xy(3, 22, 0x07); // '
						set_bkg_tile_xy(4, 22, 0x53); // s
						set_bkg_tile_xy(5, 22, 0x1A); // :
						set_bkg_tile_xy(6, 22, 0x00); // blank
						set_bkg_tile_xy(7, 22, 0x00); // blank
                        break;
					//2's
					case 9:
						set_bkg_tiles(2, 23, len, 1, buf);
						set_bkg_tile_xy(2, 23, 0x12); // 2
						set_bkg_tile_xy(3, 23, 0x07); // '
						set_bkg_tile_xy(4, 23, 0x53); // s
						set_bkg_tile_xy(5, 23, 0x1A); // :
						set_bkg_tile_xy(6, 23, 0x00); // blank
						set_bkg_tile_xy(7, 23, 0x00); // blank
						break;
					//3's
					case 10:
						set_bkg_tiles(2, 24, len, 1, buf);
						set_bkg_tile_xy(2, 24, 0x13); // 3
						set_bkg_tile_xy(3, 24, 0x07); // '
						set_bkg_tile_xy(4, 24, 0x53); // s
						set_bkg_tile_xy(5, 24, 0x1A); // :
						set_bkg_tile_xy(6, 24, 0x00); // blank
						set_bkg_tile_xy(7, 24, 0x00); // blank
						break;
					//4's
					case 16:
						set_bkg_tiles(11, 22, len, 1, buf);
						set_bkg_tile_xy(11, 22, 0x14); // 4
						set_bkg_tile_xy(12, 22, 0x07); // '
						set_bkg_tile_xy(13, 22, 0x53); // s
						set_bkg_tile_xy(14, 22, 0x1A); // :
						set_bkg_tile_xy(15, 22, 0x00); // blank
						set_bkg_tile_xy(16, 22, 0x00); // blank
						break;
					//5's
					case 17:
						set_bkg_tiles(11, 23, len, 1, buf);
						set_bkg_tile_xy(11, 23, 0x15); // 5
						set_bkg_tile_xy(12, 23, 0x07); // '
						set_bkg_tile_xy(13, 23, 0x53); // s
						set_bkg_tile_xy(14, 23, 0x1A); // :
						set_bkg_tile_xy(15, 23, 0x00); // blank
						set_bkg_tile_xy(16, 23, 0x00); // blank
						break;
					//6's
					case 18:
						set_bkg_tiles(11, 24, len, 1, buf);
						set_bkg_tile_xy(11, 24, 0x16); // 6
						set_bkg_tile_xy(12, 24, 0x07); // '
						set_bkg_tile_xy(13, 24, 0x53); // s
						set_bkg_tile_xy(14, 24, 0x1A); // :
						set_bkg_tile_xy(15, 24, 0x00); // blank
						set_bkg_tile_xy(16, 24, 0x00); // blank
						break;
				}
			}
		}
	}

	scorecardBuf = 0;

	//returns funky numbers that are indeed 16 bits in binary but i don't
    //know the conversion for this particular bcd scheme
    //made another BCD pointer to just make comparisons not need to be translated
    //printf("%u ", &upperScoreBCD);
    for(i = 0; i != 11; i++){
        if(i < 2 || i > 7 && i < 11){
            if(scorecard[i] != 255){
                scorecardBuf += scorecard[i];
                if(i == 2){
                    i = 7;
                }
            }
        }
    }

    if(scorecardBuf >= 63){
        //bcd_sub(&upperScoreBuf, &upperScoreBuf);
        if(scorecard[14] == 255 || scorecard[14] == 35){
            scorecard[14] = 35;
            scorecardSummed[14] = scorecard[14];
            uint2bcd(scorecardSummed[14], &upperScoreBonus);
            if(trackUpperBonusAdd == 0){
                bcd_add(&upperScoreBCD, &upperScoreBonus);
                trackUpperBonusAdd = 1;
            }
        }
    }

	//add upperScoreBuf INTO upperScoreBCD
	bcd_add(&upperScoreBCD, &upperScoreBuf);

}

void setScoreLower(){
	len = 0;
	bcd_sub(&lowerScoreBuf, &lowerScoreBuf);
	for(i = 0; i != 10; i++){
		buf[i] = 0;
	}
	if(indexCursor <= 21){
		if(scorecardSummed[indexCursor - 8] != scorecard[indexCursor - 8]){
			if(scorecard[indexCursor - 8] != 255 /*&& scorecard[indexCursor - 8] != 0*/){
				//3kind 4kind fhouse 5kind
				if(indexCursor >= 11 && indexCursor <= 14){
					//printf("upper check: %u\n", scorecard[i]);
					scorecardSummed[indexCursor - 8] = scorecard[indexCursor - 8];
					uint2bcd(scorecardSummed[indexCursor - 8], &lowerScoreBuf);
				}
				//smStraight lgStraight chance
				else if(indexCursor >= 19 && indexCursor <= 21){
					//printf("upper check: %u\n", scorecard[i]);
					scorecardSummed[indexCursor - 8] = scorecard[indexCursor - 8];
					//printf("%u\n", scorecardSummed[11]);
					//printf("%u\n", scorecard[11]);
					uint2bcd(scorecardSummed[indexCursor - 8], &lowerScoreBuf);
				}
				//bonus 5-of-a-kind
				else if(indexCursor == 15 && (turn - bonusTally == scorecardMarked())){
					if(scorecard[7] < 1000){
						scorecardSummed[7] = 100;
						uint2bcd(scorecardSummed[7], &lowerScoreBuf);

                        bcd_sub(&numOptBCD, &numOptBCD);
                        uint2bcd(scorecard[7], &numOptBCD);
                        len = bcd2text(&numOptBCD, 0x10, buf);
                        set_bkg_tiles(11, 32, len, 1, buf);
						set_bkg_tile_xy(11, 32, 0x4E); // n
						set_bkg_tile_xy(12, 32, 0x55); // u
						set_bkg_tile_xy(13, 32, 0x53); // s
						set_bkg_tile_xy(14, 32, 0x1A); // :
                        set_bkg_tile_xy(15, 32, 0x00);  //blank
                        set_bkg_tile_xy(17, 32, 0x10); // 0
                        set_bkg_tile_xy(18, 32, 0x10); // 0
					}
					else if(scorecard[7] == 1000 && bonus5 == 0){
						scorecardSummed[7] = 1000;
						uint2bcd(scorecardSummed[7], &lowerScoreBuf);

                        bcd_sub(&numOptBCD, &numOptBCD);
                        uint2bcd(scorecardSummed[7], &numOptBCD);
                        len = bcd2text(&numOptBCD, 0x10, buf);
                        set_bkg_tiles(11, 32, len, 1, buf);
						set_bkg_tile_xy(11, 32, 0x4E); // n
						set_bkg_tile_xy(12, 32, 0x55); // u
						set_bkg_tile_xy(13, 32, 0x53); // s
						set_bkg_tile_xy(14, 32, 0x1A); // :
                        set_bkg_tile_xy(15, 32, 0x11);  //blank
                        set_bkg_tile_xy(17, 32, 0x10); // 0
                        set_bkg_tile_xy(18, 32, 0x10); // 0
						bonus5 = 1;
					}
					//printf("sum: %u\n", scorecardSummed[i]);
					//printf("card: %u\n", scorecard[i]);
				}
				//reset the value for displaying properly on the non collected score
				if(bonus5 == 1){
					scorecardSummed[7] == scorecard[7];
				}

				//for display score on the card individually for each option
				bcd_sub(&numOptBCD, &numOptBCD);
				uint2bcd(scorecardSummed[indexCursor - 8], &numOptBCD);
				len = bcd2text(&numOptBCD, 0x10, buf);
				switch(indexCursor){
                    //3 of a Kind
                    case 11:
                        set_bkg_tiles(2, 28, len, 1, buf);
						set_bkg_tile_xy(2, 28, 0x13); // 3
						set_bkg_tile_xy(3, 28, 0x2B); // K
						set_bkg_tile_xy(4, 28, 0x49); // i
						set_bkg_tile_xy(5, 28, 0x4E); // n
						set_bkg_tile_xy(6, 28, 0x44); // d
						set_bkg_tile_xy(7, 28, 0x00); // blank
                        break;
                    //4 of a Kind
                    case 12:
                        set_bkg_tiles(2, 29, len, 1, buf);
						set_bkg_tile_xy(2, 29, 0x14); // 4
						set_bkg_tile_xy(3, 29, 0x2B); // K
						set_bkg_tile_xy(4, 29, 0x49); // i
						set_bkg_tile_xy(5, 29, 0x4E); // n
						set_bkg_tile_xy(6, 29, 0x44); // d
						set_bkg_tile_xy(7, 29, 0x00); // blank
                        break;
                    //5 of a Kind Bonus
                    case 15:
                        set_bkg_tiles(11, 32, len, 1, buf);
						set_bkg_tile_xy(11, 32, 0x4E); // n
						set_bkg_tile_xy(12, 32, 0x55); // u
						set_bkg_tile_xy(13, 32, 0x53); // s
						set_bkg_tile_xy(14, 32, 0x1A); // :
                        break;
                    //Chance
                    case 21:
						set_bkg_tiles(11, 30, len, 1, buf);
						set_bkg_tile_xy(11, 30, 0x23); // C
						set_bkg_tile_xy(12, 30, 0x48); // h
						set_bkg_tile_xy(13, 30, 0x41); // a
						set_bkg_tile_xy(14, 30, 0x4E); // n
						set_bkg_tile_xy(15, 30, 0x43); // c
						set_bkg_tile_xy(16, 30, 0x45); // e
                        break;
                }
			}
		}
	}
	//add lowerScore INTO lowerScoreBCD
	bcd_add(&lowerScoreBCD, &lowerScoreBuf);
}


void setScoreTotal(){
	//resets total score to zero
	bcd_sub(&totalScoreAdd, &totalScoreAdd);
	//adds upper score to total score
	bcd_add(&totalScoreAdd, &upperScoreBCD);
	//adds lower score to total score
	bcd_add(&totalScoreAdd, &lowerScoreBCD);
	if(&totalScoreBCD == &totalScoreAdd) return;
	else if(&totalScoreBCD > &totalScoreAdd){
		//printf("Scoring Error");
        return;
	}
	else{
		bcd_sub(&totalScoreBCD, &totalScoreBCD);
		bcd_add(&totalScoreBCD, &totalScoreAdd);
		len = bcd2text(&totalScoreBCD, 0x10, buf);
	}
}


void scoreDisplay(){
	//card view score
	if(viewCard){


        if(bonusTally > 1){
            set_bkg_tile_xy(17, 32, 0x10); // 0
            set_bkg_tile_xy(18, 32, 0x10); // 0
        }

		//returns length in characters (always 8)
		//0x10 is where 0 is in the tile viewer
		//sets Total Upper score display
		len = bcd2text(&upperScoreBCD, 0x10, buf);
		set_bkg_tiles(11, 26, len, 1, buf);
		set_bkg_tile_xy(11, 26, 0x52); // r
		set_bkg_tile_xy(12, 26, 0x1A); // :
		set_bkg_tile_xy(13, 26, 0x00); // blank
		set_bkg_tile_xy(14, 26, 0x00); // blank
		set_bkg_tile_xy(15, 26, 0x00); // blank

		//returns length in characters (always 8)
		//sets Total Lower score display
		len = bcd2text(&lowerScoreBCD, 0x10, buf);
		set_bkg_tiles(11, 33, len, 1, buf);
		set_bkg_tile_xy(11, 33, 0x52); // r
		set_bkg_tile_xy(12, 33, 0x1A); // :
		set_bkg_tile_xy(13, 33, 0x00); // blank

		//sets Grand Total score display
		setScoreTotal();
		set_bkg_tiles(11, 34, len, 1, buf);
		set_bkg_tile_xy(11, 34, 0x4C); // l
		set_bkg_tile_xy(12, 34, 0x1A); // :
		set_bkg_tile_xy(13, 34, 0x00); // blank

        if(bonusTally <= 11){
            switch(bonusTally){
                case 2:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x11);
                    break;
                case 3:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x12);
                    break;
                case 4:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x13);
                    break;
                case 5:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x14);
                    break;
                case 6:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x15);
                    break;
                case 7:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x16);
                    break;
                case 8:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x17);
                    break;
                case 9:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x18);
                    break;
                case 10:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x19);
                    break;
                case 11:
                    set_bkg_tile_xy(15, 32, 0x10);
                    set_bkg_tile_xy(16, 32, 0x1A);
                    break;
            }
        }
//         betterDelay(60);
	}
	//play view score
	else if(viewPlay){
		setScoreTotal();
		set_bkg_tiles(11, 2, len, 1, buf);
		set_bkg_tile_xy(11, 2, 0x00); // blank
		set_bkg_tile_xy(12, 2, 0x00); // blank
		set_bkg_tile_xy(13, 2, 0x00); // blank
	}
	//wait_vbl_done();
}
