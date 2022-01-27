#include "../func/cardView.h"
#include "../func/dice_tools.h"
#include "../func/glob_vars.h"
#include "../func/newTurn.h"

#include "../res/maps.h"

void rollCheck(){
    if(gameOn == 0 || endGame == 1){
        return;
    }
	if(rollsEnabled == 0){
		if( (scorecardChangeA != scorecardChangeB || scoreBuf == 100) && gameOn == 1){
			newTurn();
		}
		else{
			//replace with buzzing noise later
			cardView(backgroundMap);
		}
	}
	else if(rollsEnabled == 1){
		diceToRoll();
	}
}
