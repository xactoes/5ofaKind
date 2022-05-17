#include <gb/gb.h>

void betterDelay(unsigned int loops){
	unsigned int ii;
	for(ii = 0; ii != loops; ii++){
		wait_vbl_done();
	}
}
