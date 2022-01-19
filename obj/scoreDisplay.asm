;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module scoreDisplay
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scoreDisplay
	.globl _setScoreTotal
	.globl _setScoreLower
	.globl _setScoreUpper
	.globl _printf
	.globl _bcd2text
	.globl _bcd_sub
	.globl _bcd_add
	.globl _uint2bcd
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
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
;func/scoreDisplay.c:8: void setScoreUpper(){
;	---------------------------------
; Function setScoreUpper
; ---------------------------------
_setScoreUpper::
	add	sp, #-6
;func/scoreDisplay.c:9: len = 0;
	xor	a, a
	ld	hl, #_len
	ld	(hl+), a
	ld	(hl), a
;func/scoreDisplay.c:10: uint2bcd(63, &compareBCD);
	ld	de, #_compareBCD
	push	de
	ld	de, #0x003f
	push	de
	call	_uint2bcd
	add	sp, #4
;func/scoreDisplay.c:12: bcd_sub(&upperScoreBuf, &upperScoreBuf);
	ld	de, #_upperScoreBuf
	push	de
	push	de
	call	_bcd_sub
	add	sp, #4
;func/scoreDisplay.c:13: for(i = 0; i != 10; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00128$:
;func/scoreDisplay.c:14: buf[i] = 0;
	ld	a, #<(_buf)
	ld	hl, #_i
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, #>(_buf)
	adc	a, (hl)
;func/scoreDisplay.c:13: for(i = 0; i != 10; i++){
	dec	hl
	ld	b, a
	xor	a, a
	ld	(bc), a
	inc	(hl)
	jr	NZ, 00222$
	inc	hl
	inc	(hl)
00222$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	NZ, 00128$
;func/scoreDisplay.c:16: if(cursorIndex >= 8 && cursorIndex <= 10 || cursorIndex >= 16 && cursorIndex <= 18){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x10
	ld	a, (hl)
	sbc	a, #0x00
	ld	a, #0x00
	rla
	ldhl	sp,	#0
	ld	(hl), a
	ld	hl, #_cursorIndex
	ld	a, #0x12
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x08
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00124$
	dec	hl
	ld	a, #0x0a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00120$
00124$:
	ldhl	sp,	#0
	bit	0, (hl)
	jp	NZ, 00121$
	inc	hl
	bit	0, (hl)
	jp	NZ, 00121$
00120$:
;func/scoreDisplay.c:17: if(scorecardSummed[cursorIndex - 8] != scorecard[cursorIndex - 8]){
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	sla	c
	rl	b
	ld	hl, #_scorecardSummed
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_scorecard
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00226$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00121$
00226$:
;func/scoreDisplay.c:18: if(scorecard[cursorIndex - 8] != 255 && scorecard[cursorIndex - 8] != 0){
	ld	a, c
	inc	a
	or	a, b
	jp	Z,00121$
	ld	a, b
	or	a, c
	jp	Z, 00121$
;func/scoreDisplay.c:20: if(cursorIndex <= 11){
	ld	hl, #_cursorIndex
	ld	a, #0x0b
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00106$
;func/scoreDisplay.c:22: scorecardSummed[cursorIndex - 8] = scorecard[cursorIndex - 8];
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/scoreDisplay.c:24: uint2bcd(scorecardSummed[cursorIndex - 8], &upperScoreBuf);
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_scorecardSummed
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_upperScoreBuf
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
	jr	00107$
00106$:
;func/scoreDisplay.c:29: else if(cursorIndex >= 16 && cursorIndex <= 18){
	ldhl	sp,	#0
	bit	0, (hl)
	jr	NZ, 00107$
	inc	hl
	bit	0, (hl)
	jr	NZ, 00107$
;func/scoreDisplay.c:31: scorecardSummed[cursorIndex - 8] = scorecard[cursorIndex - 8];
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/scoreDisplay.c:33: uint2bcd(scorecardSummed[cursorIndex - 8], &upperScoreBuf);
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_scorecardSummed
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_upperScoreBuf
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
00107$:
;func/scoreDisplay.c:37: bcd_sub(&numOptBCD, &numOptBCD);
	ld	de, #_numOptBCD
	push	de
	push	de
	call	_bcd_sub
	add	sp, #4
;func/scoreDisplay.c:38: uint2bcd(scorecard[cursorIndex - 8], &numOptBCD);
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_scorecard
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_numOptBCD
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
;func/scoreDisplay.c:39: len = bcd2text(&numOptBCD, 0x10, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_numOptBCD
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	a, e
	ld	(hl+), a
;func/scoreDisplay.c:43: set_bkg_tiles(2, 22, len, 1, buf);
	xor	a, a
	ld	(hl-), a
	ld	b, (hl)
;func/scoreDisplay.c:40: switch(cursorIndex){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x08
	or	a, (hl)
	jr	Z, 00108$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x09
	or	a, (hl)
	jp	Z,00109$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jp	Z,00110$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x10
	or	a, (hl)
	jp	Z,00111$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x11
	or	a, (hl)
	jp	Z,00112$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x12
	or	a, (hl)
	jp	Z,00113$
	jp	00121$
;func/scoreDisplay.c:42: case 8:
00108$:
;func/scoreDisplay.c:43: set_bkg_tiles(2, 22, len, 1, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x1602
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:44: set_bkg_tile_xy(2, 22, 0x11); // 1
	ld	hl, #0x1116
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:45: set_bkg_tile_xy(3, 22, 0x07); // '
	ld	hl, #0x716
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:46: set_bkg_tile_xy(4, 22, 0x53); // s
	ld	hl, #0x5316
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:47: set_bkg_tile_xy(5, 22, 0x1A); // blank
	ld	hl, #0x1a16
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:48: set_bkg_tile_xy(6, 22, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x16
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:49: set_bkg_tile_xy(7, 22, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x16
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:50: break;
	jp	00121$
;func/scoreDisplay.c:52: case 9:
00109$:
;func/scoreDisplay.c:53: set_bkg_tiles(2, 23, len, 1, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x1702
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:54: set_bkg_tile_xy(2, 23, 0x12); // 2
	ld	hl, #0x1217
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:55: set_bkg_tile_xy(3, 23, 0x07); // '
	ld	hl, #0x717
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:56: set_bkg_tile_xy(4, 23, 0x53); // s
	ld	hl, #0x5317
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:57: set_bkg_tile_xy(5, 23, 0x1A); // blank
	ld	hl, #0x1a17
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:58: set_bkg_tile_xy(6, 23, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x17
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:59: set_bkg_tile_xy(7, 23, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x17
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:60: break;
	jp	00121$
;func/scoreDisplay.c:62: case 10:
00110$:
;func/scoreDisplay.c:63: set_bkg_tiles(2, 24, len, 1, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x1802
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:64: set_bkg_tile_xy(2, 24, 0x13); // 3
	ld	hl, #0x1318
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:65: set_bkg_tile_xy(3, 24, 0x07); // '
	ld	hl, #0x718
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:66: set_bkg_tile_xy(4, 24, 0x53); // s
	ld	hl, #0x5318
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:67: set_bkg_tile_xy(5, 24, 0x1A); // blank
	ld	hl, #0x1a18
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:68: set_bkg_tile_xy(6, 24, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x18
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:69: set_bkg_tile_xy(7, 24, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x18
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:70: break;
	jp	00121$
;func/scoreDisplay.c:72: case 16:
00111$:
;func/scoreDisplay.c:73: set_bkg_tiles(11, 22, len, 1, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x160b
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:74: set_bkg_tile_xy(11, 22, 0x14); // 4
	ld	hl, #0x1416
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:75: set_bkg_tile_xy(12, 22, 0x07); // '
	ld	hl, #0x716
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:76: set_bkg_tile_xy(13, 22, 0x53); // s
	ld	hl, #0x5316
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:77: set_bkg_tile_xy(14, 22, 0x1A); // blank
	ld	hl, #0x1a16
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:78: set_bkg_tile_xy(15, 22, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x16
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:79: set_bkg_tile_xy(16, 22, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x16
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:80: break;
	jp	00121$
;func/scoreDisplay.c:82: case 17:
00112$:
;func/scoreDisplay.c:83: set_bkg_tiles(11, 23, len, 1, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x170b
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:84: set_bkg_tile_xy(11, 23, 0x15); // 5
	ld	hl, #0x1517
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:85: set_bkg_tile_xy(12, 23, 0x07); // '
	ld	hl, #0x717
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:86: set_bkg_tile_xy(13, 23, 0x53); // s
	ld	hl, #0x5317
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:87: set_bkg_tile_xy(14, 23, 0x1A); // blank
	ld	hl, #0x1a17
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:88: set_bkg_tile_xy(15, 23, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x17
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:89: set_bkg_tile_xy(16, 23, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x17
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:90: break;
	jr	00121$
;func/scoreDisplay.c:92: case 18:
00113$:
;func/scoreDisplay.c:93: set_bkg_tiles(11, 24, len, 1, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0x180b
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:94: set_bkg_tile_xy(11, 24, 0x16); // 6
	ld	hl, #0x1618
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:95: set_bkg_tile_xy(12, 24, 0x07); // '
	ld	hl, #0x718
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:96: set_bkg_tile_xy(13, 24, 0x53); // s
	ld	hl, #0x5318
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:97: set_bkg_tile_xy(14, 24, 0x1A); // blank
	ld	hl, #0x1a18
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:98: set_bkg_tile_xy(15, 24, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x18
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:99: set_bkg_tile_xy(16, 24, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x18
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:101: }
00121$:
;func/scoreDisplay.c:106: bcd_add(&upperScoreBCD, &upperScoreBuf);
	ld	de, #_upperScoreBuf
	push	de
	ld	de, #_upperScoreBCD
	push	de
	call	_bcd_add
	add	sp, #4
;func/scoreDisplay.c:113: if(&upperScoreBCD >= &compareBCD && scorecard[14] == 255){
	ld	a, #<(_upperScoreBCD)
	sub	a, #<(_compareBCD)
	ld	a, #>(_upperScoreBCD)
	sbc	a, #>(_compareBCD)
	jr	C, 00130$
	ld	hl, #(_scorecard + 28)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	inc	a
	or	a, b
	jr	NZ, 00130$
;func/scoreDisplay.c:114: scorecard[14] = 35;
	ld	hl, #(_scorecard + 28)
	ld	a, #0x23
	ld	(hl+), a
	ld	(hl), #0x00
;func/scoreDisplay.c:115: scorecardSummed[14] = scorecard[14];
	ld	hl, #(_scorecard + 28)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_scorecardSummed + 28)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/scoreDisplay.c:116: uint2bcd(scorecard[14], &upperScoreBuf);
	ld	hl, #(_scorecard + 28)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_upperScoreBuf
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
;func/scoreDisplay.c:117: bcd_add(&upperScoreBCD, &upperScoreBuf);
	ld	de, #_upperScoreBuf
	push	de
	ld	de, #_upperScoreBCD
	push	de
	call	_bcd_add
	add	sp, #4
00130$:
;func/scoreDisplay.c:119: }
	add	sp, #6
	ret
;func/scoreDisplay.c:121: void setScoreLower(){
;	---------------------------------
; Function setScoreLower
; ---------------------------------
_setScoreLower::
	add	sp, #-5
;func/scoreDisplay.c:122: len = 0;
	xor	a, a
	ld	hl, #_len
	ld	(hl+), a
	ld	(hl), a
;func/scoreDisplay.c:123: bcd_sub(&lowerScoreBuf, &lowerScoreBuf);
	ld	de, #_lowerScoreBuf
	push	de
	push	de
	call	_bcd_sub
	add	sp, #4
;func/scoreDisplay.c:124: for(i = 0; i != 10; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00127$:
;func/scoreDisplay.c:125: buf[i] = 0;
	ld	a, #<(_buf)
	ld	hl, #_i
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, #>(_buf)
	adc	a, (hl)
;func/scoreDisplay.c:124: for(i = 0; i != 10; i++){
	dec	hl
	ld	b, a
	xor	a, a
	ld	(bc), a
	inc	(hl)
	jr	NZ, 00202$
	inc	hl
	inc	(hl)
00202$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	NZ, 00127$
;func/scoreDisplay.c:127: if(cursorIndex <= 21){
	ld	hl, #_cursorIndex
	ld	a, #0x15
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	rla
	ldhl	sp,	#0
	ld	(hl), a
	bit	0, (hl)
	jp	NZ, 00126$
;func/scoreDisplay.c:128: if(scorecardSummed[cursorIndex - 8] != scorecard[cursorIndex - 8]){
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, #_scorecardSummed
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_scorecard
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00205$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00126$
00205$:
;func/scoreDisplay.c:129: if(scorecard[cursorIndex - 8] != 255 && scorecard[cursorIndex - 8] != 0){
	ld	a, c
	inc	a
	or	a, b
	jp	Z,00126$
	ld	a, b
	or	a, c
	jp	Z, 00126$
;func/scoreDisplay.c:131: if(cursorIndex >= 11 && cursorIndex <= 14){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0b
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00115$
	dec	hl
	ld	a, #0x0e
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00115$
;func/scoreDisplay.c:133: scorecardSummed[cursorIndex - 8] = scorecard[cursorIndex - 8];
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/scoreDisplay.c:134: uint2bcd(scorecard[cursorIndex - 8], &lowerScoreBuf);
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_scorecard
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_lowerScoreBuf
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
	jp	00126$
00115$:
;func/scoreDisplay.c:137: else if(cursorIndex >= 19 && cursorIndex <= 21){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x13
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00111$
	ldhl	sp,	#0
	bit	0, (hl)
	jr	NZ, 00111$
;func/scoreDisplay.c:139: scorecardSummed[cursorIndex - 8] = scorecard[cursorIndex - 8];
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/scoreDisplay.c:142: uint2bcd(scorecard[cursorIndex - 8], &lowerScoreBuf);
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_scorecard
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_lowerScoreBuf
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
	jr	00126$
00111$:
;func/scoreDisplay.c:145: else if(cursorIndex == 15){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0f
	or	a, (hl)
	jr	NZ, 00126$
;func/scoreDisplay.c:146: if(scorecard[7] < 1000){
	ld	hl, #_scorecard + 14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	sbc	a, #0x03
	jr	NC, 00106$
;func/scoreDisplay.c:147: scorecardSummed[cursorIndex - 8] = 100;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x64
	ld	(hl+), a
	ld	(hl), #0x00
;func/scoreDisplay.c:148: uint2bcd(scorecardSummed[cursorIndex - 8], &lowerScoreBuf);
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_scorecardSummed
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_lowerScoreBuf
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
	jr	00126$
00106$:
;func/scoreDisplay.c:150: else if(scorecard[7] == 1000 && bonus5 == 0){
	ld	a, c
	sub	a, #0xe8
	jr	NZ, 00126$
	ld	a, b
	sub	a, #0x03
	jr	NZ, 00126$
	ld	a, (#_bonus5)
	or	a, a
	jr	NZ, 00126$
;func/scoreDisplay.c:151: scorecardSummed[cursorIndex - 8] = 100;
	ldhl	sp,	#1
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x64
	ld	(hl+), a
	ld	(hl), #0x00
;func/scoreDisplay.c:152: uint2bcd(scorecardSummed[cursorIndex - 8], &lowerScoreBuf);
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_scorecardSummed
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_lowerScoreBuf
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
;func/scoreDisplay.c:153: bonus5 = 1;
	ld	hl, #_bonus5
	ld	(hl), #0x01
;func/scoreDisplay.c:159: scorecardSummed[7] == scorecard[7];
00126$:
;func/scoreDisplay.c:165: bcd_add(&lowerScoreBCD, &lowerScoreBuf);
	ld	de, #_lowerScoreBuf
	push	de
	ld	de, #_lowerScoreBCD
	push	de
	call	_bcd_add
;func/scoreDisplay.c:166: }
	add	sp, #9
	ret
;func/scoreDisplay.c:169: void setScoreTotal(){
;	---------------------------------
; Function setScoreTotal
; ---------------------------------
_setScoreTotal::
;func/scoreDisplay.c:171: bcd_sub(&totalScoreAdd, &totalScoreAdd);
	ld	de, #_totalScoreAdd
	push	de
	push	de
	call	_bcd_sub
	add	sp, #4
;func/scoreDisplay.c:173: bcd_add(&totalScoreAdd, &upperScoreBCD);
	ld	de, #_upperScoreBCD
	push	de
	ld	de, #_totalScoreAdd
	push	de
	call	_bcd_add
	add	sp, #4
;func/scoreDisplay.c:175: bcd_add(&totalScoreAdd, &lowerScoreBCD);
	ld	de, #_lowerScoreBCD
	push	de
	ld	de, #_totalScoreAdd
	push	de
	call	_bcd_add
	add	sp, #4
;func/scoreDisplay.c:176: if(&totalScoreBCD == &totalScoreAdd) return;
	ld	a, #<(_totalScoreAdd)
	sub	a, #<(_totalScoreBCD)
	jr	NZ, 00105$
	ld	a, #>(_totalScoreAdd)
	sub	a, #>(_totalScoreBCD)
	ret	Z
	jr	00105$
00105$:
;func/scoreDisplay.c:177: else if(&totalScoreBCD > &totalScoreAdd){
	ld	a, #<(_totalScoreAdd)
	sub	a, #<(_totalScoreBCD)
	ld	a, #>(_totalScoreAdd)
	sbc	a, #>(_totalScoreBCD)
	jr	NC, 00102$
;func/scoreDisplay.c:178: printf("Scoring Error");
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
	ret
00102$:
;func/scoreDisplay.c:181: bcd_sub(&totalScoreBCD, &totalScoreBCD);
	ld	de, #_totalScoreBCD
	push	de
	push	de
	call	_bcd_sub
	add	sp, #4
;func/scoreDisplay.c:182: bcd_add(&totalScoreBCD, &totalScoreAdd);
	ld	de, #_totalScoreAdd
	push	de
	ld	de, #_totalScoreBCD
	push	de
	call	_bcd_add
	add	sp, #4
;func/scoreDisplay.c:183: len = bcd2text(&totalScoreBCD, 0x10, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_totalScoreBCD
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	a, e
	ld	(hl+), a
	ld	(hl), #0x00
;func/scoreDisplay.c:185: }
	ret
___str_0:
	.ascii "Scoring Error"
	.db 0x00
;func/scoreDisplay.c:188: void scoreDisplay(){
;	---------------------------------
; Function scoreDisplay
; ---------------------------------
_scoreDisplay::
;func/scoreDisplay.c:190: if(viewMode == 1){
	ld	a, (#_viewMode)
	dec	a
	jp	NZ,00102$
;func/scoreDisplay.c:194: len = bcd2text(&upperScoreBCD, 0x10, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_upperScoreBCD
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	a, e
	ld	(hl+), a
;func/scoreDisplay.c:195: set_bkg_tiles(11, 26, len, 1, buf);
	ld	a, #0x00
	ld	(hl-), a
	ld	a, (hl)
	ld	de, #_buf
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x1a
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:196: set_bkg_tile_xy(11, 26, 0x52); // r
	ld	hl, #0x521a
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:197: set_bkg_tile_xy(12, 26, 0x1A); // :
	ld	hl, #0x1a1a
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:198: set_bkg_tile_xy(13, 26, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x1a
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:199: set_bkg_tile_xy(14, 26, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x1a
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:200: set_bkg_tile_xy(15, 26, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x1a
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:204: len = bcd2text(&lowerScoreBCD, 0x10, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_lowerScoreBCD
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	a, e
	ld	(hl+), a
;func/scoreDisplay.c:205: set_bkg_tiles(11, 33, len, 1, buf);
	ld	a, #0x00
	ld	(hl-), a
	ld	a, (hl)
	ld	de, #_buf
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x21
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:206: set_bkg_tile_xy(11, 33, 0x52); // r
	ld	hl, #0x5221
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:207: set_bkg_tile_xy(12, 33, 0x1A); // :
	ld	hl, #0x1a21
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:208: set_bkg_tile_xy(13, 33, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x21
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:211: setScoreTotal();
	call	_setScoreTotal
;func/scoreDisplay.c:212: set_bkg_tiles(11, 34, len, 1, buf);
	ld	hl, #_len
	ld	a, (hl)
	ld	de, #_buf
	push	de
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x22
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:213: set_bkg_tile_xy(11, 34, 0x4C); // l
	ld	hl, #0x4c22
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:214: set_bkg_tile_xy(12, 34, 0x1A); // :
	ld	hl, #0x1a22
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:215: set_bkg_tile_xy(13, 34, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x22
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	ret
00102$:
;func/scoreDisplay.c:219: setScoreTotal();
	call	_setScoreTotal
;func/scoreDisplay.c:220: set_bkg_tiles(11, 2, len, 1, buf);
	ld	bc, #_buf+0
	ld	hl, #_len
	ld	a, (hl)
	push	bc
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;func/scoreDisplay.c:221: set_bkg_tile_xy(11, 2, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:222: set_bkg_tile_xy(12, 2, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:223: set_bkg_tile_xy(13, 2, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/scoreDisplay.c:226: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
