#ifndef SOUND_EFFECTS_H
#define SOUND_EFFECTS_H

#include <gb/gb.h>

extern void soundCursorMove() BANKED;
BANKREF_EXTERN(soundCursorMove)

extern void soundInvalid() BANKED;
BANKREF_EXTERN(soundInvalid)

#endif
