#include "../func/betterDelay.h"
#include "../func/dice_tools.h"
#include "../func/diceStruct.h"
#include "../func/glob_vars.h"

void diceToRoll(){
	if(rollsLeft > 0){
		rollsLeft -= 1;
		for(j = 0; j != 5; j++){
			betterDelay(6);
			if(j == 0){
				if(Di1.inPlay == 1){
					setDiFace(&Di1);
				}
			}
			else if(j == 1){
				if(Di2.inPlay == 1){
					setDiFace(&Di2);
				}
			}
			else if(j == 2){
				if(Di3.inPlay == 1){
					setDiFace(&Di3);
				}
			}
			else if(j == 3){
				if(Di4.inPlay == 1){
					setDiFace(&Di4);
				}
			}
			else if(j == 4){
				if(Di5.inPlay == 1){
					setDiFace(&Di5);
				}
			}
		}
	}
}
