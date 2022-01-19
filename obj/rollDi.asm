;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module rollDi
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rollDi
	.globl _myRandom
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
;func/rollDi.c:10: void rollDi(){
;	---------------------------------
; Function rollDi
; ---------------------------------
_rollDi::
	add	sp, #-4
;func/rollDi.c:12: switch(myRandom(5)){
	ld	a, #0x05
	push	af
	inc	sp
	call	_myRandom
	inc	sp
	ld	a, #0x05
	sub	a, e
	jp	C, 00126$
	ld	d, #0x00
	ld	hl, #00194$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00194$:
	jp	00129$
	jp	00131$
	jp	00133$
	jp	00135$
	jp	00137$
	jp	00139$
;func/rollDi.c:14: for(r = 0; r < 4; r++){
00129$:
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
00114$:
;func/rollDi.c:15: currentFace[r] = diFace1[r];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_currentFace
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_diFace1
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/rollDi.c:16: diFaceBuf = 1;
	ld	hl, #_diFaceBuf
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/rollDi.c:14: for(r = 0; r < 4; r++){
	ldhl	sp,	#2
	inc	(hl)
	jr	NZ, 00196$
	inc	hl
	inc	(hl)
00196$:
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00114$
;func/rollDi.c:18: break;
	jp	00126$
;func/rollDi.c:20: for(r = 0; r < 4; r++){
00131$:
	ld	bc, #0x0000
00116$:
;func/rollDi.c:21: currentFace[r] = diFace2[r];
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	push	de
	ld	hl, #_currentFace
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_diFace2
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;func/rollDi.c:22: diFaceBuf = 2;
	ld	hl, #_diFaceBuf
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/rollDi.c:20: for(r = 0; r < 4; r++){
	inc	bc
	ld	a, c
	sub	a, #0x04
	ld	a, b
	sbc	a, #0x00
	jr	C, 00116$
;func/rollDi.c:24: break;
	jp	00126$
;func/rollDi.c:26: for(r = 0; r < 4; r++){
00133$:
	ld	bc, #0x0000
00118$:
;func/rollDi.c:27: currentFace[r] = diFace3[r];
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	push	de
	ld	hl, #_currentFace
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_diFace3
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;func/rollDi.c:28: diFaceBuf = 3;
	ld	hl, #_diFaceBuf
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/rollDi.c:26: for(r = 0; r < 4; r++){
	inc	bc
	ld	a, c
	sub	a, #0x04
	ld	a, b
	sbc	a, #0x00
	jr	C, 00118$
;func/rollDi.c:30: break;
	jp	00126$
;func/rollDi.c:32: for(r = 0; r < 4; r++){
00135$:
	ld	bc, #0x0000
00120$:
;func/rollDi.c:33: currentFace[r] = diFace4[r];
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	push	de
	ld	hl, #_currentFace
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_diFace4
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;func/rollDi.c:34: diFaceBuf = 4;
	ld	hl, #_diFaceBuf
	ld	a, #0x04
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/rollDi.c:32: for(r = 0; r < 4; r++){
	inc	bc
	ld	a, c
	sub	a, #0x04
	ld	a, b
	sbc	a, #0x00
	jr	C, 00120$
;func/rollDi.c:36: break;
	jr	00126$
;func/rollDi.c:38: for(r = 0; r < 4; r++){
00137$:
	ld	bc, #0x0000
00122$:
;func/rollDi.c:39: currentFace[r] = diFace5[r];
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	push	de
	ld	hl, #_currentFace
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_diFace5
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;func/rollDi.c:40: diFaceBuf = 5;
	ld	hl, #_diFaceBuf
	ld	a, #0x05
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/rollDi.c:38: for(r = 0; r < 4; r++){
	inc	bc
	ld	a, c
	sub	a, #0x04
	ld	a, b
	sbc	a, #0x00
	jr	C, 00122$
;func/rollDi.c:42: break;
	jr	00126$
;func/rollDi.c:44: for(r = 0; r < 4; r++){
00139$:
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
00124$:
;func/rollDi.c:45: currentFace[r] = diFace6[r];
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_currentFace
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	hl, #_diFace6
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/rollDi.c:46: diFaceBuf = 6;
	ld	hl, #_diFaceBuf
	ld	a, #0x06
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/rollDi.c:44: for(r = 0; r < 4; r++){
	ldhl	sp,	#2
	inc	(hl)
	jr	NZ, 00202$
	inc	hl
	inc	(hl)
00202$:
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00124$
;func/rollDi.c:49: }
00126$:
;func/rollDi.c:50: }
	add	sp, #4
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
