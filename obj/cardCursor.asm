;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module cardCursor
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cardCursor
	.globl _cardCursorSelect
	.globl _cardCursorB
	.globl _cardCursorA
	.globl _cardCursorRight
	.globl _cardCursorLeft
	.globl _cardCursorDown
	.globl _cardCursorUp
	.globl _logicScorecard
	.globl _playView
	.globl _waitpadup
	.globl _joypad
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
;func/cardCursor.c:13: void cardCursorUp(){
;	---------------------------------
; Function cardCursorUp
; ---------------------------------
_cardCursorUp::
;func/cardCursor.c:14: if(cursorIndex > 8 && cursorIndex <= 15 || cursorIndex > 16 && cursorIndex <= 21){
	ld	hl, #_cursorIndex
	ld	a, #0x08
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00109$
	ld	hl, #_cursorIndex
	ld	a, #0x0f
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00105$
00109$:
	ld	hl, #_cursorIndex
	ld	a, #0x10
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00106$
	ld	hl, #_cursorIndex
	ld	a, #0x15
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00106$
00105$:
;func/cardCursor.c:15: if(cursorIndex == 11 || cursorIndex == 19){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0b
	or	a, (hl)
	jr	Z, 00101$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x13
	or	a, (hl)
	jr	NZ, 00102$
00101$:
;func/cardCursor.c:16: cursorPosition[1] -= 32;
	ld	hl, #(_cursorPosition + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xe0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_cursorPosition + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/cardCursor.c:17: upperRegion = 1;
	ld	hl, #_upperRegion
	ld	(hl), #0x01
	jr	00103$
00102$:
;func/cardCursor.c:20: cursorPosition[1] -= 8;
	ld	hl, #(_cursorPosition + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_cursorPosition + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00103$:
;func/cardCursor.c:22: cursorIndex -= 1;
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00106$:
;func/cardCursor.c:24: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
	ld	hl, #_cursorPosition + 2
	ld	b, (hl)
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
;func/cardCursor.c:24: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;func/cardCursor.c:25: }
	ret
;func/cardCursor.c:28: void cardCursorDown(){
;	---------------------------------
; Function cardCursorDown
; ---------------------------------
_cardCursorDown::
;func/cardCursor.c:29: if(cursorIndex >= 8 && cursorIndex < 15 || cursorIndex >= 16 && cursorIndex <= 21){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x08
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00112$
	dec	hl
	ld	a, (hl+)
	sub	a, #0x0f
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00108$
00112$:
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	jp	C, 00109$
	dec	hl
	ld	a, #0x15
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00109$
00108$:
;func/cardCursor.c:30: if(cursorIndex == 10 || cursorIndex == 18){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	Z, 00104$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x12
	or	a, (hl)
	jr	NZ, 00105$
00104$:
;func/cardCursor.c:31: cursorPosition[1] += 32;
	ld	hl, #(_cursorPosition + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0020
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_cursorPosition + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/cardCursor.c:32: cursorIndex += 1;
	ld	hl, #_cursorIndex
	inc	(hl)
	jr	NZ, 00139$
	inc	hl
	inc	(hl)
00139$:
;func/cardCursor.c:33: upperRegion = 0;
	ld	hl, #_upperRegion
	ld	(hl), #0x00
	jr	00109$
00105$:
;func/cardCursor.c:35: else if(cursorIndex == 21){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x15
	or	a, (hl)
	jr	NZ, 00102$
;func/cardCursor.c:36: cursorPosition[0] = 16;
	ld	hl, #_cursorPosition
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;func/cardCursor.c:37: cursorPosition[1] += 8;
	ld	hl, #(_cursorPosition + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_cursorPosition + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/cardCursor.c:38: cursorIndex = 14;
	ld	hl, #_cursorIndex
	ld	a, #0x0e
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00109$
00102$:
;func/cardCursor.c:41: cursorPosition[1] += 8;
	ld	hl, #(_cursorPosition + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_cursorPosition + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/cardCursor.c:42: cursorIndex += 1;
	ld	hl, #_cursorIndex
	inc	(hl)
	jr	NZ, 00142$
	inc	hl
	inc	(hl)
00142$:
00109$:
;func/cardCursor.c:45: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
	ld	hl, #_cursorPosition + 2
	ld	b, (hl)
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
;func/cardCursor.c:45: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;func/cardCursor.c:46: }
	ret
;func/cardCursor.c:49: void cardCursorLeft(){
;	---------------------------------
; Function cardCursorLeft
; ---------------------------------
_cardCursorLeft::
;func/cardCursor.c:50: if(cursorIndex >= 16 && cursorIndex <= 21){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00102$
	dec	hl
	ld	a, #0x15
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00102$
;func/cardCursor.c:51: cursorPosition[0] -= 72;
	ld	hl, #_cursorPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xb8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_cursorPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/cardCursor.c:52: cursorIndex -= 8;
	ld	hl, #_cursorIndex
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00102$:
;func/cardCursor.c:54: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
	ld	hl, #_cursorPosition + 2
	ld	b, (hl)
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
;func/cardCursor.c:54: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;func/cardCursor.c:55: }
	ret
;func/cardCursor.c:58: void cardCursorRight(){
;	---------------------------------
; Function cardCursorRight
; ---------------------------------
_cardCursorRight::
;func/cardCursor.c:59: if(cursorIndex >= 8 && cursorIndex <= 13){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x08
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00102$
	dec	hl
	ld	a, #0x0d
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00102$
;func/cardCursor.c:60: cursorPosition[0] += 72;
	ld	hl, #_cursorPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0048
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_cursorPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/cardCursor.c:61: cursorIndex += 8;
	ld	hl, #_cursorIndex
	ld	a, (hl)
	add	a, #0x08
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
00102$:
;func/cardCursor.c:63: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
	ld	hl, #_cursorPosition + 2
	ld	b, (hl)
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
;func/cardCursor.c:63: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;func/cardCursor.c:64: }
	ret
;func/cardCursor.c:66: void cardCursorA(){
;	---------------------------------
; Function cardCursorA
; ---------------------------------
_cardCursorA::
;func/cardCursor.c:67: logicScorecard();
;func/cardCursor.c:68: }
	jp	_logicScorecard
;func/cardCursor.c:70: void cardCursorB(){
;	---------------------------------
; Function cardCursorB
; ---------------------------------
_cardCursorB::
;func/cardCursor.c:71: playView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_playView
	pop	hl
;func/cardCursor.c:73: }
	ret
;func/cardCursor.c:76: void cardCursorSelect(){
;	---------------------------------
; Function cardCursorSelect
; ---------------------------------
_cardCursorSelect::
;func/cardCursor.c:77: quickSwitch = 1;
	ld	hl, #_quickSwitch
	ld	(hl), #0x01
;func/cardCursor.c:78: playView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_playView
	pop	hl
;func/cardCursor.c:79: }
	ret
;func/cardCursor.c:82: void cardCursor(){
;	---------------------------------
; Function cardCursor
; ---------------------------------
_cardCursor::
;func/cardCursor.c:83: switch(joypad()){
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jr	Z, 00102$
	cp	a, #0x02
	jr	Z, 00101$
	cp	a, #0x04
	jr	Z, 00103$
	cp	a, #0x08
	jr	Z, 00104$
	cp	a, #0x10
	jr	Z, 00105$
	cp	a, #0x20
	jr	Z, 00106$
	sub	a, #0x40
	jr	Z, 00108$
	ret
;func/cardCursor.c:84: case J_LEFT:
00101$:
;func/cardCursor.c:85: cardCursorLeft();
	call	_cardCursorLeft
;func/cardCursor.c:86: waitpadup();
;func/cardCursor.c:87: break;
	jp	_waitpadup
;func/cardCursor.c:88: case J_RIGHT:
00102$:
;func/cardCursor.c:89: cardCursorRight();
	call	_cardCursorRight
;func/cardCursor.c:90: waitpadup();
;func/cardCursor.c:91: break;
	jp	_waitpadup
;func/cardCursor.c:92: case J_UP:
00103$:
;func/cardCursor.c:93: cardCursorUp();
	call	_cardCursorUp
;func/cardCursor.c:94: waitpadup();
;func/cardCursor.c:95: break;
	jp	_waitpadup
;func/cardCursor.c:96: case J_DOWN:
00104$:
;func/cardCursor.c:97: cardCursorDown();
	call	_cardCursorDown
;func/cardCursor.c:98: waitpadup();
;func/cardCursor.c:99: break;
	jp	_waitpadup
;func/cardCursor.c:100: case J_A:
00105$:
;func/cardCursor.c:101: cardCursorA();
	call	_cardCursorA
;func/cardCursor.c:102: waitpadup();
;func/cardCursor.c:103: break;
	jp	_waitpadup
;func/cardCursor.c:104: case J_B:
00106$:
;func/cardCursor.c:105: cardCursorB();
	call	_cardCursorB
;func/cardCursor.c:106: waitpadup();
;func/cardCursor.c:107: break;
	jp	_waitpadup
;func/cardCursor.c:110: case J_SELECT:
00108$:
;func/cardCursor.c:111: cardCursorSelect();
	call	_cardCursorSelect
;func/cardCursor.c:112: waitpadup();
;func/cardCursor.c:114: }
;func/cardCursor.c:115: }
	jp	_waitpadup
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
