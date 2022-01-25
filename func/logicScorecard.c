#include </opt/gbdk/include/gb/gb.h>
//#include <stdio.h>

//global variables
#include "../func/global_variables.h"

//functions
#include "../func/betterDelay.h"
#include "../func/playView.h"
#include "../func/scoreDisplay.h"
#include "../func/sortDice.h"
#include "../func/turnRollDisplay.h"

//backgrounds
#include "../res/maps.h"


void logicUpper(){
	unsigned int valueToCheck = 0;
	scoreBuf = 0;
	switch(cursorIndex){
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
			//scoreBuf += 63;
		}
	}
	scorecard[cursorIndex - 8] = scoreBuf;
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
		if(diceValues[0] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightContinue == 3){
		if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
			return 1;
		}
		else return 0;
	}
	else if(smStraightContinue == 4){
		if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
			return 1;
		}
		else return 0;
	}
	else return 0;
}


void logicLower(){
	scoreBuf = 0;
	sortDice();
	switch(cursorIndex){
		//3 of a Kind
		case 11:
			if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			else if(diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			else{
				scoreBuf = 0;
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			break;
		//4 of a Kind
		case 12:
			if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
				for(i = 0; i != 5; i++){
					scoreBuf += diceValues[i];
				}
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			else{
				scoreBuf = 0;
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			break;
		//full house;
		case 13:
			if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
				if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
					scoreBuf = 25;
					//printf("%u", scoreBuf);
					scorecard[cursorIndex - 8] = scoreBuf;
					//printf("SCL: %u\n", scorecard[12]);
					set_bkg_tile_xy(8, 30, 0x12); // 2
					set_bkg_tile_xy(9, 30, 0x15); // 5
				}
			}
			else if(diceValues[0] == diceValues[1]){
				if(diceValues[1] != diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
					scoreBuf = 25;
					//printf("%u", scoreBuf);
					scorecard[cursorIndex - 8] = scoreBuf;
					//printf("SCL: %u\n", scorecard[12]);
					set_bkg_tile_xy(8, 30, 0x12); // 2
					set_bkg_tile_xy(9, 30, 0x15); // 5
				}
			}
			else{
				scoreBuf = 0;
				scorecard[cursorIndex - 8] = scoreBuf;
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
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			break;
			//lgStraight
		case 20:
			if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
				scoreBuf = 40;
				//printf("%u", scoreBuf);
				scorecard[cursorIndex - 8] = scoreBuf;
				//printf("SCL: %u\n", scorecard[12]);
				set_bkg_tile_xy(17, 29, 0x14); // 4
				set_bkg_tile_xy(18, 29, 0x10); // 0
			}
			else{
				scoreBuf = 0;
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			break;
		//chance
		case 21:
			for(i = 0; i < 5; i++){
				scoreBuf += diceValues[i];
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			break;
		//5-of-a-Kind
		case 14:
			match5 = 0;
			for(i = 0; i < 4; i++){
				if(diceValues[i] == diceValues[i + 1]){
					match5++;
					//printf("%u ", match5);
				}
			}
			if(match5 == 4){
				//printf("\n New Line\n");
				scoreBuf = 50;
				scorecard[cursorIndex - 8] = scoreBuf;
				//printf("%u\n", scorecard[6]);
				set_bkg_tile_xy(17, 31, 0x15); // 5
				set_bkg_tile_xy(18, 31, 0x10); // 0
			}
			else if(turn == 13){
				scoreBuf = 0;
				scorecard[cursorIndex - 8] = scoreBuf;
			}
			break;
		case 15:
			match5 = 0;
			for(i = 0; i < 4; i++){
				if(diceValues[i] == diceValues[i + 1]){
					match5++;
					//printf("%u ", match5);
				}
			}
			if(match5 == 4 && scorecard[6] != 255 && scorecard[6] != 0){
				if(scorecard[14] < 1000){
					//printf("\n New Line\n");
					scoreBuf = 100;
					if(scorecard[14] == 255){
						scorecard[14] = scoreBuf;
					}
					else{
						scorecard[14] += scoreBuf;
					}
					//printf("%u\n", scorecard[7]);
				}
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
				scorecard[7] = 35;
				set_bkg_tile_xy(17, 25, 0x13); // 3
				set_bkg_tile_xy(18, 25, 0x15); // 5
			}
		}
	}
}


void logicScorecard(){
	//checks if card has been selected this turn or if the turn is over
	if(scorecardChangeA == scorecardChangeB){
		scorecardChangeA = 0;
		scorecardChangeB = 0;
		if(scorecard[cursorIndex - 8] == 255){
			for(i = 0; i != 14; i++){
				if(scorecard[i] != 255){
					scorecardChangeA++;
				}
			}
			if(upperRegion == 1){
				logicUpper();
			}
			else{
				logicLower();
			}
			for(i = 0; i != 14; i++){
				if(scorecard[i] != 255){
					scorecardChangeB++;
				}
			}
		}
		bonusCheck();
		setScoreUpper();
		setScoreLower();
		scoreDisplay();
		if(scorecardChangeA != scorecardChangeB){
			rollsLeft = 0;
			rollsEnabled = 0;
            playView(backgroundMap);
			//turnRollDisplay();
		}
	}
}
