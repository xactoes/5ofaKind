#include </opt/gbdk/include/gb/gb.h>

//backgrounds
#include "../res/splashScreen.h"

void titleScreen(){
    HIDE_BKG;
    set_bkg_data(0, 68, splashScreen_data);
    set_bkg_tiles(0, 0, 20, 18, splashScreen_map);
    SHOW_BKG;
}
