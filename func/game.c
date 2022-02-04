#include "../func/initGame.h"
#include "../func/glob_vars.h"
#include "../func/logicGame.h"
#include "../func/cursorGame.h"
#include "../res/maps.h"
#include "../func/screens.h"

#include <stdio.h>
#include "../func/betterDelay.h"

void game(){
    initGame();
    viewPlay = 1;
    viewCard = 0;
    while(viewGame){
        while(viewPlay){
            if(turnCheck()){
                initTurn();
            }
            play(backgroundMap);
            cursorPlay();
        }
        while(viewCard){
            card(backgroundMap);
            cursorCard();
        }
    }
    while(viewEnd){
        endScreen();
    }
}
