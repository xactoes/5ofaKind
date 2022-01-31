#include </opt/gbdk/include/gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//functions
#include "../func/betterDelay.h"


//fades screen to black from normal palette
void fadeToBlack(unsigned int delayTime){
	for(i = 0; i < 4; i++){
		switch(i){
			case 0:
				BGP_REG = 0xE4;
				break;
			case 1:
				BGP_REG = 0xF9;
				break;
			case 2:
				BGP_REG = 0xFE;
				break;
			case 3:
				BGP_REG = 0xFF;
				break;
		}
		betterDelay(delayTime);
	}
}

//fades screen from black to normal palette
void fadeFromBlack(unsigned int delayTime){
	for(i = 0; i < 4; i++){
		switch(i){
			case 0:
				BGP_REG = 0xFF;
				break;
			case 1:
				BGP_REG = 0xFE;
				break;
			case 2:
				BGP_REG = 0xF9;
				break;
			case 3:
				BGP_REG = 0xE4;
				break;
		}
		betterDelay(delayTime);
	}
}
