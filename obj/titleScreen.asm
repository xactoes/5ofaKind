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
	.globl _nameInput
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
;func/titleScreen.c:15: void titleScreen(){
;	---------------------------------
; Function titleScreen
; ---------------------------------
_titleScreen::
	dec	sp
	dec	sp
;func/titleScreen.c:16: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:17: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:18: set_bkg_data(0, 93, splashScreen_data);
	ld	de, #_splashScreen_data
	push	de
	ld	hl, #0x5d00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;func/titleScreen.c:19: set_bkg_tiles(0, 0, 20, 18, splashScreen_map);
	ld	de, #_splashScreen_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;func/titleScreen.c:22: set_sprite_data(0, 7, Sprites);
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
;func/titleScreen.c:26: titlePosL[0] = 64;
	ld	hl, #_titlePosL
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:27: titlePosL[1] = 96;
	ld	hl, #(_titlePosL + 2)
	ld	a, #0x60
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:28: titlePosR[0] = 104;
	ld	hl, #_titlePosR
	ld	a, #0x68
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:29: titlePosR[1] = titlePosL[1];
	ld	hl, #(_titlePosL + 2)
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	hl, #(_titlePosR + 2)
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;func/titleScreen.c:31: move_sprite(20, titlePosL[0], titlePosL[1]);
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
;func/titleScreen.c:32: move_sprite(21, titlePosR[0], titlePosR[1]);
	ld	hl, #_titlePosR
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;func/titleScreen.c:34: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:35: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:37: while(gameStart == 0){
00126$:
	ld	a, (#_gameStart)
	or	a, a
	jp	NZ, 00138$
;func/titleScreen.c:38: switch(joypad()){
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), e
;func/titleScreen.c:47: else if(titleIndex == 1){
	ld	hl, #_titleIndex
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	ld	a, #0x01
	jr	Z, 00206$
	xor	a, a
00206$:
	ld	c, a
;func/titleScreen.c:54: else if(titleIndex == 2){
	ld	hl, #_titleIndex
	ld	a, (hl+)
	sub	a, #0x02
	or	a, (hl)
	ld	a, #0x01
	jr	Z, 00208$
	xor	a, a
00208$:
	ldhl	sp,	#1
	ld	(hl), a
;func/titleScreen.c:80: else if(titleIndex == 3){
	ld	hl, #_titleIndex
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	ld	a, #0x01
	jr	Z, 00210$
	xor	a, a
00210$:
	ld	e, a
;func/titleScreen.c:38: switch(joypad()){
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x04
	jp	Z,00110$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00101$
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x10
	jp	Z,00119$
	jr	00126$
;func/titleScreen.c:39: case J_DOWN:
00101$:
;func/titleScreen.c:40: if(titleIndex == 0){
	ld	hl, #_titleIndex + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00108$
;func/titleScreen.c:41: titlePosL[0] = 40;
	ld	hl, #_titlePosL
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:42: titlePosL[1] += 8;
	ld	hl, #(_titlePosL + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_titlePosL + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:43: titlePosR[0] = 136;
	ld	hl, #_titlePosR
	ld	a, #0x88
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:44: titlePosR[1] = titlePosL[1];
	ld	hl, #(_titlePosR + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:45: titleIndex++;
	ld	hl, #_titleIndex
	inc	(hl)
	jr	NZ, 00109$
	inc	hl
	inc	(hl)
	jr	00109$
00108$:
;func/titleScreen.c:47: else if(titleIndex == 1){
	ld	a, c
	or	a, a
	jr	Z, 00105$
;func/titleScreen.c:48: titlePosL[0] = 48;
	ld	hl, #_titlePosL
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:49: titlePosL[1] += 8;
	ld	hl, #(_titlePosL + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_titlePosL + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:50: titlePosR[0] = 120;
	ld	hl, #_titlePosR
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:51: titlePosR[1] = titlePosL[1];
	ld	hl, #(_titlePosR + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:52: titleIndex++;
	ld	hl, #_titleIndex
	inc	(hl)
	jr	NZ, 00109$
	inc	hl
	inc	(hl)
	jr	00109$
00105$:
;func/titleScreen.c:54: else if(titleIndex == 2){
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
;func/titleScreen.c:55: titlePosL[0] = 56;
	ld	hl, #_titlePosL
	ld	a, #0x38
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:56: titlePosL[1] += 8;
	ld	hl, #(_titlePosL + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_titlePosL + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:57: titlePosR[0] = 120;
	ld	hl, #_titlePosR
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:58: titlePosR[1] = titlePosL[1];
	ld	hl, #(_titlePosR + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:59: titleIndex++;
	ld	hl, #_titleIndex
	inc	(hl)
	jr	NZ, 00216$
	inc	hl
	inc	(hl)
00216$:
00109$:
;func/titleScreen.c:61: move_sprite(20, titlePosL[0], titlePosL[1]);
	ld	hl, #(_titlePosL + 2)
	ld	c, (hl)
	ld	hl, #_titlePosL
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 80)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:62: move_sprite(21, titlePosR[0], titlePosR[1]);
	ld	hl, #(_titlePosR + 2)
	ld	c, (hl)
	ld	hl, #_titlePosR
	ld	b, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:63: waitpadup();
	call	_waitpadup
;func/titleScreen.c:64: break;
	jp	00126$
;func/titleScreen.c:65: case J_UP:
00110$:
;func/titleScreen.c:66: if(titleIndex == 1){
	ld	a, c
	or	a, a
	jr	Z, 00117$
;func/titleScreen.c:67: titlePosL[0] = 64;
	ld	hl, #_titlePosL
	ld	a, #0x40
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:68: titlePosL[1] -= 8;
	ld	hl, #(_titlePosL + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_titlePosL + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:69: titlePosR[0] = 104;
	ld	hl, #_titlePosR
	ld	a, #0x68
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:70: titlePosR[1] = titlePosL[1];
	ld	hl, #(_titlePosR + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:71: titleIndex--;
	ld	hl, #_titleIndex
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00118$
00117$:
;func/titleScreen.c:73: else if(titleIndex == 2){
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;func/titleScreen.c:74: titlePosL[0] = 40;
	ld	hl, #_titlePosL
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:75: titlePosL[1] -= 8;
	ld	hl, #(_titlePosL + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_titlePosL + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:76: titlePosR[0] = 136;
	ld	hl, #_titlePosR
	ld	a, #0x88
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:77: titlePosR[1] = titlePosL[1];
	ld	hl, #(_titlePosR + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:78: titleIndex--;
	ld	hl, #_titleIndex
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00118$
00114$:
;func/titleScreen.c:80: else if(titleIndex == 3){
	ld	a, e
	or	a, a
	jr	Z, 00118$
;func/titleScreen.c:81: titlePosL[0] = 48;
	ld	hl, #_titlePosL
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:82: titlePosL[1] -= 8;
	ld	hl, #(_titlePosL + 2)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	hl, #(_titlePosL + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:83: titlePosR[0] = 120;
	ld	hl, #_titlePosR
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;func/titleScreen.c:84: titlePosR[1] = titlePosL[1];
	ld	hl, #(_titlePosR + 2)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/titleScreen.c:85: titleIndex--;
	ld	hl, #_titleIndex
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00118$:
;func/titleScreen.c:87: move_sprite(20, titlePosL[0], titlePosL[1]);
	ld	a, (#(_titlePosL + 2) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_titlePosL
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+80
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;func/titleScreen.c:88: move_sprite(21, titlePosR[0], titlePosR[1]);
	ld	hl, #(_titlePosR + 2)
	ld	b, (hl)
	ld	hl, #_titlePosR
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 84)
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;func/titleScreen.c:89: waitpadup();
	call	_waitpadup
;func/titleScreen.c:90: break;
	jp	00126$
;func/titleScreen.c:91: case J_A:
00119$:
;func/titleScreen.c:92: if(titleIndex == 0){
	ld	hl, #_titleIndex + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00123$
;func/titleScreen.c:93: gameStart = 1;
	ld	hl, #_gameStart
	ld	(hl), #0x01
;func/titleScreen.c:94: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;/opt/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+84
;/opt/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;func/titleScreen.c:95: move_sprite(21, 0, 0);
	jr	00124$
00123$:
;func/titleScreen.c:97: else if(titleIndex == 3){
	ld	a, e
	or	a, a
	jr	Z, 00124$
;func/titleScreen.c:99: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:100: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;func/titleScreen.c:101: nameInputMenu = 1;
	ld	hl, #_nameInputMenu
	ld	(hl), #0x01
;func/titleScreen.c:102: nameInput();
	call	_nameInput
00124$:
;func/titleScreen.c:104: waitpadup();
	call	_waitpadup
;func/titleScreen.c:106: }
	jp	00126$
00138$:
;func/titleScreen.c:108: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
