#include </opt/gbdk/include/gbdk/bcd.h>
#include "../sram/save_vars.h"
#include "../func/glob_vars.h"

void scoreSetup(){
    hiScores[24] = 0;
    for(i = 0; i != 15; i++){
        if(scorecard[i] != 255){
            hiScores[24] += scorecard[i];
        }
        else return;
    }
}
