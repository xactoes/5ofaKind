#ifndef SIO_H
#define SIO_H

#include <gb/gb.h>
#include "../bank_0/global_defines.h"

#define SCORE_LEFT  0
#define SCORE_RIGHT 1

#define WAITING     10
#define CONNECTED   11
#define SYNCING     12
#define FINISHED    13

extern uint8 scoreSplit[];
BANKREF_EXTERN(scoreSplit)

extern uint16 scorePaired;
BANKREF_EXTERN(scorePaired)

extern uint8 scoreName[];
BANKREF_EXTERN(scoreName)

extern uint8 handshake;
BANKREF_EXTERN(handshake)


extern void sioTest() BANKED;
BANKREF_EXTERN(sioTest)

extern void sioConnect(uint8) BANKED;
BANKREF_EXTERN(sioConnect)

extern void sioSendScore(uint16) BANKED;
BANKREF_EXTERN(sioSendScore)
extern void sioSendName(uint8*) BANKED;
BANKREF_EXTERN(sioSendName)

extern void sioReceiveScore() BANKED;
BANKREF_EXTERN(sioReceiveScore)
extern void sioReceiveName() BANKED;
BANKREF_EXTERN(sioReceiveName)


#endif