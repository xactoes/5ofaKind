#include </opt/gbdk/include/gb/gb.h>
#include </opt/gbdk/include/rand.h>

//my random number generator for 0 - 255
unsigned char myRandom(unsigned char maxNumber){
    unsigned int currRand;
	initrand(DIV_REG);
	currRand = 127 - rand();
	return (currRand % (maxNumber + 1) );
}
