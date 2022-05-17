#include <gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//functions
#include "../func/logicGame.h"
#include "../func/logicScore.h"

//backgrounds
#include "../res/maps.h"

void cursorCardUp(){
	if(indexCursor > 8 && indexCursor <= 15 || indexCursor > 16 && indexCursor <= 21){
		if(indexCursor == 11 || indexCursor == 19){
			cursorPosition[1] -= 32;
			upperRegion = 1;
		}
		else{
			cursorPosition[1] -= 8;
		}
		indexCursor -= 1;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}


void cursorCardDown(){
	if(indexCursor >= 8 && indexCursor < 15 || indexCursor >= 16 && indexCursor <= 21){
		if(indexCursor == 10 || indexCursor == 18){
			cursorPosition[1] += 32;
			indexCursor += 1;
			upperRegion = 0;
		}
		else if(indexCursor == 21){
			cursorPosition[0] = 16;
			cursorPosition[1] += 8;
			indexCursor = 14;
		}
		else{
			cursorPosition[1] += 8;
			indexCursor += 1;
		}
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}


void cursorCardLeft(){
	if(indexCursor >= 16 && indexCursor <= 21){
		cursorPosition[0] -= 72;
		indexCursor -= 8;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}


void cursorCardRight(){
	if(indexCursor >= 8 && indexCursor <= 13){
		cursorPosition[0] += 72;
		indexCursor += 8;
	}
	move_sprite(cursorLeft, cursorPosition[0], cursorPosition[1]);
}

void cursorCardA(){
	logicScorecard();
}

void cursorCardB(){
    viewCard = 0;
	viewPlay = 1;
    viewSwitch = 1;
}


void cursorCardSelect(){
	quickSwitch = 1;
    viewCard = 0;
    viewPlay = 1;
    viewSwitch = 1;
}


void cursorCard(){
	switch(joypad()){
		case J_LEFT:
			cursorCardLeft();
			waitpadup();
			break;
		case J_RIGHT:
			cursorCardRight();
			waitpadup();
			break;
		case J_UP:
			cursorCardUp();
			waitpadup();
			break;
		case J_DOWN:
			cursorCardDown();
			waitpadup();
			break;
		case J_A:
			cursorCardA();
			waitpadup();
			break;
		case J_B:
			cursorCardB();
			waitpadup();
			break;
		case J_START:
			break;
		case J_SELECT:
			cursorCardSelect();
			waitpadup();
			break;
	}
}
