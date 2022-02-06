#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//functions
#include "../func/betterDelay.h"
#include "../func/logicGame.h"
#include "../func/logicScore.h"
#include "../func/dice_tools.h"

//backgrounds
#include "../res/maps.h"


void logicUpper(){
	unsigned int valueToCheck = 0;
	scoreBuf = 0;
	switch(indexCursor){
		case 8:
			valueToCheck = 1;
			break;
		case 9:
			valueToCheck = 2;
			break;
		case 10:
			valueToCheck = 3;
			break;
		case 16:
			valueToCheck = 4;
			break;
		case 17:
			valueToCheck = 5;
			break;
		case 18:
			valueToCheck = 6;
			break;
	}
	for(i = 0; i != 5; i++){
		if(diceValues[i] == valueToCheck){
			scoreBuf += diceValues[i];
			//scoreBuf = 63;
		}
	}
	scorecard[indexCursor - 8] = scoreBuf;
}


void smStraightLogicA(){
	if(diceValues[0] == diceValues[1]){
		if(diceValues[1] == diceValues[2]){
			smStraightContinue = 0;
		}
		else if(diceValues[2] == diceValues[3]){
			smStraightContinue = 0;
		}
		else if(diceValues[3] == diceValues[4]){
			smStraightContinue = 0;
		}
		else{
			smStraightContinue = 1;
		}
	}
	else if(diceValues[1] == diceValues[2]){
		if(diceValues[2] == diceValues[3]){
			smStraightContinue = 0;
		}
		else if(diceValues[3] == diceValues[4]){
			smStraightContinue = 0;
		}
		else{
			smStraightContinue = 2;
		}
	}
	else if(diceValues[2] == diceValues[3]){
		if(diceValues[3] == diceValues[4]){
			smStraightContinue = 0;
		}
		else{
			smStraightContinue = 3;
		}
	}
	else{
		smStraightContinue = 4;
	}
}


unsigned int smStraightLogicB(){
	smStraightLogicA();
	if(smStraightContinue == 1){
		if(diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightContinue == 2){
		if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightContinue == 3){
		if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightContinue == 4){
		if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
			return 1;
		}
		else if(diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
            return 1;
        }
		else return 0;
	}
	else return 0;
}


void logicLower(){
	scoreBuf = 0;
	sortDice();
	switch(indexCursor){
		//3 of a Kind
		case 11:
			if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[3] = scoreBuf;
			}
			else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[3] = scoreBuf;
			}
			else if(diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[3] = scoreBuf;
			}
			else{
				scoreBuf = 0;
				scorecard[3] = scoreBuf;
			}
			break;
		//4 of a Kind
		case 12:
			if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[4] = scoreBuf;
			}
			else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[4] = scoreBuf;
			}
			else{
				scoreBuf = 0;
				scorecard[4] = scoreBuf;
			}
			break;
		//full house;
		case 13:
			if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
				if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
					scoreBuf = 25;
					//printf("%u", scoreBuf);
					scorecard[5] = scoreBuf;
					//printf("SCL: %u\n", scorecard[12]);
					set_bkg_tile_xy(8, 30, 0x12); // 2
					set_bkg_tile_xy(9, 30, 0x15); // 5
				}
				else{
				scoreBuf = 0;
				scorecard[5] = scoreBuf;
			}
			}
			else if(diceValues[0] == diceValues[1]){
				if(diceValues[1] != diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
					scoreBuf = 25;
					//printf("%u", scoreBuf);
					scorecard[5] = scoreBuf;
					//printf("SCL: %u\n", scorecard[12]);
					set_bkg_tile_xy(8, 30, 0x12); // 2
					set_bkg_tile_xy(9, 30, 0x15); // 5
				}
				else{
				scoreBuf = 0;
				scorecard[5] = scoreBuf;
			}
			}
			else{
				scoreBuf = 0;
				scorecard[5] = scoreBuf;
			}
			break;
		//smStraight
		case 19:
			if(smStraightLogicB()){
				scoreBuf = 30;
				//printf("%u", scoreBuf);
				scorecard[11] = scoreBuf;
				//printf("SCL: %u\n", scorecard[12]);
				set_bkg_tile_xy(17, 28, 0x13); // 3
				set_bkg_tile_xy(18, 28, 0x10); // 0
				//betterDelay(300);
				//printf("%u", smStraightContinue);
			}
			else{
				scoreBuf = 0;
				scorecard[11] = scoreBuf;
			}
			break;
			//lgStraight
		case 20:
			if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
				scoreBuf = 40;
				//printf("%u", scoreBuf);
				scorecard[12] = scoreBuf;
				//printf("SCL: %u\n", scorecard[12]);
				set_bkg_tile_xy(17, 29, 0x14); // 4
				set_bkg_tile_xy(18, 29, 0x10); // 0
			}
			else{
				scoreBuf = 0;
				scorecard[12] = scoreBuf;
			}
			break;
		//chance
		case 21:
			for(i = 0; i < 5; i++){
				scoreBuf += diceValues[i];
				scorecard[13] = scoreBuf;
			}
			break;
		//5-of-a-Kind
		case 14:
			match5 = 0;
			for(i = 0; i < 4; i++){
				if(diceValues[i] == diceValues[i + 1]){
					match5++;
				}
			}
			if(turn <= 13 && match5 == 4){
				scoreBuf = 50;
				scorecard[6] = scoreBuf;
                bonusTally += 1;
				set_bkg_tile_xy(17, 31, 0x15); // 5
				set_bkg_tile_xy(18, 31, 0x10); // 0
			}
			else if(turn <= 13 && match5 != 4){
				scoreBuf = 0;
				scorecard[6] = scoreBuf;
            }
			break;
        //bonus 5ofakind
		case 15:
			match5 = 0;
			for(i = 0; i < 4; i++){
				if(diceValues[i] == diceValues[i + 1]){
					match5++;
				}
			}
			if(match5 == 4 && scorecard[6] == 50 && scorecard[7] != 0){
				if(scorecard[7] < 1000){
					scoreBuf = 100;
                    bonusTally += 1;
					if(scorecard[7] == 255){
						scorecard[7] = scoreBuf;
					}
					else{
						scorecard[7] += scoreBuf;
					}
				}
			}
			else if(match5 == 4 && scorecard[6] == 50 && scorecard[7] == 0){
                //play error sound
                return;
            }
			else if(match5 != 4 && scorecard[6] == 50 && scorecard[7] == 255 && turn > 13){
                scorecard[7] = 0;
//                 rollsLeft = 0;
                //switch back to play view
                viewPlay = 1;
                turnRequest = 0;
                viewCard = 0;
                viewSwitch = 1;
                viewGame = 0;
                viewEnd = 1;
                return;
            }
            else if(match5 == 4 && scorecard[6] != 50){
                //play error sound
                return;
            }
			break;
	}
}


void bonusCheck(){
	//parses entire scorecard
	unsigned int bonusCompare = 0;
	for(i = 0; i != 15; i++){
		if(i <= 2 || i >= 8 && i <= 10){
			if(scorecard[i] != 255){
				bonusCompare += scorecard[i];
			}
			if(bonusCompare >= 63){
				scorecard[14] = 35;
				set_bkg_tile_xy(17, 25, 0x13); // 3
				set_bkg_tile_xy(18, 25, 0x15); // 5
			}
		}
	}
}


void logicScorecard(){
	//if scorecard hasn't changed this turn
	if(scorecardChangeA == scorecardChangeB){
        //set the change tracking variables to 0 (still equal but now a known value)
		scorecardChangeA = 0;
		scorecardChangeB = 0;
        //if a value is null, OR (5KIND has been prev. chosen AND now Bonus is being chosen)
		if(scorecard[indexCursor - 8] == 255 || (scorecard[7] != 0 && indexCursor == 15)){
            //for 1, 2, 3, 3k, 4, fh, and 5k
			for(i = 0; i != 7; i++){
                //if they aren't null, a score has been set, record that in A
				if(scorecard[i] != 255){
					scorecardChangeA++;
				}
			}
			//for 4, 5, 6, sm, lg, and chance
			for(i = 8; i != 14; i++){
                //if they aren't null, a score has been set, record that in A
				if(scorecard[i] != 255){
					scorecardChangeA++;
				}
			}


			//BEGIN SCORE LOGIC
			if(upperRegion == 1){
				logicUpper();
			}
			else{
				logicLower();
			}
			//END SCORE LOGIC


			//for 1, 2, 3, 3k, 4, fh, and 5k
			for(i = 0; i != 7; i++){
                //if they aren't null, a score has been set, record that in B
				if(scorecard[i] != 255){
					scorecardChangeB++;
				}
			}
			//for 4, 5, 6, sm, lg, and chance
			for(i = 8; i != 14; i++){
                //if they aren't null, a score has been set, record that in A
				if(scorecard[i] != 255){
					scorecardChangeB++;
				}
			}
		}

		//check if upper card has a bonus score
		bonusCheck();

        //set scores on screen
		setScoreUpper();
		setScoreLower();
		scoreDisplay();

        scoreCheckRequest = 1;
        //if scorecard was selected in some way
		if(rollsCheck() == 255){
            //prevent more rolling this turn
			rollsLeft = 0;
            //switch back to play view
            viewPlay = 1;
            turnRequest = 1;
            viewCard = 0;
            viewSwitch = 1;
		}
	}
}
