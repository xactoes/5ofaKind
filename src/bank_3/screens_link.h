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

extern void linkBlankExit() BANKED;
BANKREF_EXTERN(linkBlankExit)

extern void linkExit() BANKED;
BANKREF_EXTERN(linkExit)

extern void linkConnected() BANKED;
BANKREF_EXTERN(linkConnected)

extern void linkSyncing() BANKED;
BANKREF_EXTERN(linkSyncing)

extern void linkWaiting() BANKED;
BANKREF_EXTERN(linkWaiting)

extern void linkFinished() BANKED;
BANKREF_EXTERN(linkFinished)

extern void progressBar(uint8) BANKED;
BANKREF_EXTERN(progressBar)

#endif