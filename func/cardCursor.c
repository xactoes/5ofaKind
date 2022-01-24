#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/global_variables.h"

//functions
#include "../func/playView.h"
#include "../func/logicScorecard.h"

//backgrounds
#include "../res/maps.h"

void cardCursorUp(){
	if(cursorIndex > 8 && cursorIndex <= 15 || cursorIndex > 16 && cursorIndex <= 21){
		if(cursorIndex == 11 || cursorIndex == 19){
			cursorPosition[1] -= 32;
			upperRegion = 1;
		}
		else{
			cursorPosition[1] -= 8;
		}
		cursorIndex -= 1;
	}
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
}


void cardCursorDown(){
	if(cursorIndex >= 8 && cursorIndex < 15 || cursorIndex >= 16 && cursorIndex <= 21){
		if(cursorIndex == 10 || cursorIndex == 18){
			cursorPosition[1] += 32;
			cursorIndex += 1;
			upperRegion = 0;
		}
		else if(cursorIndex == 21){
			cursorPosition[0] = 16;
			cursorPosition[1] += 8;
			cursorIndex = 14;
		}
		else{
			cursorPosition[1] += 8;
			cursorIndex += 1;
		}
	}
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
}


void cardCursorLeft(){
	if(cursorIndex >= 16 && cursorIndex <= 21){
		cursorPosition[0] -= 72;
		cursorIndex -= 8;
	}
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
}


void cardCursorRight(){
	if(cursorIndex >= 8 && cursorIndex <= 13){
		cursorPosition[0] += 72;
		cursorIndex += 8;
	}
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
}

void cardCursorA(){
	logicScorecard();
}

void cardCursorB(){
	playView(backgroundMap);
	//turnTracker();
}


void cardCursorSelect(){
	quickSwitch = 1;
	playView(backgroundMap);
}


void cardCursor(){
	switch(joypad()){
		case J_LEFT:
			cardCursorLeft();
			waitpadup();
			break;
		case J_RIGHT:
			cardCursorRight();
			waitpadup();
			break;
		case J_UP:
			cardCursorUp();
			waitpadup();
			break;
		case J_DOWN:
			cardCursorDown();
			waitpadup();
			break;
		case J_A:
			cardCursorA();
			waitpadup();
			break;
		case J_B:
			cardCursorB();
			waitpadup();
			break;
		case J_START:
			break;
		case J_SELECT:
			cardCursorSelect();
			waitpadup();
			break;
	}
}
