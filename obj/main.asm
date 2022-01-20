;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _playCursor
	.globl _playCursorSelect
	.globl _playCursorB
	.globl _playCursorA
	.globl _rollCheck
	.globl _toggleDi
	.globl _playCursorRight
	.globl _playCursorLeft
	.globl _rollTracker
	.globl _newTurn
	.globl _initGame
	.globl _initDi
	.globl _moveDiceStruct
	.globl _diceToRoll
	.globl _setDiFace
	.globl _setDiceValues
	.globl _turnRollDisplay
	.globl _titleScreen
	.globl _spriteFlip
	.globl _scoreDisplay
	.globl _rollDi
	.globl _cardView
	.globl _cardCursor
	.globl _betterDelay
	.globl _puts
	.globl _printf
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
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
;src/main.c:30: void setDiceValues(){
;	---------------------------------
; Function setDiceValues
; ---------------------------------
_setDiceValues::
;src/main.c:31: diceValues[0] = Di1.face;
	ld	hl, #(_Di1 + 14)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_diceValues
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:32: diceValues[1] = Di2.face;
	ld	hl, #(_Di2 + 14)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_diceValues + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:33: diceValues[2] = Di3.face;
	ld	hl, #(_Di3 + 14)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_diceValues + 4)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:34: diceValues[3] = Di4.face;
	ld	hl, #(_Di4 + 14)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_diceValues + 6)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:35: diceValues[4] = Di5.face;
	ld	hl, #(_Di5 + 14)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_diceValues + 8)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:36: }
	ret
;src/main.c:39: void setDiFace(struct DiceStruct * diSprite){
;	---------------------------------
; Function setDiFace
; ---------------------------------
_setDiFace::
	dec	sp
;src/main.c:40: rollDi();
	call	_rollDi
;src/main.c:41: for(i = 0; i != 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00103$:
;src/main.c:42: set_sprite_tile(diSprite->spriteID[i], currentFace[i]);
	ld	hl, #_i
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sla	e
	rl	d
	ld	hl, #_currentFace
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	l, e
	ld	h, d
	add	hl, bc
;/opt/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;src/main.c:41: for(i = 0; i != 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00118$
	inc	hl
	inc	(hl)
00118$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00103$
;src/main.c:44: diSprite->face = diFaceBuf;
	ld	hl, #0x000e
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_diFaceBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/main.c:45: setDiceValues();
	inc	sp
	jp	_setDiceValues
;src/main.c:46: }
	inc	sp
	ret
;src/main.c:49: void diceToRoll(){
;	---------------------------------
; Function diceToRoll
; ---------------------------------
_diceToRoll::
;src/main.c:50: if(rollsLeft > 0){
	ld	hl, #_rollsLeft + 1
	ld	a, (hl-)
	or	a, (hl)
	ret	Z
;src/main.c:51: rollsLeft -= 1;
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/main.c:52: for(j = 0; j != 5; j++){
	xor	a, a
	ld	hl, #_j
	ld	(hl+), a
	ld	(hl), a
00128$:
;src/main.c:53: betterDelay(6);
	ld	de, #0x0006
	push	de
	call	_betterDelay
	pop	hl
;src/main.c:54: if(j == 0){
	ld	hl, #_j + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00123$
;src/main.c:55: if(Di1.inPlay == 1){
	ld	a, (#(_Di1 + 16) + 0)
	dec	a
	jr	NZ, 00129$
;src/main.c:56: setDiFace(&Di1);
	ld	de, #_Di1
	push	de
	call	_setDiFace
	pop	hl
	jr	00129$
00123$:
;src/main.c:60: else if(j == 1){
	ld	hl, #_j
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	NZ, 00120$
;src/main.c:61: if(Di2.inPlay == 1){
	ld	a, (#(_Di2 + 16) + 0)
	dec	a
	jr	NZ, 00129$
;src/main.c:62: setDiFace(&Di2);
	ld	de, #_Di2
	push	de
	call	_setDiFace
	pop	hl
	jr	00129$
00120$:
;src/main.c:66: else if(j == 2){
	ld	hl, #_j
	ld	a, (hl+)
	sub	a, #0x02
	or	a, (hl)
	jr	NZ, 00117$
;src/main.c:67: if(Di3.inPlay == 1){
	ld	a, (#(_Di3 + 16) + 0)
	dec	a
	jr	NZ, 00129$
;src/main.c:68: setDiFace(&Di3);
	ld	de, #_Di3
	push	de
	call	_setDiFace
	pop	hl
	jr	00129$
00117$:
;src/main.c:72: else if(j == 3){
	ld	hl, #_j
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	jr	NZ, 00114$
;src/main.c:73: if(Di4.inPlay == 1){
	ld	a, (#(_Di4 + 16) + 0)
	dec	a
	jr	NZ, 00129$
;src/main.c:74: setDiFace(&Di4);
	ld	de, #_Di4
	push	de
	call	_setDiFace
	pop	hl
	jr	00129$
00114$:
;src/main.c:78: else if(j == 4){
	ld	hl, #_j
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00129$
;src/main.c:79: if(Di5.inPlay == 1){
	ld	a, (#(_Di5 + 16) + 0)
	dec	a
	jr	NZ, 00129$
;src/main.c:80: setDiFace(&Di5);
	ld	de, #_Di5
	push	de
	call	_setDiFace
	pop	hl
00129$:
;src/main.c:52: for(j = 0; j != 5; j++){
	ld	hl, #_j
	inc	(hl)
	jr	NZ, 00210$
	inc	hl
	inc	(hl)
00210$:
	ld	hl, #_j
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jp	NZ,00128$
;src/main.c:86: }
	ret
;src/main.c:89: void moveDiceStruct(struct DiceStruct * diSprite, unsigned int x, unsigned int y){
;	---------------------------------
; Function moveDiceStruct
; ---------------------------------
_moveDiceStruct::
	add	sp, #-6
;src/main.c:90: move_sprite(diSprite->spriteID[0], x, y);
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, l
	ld	b, h
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
;src/main.c:91: move_sprite(diSprite->spriteID[1], x + 8, y);
	ld	a, (hl-)
	ld	(bc), a
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	c, a
	ld	b, c
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	a, (de)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;src/main.c:92: move_sprite(diSprite->spriteID[2], x, y + 8);
	ld	a, (hl)
	add	a, #0x08
	ld	b, a
	ldhl	sp,	#3
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:93: move_sprite(diSprite->spriteID[3], x + 8, y + 8);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
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
;src/main.c:93: move_sprite(diSprite->spriteID[3], x + 8, y + 8);
;src/main.c:94: }
	add	sp, #6
	ret
;src/main.c:98: void initDi(struct DiceStruct * diSprite, unsigned int spot){
;	---------------------------------
; Function initDi
; ---------------------------------
_initDi::
	add	sp, #-10
;src/main.c:99: for(i = 0; i != 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	a, #0x02
00116$:
	ldhl	sp,	#4
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00116$
00102$:
;src/main.c:103: diSprite->position = spot;
	pop	de
	push	de
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/main.c:106: spriteNumber = (4 * (spot - 1) ) + i;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_i
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
;src/main.c:109: diSprite->spriteID[i] = spriteNumber;
	ld	hl, #_i
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	e, a
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;src/main.c:112: diSprite->x = diStartPosition[0] + ( (diSprite->position - 1) * diSpacing);
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	hl, #_diStartPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_diSpacing
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__mulint
	add	sp, #4
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	pop	bc
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:113: diSprite->y = diStartPosition[1];
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #(_diStartPosition + 2)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	e, c
	ld	d, b
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/main.c:99: for(i = 0; i != 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00118$
	inc	hl
	inc	(hl)
00118$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jp	NZ,00102$
;src/main.c:116: diSprite->inPlay = 1;
	pop	de
	push	de
	ld	hl, #0x0010
	add	hl, de
	ld	(hl), #0x01
;src/main.c:119: moveDiceStruct(diSprite, diSprite->x, diSprite->y);
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_moveDiceStruct
	add	sp, #6
;src/main.c:122: setDiFace(diSprite);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_setDiFace
	pop	hl
;src/main.c:123: }
	add	sp, #10
	ret
;src/main.c:126: void initGame(){
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/main.c:127: set_sprite_data(0, 6, Sprites);
	ld	de, #_Sprites
	push	de
	ld	hl, #0x600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:128: set_sprite_tile(cursor, 5);
	ld	hl, #_cursor
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl)
;/opt/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x05
;src/main.c:129: set_bkg_data(0, 128, backgroundData);
	ld	de, #_backgroundData
	push	de
	ld	hl, #0x8000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:130: set_bkg_tiles(0, 0, 20, 32, backgroundMap);
	ld	de, #_backgroundMap
	push	de
	ld	hl, #0x2014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:131: viewMode = 0;
	ld	hl, #_viewMode
	ld	(hl), #0x00
;src/main.c:133: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:135: initDi(&Di1, 1);
	ld	de, #0x0001
	push	de
	ld	de, #_Di1
	push	de
	call	_initDi
	add	sp, #4
;src/main.c:136: initDi(&Di2, 2);
	ld	de, #0x0002
	push	de
	ld	de, #_Di2
	push	de
	call	_initDi
	add	sp, #4
;src/main.c:137: initDi(&Di3, 3);
	ld	de, #0x0003
	push	de
	ld	de, #_Di3
	push	de
	call	_initDi
	add	sp, #4
;src/main.c:138: initDi(&Di4, 4);
	ld	de, #0x0004
	push	de
	ld	de, #_Di4
	push	de
	call	_initDi
	add	sp, #4
;src/main.c:139: initDi(&Di5, 5);
	ld	de, #0x0005
	push	de
	ld	de, #_Di5
	push	de
	call	_initDi
	add	sp, #4
;src/main.c:140: spriteFlip();
	call	_spriteFlip
;src/main.c:143: cursorIndex = 0;
	xor	a, a
	ld	hl, #_cursorIndex
	ld	(hl+), a
	ld	(hl), a
;src/main.c:144: cursorPosition[0] = 16;
	ld	hl, #_cursorPosition
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:145: cursorPosition[1] = 144;
	ld	bc, #_cursorPosition + 2
	ld	l, c
	ld	h, b
	ld	a, #0x90
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:146: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
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
;src/main.c:148: scoreDisplay();
	call	_scoreDisplay
;src/main.c:150: rollsLeft = 3;
	ld	hl, #_rollsLeft
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:151: turn = 1;
	ld	hl, #_turn
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:153: turnRollDisplay();
	call	_turnRollDisplay
;src/main.c:156: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:157: }
	ret
;src/main.c:160: void newTurn(){
;	---------------------------------
; Function newTurn
; ---------------------------------
_newTurn::
;src/main.c:161: turn++;
	ld	hl, #_turn
	inc	(hl)
	jr	NZ, 00138$
	inc	hl
	inc	(hl)
00138$:
;src/main.c:162: rollsLeft = 3;
	ld	hl, #_rollsLeft
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:163: turnRollDisplay();
	call	_turnRollDisplay
;src/main.c:164: rollsEnabled = 1;
	ld	hl, #_rollsEnabled
	ld	(hl), #0x01
;src/main.c:165: scorecardChangeA = 0;
	ld	hl, #_scorecardChangeA
	ld	(hl), #0x00
;src/main.c:166: scorecardChangeB = 0;
	ld	hl, #_scorecardChangeB
	ld	(hl), #0x00
;src/main.c:167: if(Di1.inPlay == 0){
	ld	hl, #_Di1 + 16
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;src/main.c:168: Di1.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:169: moveDiceStruct(&Di1, Di1.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_Di1 + 8
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di1
	push	de
	call	_moveDiceStruct
	add	sp, #6
00102$:
;src/main.c:171: if(Di2.inPlay == 0){
	ld	hl, #_Di2 + 16
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;src/main.c:172: Di2.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:173: moveDiceStruct(&Di2, Di2.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_Di2 + 8
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di2
	push	de
	call	_moveDiceStruct
	add	sp, #6
00104$:
;src/main.c:175: if(Di3.inPlay == 0){
	ld	hl, #_Di3 + 16
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
;src/main.c:176: Di3.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:177: moveDiceStruct(&Di3, Di3.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_Di3 + 8
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di3
	push	de
	call	_moveDiceStruct
	add	sp, #6
00106$:
;src/main.c:179: if(Di4.inPlay == 0){
	ld	hl, #_Di4 + 16
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
;src/main.c:180: Di4.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:181: moveDiceStruct(&Di4, Di4.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_Di4 + 8
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di4
	push	de
	call	_moveDiceStruct
	add	sp, #6
00108$:
;src/main.c:183: if(Di5.inPlay == 0){
	ld	hl, #_Di5 + 16
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/main.c:184: Di5.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:185: moveDiceStruct(&Di5, Di5.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_Di5 + 8
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di5
	push	de
	call	_moveDiceStruct
	add	sp, #6
;src/main.c:187: }
	ret
;src/main.c:190: void rollTracker(){
;	---------------------------------
; Function rollTracker
; ---------------------------------
_rollTracker::
;src/main.c:191: turnsPassed = 0;
	xor	a, a
	ld	hl, #_turnsPassed
	ld	(hl+), a
	ld	(hl), a
;src/main.c:192: if(rollsLeft == 0){
	ld	hl, #_rollsLeft + 1
	ld	a, (hl-)
;src/main.c:194: for(i = 0; i != 13; i++){
	or	a,(hl)
	jp	NZ,00123$
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00125$:
;src/main.c:195: if(scorecard[i] != 255){
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_scorecard
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	inc	a
	or	a, b
	jr	Z, 00126$
;src/main.c:196: turnsPassed++;
	ld	hl, #_turnsPassed
	inc	(hl)
	jr	NZ, 00186$
	inc	hl
	inc	(hl)
00186$:
00126$:
;src/main.c:194: for(i = 0; i != 13; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00187$
	inc	hl
	inc	(hl)
00187$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0d
	or	a, (hl)
	jr	NZ, 00125$
;src/main.c:200: if(turnsPassed < turn){
	ld	de, #_turnsPassed
	ld	hl, #_turn
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00118$
;src/main.c:201: rollsEnabled = 0;
	ld	hl, #_rollsEnabled
	ld	(hl), #0x00
	jr	00124$
00118$:
;src/main.c:204: else if(turnsPassed == turn){
	ld	a, (#_turnsPassed)
	ld	hl, #_turn
	sub	a, (hl)
	jr	NZ, 00124$
	ld	a, (#_turnsPassed + 1)
	ld	hl, #_turn + 1
	sub	a, (hl)
	jr	NZ, 00124$
;src/main.c:205: if(turn == 13){
	ld	hl, #_turn
	ld	a, (hl+)
	sub	a, #0x0d
	or	a, (hl)
	jr	NZ, 00113$
;src/main.c:206: if(scorecard[6] == 0){
	ld	hl, #(_scorecard + 12)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, b
	or	a, c
	jr	NZ, 00107$
;src/main.c:207: endGame = 1;
	ld	hl, #_endGame
	ld	(hl), #0x01
	jr	00124$
00107$:
;src/main.c:209: else if(scorecard[6] == 50){
	ld	a, c
	sub	a, #0x32
	or	a, b
	jr	NZ, 00124$
;src/main.c:210: endGame = 1;
	ld	hl, #_endGame
	ld	(hl), #0x01
	jr	00124$
00113$:
;src/main.c:213: else if(turn >= 13){
	ld	hl, #_turn
	ld	a, (hl+)
	sub	a, #0x0d
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00110$
;src/main.c:214: endGame = 1;
	ld	hl, #_endGame
	ld	(hl), #0x01
	jr	00124$
00110$:
;src/main.c:217: newTurn();
	call	_newTurn
	jr	00124$
00123$:
;src/main.c:221: else if(rollsLeft > 0){
	ld	hl, #_rollsLeft + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00124$
;src/main.c:222: rollsEnabled = 1;
	ld	hl, #_rollsEnabled
	ld	(hl), #0x01
00124$:
;src/main.c:224: turnsPassed = 0;
	xor	a, a
	ld	hl, #_turnsPassed
	ld	(hl+), a
	ld	(hl), a
;src/main.c:225: }
	ret
;src/main.c:227: void playCursorLeft(){
;	---------------------------------
; Function playCursorLeft
; ---------------------------------
_playCursorLeft::
;src/main.c:228: if(cursorIndex == 1 || cursorIndex == 2){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	Z, 00101$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x02
	or	a, (hl)
	jr	NZ, 00102$
00101$:
;src/main.c:229: cursorPosition[0] -= 48;
	ld	hl, #_cursorPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xd0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_cursorPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:230: cursorIndex -= 1;
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00102$:
;src/main.c:232: if(cursorIndex > 3 && cursorIndex <= 7){//null for now
	ld	hl, #_cursorIndex
	ld	a, #0x03
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00105$
	ld	hl, #_cursorIndex
	ld	a, #0x07
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00105$
;src/main.c:233: cursorPosition[0] -= 24;
	ld	hl, #_cursorPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xe8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #_cursorPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:234: cursorIndex -= 1;
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00105$:
;src/main.c:236: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
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
;src/main.c:236: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;src/main.c:237: }
	ret
;src/main.c:240: void playCursorRight(){
;	---------------------------------
; Function playCursorRight
; ---------------------------------
_playCursorRight::
;src/main.c:241: if(cursorIndex == 0 || cursorIndex == 1){
	ld	hl, #_cursorIndex + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00101$
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	NZ, 00102$
00101$:
;src/main.c:242: cursorPosition[0] += 48;
	ld	hl, #_cursorPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0030
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_cursorPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:243: cursorIndex += 1;
	ld	hl, #_cursorIndex
	inc	(hl)
	jr	NZ, 00127$
	inc	hl
	inc	(hl)
00127$:
00102$:
;src/main.c:245: if(cursorIndex >= 3 && cursorIndex < 7){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x03
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00105$
	dec	hl
	ld	a, (hl+)
	sub	a, #0x07
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00105$
;src/main.c:246: cursorPosition[0] += 24;
	ld	hl, #_cursorPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0018
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_cursorPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/main.c:247: cursorIndex += 1;
	ld	hl, #_cursorIndex
	inc	(hl)
	jr	NZ, 00128$
	inc	hl
	inc	(hl)
00128$:
00105$:
;src/main.c:249: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
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
;src/main.c:249: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;src/main.c:250: }
	ret
;src/main.c:253: void toggleDi(){
;	---------------------------------
; Function toggleDi
; ---------------------------------
_toggleDi::
;src/main.c:254: switch(cursorIndex){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	jr	Z, 00101$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	Z, 00107$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jp	Z,00113$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x06
	or	a, (hl)
	jp	Z,00119$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x07
	or	a, (hl)
	jp	Z,00125$
	ret
;src/main.c:255: case 3:
00101$:
;src/main.c:256: if(Di1.inPlay == 1){
	ld	hl, #_Di1 + 16
	ld	c, (hl)
;src/main.c:258: moveDiceStruct(&Di1, Di1.x, heldPosY);
;src/main.c:256: if(Di1.inPlay == 1){
	ld	a, c
;src/main.c:257: Di1.inPlay = 0;
	dec	a
	jr	NZ, 00105$
	ld	(hl),a
;src/main.c:258: moveDiceStruct(&Di1, Di1.x, heldPosY);
	ld	hl, #_heldPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di1 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di1
	push	de
	call	_moveDiceStruct
	add	sp, #6
	ret
00105$:
;src/main.c:260: else if(Di1.inPlay == 0){
	ld	a, c
	or	a, a
	ret	NZ
;src/main.c:261: Di1.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:262: moveDiceStruct(&Di1, Di1.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di1 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di1
	push	de
	call	_moveDiceStruct
	add	sp, #6
;src/main.c:264: break;
	ret
;src/main.c:265: case 4:
00107$:
;src/main.c:266: if(Di2.inPlay == 1){
	ld	hl, #_Di2 + 16
	ld	c, (hl)
;src/main.c:268: moveDiceStruct(&Di2, Di2.x, heldPosY);
;src/main.c:266: if(Di2.inPlay == 1){
	ld	a, c
;src/main.c:267: Di2.inPlay = 0;
	dec	a
	jr	NZ, 00111$
	ld	(hl),a
;src/main.c:268: moveDiceStruct(&Di2, Di2.x, heldPosY);
	ld	hl, #_heldPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di2 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di2
	push	de
	call	_moveDiceStruct
	add	sp, #6
	ret
00111$:
;src/main.c:270: else if(Di2.inPlay == 0){
	ld	a, c
	or	a, a
	ret	NZ
;src/main.c:271: Di2.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:272: moveDiceStruct(&Di2, Di2.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di2 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di2
	push	de
	call	_moveDiceStruct
	add	sp, #6
;src/main.c:274: break;
	ret
;src/main.c:275: case 5:
00113$:
;src/main.c:276: if(Di3.inPlay == 1){
	ld	hl, #_Di3 + 16
	ld	c, (hl)
;src/main.c:278: moveDiceStruct(&Di3, Di3.x, heldPosY);
;src/main.c:276: if(Di3.inPlay == 1){
	ld	a, c
;src/main.c:277: Di3.inPlay = 0;
	dec	a
	jr	NZ, 00117$
	ld	(hl),a
;src/main.c:278: moveDiceStruct(&Di3, Di3.x, heldPosY);
	ld	hl, #_heldPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di3 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di3
	push	de
	call	_moveDiceStruct
	add	sp, #6
	ret
00117$:
;src/main.c:280: else if(Di3.inPlay == 0){
	ld	a, c
	or	a, a
	ret	NZ
;src/main.c:281: Di3.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:282: moveDiceStruct(&Di3, Di3.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di3 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di3
	push	de
	call	_moveDiceStruct
	add	sp, #6
;src/main.c:284: break;
	ret
;src/main.c:285: case 6:
00119$:
;src/main.c:286: if(Di4.inPlay == 1){
	ld	hl, #_Di4 + 16
	ld	c, (hl)
;src/main.c:288: moveDiceStruct(&Di4, Di4.x, heldPosY);
;src/main.c:286: if(Di4.inPlay == 1){
	ld	a, c
;src/main.c:287: Di4.inPlay = 0;
	dec	a
	jr	NZ, 00123$
	ld	(hl),a
;src/main.c:288: moveDiceStruct(&Di4, Di4.x, heldPosY);
	ld	hl, #_heldPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di4 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di4
	push	de
	call	_moveDiceStruct
	add	sp, #6
	ret
00123$:
;src/main.c:290: else if(Di4.inPlay == 0){
	ld	a, c
	or	a, a
	ret	NZ
;src/main.c:291: Di4.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:292: moveDiceStruct(&Di4, Di4.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di4 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di4
	push	de
	call	_moveDiceStruct
	add	sp, #6
;src/main.c:294: break;
	ret
;src/main.c:295: case 7:
00125$:
;src/main.c:296: if(Di5.inPlay == 1){
	ld	hl, #_Di5 + 16
	ld	c, (hl)
;src/main.c:298: moveDiceStruct(&Di5, Di5.x, heldPosY);
;src/main.c:296: if(Di5.inPlay == 1){
	ld	a, c
;src/main.c:297: Di5.inPlay = 0;
	dec	a
	jr	NZ, 00129$
	ld	(hl),a
;src/main.c:298: moveDiceStruct(&Di5, Di5.x, heldPosY);
	ld	hl, #_heldPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di5 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di5
	push	de
	call	_moveDiceStruct
	add	sp, #6
	ret
00129$:
;src/main.c:300: else if(Di5.inPlay == 0){
	ld	a, c
	or	a, a
	ret	NZ
;src/main.c:301: Di5.inPlay = 1;
	ld	(hl), #0x01
;src/main.c:302: moveDiceStruct(&Di5, Di5.x, rollPosY);
	ld	hl, #_rollPosY
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_Di5 + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	de, #_Di5
	push	de
	call	_moveDiceStruct
	add	sp, #6
;src/main.c:305: }
;src/main.c:306: }
	ret
;src/main.c:309: void rollCheck(){
;	---------------------------------
; Function rollCheck
; ---------------------------------
_rollCheck::
;src/main.c:310: if(rollsEnabled == 0){
	ld	a, (#_rollsEnabled)
	or	a, a
	jr	NZ, 00107$
;src/main.c:311: if(scorecardChangeA != scorecardChangeB){
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
;src/main.c:312: newTurn();
	jp	NZ,_newTurn
;src/main.c:316: cardView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_cardView
	pop	hl
	ret
00107$:
;src/main.c:319: else if(rollsEnabled == 1){
	ld	hl, #_rollsEnabled
	ld	a, (hl)
	dec	a
	jp	Z,_diceToRoll
;src/main.c:320: diceToRoll();
	ret
;src/main.c:322: }
	ret
;src/main.c:325: void playCursorA(){
;	---------------------------------
; Function playCursorA
; ---------------------------------
_playCursorA::
;src/main.c:327: if(cursorIndex == 0){
	ld	hl, #_cursorIndex + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00125$
;src/main.c:328: rollTracker();
	call	_rollTracker
;src/main.c:329: rollCheck();
	call	_rollCheck
;src/main.c:330: turnRollDisplay();
	call	_turnRollDisplay
	jp	00126$
00125$:
;src/main.c:333: if(rollsLeft == 3 || scorecardChangeA != scorecardChangeB) return;
	ld	hl, #_rollsLeft
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	ld	a, #0x01
	jr	Z, 00186$
	xor	a, a
00186$:
	ld	e, a
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00188$
	xor	a, a
00188$:
	ld	c, a
;src/main.c:334: else if(rollsLeft < 3 && scorecardChangeA == scorecardChangeB){
	ld	hl, #_rollsLeft
	ld	a, (hl+)
	sub	a, #0x03
	ld	a, (hl)
	sbc	a, #0x00
	ld	a, #0x00
	rla
	ld	b, a
;src/main.c:332: else if(cursorIndex == 1){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	dec	a
;src/main.c:333: if(rollsLeft == 3 || scorecardChangeA != scorecardChangeB) return;
	or	a,(hl)
	jr	NZ, 00122$
	or	a,e
	ret	NZ
	bit	0, c
	ret	Z
;src/main.c:334: else if(rollsLeft < 3 && scorecardChangeA == scorecardChangeB){
	ld	a, b
	or	a, a
	jr	Z, 00126$
	ld	a, c
	or	a, a
	jr	Z, 00126$
;src/main.c:335: cursorPosition[0] = 40;
	ld	hl, #_cursorPosition
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:336: cursorPosition[1] = 128;
	ld	hl, #(_cursorPosition + 2)
	ld	a, #0x80
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:337: cursorIndex = 3;
	ld	hl, #_cursorIndex
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00126$
00122$:
;src/main.c:340: else if(cursorIndex == 2){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x02
;src/main.c:341: if(rollsLeft == 3 || scorecardChangeA != scorecardChangeB) return;
	or	a,(hl)
	jr	NZ, 00119$
	or	a,e
	ret	NZ
	bit	0, c
	ret	Z
;src/main.c:342: else if(rollsLeft < 3 && scorecardChangeA == scorecardChangeB){
	ld	a, b
	or	a, a
	jr	Z, 00126$
	ld	a, c
	or	a, a
	jr	Z, 00126$
;src/main.c:343: viewMode = 1;
	ld	hl, #_viewMode
	ld	(hl), #0x01
;src/main.c:344: cardView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_cardView
	pop	hl
	jr	00126$
00119$:
;src/main.c:347: else if(cursorIndex >= 3 && cursorIndex <= 7){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x03
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00126$
	dec	hl
	ld	a, #0x07
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00126$
;src/main.c:348: toggleDi();
	call	_toggleDi
00126$:
;src/main.c:350: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
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
;src/main.c:350: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;src/main.c:351: }
	ret
;src/main.c:353: void playCursorB(){
;	---------------------------------
; Function playCursorB
; ---------------------------------
_playCursorB::
;src/main.c:354: if(cursorIndex >= 3 && cursorIndex <= 7){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x03
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00102$
	dec	hl
	ld	a, #0x07
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00102$
;src/main.c:355: cursorPosition[0] = 16;
	ld	hl, #_cursorPosition
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:356: cursorPosition[1] = 144;
	ld	hl, #(_cursorPosition + 2)
	ld	a, #0x90
	ld	(hl+), a
	ld	(hl), #0x00
;src/main.c:357: cursorIndex = 0;
	xor	a, a
	ld	hl, #_cursorIndex
	ld	(hl+), a
	ld	(hl), a
00102$:
;src/main.c:359: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
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
;src/main.c:359: move_sprite(cursor, cursorPosition[0], cursorPosition[1]);
;src/main.c:360: }
	ret
;src/main.c:362: void playCursorSelect(){
;	---------------------------------
; Function playCursorSelect
; ---------------------------------
_playCursorSelect::
;src/main.c:363: quickSwitch = 1;
	ld	hl, #_quickSwitch
	ld	(hl), #0x01
;src/main.c:364: if(rollsLeft == 3 || scorecardChangeA != scorecardChangeB) return;
	ld	hl, #_rollsLeft
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	ret	Z
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00127$
	xor	a, a
00127$:
	ld	c, a
	bit	0, c
	ret	Z
;src/main.c:365: else if(rollsLeft < 3 && scorecardChangeA == scorecardChangeB){
	ld	hl, #_rollsLeft
	ld	a, (hl+)
	sub	a, #0x03
	ld	a, (hl)
	sbc	a, #0x00
	ret	NC
	ld	a, c
	or	a, a
	ret	Z
;src/main.c:366: viewMode = 1;
	ld	hl, #_viewMode
	ld	(hl), #0x01
;src/main.c:367: cardView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_cardView
	pop	hl
;src/main.c:369: }
	ret
;src/main.c:373: void playCursor(){
;	---------------------------------
; Function playCursor
; ---------------------------------
_playCursor::
;src/main.c:374: switch(joypad()){
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jr	Z, 00102$
	cp	a, #0x02
	jr	Z, 00101$
	cp	a, #0x10
	jr	Z, 00103$
	cp	a, #0x20
	jr	Z, 00104$
	cp	a, #0x40
	jr	Z, 00106$
	sub	a, #0x80
	jp	Z,_waitpadup
	ret
;src/main.c:375: case J_LEFT:
00101$:
;src/main.c:376: playCursorLeft();
	call	_playCursorLeft
;src/main.c:377: waitpadup();
;src/main.c:378: break;
	jp	_waitpadup
;src/main.c:379: case J_RIGHT:
00102$:
;src/main.c:380: playCursorRight();
	call	_playCursorRight
;src/main.c:381: waitpadup();
;src/main.c:382: break;
	jp	_waitpadup
;src/main.c:383: case J_A:
00103$:
;src/main.c:384: playCursorA();
	call	_playCursorA
;src/main.c:385: waitpadup();
;src/main.c:386: break;
	jp	_waitpadup
;src/main.c:387: case J_B:
00104$:
;src/main.c:388: playCursorB();
	call	_playCursorB
;src/main.c:389: waitpadup();
;src/main.c:390: break;
;src/main.c:391: case J_START:
;src/main.c:393: waitpadup();
;src/main.c:394: break;
	jp	_waitpadup
;src/main.c:395: case J_SELECT:
00106$:
;src/main.c:396: playCursorSelect();
	call	_playCursorSelect
;src/main.c:397: waitpadup();
;src/main.c:399: }
;src/main.c:400: }
	jp	_waitpadup
;src/main.c:403: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:405: titleScreen();
	call	_titleScreen
;src/main.c:406: betterDelay(180);
	ld	de, #0x00b4
	push	de
	call	_betterDelay
	pop	hl
;src/main.c:408: initGame();
	call	_initGame
;src/main.c:410: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:412: while(endGame == 0){
00106$:
	ld	a, (#_endGame)
	or	a, a
	jr	NZ, 00119$
;src/main.c:413: if(viewMode == 0){
	ld	a, (#_viewMode)
	or	a, a
	jr	NZ, 00104$
;src/main.c:414: playCursor();
	call	_playCursor
	jr	00106$
00104$:
;src/main.c:416: else if(viewMode == 1){
	ld	a, (#_viewMode)
	dec	a
	jr	NZ, 00106$
;src/main.c:417: cardCursor();
	call	_cardCursor
	jr	00106$
;src/main.c:420: while(endGame == 1){
00119$:
00109$:
	ld	a, (#_endGame)
	dec	a
	ret	NZ
;src/main.c:421: printf("that's it for now!\n\n");
	ld	de, #___str_1
	push	de
	call	_puts
	pop	hl
;src/main.c:422: printf("reset game to play again!");
	ld	de, #___str_2
	push	de
	call	_printf
	pop	hl
;src/main.c:424: }
	jr	00109$
___str_1:
	.ascii "that's it for now!"
	.db 0x0a
	.db 0x00
___str_2:
	.ascii "reset game to play again!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
