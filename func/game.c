#include "../func/initGame.h"
#include "../func/glob_vars.h"
#include "../func/logicGame.h"
#include "../func/cursorGame.h"
#include "../res/maps.h"

void game(){
    initGame();
    viewPlay = 1;
    viewCard = 0;
    viewSwitch = 1;
    if(viewGame){
        while(viewPlay){
            play(backgroundMap);
            if(turnCheck()){
                initTurn();
            }
            cursorPlay();
            turnRollDisplay();
        }
        while(viewCard){
            card(backgroundMap);
            //select option
            //switch view
        }
    }
    else if(viewEnd){}
}
