#ifndef GLOBAL_DEFINES_H
#define GLOBAL_DEFINES_H

// SHORTHAND VARIABLE TYPES
typedef unsigned char   uint8;
typedef unsigned int    uint16;

typedef char            int8;
typedef int             int16;
typedef long            int32;
typedef long long       int64;

#define MAX_SPRITE_COUNT    40
#define MAX_ROLLS			3

// DICE
#define DICE_COUNT          5
#define DI_SPRITE_COUNT     4
#define DI_X				48
#define DI_Y				72
#define DI_SPRITE_OFFSET	8
#define DI_SPACE			24
#define DI_HELD_OFFSET		32

#define SPRITES_SIZE		8

// CURSOR
#define ARROW_RIGHT			20
#define ARROW_LEFT			21
#define ARROW_UP			22

// SCREENS
#define SCREEN_SPLASH		0
#define SCREEN_TITLE		10
#define SCREEN_OPTIONS		11
#define HIGH_SCORE_0		12
#define HIGH_SCORE_1		13
#define HIGH_SCORE_2		14
#define HIGH_SCORE_3		15
#define SCREEN_NAME_INPUT_0	16
#define SCREEN_NAME_INPUT_1 17
#define SCREEN_NAME_INPUT_2 18
#define SCREEN_LINK			19
#define SCREEN_PLAY			20
#define SCREEN_START		25
#define SCREEN_CARD			30
#define SCREEN_END			40
#define SCREEN_CREDITS		50

// SCORE
#define SCORE_NULL			255
#define SCORE_NULL_COMPARE	511

// AUDIO SETTINGS NOTES
/* NR52 turns sound on
 * NR51 controls which channels are on
 * NR50 controls volume for left and right speakers
 *
 * NRx0 ------------------------------------------------------------------------
 * Register 0: Frequency sweep settings
 * On Channels 1, and 3
 * Sweep is the pitch of the sound
 * 7		: unsued
 * 6 - 4	: Sweep time (update rate) if 0, sweeping is off
 * 3		: Sweep Direction (1: Decrease, 0: Increase)
 * 2		: Sweep Right Shift amount (if 0, sweeping is off)
 *
 * NRx1 ------------------------------------------------------------------------
 * Register 1: Wave Pattern duty and sound length
 * On Channels 1, 2, and 4
 * 7-6		: Wave pattern duty cycle 0-3 (12.5%, 25%, 50%, 75%)
 * 5-0		: sound length (the high the number the shorter the sound)
 *
 * NRx2 ------------------------------------------------------------------------
 * Register 2: Volume Envelope (Makes the volume get louder or quieter each tick)
 * On Channels 1, 2, and 4
 * 7-4		: (Initial) Channel Volume
 * 3		: Volume Sweep Direction (0: Down, 1: Up)
 * 2-0		: Length of each step in sweep (if 9 sweeping is off)
 *
 * NRx3 ------------------------------------------------------------------------
 * Register 3	: Frequency
 * On Channels 1, 2, and 3
 * 7-0			: Frequency
 *
 * Nx4 -------------------------------------------------------------------------
 * Register 4: Playback and Frequency
 * On Channels 1, 2, 3, and 4
 * 7-4		: Playback
 * 3-0 		: Frequency
*/

// AUDIO
#define AUDIO_ON			0x80	// for NR52_REG
#define CHANNEL_ON_1		0x11	// for NR51_REG
#define CHANNEL_ON_2		0x22
#define CHANNEL_ON_3		0x44
#define CHANNEL_ON_4		0x88
#define CHANNEL_ON_ALL		0xFF
#define MAX_VOLUME			0x77	// for NR50_REG
#define MIN_VOLUME			0x00	// LB and RB are LEFT and RIGHT audio channels	

#endif
