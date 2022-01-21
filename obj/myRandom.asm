;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module myRandom
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myRandom
	.globl _rand
	.globl _initrand
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
;func/myRandom.c:5: unsigned char myRandom(unsigned char maxNumber){
;	---------------------------------
; Function myRandom
; ---------------------------------
_myRandom::
;func/myRandom.c:7: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;func/myRandom.c:8: currRand = 127 - rand();
	call	_rand
	ld	a, e
	rlca
	sbc	a, a
	ld	c, a
	ld	a, #0x7f
	sub	a, e
	ld	e, a
	sbc	a, a
	sub	a, c
;func/myRandom.c:9: return (currRand % (maxNumber + 1) );
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	push	bc
	ld	d, a
	push	de
	call	__moduint
	add	sp, #4
;func/myRandom.c:10: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
