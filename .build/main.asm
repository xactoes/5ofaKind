;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl b_initializeDiProperties
	.globl _initializeDiProperties
	.globl _printf
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
;src/main.c:11: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:12: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:13: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:14: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:22: initializeDiProperties(0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #b_initializeDiProperties
	ld	hl, #_initializeDiProperties
	call	___sdcc_bcall_ehl
	inc	sp
;src/main.c:24: for(uint8 i = 0; i != DICE_COUNT; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x05
	ret	Z
;src/main.c:26: printf("%u\n", dice[i].face);
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
	ld	de, #_dice
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
	pop	bc
;src/main.c:24: for(uint8 i = 0; i != DICE_COUNT; i++)
	inc	c
;src/main.c:30: }
	jr	00103$
___str_0:
	.ascii "%u"
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
