#include <gb/gb.h>

//global variables
#include "../func/glob_vars.h"

//functions
#include "../func/myRandom.h"
#include "../func/diFaces.h"

void diFaceChange(){
    unsigned int r;
	switch(myRandom(5)){
		case 0:
			for(r = 0; r < 4; r++){
				currentFace[r] = diFace1[r];
				diFaceBuf = 1;
			}
			break;
		case 1:
			for(r = 0; r < 4; r++){
				currentFace[r] = diFace2[r];
				diFaceBuf = 2;
			}
			break;
		case 2:
			for(r = 0; r < 4; r++){
				currentFace[r] = diFace3[r];
				diFaceBuf = 3;
			}
			break;
		case 3:
			for(r = 0; r < 4; r++){
				currentFace[r] = diFace4[r];
				diFaceBuf = 4;
			}
			break;
		case 4:
			for(r = 0; r < 4; r++){
				currentFace[r] = diFace5[r];
				diFaceBuf = 5;
			}
			break;
		case 5:
			for(r = 0; r < 4; r++){
				currentFace[r] = diFace6[r];
				diFaceBuf = 6;
			}
			break;
	}
}
