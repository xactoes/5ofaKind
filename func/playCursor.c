#include <gb/gb.h>

#include "../func/cardView.h"
#include "../func/diceStruct.h"
#include "../func/dice_tools.h"
#include "../func/glob_vars.h"
#include "../func/rollLogic.h"
#include "../func/turnRollDisplay.h"

#include "../res/maps.h"

void playCursorLeft(){
	if(cursorIndex == 1 || cursorIndex == 2){
		cursorPosition[0] -= 48;
		cursorIndex -= 1;
	}
	if(cursorIndex > 3 && cursorIndex <= 7){//null for now
		cursorPosition[0] -= 24;
		cursorIndex -= 1;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}


void playCursorRight(){
	if(cursorIndex == 0 || cursorIndex == 1){
		cursorPosition[0] += 48;
		cursorIndex += 1;
	}
	if(cursorIndex >= 3 && cursorIndex < 7){
		cursorPosition[0] += 24;
		cursorIndex += 1;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}


void playCursorA(){
    if(gameOn == 0){
        return;
    }
	if(cursorIndex == 0){
		rollTracker();
		rollCheck();
		turnRollDisplay();
	}
	else if(cursorIndex == 1){
		if(rollsLeft == cheatRolls || scorecardChangeA != scorecardChangeB) return;
		else if(rollsLeft < cheatRolls && scorecardChangeA == scorecardChangeB){
			cursorPosition[0] = 40;
			cursorPosition[1] = 128;
			cursorIndex = 3;
		}
	}
	else if(cursorIndex == 2){
		if(rollsLeft == cheatRolls || scorecardChangeA != scorecardChangeB) return;
		else if(rollsLeft < cheatRolls && scorecardChangeA == scorecardChangeB){
			viewMode = 1;
			cardView(backgroundMap);
		}
	}
	else if(cursorIndex >= 3 && cursorIndex <= 7){
		toggleDi();
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}

void playCursorB(){
	if(cursorIndex >= 3 && cursorIndex <= 7){
		cursorPosition[0] = 16;
		cursorPosition[1] = 144;
		cursorIndex = 0;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}

void playCursorSelect(){
	quickSwitch = 1;
    if(rollsLeft == cheatRolls || scorecardChangeA != scorecardChangeB) return;
	else if(rollsLeft < cheatRolls && scorecardChangeA == scorecardChangeB){
		viewMode = 1;
		cardView(backgroundMap);
	}
}



void playCursor(){
	switch(joypad()){
		case J_LEFT:
			playCursorLeft();
			waitpadup();
			break;
		case J_RIGHT:
			playCursorRight();
			waitpadup();
			break;
		case J_A:
			playCursorA();
			waitpadup();
			break;
		case J_B:
			playCursorB();
			waitpadup();
			break;
		case J_START:
			//playCursorStart();
			waitpadup();
			break;
		case J_SELECT:
			playCursorSelect();
			waitpadup();
			break;
	}
}
