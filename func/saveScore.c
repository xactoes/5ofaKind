#include </opt/gbdk/include/gbdk/bcd.h>

//global variables
#include "../func/global_variables.h"
#include "../sram/saveVars.h"

void saveScore(){
    bcd_add(&hiScore[0], &totalScoreBCD);
}
