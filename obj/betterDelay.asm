;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module betterDelay
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
;func/betterDelay.c:3: void betterDelay(unsigned int loops){
;	---------------------------------
; Function betterDelay
; ---------------------------------
_betterDelay::
;func/betterDelay.c:5: for(ii = 0; ii != loops; ii++){
	ld	bc, #0x0000
00103$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00118$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ret	Z
00118$:
;func/betterDelay.c:6: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;func/betterDelay.c:5: for(ii = 0; ii != loops; ii++){
	inc	bc
;func/betterDelay.c:8: }
	jr	00103$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
