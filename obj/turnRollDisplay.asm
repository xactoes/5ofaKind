;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module turnRollDisplay
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _turnRollDisplay
	.globl _turnDisplay
	.globl _rollDisplay
	.globl _bcd2text
	.globl _bcd_sub
	.globl _uint2bcd
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
	.globl _wait_vbl_done
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
;func/turnRollDisplay.c:12: void rollDisplay(){
;	---------------------------------
; Function rollDisplay
; ---------------------------------
_rollDisplay::
;func/turnRollDisplay.c:13: len = 0;
	xor	a, a
	ld	hl, #_len
	ld	(hl+), a
	ld	(hl), a
;func/turnRollDisplay.c:14: bcd_sub(&rollBCD, &rollBCD);
	ld	de, #_rollBCD
	push	de
	push	de
	call	_bcd_sub
	add	sp, #4
;func/turnRollDisplay.c:15: for(i = 0; i != 10; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00106$:
;func/turnRollDisplay.c:16: buf[i] = 0;
	ld	a, #<(_buf)
	ld	hl, #_i
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, #>(_buf)
	adc	a, (hl)
;func/turnRollDisplay.c:15: for(i = 0; i != 10; i++){
	dec	hl
	ld	b, a
	xor	a, a
	ld	(bc), a
	inc	(hl)
	jr	NZ, 00130$
	inc	hl
	inc	(hl)
00130$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	NZ, 00106$
;func/turnRollDisplay.c:18: if(rollsLeft == 3 && turn != 1) return;
	ld	hl, #_rollsLeft
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	jr	NZ, 00103$
	ld	hl, #_turn
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	ret	NZ
00103$:
;func/turnRollDisplay.c:20: uint2bcd(rollsLeft, &rollBCD);
	ld	de, #_rollBCD
	ld	hl, #_rollsLeft
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
;func/turnRollDisplay.c:21: len = bcd2text(&rollBCD, 0x10, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_rollBCD
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	a, e
	ld	(hl+), a
;func/turnRollDisplay.c:22: set_bkg_tiles(11, 5, len, 1, buf);
	ld	a, #0x00
	ld	(hl-), a
	ld	bc, #_buf
	ld	a, (hl)
	push	bc
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x05
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;func/turnRollDisplay.c:25: set_bkg_tile_xy(11, 5, 0x2C); // L
	ld	hl, #0x2c05
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:26: set_bkg_tile_xy(12, 5, 0x45); // e
	ld	hl, #0x4505
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:27: set_bkg_tile_xy(13, 5, 0x46); // f
	ld	hl, #0x4605
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:28: set_bkg_tile_xy(14, 5, 0x54); // t
	ld	hl, #0x5405
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:29: set_bkg_tile_xy(15, 5, 0x1A); // :
	ld	hl, #0x1a05
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:30: set_bkg_tile_xy(16, 5, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x05
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:31: set_bkg_tile_xy(17, 5, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x05
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:33: }
	ret
;func/turnRollDisplay.c:36: void turnDisplay(){
;	---------------------------------
; Function turnDisplay
; ---------------------------------
_turnDisplay::
;func/turnRollDisplay.c:37: len = 0;
	xor	a, a
	ld	hl, #_len
	ld	(hl+), a
	ld	(hl), a
;func/turnRollDisplay.c:38: bcd_sub(&turnBCD, &turnBCD);
	ld	de, #_turnBCD
	push	de
	push	de
	call	_bcd_sub
	add	sp, #4
;func/turnRollDisplay.c:39: for(i = 0; i != 10; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00102$:
;func/turnRollDisplay.c:40: buf[i] = 0;
	ld	a, #<(_buf)
	ld	hl, #_i
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, #>(_buf)
	adc	a, (hl)
;func/turnRollDisplay.c:39: for(i = 0; i != 10; i++){
	dec	hl
	ld	b, a
	xor	a, a
	ld	(bc), a
	inc	(hl)
	jr	NZ, 00116$
	inc	hl
	inc	(hl)
00116$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	NZ, 00102$
;func/turnRollDisplay.c:42: uint2bcd(turn, &turnBCD);
	ld	hl, #_turn
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_turnBCD
	push	de
	push	bc
	call	_uint2bcd
	add	sp, #4
;func/turnRollDisplay.c:43: len = bcd2text(&turnBCD, 0x10, buf);
	ld	de, #_buf
	push	de
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_turnBCD
	push	de
	call	_bcd2text
	add	sp, #5
	ld	hl, #_len
	ld	a, e
	ld	(hl+), a
;func/turnRollDisplay.c:44: set_bkg_tiles(2, 5, len, 1, buf);
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
	ld	l, #0x05
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;func/turnRollDisplay.c:47: set_bkg_tile_xy(2, 5, 0x34); // T
	ld	hl, #0x3405
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:48: set_bkg_tile_xy(3, 5, 0x55); // u
	ld	hl, #0x5505
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:49: set_bkg_tile_xy(4, 5, 0x52); // r
	ld	hl, #0x5205
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:50: set_bkg_tile_xy(5, 5, 0x4E); // n
	ld	hl, #0x4e05
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:51: set_bkg_tile_xy(6, 5, 0x1A); // :
	ld	hl, #0x1a05
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:52: set_bkg_tile_xy(7, 5, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x05
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:53: set_bkg_tile_xy(8, 5, 0x00); // blank
	xor	a, a
	ld	h, a
	ld	l, #0x05
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/turnRollDisplay.c:54: }
	ret
;func/turnRollDisplay.c:57: void turnRollDisplay(){
;	---------------------------------
; Function turnRollDisplay
; ---------------------------------
_turnRollDisplay::
;func/turnRollDisplay.c:58: rollDisplay();
	call	_rollDisplay
;func/turnRollDisplay.c:59: turnDisplay();
	call	_turnDisplay
;func/turnRollDisplay.c:60: wait_vbl_done();
;func/turnRollDisplay.c:61: }
	jp	_wait_vbl_done
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
