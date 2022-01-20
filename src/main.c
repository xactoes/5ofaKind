#include </opt/gbdk/include/gb/gb.h>
//#include </opt/gbdk/include/gbdk/bcd.h>
#include <stdio.h>

//global variables
#include "../func/global_variables.h"

//functions
#include "../func/betterDelay.h"
#include "../func/cardCursor.h"
#include "../func/cardView.h"
//#include "../func/playView.h"
#include "../func/rollDi.h"
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
#include "../res/backgroundMap.h"


void setDiceValues(){
	diceValues[0] = Di1.face;
	diceValues[1] = Di2.face;
	diceValues[2] = Di3.face;
	diceValues[3] = Di4.face;
	diceValues[4] = Di5.face;
}


void setDiFace(struct DiceStruct * diSprite){
	rollDi();
	for(i = 0; i != 4; i++){
		set_sprite_tile(diSprite->spriteID[i], currentFace[i]);
	}
	diSprite->face = diFaceBuf;
	setDiceValues();
}


void diceToRoll(){
	if(rollsLeft > 0){
		rollsLeft -= 1;
		for(j = 0; j != 5; j++){
			betterDelay(6);
			if(j == 0){
				if(Di1.inPlay == 1){
					setDiFace(&Di1);
					//printf("1");
				}
			}
			else if(j == 1){
				if(Di2.inPlay == 1){
					setDiFace(&Di2);
					//printf("2");
				}
			}
			else if(j == 2){
				if(Di3.inPlay == 1){
					setDiFace(&Di3);
					//printf("3");
				}
			}
			else if(j == 3){
				if(Di4.inPlay == 1){
					setDiFace(&Di4);
					//printf("4");
				}
			}
			else if(j == 4){
				if(Di5.inPlay == 1){
					setDiFace(&Di5);
					//printf("5");
				}
			}
		}
	}
}


void moveDiceStruct(struct DiceStruct * diSprite, unsigned int x, unsigned int y){
	move_sprite(diSprite->spriteID[0], x, y);
	move_sprite(diSprite->spriteID[1], x + 8, y);
	move_sprite(diSprite->spriteID[2], x, y + 8);
	move_sprite(diSprite->spriteID[3], x + 8, y + 8);
}


//function that allows for more automated setup of dice metasprites
void initDi(struct DiceStruct * diSprite, unsigned int spot){
	for(i = 0; i != 4; i++){
        unsigned int spriteNumber;

        //assigns Di position on screen (1-5)
        diSprite->position = spot;

        //preps sprite number to evaluate location in memory
		spriteNumber = (4 * (spot - 1) ) + i;

        //assigns di to be made up of 4 sprites at addresses evaluated above
        diSprite->spriteID[i] = spriteNumber;

        //initializes di to be in proper x, y pixel coordinates on screen
		diSprite->x = diStartPosition[0] + ( (diSprite->position - 1) * diSpacing);
		diSprite->y = diStartPosition[1];
	}
	//puts di in play
	diSprite->inPlay = 1;

	//moves di to screen
    moveDiceStruct(diSprite, diSprite->x, diSprite->y);

    //calls function to setup face of di
    setDiFace(diSprite);
}


void initGame(){
    set_sprite_data(0, 6, Sprites);
	set_sprite_tile(cursor, 5);
	set_bkg_data(0, 128, backgroundData);
    set_bkg_tiles(0, 0, 20, 32, backgroundMap);
    viewMode = 0;

    SHOW_BKG;

    initDi(&Di1, 1);
    initDi(&Di2, 2);
    initDi(&Di3, 3);
    initDi(&Di4, 4);
    initDi(&Di5, 5);
    spriteFlip();


	cursorIndex = 0;
	cursorPosition[0] = 16;
	cursorPosition[1] = 144;
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);

	scoreDisplay();

	rollsLeft = 3;
	turn = 1;

    turnRollDisplay();


    SHOW_SPRITES;
}


void newTurn(){
    turn++;
    rollsLeft = 3;
	turnRollDisplay();
    rollsEnabled = 1;
    scorecardChangeA = 0;
    scorecardChangeB = 0;
    if(Di1.inPlay == 0){
        Di1.inPlay = 1;
        moveDiceStruct(&Di1, Di1.x, rollPosY);
    }
    if(Di2.inPlay == 0){
        Di2.inPlay = 1;
        moveDiceStruct(&Di2, Di2.x, rollPosY);
    }
    if(Di3.inPlay == 0){
        Di3.inPlay = 1;
        moveDiceStruct(&Di3, Di3.x, rollPosY);
    }
    if(Di4.inPlay == 0){
        Di4.inPlay = 1;
        moveDiceStruct(&Di4, Di4.x, rollPosY);
    }
    if(Di5.inPlay == 0){
        Di5.inPlay = 1;
        moveDiceStruct(&Di5, Di5.x, rollPosY);
    }
}


void rollTracker(){
	turnsPassed = 0;
	if(rollsLeft == 0){
		//tally that counts how many scores have been set to compare with turns later
		for(i = 0; i != 13; i++){
			if(scorecard[i] != 255){
				turnsPassed++;
			}
		}
		//compared with turns here
		if(turnsPassed < turn){
			rollsEnabled = 0;
		}
		//and here
		else if(turnsPassed == turn){
			if(turn == 13){
				if(scorecard[6] == 0){
					endGame = 1;
				}
				else if(scorecard[6] == 50){
					endGame = 1;
				}
			}
			else if(turn >= 13){
				endGame = 1;
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

void playCursorLeft(){
	if(cursorIndex == 1 || cursorIndex == 2){
		cursorPosition[0] -= 48;
		cursorIndex -= 1;
	}
	if(cursorIndex > 3 && cursorIndex <= 7){//null for now
		cursorPosition[0] -= 24;
		cursorIndex -= 1;
	}
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
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
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
}


void toggleDi(){
	switch(cursorIndex){
		case 3:
			if(Di1.inPlay == 1){
				Di1.inPlay = 0;
				moveDiceStruct(&Di1, Di1.x, heldPosY);
			}
			else if(Di1.inPlay == 0){
				Di1.inPlay = 1;
				moveDiceStruct(&Di1, Di1.x, rollPosY);
			}
			break;
		case 4:
			if(Di2.inPlay == 1){
				Di2.inPlay = 0;
				moveDiceStruct(&Di2, Di2.x, heldPosY);
			}
			else if(Di2.inPlay == 0){
				Di2.inPlay = 1;
				moveDiceStruct(&Di2, Di2.x, rollPosY);
			}
			break;
		case 5:
			if(Di3.inPlay == 1){
				Di3.inPlay = 0;
				moveDiceStruct(&Di3, Di3.x, heldPosY);
			}
			else if(Di3.inPlay == 0){
				Di3.inPlay = 1;
				moveDiceStruct(&Di3, Di3.x, rollPosY);
			}
			break;
		case 6:
			if(Di4.inPlay == 1){
				Di4.inPlay = 0;
				moveDiceStruct(&Di4, Di4.x, heldPosY);
			}
			else if(Di4.inPlay == 0){
				Di4.inPlay = 1;
				moveDiceStruct(&Di4, Di4.x, rollPosY);
			}
			break;
		case 7:
			if(Di5.inPlay == 1){
				Di5.inPlay = 0;
				moveDiceStruct(&Di5, Di5.x, heldPosY);
			}
			else if(Di5.inPlay == 0){
				Di5.inPlay = 1;
				moveDiceStruct(&Di5, Di5.x, rollPosY);
			}
			break;
	}
}


void rollCheck(){
	if(rollsEnabled == 0){
		if(scorecardChangeA != scorecardChangeB){
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
	//waitpadup();
	if(cursorIndex == 0){
		rollTracker();
		rollCheck();
		turnRollDisplay();
	}
	else if(cursorIndex == 1){
		if(rollsLeft == 3 || scorecardChangeA != scorecardChangeB) return;
		else if(rollsLeft < 3 && scorecardChangeA == scorecardChangeB){
			cursorPosition[0] = 40;
			cursorPosition[1] = 128;
			cursorIndex = 3;
		}
	}
	else if(cursorIndex == 2){
		if(rollsLeft == 3 || scorecardChangeA != scorecardChangeB) return;
		else if(rollsLeft < 3 && scorecardChangeA == scorecardChangeB){
			viewMode = 1;
			cardView(backgroundMap);
		}
	}
	else if(cursorIndex >= 3 && cursorIndex <= 7){
		toggleDi();
	}
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
}

void playCursorB(){
	if(cursorIndex >= 3 && cursorIndex <= 7){
		cursorPosition[0] = 16;
		cursorPosition[1] = 144;
		cursorIndex = 0;
	}
	move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
}

void playCursorSelect(){
	quickSwitch = 1;
    if(rollsLeft == 3 || scorecardChangeA != scorecardChangeB) return;
	else if(rollsLeft < 3 && scorecardChangeA == scorecardChangeB){
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

	titleScreen();
    betterDelay(180);

	initGame();

	DISPLAY_ON;

	while(endGame == 0){
		if(viewMode == 0){
			playCursor();
        }
        else if(viewMode == 1){
			cardCursor();
        }
    }
    while(endGame == 1){
		printf("that's it for now!\n\n");
		printf("reset game to play again!");
	}
}
