;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module cardView
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cardView
	.globl _scoreDisplay
	.globl _betterDelay
	.globl _set_bkg_submap
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
;func/cardView.c:11: void cardView(unsigned char map[]){
;	---------------------------------
; Function cardView
; ---------------------------------
_cardView::
;func/cardView.c:12: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;func/cardView.c:13: for(i = 0; i != 36; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00110$:
;func/cardView.c:14: if(quickSwitch == 0){
	ld	a, (#_quickSwitch)
	or	a, a
	jr	NZ, 00102$
;func/cardView.c:15: betterDelay(1);
	ld	de, #0x0001
	push	de
	call	_betterDelay
	pop	hl
00102$:
;/opt/gbdk/include/gb/gb.h:1023: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG + 0)
	add	a, #0x04
	ldh	(_SCY_REG + 0), a
;func/cardView.c:18: if(i == 10){
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	NZ, 00111$
;func/cardView.c:19: set_bkg_submap(0, 32, 20, 4, map, 20);
	ld	a, #0x14
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x414
	push	hl
	ld	hl, #0x2000
	push	hl
	call	_set_bkg_submap
	add	sp, #7
00111$:
;func/cardView.c:13: for(i = 0; i != 36; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00148$
	inc	hl
	inc	(hl)
00148$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x24
;func/cardView.c:22: for(i = 0; i != 20; i++){
	or	a,(hl)
	jr	NZ, 00110$
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00112$:
;func/cardView.c:23: scroll_sprite(i, 0, -88);
	ld	hl, #_i
;/opt/gbdk/include/gb/gb.h:1415: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;/opt/gbdk/include/gb/gb.h:1416: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	add	a, #0xa8
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;func/cardView.c:22: for(i = 0; i != 20; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00151$
	inc	hl
	inc	(hl)
00151$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x14
	or	a, (hl)
	jr	NZ, 00112$
;func/cardView.c:25: cursorIndex = 8;
	ld	hl, #_cursorIndex
	ld	a, #0x08
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/cardView.c:26: cursorPosition[0] = 16;
	ld	hl, #_cursorPosition
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;func/cardView.c:27: cursorPosition[1] = 48;
	ld	bc, #_cursorPosition + 2
	ld	l, c
	ld	h, b
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x00
;func/cardView.c:28: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
	ld	a, (bc)
	ld	b, a
	ld	hl, #_cursorPosition
	ld	c, (hl)
	ld	hl, #_cursor
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;func/cardView.c:29: upperRegion = 1;
	ld	hl, #_upperRegion
	ld	(hl), #0x01
;func/cardView.c:30: quickSwitch = 0;
	ld	hl, #_quickSwitch
	ld	(hl), #0x00
;func/cardView.c:31: viewMode = 1;
	ld	hl, #_viewMode
	ld	(hl), #0x01
;func/cardView.c:32: scoreDisplay();
	call	_scoreDisplay
;func/cardView.c:33: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;func/cardView.c:34: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
