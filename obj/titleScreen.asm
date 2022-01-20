;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module titleScreen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _titleScreen
	.globl _set_bkg_tiles
	.globl _set_bkg_data
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
;func/titleScreen.c:6: void titleScreen(){
;	---------------------------------
; Function titleScreen
; ---------------------------------
_titleScreen::
;func/titleScreen.c:7: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:8: set_bkg_data(0, 68, splashScreen_data);
	ld	de, #_splashScreen_data
	push	de
	ld	hl, #0x4400
	push	hl
	call	_set_bkg_data
	add	sp, #4
;func/titleScreen.c:9: set_bkg_tiles(0, 0, 20, 18, splashScreen_map);
	ld	de, #_splashScreen_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;func/titleScreen.c:10: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:11: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
