#include </opt/gbdk/include/gbdk/bcd.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

void saveScore(){
    bcd_add(&hiScore[0], &totalScoreBCD);
}
