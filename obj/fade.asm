;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module fade
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fadeFromBlack
	.globl _fadeToBlack
	.globl _betterDelay
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;func/fade.c:11: void fadeToBlack(unsigned int delayTime){
;	---------------------------------
; Function fadeToBlack
; ---------------------------------
_fadeToBlack::
;func/fade.c:12: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00107$:
;func/fade.c:13: switch(i){
	ld	hl, #_i
	ld	a, (hl+)
	or	a, a
	or	a, (hl)
	jr	Z, 00101$
	ld	hl, #_i
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	Z, 00102$
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x02
	or	a, (hl)
	jr	Z, 00103$
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	jr	Z, 00104$
	jr	00105$
;func/fade.c:14: case 0:
00101$:
;func/fade.c:15: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;func/fade.c:16: break;
	jr	00105$
;func/fade.c:17: case 1:
00102$:
;func/fade.c:18: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;func/fade.c:19: break;
	jr	00105$
;func/fade.c:20: case 2:
00103$:
;func/fade.c:21: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;func/fade.c:22: break;
	jr	00105$
;func/fade.c:23: case 3:
00104$:
;func/fade.c:24: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;func/fade.c:26: }
00105$:
;func/fade.c:27: betterDelay(delayTime);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_betterDelay
	pop	hl
;func/fade.c:12: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00140$
	inc	hl
	inc	(hl)
00140$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;func/fade.c:29: }
	ret
;func/fade.c:32: void fadeFromBlack(unsigned int delayTime){
;	---------------------------------
; Function fadeFromBlack
; ---------------------------------
_fadeFromBlack::
;func/fade.c:33: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00107$:
;func/fade.c:34: switch(i){
	ld	hl, #_i
	ld	a, (hl+)
	or	a, a
	or	a, (hl)
	jr	Z, 00101$
	ld	hl, #_i
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	Z, 00102$
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x02
	or	a, (hl)
	jr	Z, 00103$
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	jr	Z, 00104$
	jr	00105$
;func/fade.c:35: case 0:
00101$:
;func/fade.c:36: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;func/fade.c:37: break;
	jr	00105$
;func/fade.c:38: case 1:
00102$:
;func/fade.c:39: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;func/fade.c:40: break;
	jr	00105$
;func/fade.c:41: case 2:
00103$:
;func/fade.c:42: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;func/fade.c:43: break;
	jr	00105$
;func/fade.c:44: case 3:
00104$:
;func/fade.c:45: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;func/fade.c:47: }
00105$:
;func/fade.c:48: betterDelay(delayTime);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_betterDelay
	pop	hl
;func/fade.c:33: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00140$
	inc	hl
	inc	(hl)
00140$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00107$
;func/fade.c:50: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
