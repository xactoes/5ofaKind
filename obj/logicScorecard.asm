;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module logicScorecard
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _logicScorecard
	.globl _bonusCheck
	.globl _logicLower
	.globl _logicUpper
	.globl _sortDice
	.globl _scoreDisplay
	.globl _setScoreLower
	.globl _setScoreUpper
	.globl _playView
	.globl _set_bkg_tile_xy
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
;func/logicScorecard.c:16: void logicUpper(){
;	---------------------------------
; Function logicUpper
; ---------------------------------
_logicUpper::
	dec	sp
	dec	sp
;func/logicScorecard.c:17: unsigned int valueToCheck = 0;
	ld	bc, #0x0000
;func/logicScorecard.c:18: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:19: switch(cursorIndex){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x08
	or	a, (hl)
	jr	Z, 00101$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x09
	or	a, (hl)
	jr	Z, 00102$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0a
	or	a, (hl)
	jr	Z, 00103$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x10
	or	a, (hl)
	jr	Z, 00104$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x11
	or	a, (hl)
	jr	Z, 00105$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x12
	or	a, (hl)
	jr	Z, 00106$
	jr	00107$
;func/logicScorecard.c:20: case 8:
00101$:
;func/logicScorecard.c:21: valueToCheck = 1;
	ld	bc, #0x0001
;func/logicScorecard.c:22: break;
	jr	00107$
;func/logicScorecard.c:23: case 9:
00102$:
;func/logicScorecard.c:24: valueToCheck = 2;
	ld	bc, #0x0002
;func/logicScorecard.c:25: break;
	jr	00107$
;func/logicScorecard.c:26: case 10:
00103$:
;func/logicScorecard.c:27: valueToCheck = 3;
	ld	bc, #0x0003
;func/logicScorecard.c:28: break;
	jr	00107$
;func/logicScorecard.c:29: case 16:
00104$:
;func/logicScorecard.c:30: valueToCheck = 4;
	ld	bc, #0x0004
;func/logicScorecard.c:31: break;
	jr	00107$
;func/logicScorecard.c:32: case 17:
00105$:
;func/logicScorecard.c:33: valueToCheck = 5;
	ld	bc, #0x0005
;func/logicScorecard.c:34: break;
	jr	00107$
;func/logicScorecard.c:35: case 18:
00106$:
;func/logicScorecard.c:36: valueToCheck = 6;
	ld	bc, #0x0006
;func/logicScorecard.c:38: }
00107$:
;func/logicScorecard.c:39: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00111$:
;func/logicScorecard.c:40: if(diceValues[i] == valueToCheck){
	ld	hl, #_i
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sla	e
	rl	d
	ld	hl, #_diceValues
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00112$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00112$
;func/logicScorecard.c:41: scoreBuf += diceValues[i];
	ld	hl, #_scoreBuf + 1
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_scoreBuf
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00112$:
;func/logicScorecard.c:39: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00169$
	inc	hl
	inc	(hl)
00169$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00111$
;func/logicScorecard.c:44: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;func/logicScorecard.c:45: }
	inc	sp
	inc	sp
	ret
;func/logicScorecard.c:48: void logicLower(){
;	---------------------------------
; Function logicLower
; ---------------------------------
_logicLower::
	add	sp, #-9
;func/logicScorecard.c:49: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:50: sortDice();
	call	_sortDice
;func/logicScorecard.c:58: scorecard[cursorIndex - 8] = scoreBuf;
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	c, a
	rlca
	sbc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#2
	ld	(hl), c
	inc	hl
	ld	(hl), a
;func/logicScorecard.c:51: switch(cursorIndex){
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0b
	or	a, (hl)
	jr	Z, 00101$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0c
	or	a, (hl)
	jp	Z,00117$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0d
	or	a, (hl)
	jp	Z,00130$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0e
	or	a, (hl)
	jp	Z,00164$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0f
	or	a, (hl)
	jp	Z,00173$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x13
	or	a, (hl)
	jp	Z,00145$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x14
	or	a, (hl)
	jp	Z,00155$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x15
	or	a, (hl)
	jp	Z,00162$
	jp	00203$
;func/logicScorecard.c:53: case 11:
00101$:
;func/logicScorecard.c:54: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_diceValues + 2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00524$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00525$
00524$:
	xor	a, a
00525$:
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00114$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00114$
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;func/logicScorecard.c:55: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00187$:
;func/logicScorecard.c:56: scoreBuf += diceValues[i];
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scoreBuf
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;func/logicScorecard.c:55: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00529$
	inc	hl
	inc	(hl)
00529$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00187$
;func/logicScorecard.c:58: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00203$
00114$:
;func/logicScorecard.c:60: else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
	ld	hl, #_diceValues + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00532$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00533$
00532$:
	xor	a, a
00533$:
	ld	e, a
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	ld	a, e
	or	a, a
	jr	Z, 00110$
;func/logicScorecard.c:61: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00189$:
;func/logicScorecard.c:62: scoreBuf += diceValues[i];
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scoreBuf
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;func/logicScorecard.c:61: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00535$
	inc	hl
	inc	(hl)
00535$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00189$
;func/logicScorecard.c:64: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00203$
00110$:
;func/logicScorecard.c:66: else if(diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
	ld	a, e
	or	a, a
	jr	Z, 00106$
	ld	hl, #_diceValues + 8
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jr	NZ, 00106$
	ld	a, h
	sub	a, b
	jr	NZ, 00106$
;func/logicScorecard.c:67: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00191$:
;func/logicScorecard.c:68: scoreBuf += diceValues[i];
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scoreBuf
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;func/logicScorecard.c:67: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00541$
	inc	hl
	inc	(hl)
00541$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00191$
;func/logicScorecard.c:70: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00203$
00106$:
;func/logicScorecard.c:73: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:74: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:76: break;
	jp	00203$
;func/logicScorecard.c:78: case 12:
00117$:
;func/logicScorecard.c:79: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_diceValues + 2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00544$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00545$
00544$:
	xor	a, a
00545$:
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00126$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00126$
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00126$
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00126$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00126$
;func/logicScorecard.c:80: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00193$:
;func/logicScorecard.c:81: scoreBuf += diceValues[i];
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scoreBuf
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;func/logicScorecard.c:80: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00551$
	inc	hl
	inc	(hl)
00551$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00193$
;func/logicScorecard.c:83: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00203$
00126$:
;func/logicScorecard.c:85: else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00121$
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00121$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00121$
	ld	hl, #_diceValues + 8
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jr	NZ, 00121$
	ld	a, h
	sub	a, b
	jr	NZ, 00121$
;func/logicScorecard.c:86: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00195$:
;func/logicScorecard.c:87: scoreBuf += diceValues[i];
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scoreBuf
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;func/logicScorecard.c:86: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00559$
	inc	hl
	inc	(hl)
00559$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00195$
;func/logicScorecard.c:89: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00203$
00121$:
;func/logicScorecard.c:92: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:93: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:95: break;
	jp	00203$
;func/logicScorecard.c:97: case 13:
00130$:
;func/logicScorecard.c:98: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_diceValues + 2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00562$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00563$
00562$:
	xor	a, a
00563$:
	ldhl	sp,	#6
;func/logicScorecard.c:99: if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
;func/logicScorecard.c:98: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
	ld	(hl), a
	or	a, a
	jr	Z, 00142$
	inc	hl
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00142$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00142$
;func/logicScorecard.c:99: if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00566$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00203$
00566$:
	ld	hl, #(_diceValues + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jp	NZ,00203$
	ld	a, h
	sub	a, b
	jp	NZ,00203$
;func/logicScorecard.c:100: scoreBuf = 25;
	ld	hl, #_scoreBuf
	ld	a, #0x19
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:102: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x19
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:104: set_bkg_tile_xy(8, 30, 0x12); // 2
	ld	hl, #0x121e
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:105: set_bkg_tile_xy(9, 30, 0x15); // 5
	ld	hl, #0x151e
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00142$:
;func/logicScorecard.c:108: else if(diceValues[0] == diceValues[1]){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00139$
;func/logicScorecard.c:109: if(diceValues[1] != diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
	inc	hl
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00569$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00203$
00569$:
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, c
	jp	NZ,00203$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	NZ,00203$
	ld	hl, #(_diceValues + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jp	NZ,00203$
	ld	a, h
	sub	a, b
	jp	NZ,00203$
;func/logicScorecard.c:110: scoreBuf = 25;
	ld	hl, #_scoreBuf
	ld	a, #0x19
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:112: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x19
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:114: set_bkg_tile_xy(8, 30, 0x12); // 2
	ld	hl, #0x121e
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:115: set_bkg_tile_xy(9, 30, 0x15); // 5
	ld	hl, #0x151e
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00139$:
;func/logicScorecard.c:119: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:120: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:122: break;
	jp	00203$
;func/logicScorecard.c:124: case 19:
00145$:
;func/logicScorecard.c:125: sortDice();
	call	_sortDice
;func/logicScorecard.c:126: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	de, #(_diceValues + 2)
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
;func/logicScorecard.c:58: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_cursorIndex
	ld	c, (hl)
;func/logicScorecard.c:126: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
;func/logicScorecard.c:58: scorecard[cursorIndex - 8] = scoreBuf;
;func/logicScorecard.c:126: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
;func/logicScorecard.c:58: scorecard[cursorIndex - 8] = scoreBuf;
;func/logicScorecard.c:126: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ld	(hl-), a
	ld	a, c
	add	a, #0xf8
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
;func/logicScorecard.c:58: scorecard[cursorIndex - 8] = scoreBuf;
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
;func/logicScorecard.c:126: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00574$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00575$
00574$:
	xor	a, a
00575$:
	ldhl	sp,	#8
	ld	(hl), a
;func/logicScorecard.c:58: scorecard[cursorIndex - 8] = scoreBuf;
	ld	c, e
	ld	b, d
	sla	c
	rl	b
;func/logicScorecard.c:126: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#4
	sub	a, (hl)
	jr	NZ, 00151$
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#5
	sub	a, (hl)
	jr	NZ, 00151$
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00151$
	ld	hl, #(_diceValues + 6) + 1
	ld	a,	(hl-)
;	spillPairReg hl
	ld	e, (hl)
	ld	d, a
	dec	de
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00151$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00151$
;func/logicScorecard.c:127: scoreBuf = 30;
	ld	hl, #_scoreBuf
	ld	a, #0x1e
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:129: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_scorecard
	add	hl, bc
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:131: set_bkg_tile_xy(17, 28, 0x13); // 3
	ld	hl, #0x131c
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:132: set_bkg_tile_xy(18, 28, 0x10); // 0
	ld	hl, #0x101c
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00151$:
;func/logicScorecard.c:134: else if(diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00147$
	ld	hl, #(_diceValues + 6) + 1
	ld	a,	(hl-)
;	spillPairReg hl
	ld	e, (hl)
	ld	d, a
	dec	de
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00147$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00147$
;func/logicScorecard.c:135: scoreBuf = 30;
	ld	hl, #_scoreBuf
	ld	a, #0x1e
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:137: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_scorecard
	add	hl, bc
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:139: set_bkg_tile_xy(17, 28, 0x13); // 3
	ld	hl, #0x131c
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:140: set_bkg_tile_xy(18, 28, 0x10); // 0
	ld	hl, #0x101c
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00147$:
;func/logicScorecard.c:143: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:144: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_scorecard
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:146: break;
	jp	00203$
;func/logicScorecard.c:148: case 20:
00155$:
;func/logicScorecard.c:149: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	de, #(_diceValues + 2)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	dec	bc
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00157$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00157$
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00157$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00157$
	ld	hl, #_diceValues + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	dec	de
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00157$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00157$
	ld	hl, #_diceValues + 8
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	dec	hl
	ld	a, l
	sub	a, c
	jr	NZ, 00157$
	ld	a, h
	sub	a, b
	jr	NZ, 00157$
;func/logicScorecard.c:150: scoreBuf = 40;
	ld	hl, #_scoreBuf
	ld	a, #0x28
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:152: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x28
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:154: set_bkg_tile_xy(17, 29, 0x14); // 4
	ld	hl, #0x141d
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:155: set_bkg_tile_xy(18, 29, 0x10); // 0
	ld	hl, #0x101d
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00157$:
;func/logicScorecard.c:158: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:159: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:161: break;
	jp	00203$
;func/logicScorecard.c:163: case 21:
00162$:
;func/logicScorecard.c:164: for(i = 0; i < 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00197$:
;func/logicScorecard.c:165: scoreBuf += diceValues[i];
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scoreBuf
	ld	a, (hl)
	add	a, c
	ld	(hl+), a
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;func/logicScorecard.c:166: scorecard[cursorIndex - 8] = scoreBuf;
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
	ld	a, l
	add	a, #<(_scorecard)
	ld	c, a
	ld	a, h
	adc	a, #>(_scorecard)
	ld	b, a
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;func/logicScorecard.c:164: for(i = 0; i < 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00592$
	inc	hl
	inc	(hl)
00592$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00197$
;func/logicScorecard.c:168: break;
	jp	00203$
;func/logicScorecard.c:170: case 14:
00164$:
;func/logicScorecard.c:171: match5 = 0;
	xor	a, a
	ld	hl, #_match5
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:172: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00199$:
;func/logicScorecard.c:173: if(diceValues[i] == diceValues[i + 1]){
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_i)
	inc	a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_diceValues
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jr	NZ, 00200$
	ld	a, h
	sub	a, b
	jr	NZ, 00200$
;func/logicScorecard.c:174: match5++;
	ld	hl, #_match5
	inc	(hl)
	jr	NZ, 00596$
	inc	hl
	inc	(hl)
00596$:
00200$:
;func/logicScorecard.c:172: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00597$
	inc	hl
	inc	(hl)
00597$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00199$
;func/logicScorecard.c:178: if(match5 == 4){
	ld	hl, #_match5
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00171$
;func/logicScorecard.c:180: scoreBuf = 50;
	ld	hl, #_scoreBuf
	ld	a, #0x32
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:181: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x32
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:183: set_bkg_tile_xy(17, 31, 0x15); // 5
	ld	hl, #0x151f
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:184: set_bkg_tile_xy(18, 31, 0x10); // 0
	ld	hl, #0x101f
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00171$:
;func/logicScorecard.c:186: else if(turn == 13){
	ld	hl, #_turn
	ld	a, (hl+)
	sub	a, #0x0d
;func/logicScorecard.c:187: scoreBuf = 0;
	or	a,(hl)
	jp	NZ,00203$
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:188: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:190: break;
	jp	00203$
;func/logicScorecard.c:191: case 15:
00173$:
;func/logicScorecard.c:192: match5 = 0;
	xor	a, a
	ld	hl, #_match5
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:193: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00201$:
;func/logicScorecard.c:194: if(diceValues[i] == diceValues[i + 1]){
	ld	hl, #_i
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_diceValues
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_i)
	inc	a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_diceValues
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jr	NZ, 00202$
	ld	a, h
	sub	a, b
	jr	NZ, 00202$
;func/logicScorecard.c:195: match5++;
	ld	hl, #_match5
	inc	(hl)
	jr	NZ, 00605$
	inc	hl
	inc	(hl)
00605$:
00202$:
;func/logicScorecard.c:193: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00606$
	inc	hl
	inc	(hl)
00606$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00201$
;func/logicScorecard.c:199: if(match5 == 4 && scorecard[6] != 255 && scorecard[6] != 0){
	ld	hl, #_match5
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00203$
	ld	hl, #(_scorecard + 12)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	inc	a
	or	a, b
	jr	Z, 00203$
	ld	a, b
	or	a, c
	jr	Z, 00203$
;func/logicScorecard.c:200: if(scorecard[cursorIndex - 8] < 1000){
	ld	de, #_scorecard
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c,l
	ld	b,h
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, #0xe8
	ld	a, h
	sbc	a, #0x03
	jr	NC, 00203$
;func/logicScorecard.c:202: scoreBuf = 100;
	ld	hl, #_scoreBuf
	ld	a, #0x64
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:203: if(scorecard[cursorIndex - 8] == 255){
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	inc	a
	or	a, h
	jr	NZ, 00178$
;func/logicScorecard.c:204: scorecard[cursorIndex - 8] = scoreBuf;
	ld	a, #0x64
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	jr	00203$
00178$:
;func/logicScorecard.c:207: scorecard[cursorIndex - 8] += scoreBuf;
	ld	de, #0x64
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;func/logicScorecard.c:213: }
00203$:
;func/logicScorecard.c:214: }
	add	sp, #9
	ret
;func/logicScorecard.c:217: void bonusCheck(){
;	---------------------------------
; Function bonusCheck
; ---------------------------------
_bonusCheck::
;func/logicScorecard.c:219: unsigned int bonusCompare = 0;
	ld	bc, #0x0000
;func/logicScorecard.c:220: for(i = 0; i != 15; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00110$:
;func/logicScorecard.c:221: if(i <= 2 || i >= 7 && i <= 10){
	ld	hl, #_i
	ld	a, #0x02
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00105$
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x07
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00111$
	dec	hl
	ld	a, #0x0a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	C, 00111$
00105$:
;func/logicScorecard.c:222: if(scorecard[i] != 255){
	ld	hl, #_i
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sla	e
	rl	d
	ld	hl, #_scorecard
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	inc	a
	or	a, h
	jr	Z, 00102$
;func/logicScorecard.c:223: bonusCompare += scorecard[i];
	add	hl, bc
	ld	c, l
	ld	b, h
00102$:
;func/logicScorecard.c:225: if(bonusCompare >= 63){
	ld	a, c
	sub	a, #0x3f
	ld	a, b
	sbc	a, #0x00
	jr	C, 00111$
;func/logicScorecard.c:226: scorecard[14] = 35;
	ld	hl, #(_scorecard + 28)
	ld	a, #0x23
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:227: set_bkg_tile_xy(17, 25, 0x13); // 3
	ld	hl, #0x1319
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:228: set_bkg_tile_xy(18, 25, 0x15); // 5
	ld	hl, #0x1519
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00111$:
;func/logicScorecard.c:220: for(i = 0; i != 15; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00141$
	inc	hl
	inc	(hl)
00141$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0f
	or	a, (hl)
	jr	NZ, 00110$
;func/logicScorecard.c:232: }
	ret
;func/logicScorecard.c:235: void logicScorecard(){
;	---------------------------------
; Function logicScorecard
; ---------------------------------
_logicScorecard::
;func/logicScorecard.c:237: if(scorecardChangeA == scorecardChangeB){
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ret	NZ
;func/logicScorecard.c:238: scorecardChangeA = 0;
	ld	hl, #_scorecardChangeA
	ld	(hl), #0x00
;func/logicScorecard.c:239: scorecardChangeB = 0;
	ld	hl, #_scorecardChangeB
	ld	(hl), #0x00
;func/logicScorecard.c:240: if(scorecard[cursorIndex - 8] == 255){
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
	ld	a, c
	inc	a
;func/logicScorecard.c:241: for(i = 0; i != 14; i++){
	or	a,b
	jr	NZ, 00111$
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00116$:
;func/logicScorecard.c:242: if(scorecard[i] != 255){
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
	jr	Z, 00117$
;func/logicScorecard.c:243: scorecardChangeA++;
	ld	hl, #_scorecardChangeA
	inc	(hl)
00117$:
;func/logicScorecard.c:241: for(i = 0; i != 14; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00178$
	inc	hl
	inc	(hl)
00178$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0e
	or	a, (hl)
	jr	NZ, 00116$
;func/logicScorecard.c:246: if(upperRegion == 1){
	ld	a, (#_upperRegion)
	dec	a
	jr	NZ, 00105$
;func/logicScorecard.c:247: logicUpper();
	call	_logicUpper
	jr	00106$
00105$:
;func/logicScorecard.c:250: logicLower();
	call	_logicLower
00106$:
;func/logicScorecard.c:252: for(i = 0; i != 14; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00118$:
;func/logicScorecard.c:253: if(scorecard[i] != 255){
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
	jr	Z, 00119$
;func/logicScorecard.c:254: scorecardChangeB++;
	ld	hl, #_scorecardChangeB
	inc	(hl)
00119$:
;func/logicScorecard.c:252: for(i = 0; i != 14; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00185$
	inc	hl
	inc	(hl)
00185$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0e
	or	a, (hl)
	jr	NZ, 00118$
;func/logicScorecard.c:257: bonusCheck();
	call	_bonusCheck
;func/logicScorecard.c:258: setScoreUpper();
	call	_setScoreUpper
;func/logicScorecard.c:259: setScoreLower();
	call	_setScoreLower
;func/logicScorecard.c:260: scoreDisplay();
	call	_scoreDisplay
00111$:
;func/logicScorecard.c:262: if(scorecardChangeA != scorecardChangeB){
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ret	Z
;func/logicScorecard.c:263: rollsLeft = 0;
	xor	a, a
	ld	hl, #_rollsLeft
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:264: rollsEnabled = 0;
	ld	hl, #_rollsEnabled
	ld	(hl), #0x00
;func/logicScorecard.c:265: playView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_playView
	pop	hl
;func/logicScorecard.c:268: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
