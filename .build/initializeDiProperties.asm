;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module initializeDiProperties
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_initializeDiProperties
	.globl ___func_initializeDiProperties
	.globl b_assignDiFace
	.globl _assignDiFace
	.globl b_initializeDiSprites
	.globl _initializeDiSprites
	.globl b_initializeDiProperties
	.globl _initializeDiProperties
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
;src/bank_1/initializeDiProperties.c:7: BANKREF(initializeDiProperties)
;	---------------------------------
; Function __func_initializeDiProperties
; ---------------------------------
	b___func_initializeDiProperties	= 1
___func_initializeDiProperties::
	.local b___func_initializeDiProperties 
	___bank_initializeDiProperties = b___func_initializeDiProperties 
	.globl ___bank_initializeDiProperties 
;src/bank_1/initializeDiProperties.c:8: void initializeDiProperties(uint8 diPosition) BANKED
;	---------------------------------
; Function initializeDiProperties
; ---------------------------------
	b_initializeDiProperties	= 1
_initializeDiProperties::
;src/bank_1/initializeDiProperties.c:10: initializeDiSprites(diPosition);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_initializeDiSprites
	ld	hl, #_initializeDiSprites
	call	___sdcc_bcall_ehl
	inc	sp
;src/bank_1/initializeDiProperties.c:12: assignDiFace(diPosition);
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, #b_assignDiFace
	ld	hl, #_assignDiFace
	call	___sdcc_bcall_ehl
	inc	sp
;src/bank_1/initializeDiProperties.c:14: dice[diPosition].isHeld = 0;
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
	ld	bc,#_dice
	add	hl,bc
	inc	hl
	ld	(hl), #0x00
;src/bank_1/initializeDiProperties.c:15: }
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
