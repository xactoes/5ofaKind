#ifndef SCREENS_LINK_H
#define SCREENS_LINK_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

extern uint8 linkMap[];
BANKREF_EXTERN(linkMap)

extern void drawScreenLink() BANKED;
BANKREF_EXTERN(drawScreenLink)

extern void linkBlank() BANKED;
BANKREF_EXTERN(linkBlank)

extern void linkConnected() BANKED;
BANKREF_EXTERN(linkConnected)

extern void linkSyncing() BANKED;
BANKREF_EXTERN(linkSyncing)

extern void linkWaiting() BANKED;
BANKREF_EXTERN(linkWaiting)

#endif