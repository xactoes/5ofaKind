#include <gb/gb.h>

#include "../func/glob_vars.h"
#include "../func/dice_tools.h"
#include "../func/logicGame.h"

#include "../res/maps.h"


void cursorPlayLeft(){
	if(indexCursor == 1 || indexCursor == 2){
		cursorPosition[0] -= 48;
		indexCursor -= 1;
	}
	if(indexCursor > 3 && indexCursor <= 7){//null for now
		cursorPosition[0] -= 24;
		indexCursor -= 1;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}


void cursorPlayRight(){
	if(indexCursor == 0 || indexCursor == 1){
		cursorPosition[0] += 48;
		indexCursor += 1;
	}
	if(indexCursor >= 3 && indexCursor < 7){
		cursorPosition[0] += 24;
		indexCursor += 1;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}


void cursorPlayA(){
	if(indexCursor == 0){
        rollRequest = 1;
        //if rolls are enabled
        if(rollsEnabled()){
            //then roll dice, duh
            rollDice();
            turnRollDisplay();
        }
        //if rolls are not enabled
        else{
            //switch to card when rolls are disabled
            card(backgroundMap);
        }
	}
	else if(indexCursor == 1){
        //if max rolls remain, or the scorecard has been changed, don't allow holding
		if(rollsCheck() == initRolls || rollsCheck() == 255) return;
        //otherwise if less than 3 rolls are left (incl. 0) and scorecard hasn't been changed, allow holding
		else if(rollsCheck() < initRolls){
			cursorPosition[0] = 40;
			cursorPosition[1] = 128;
			indexCursor = 3;
		}
	}
	else if(indexCursor == 2){
		if(rollsCheck() == initRolls || rollsCheck() == 255) return;
		else if(rollsCheck() < initRolls){
			viewPlay = 0;
            viewCard = 1;
            viewSwitch = 1;
		}
	}
	else if(indexCursor >= 3 && indexCursor <= 7){
		diToggle();
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}

void cursorPlayB(){
    //if on hold options 1-5, back out to roll
	if(indexCursor >= 3 && indexCursor <= 7){
		cursorPosition[0] = 16;
		cursorPosition[1] = 144;
		indexCursor = 0;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}

void cursorPlaySelect(){
	quickSwitch = 1;
    if(rollsCheck() == initRolls ||rollsCheck() == 255) return;
	else if(rollsCheck() < initRolls){
		viewPlay = 0;
        viewCard = 1;
        viewSwitch = 1;
	}
}



void cursorPlay(){
	switch(joypad()){
		case J_LEFT:
			cursorPlayLeft();
			waitpadup();
			break;
		case J_RIGHT:
			cursorPlayRight();
			waitpadup();
			break;
		case J_A:
			cursorPlayA();
			waitpadup();
			break;
		case J_B:
			cursorPlayB();
			waitpadup();
			break;
		case J_START:
			//cursorPlayStart();
			waitpadup();
			break;
		case J_SELECT:
			cursorPlaySelect();
			waitpadup();
			break;
	}
}
