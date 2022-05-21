;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module assignDiFace
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_assignDiFace
	.globl ___func_assignDiFace
	.globl _randomRange
	.globl b_assignDiFace
	.globl _assignDiFace
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
	.area _CODE_1
;src/bank_1/assignDiFace.c:11: BANKREF(assignDiFace)
;	---------------------------------
; Function __func_assignDiFace
; ---------------------------------
	b___func_assignDiFace	= 1
___func_assignDiFace::
	.local b___func_assignDiFace 
	___bank_assignDiFace = b___func_assignDiFace 
	.globl ___bank_assignDiFace 
;src/bank_1/assignDiFace.c:12: void assignDiFace(uint8 diPosition) BANKED
;	---------------------------------
; Function assignDiFace
; ---------------------------------
	b_assignDiFace	= 1
_assignDiFace::
;src/bank_1/assignDiFace.c:16: dice[diPosition].face = 1;
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
;src/bank_1/assignDiFace.c:14: if(!diceInitialized)
	ld	a, (#_diceInitialized)
	or	a, a
	jr	NZ, 00102$
;src/bank_1/assignDiFace.c:16: dice[diPosition].face = 1;
	ld	hl, #_dice
	add	hl, bc
	ld	(hl), #0x01
	ret
00102$:
;src/bank_1/assignDiFace.c:21: dice[diPosition].face = randomRange(1, 6);
	ld	hl, #_dice
	add	hl, bc
	push	hl
	ld	hl, #0x601
	push	hl
	call	_randomRange
	pop	hl
	pop	hl
	ld	(hl), e
;src/bank_1/assignDiFace.c:23: }
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
