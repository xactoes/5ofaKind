#include <gb/gb.h>

#include "../func/screens.h"
#include "../func/save_tools.h"
#include "../func/glob_vars.h"


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
