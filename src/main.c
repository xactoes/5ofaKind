#include <gb/gb.h>

#include "../func/screens.h"

#include "../func/save_tools.h"

#include "../func/glob_vars.h"

#include "../func/dice_tools.h"



//functions

#include "../func/cardCursor.h"
#include "../func/cardView.h"
#include "../func/endScreen.h"
#include "../func/fade.h"
#include "../func/saveScore.h"
#include "../func/scoreDisplay.h"
#include "../func/spriteFlip.h"
#include "../func/titleScreen.h"
#include "../func/turnRollDisplay.h"

//structs
#include "../func/diceStruct.h"

//sprites
#include "../res/Sprites.h"

//backgrounds
#include "../res/backgroundData.h"
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


void main(){
    DISPLAY_ON;

    //checks for name save data and loads it in
    checkName();


    viewTitle = 1;

    while(1){
        //title screen
        if(viewTitle){
            titleScreen();
        }

        //game being played
        if(viewGame){
            //game();
        }

        //high score menu
        if(viewScores){
            //highScores();
        }

        //transfer data screen
        if(viewLink){
            //linkTransfer();
        }

        //options screen
        if(viewOptions){
            //options();
        }
    }









    /*


    titleScreen();

    fadeToBlack(4);

    initGame();

    fadeFromBlack(4);


    SHOW_SPRITES;

	while(endGame == 0){
        while(gameOn == 1){
            if(viewMode == 0 && gameOn == 1){
                playCursor();
            }
            else if(viewMode == 1 && gameOn == 1){
                cardCursor();
            }
            else if(gameOn == 0){
                break;
            }
        }
    }
    while(endGame == 1){
        endScreen();
		saveScore();
	}
	*/
}
