#include <gb/gb.h>
#include <gbdk/bcd.h>

#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

#include "../func/save_tools.h"

#include "../func/logicScore.h"

#include "../res/backgroundData.h"
#include "../res/maps.h"



unsigned int scoreIndex, nameIndex;

void highScores(){
    //make save variables accessible as they can be written to in this function
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

    //hide screen objects during setup
    HIDE_BKG;
    HIDE_SPRITES;


    set_bkg_data(0, 128, backgroundData);
    set_bkg_tiles(0, 0, 20, 18, scoreMap1);


    for(i = 0; i != 25; i++){
        if(scoreTrue[i] != 1){
            if(hiScores[i] > 0 && hiScores[i] != 65535){
                scoreTrue[i] = 1;
            }
            else{
                scoreTrue[i] = 0;
                hiScores[i] = 0;
            }
        }
        else{
            if(hiScores[i] == 0 || hiScores[i] == 65535){
                scoreTrue[i] = 0;
                hiScores[i] = 0;
            }
        }
   }

    //sort the scores
    sortNameScores();



    SHOW_BKG;

}
