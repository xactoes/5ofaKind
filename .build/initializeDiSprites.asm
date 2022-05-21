;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module initializeDiSprites
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_initializeDiSprites
	.globl ___func_initializeDiSprites
	.globl b_initializeDiSprites
	.globl _initializeDiSprites
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
;src/bank_1/initializeDiSprites.c:8: BANKREF(initializeDiSprites)
;	---------------------------------
; Function __func_initializeDiSprites
; ---------------------------------
	b___func_initializeDiSprites	= 1
___func_initializeDiSprites::
	.local b___func_initializeDiSprites 
	___bank_initializeDiSprites = b___func_initializeDiSprites 
	.globl ___bank_initializeDiSprites 
;src/bank_1/initializeDiSprites.c:9: void initializeDiSprites(uint8 diPosition) BANKED
;	---------------------------------
; Function initializeDiSprites
; ---------------------------------
	b_initializeDiSprites	= 1
_initializeDiSprites::
	dec	sp
	dec	sp
;src/bank_1/initializeDiSprites.c:12: for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
	ldhl	sp,	#8
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
	ld	bc,#_dice
	add	hl,bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	bc
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x04
	jr	Z, 00105$
;src/bank_1/initializeDiSprites.c:14: spriteNumber = (4 * diPosition) + i;
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, a
	add	a, a
	ld	b, c
	add	a, b
	ld	b, a
;src/bank_1/initializeDiSprites.c:15: dice[diPosition].sprite[i].address = spriteNumber;
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	ld	e, a
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;src/bank_1/initializeDiSprites.c:12: for(uint8 i = 0; i != DI_SPRITE_COUNT; i++)
	inc	c
	jr	00103$
00105$:
;src/bank_1/initializeDiSprites.c:17: }
	inc	sp
	inc	sp
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
