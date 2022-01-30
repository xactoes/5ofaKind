#include "../func/glob_vars.h"

unsigned int scorecardMarked(){
    unsigned int marked = 0;
    //tally that counts how many scores have been set to compare with turns later
    for(i = 0; i != 14; i++){
        //ignore 5 of a kind (uses bonusTally)
        //ignore bonus 5 of a Kind
        if(i == 6 || i == 7){
            marked = marked;
        }
        //tally everything else except bonusUpper
        else{
            //if the scorecard doesn't have a null value at that location
            if(scorecard[i] != 255){
                //it is marked
                marked++;
            }
        }
    }
    //return marked when function is called
	return marked;
}
