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
	.globl _set_sprite_data
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
;func/titleScreen.c:12: void titleScreen(){
;	---------------------------------
; Function titleScreen
; ---------------------------------
_titleScreen::
	dec	sp
	dec	sp
;func/titleScreen.c:13: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:14: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:15: set_bkg_data(0, 93, splashScreen_data);
	ld	de, #_splashScreen_data
	push	de
	ld	hl, #0x5d00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;func/titleScreen.c:16: set_bkg_tiles(0, 0, 20, 18, splashScreen_map);
	ld	de, #_splashScreen_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;func/titleScreen.c:19: set_sprite_data(0, 7, Sprites);
	ld	de, #_Sprites
	push	de
	ld	hl, #0x700
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
	ld	(hl), #0x05
	ld	hl, #(_shadow_OAM + 86)
	ld	(hl), #0x06
;func/titleScreen.c:23: titlePosL[0] = 64;
	ld	hl, #_titlePosL
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:24: titlePosL[1] = 96;
	ld	hl, #(_titlePosL + 2)
	ld	a, #0x60
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:25: titlePosR[0] = 104;
	ld	hl, #_titlePosR
	ld	a, #0x68
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:26: titlePosR[1] = titlePosR[1];
	ld	hl, #(_titlePosR + 2)
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	hl, #(_titlePosR + 2)
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;func/titleScreen.c:28: move_sprite(20, titlePosL[0], titlePosL[1]);
	ld	a, (#(_titlePosL + 2) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_titlePosL + 0)
	ldhl	sp,	#1
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+80
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;func/titleScreen.c:29: move_sprite(21, titlePosR[0], titlePosR[1]);
	ld	hl, #_titlePosR
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;func/titleScreen.c:31: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:32: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:33: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
