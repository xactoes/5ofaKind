void rollTracker(){
	turnsPassed = 0;
	if(rollsLeft == 0){
		//tally that counts how many scores have been set to compare with turns later
		for(i = 0; i != 13; i++){
			if(scorecard[i] != 255){
				turnsPassed++;
			}
			turnsPassed = turnsPassed - trueTurnOffset;
		}
		//compared with turns here
		if(turnsPassed < turn - trueTurnOffset){
			rollsEnabled = 0;
		}
		//and here

		else if(turnsPassed == (turn - trueTurnOffset) ){
            //if 13 turns have passed
            if(turnsPassed == 13){
                if(scorecard[6] == 0){
                    //printf("t - tT0: %u", (turn - trueTurnOffset));
                }
                else if(scorecard[6] == 50){
                    newTurn();
                    //printf("new turn");
                }
            }
        }
		else if(turnsPassed == turn - trueTurnOffset){
            //if next turn is 14 (not counting turns spent on bonus 5K)
			if(turn - trueTurnOffset + 1 == 14){
                //if 5K is 0 at start of turn 14
				if(scorecard[6] == 0){
                    gameOn = 0;
					endGame = 1;
				}
				//if it isn't 0 then
				else if(scorecard[6] == 50){
                    //this will be changed later but for now it is there to test stuff
                    gameOn = 0;
					endGame = 1;
				}
			}
			//if the score buffer is 100, then a 5k bonus was last chosen
			//allow to keep playing
			else if( (turn - trueTurnOffset + 1) >= 13 && scoreBuf == 100){
				newTurn();
			}
			else{
				newTurn();
			}
		}
	}
	else if(rollsLeft > 0){
		rollsEnabled = 1;
	}
	turnsPassed = 0;
}
