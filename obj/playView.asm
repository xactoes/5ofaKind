;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module playView
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _playView
	.globl _turnRollDisplay
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
;func/playView.c:12: void playView(unsigned char map[]){
;	---------------------------------
; Function playView
; ---------------------------------
_playView::
;func/playView.c:13: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;func/playView.c:14: for(i = 0; i != 36; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00110$:
;func/playView.c:15: if(quickSwitch == 0){
	ld	a, (#_quickSwitch)
	or	a, a
	jr	NZ, 00102$
;func/playView.c:16: betterDelay(1);
	ld	de, #0x0001
	push	de
	call	_betterDelay
	pop	hl
00102$:
;/opt/gbdk/include/gb/gb.h:1023: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG + 0)
	add	a, #0xfc
	ldh	(_SCY_REG + 0), a
;func/playView.c:19: if(i == 10){
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	NZ, 00111$
;func/playView.c:20: set_bkg_submap(0, 0, 20, 4, map, 20);
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
	xor	a, a
	rrca
	push	af
	call	_set_bkg_submap
	add	sp, #7
00111$:
;func/playView.c:14: for(i = 0; i != 36; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00148$
	inc	hl
	inc	(hl)
00148$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x24
;func/playView.c:23: for(i = 0; i != 20; i++){
	or	a,(hl)
	jr	NZ, 00110$
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00112$:
;func/playView.c:24: scroll_sprite(i, 0, 88);
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
	add	a, #0x58
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;func/playView.c:23: for(i = 0; i != 20; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00151$
	inc	hl
	inc	(hl)
00151$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x14
;func/playView.c:26: cursorIndex = 0;
	or	a,(hl)
	jr	NZ, 00112$
	ld	hl, #_cursorIndex
	ld	(hl+), a
	ld	(hl), a
;func/playView.c:27: cursorPosition[0] = 16;
	ld	hl, #_cursorPosition
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;func/playView.c:28: cursorPosition[1] = 144;
	ld	bc, #_cursorPosition + 2
	ld	l, c
	ld	h, b
	ld	a, #0x90
	ld	(hl+), a
	ld	(hl), #0x00
;func/playView.c:29: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
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
;func/playView.c:30: quickSwitch = 0;
	ld	hl, #_quickSwitch
	ld	(hl), #0x00
;func/playView.c:31: viewMode = 0;
	ld	hl, #_viewMode
	ld	(hl), #0x00
;func/playView.c:32: scoreDisplay();
	call	_scoreDisplay
;func/playView.c:33: turnRollDisplay();
	call	_turnRollDisplay
;func/playView.c:34: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;func/playView.c:35: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
