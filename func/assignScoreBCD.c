#include <gb/gb.h>
#include </opt/gbdk/include/gbdk/bcd.h>

#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

void assignScoreBCD(){
    uint2bcd(hiScores[0], &hiScore01);
    uint2bcd(hiScores[1], &hiScore02);
    uint2bcd(hiScores[2], &hiScore03);
    uint2bcd(hiScores[3], &hiScore04);
    uint2bcd(hiScores[4], &hiScore05);
    uint2bcd(hiScores[5], &hiScore06);
    uint2bcd(hiScores[6], &hiScore07);
    uint2bcd(hiScores[7], &hiScore08);
    uint2bcd(hiScores[8], &hiScore09);
    uint2bcd(hiScores[9], &hiScore10);
    uint2bcd(hiScores[10], &hiScore11);
    uint2bcd(hiScores[11], &hiScore12);
    uint2bcd(hiScores[12], &hiScore13);
    uint2bcd(hiScores[13], &hiScore14);
    uint2bcd(hiScores[14], &hiScore15);
    uint2bcd(hiScores[15], &hiScore16);
    uint2bcd(hiScores[16], &hiScore17);
    uint2bcd(hiScores[17], &hiScore18);
    uint2bcd(hiScores[18], &hiScore19);
    uint2bcd(hiScores[19], &hiScore20);
    uint2bcd(hiScores[20], &hiScore21);
    uint2bcd(hiScores[21], &hiScore22);
    uint2bcd(hiScores[22], &hiScore23);
    uint2bcd(hiScores[23], &hiScore24);
    uint2bcd(hiScores[24], &hiScoreBuf);
}
