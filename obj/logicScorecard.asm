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
;func/logicScorecard.c:17: void logicUpper(){
;	---------------------------------
; Function logicUpper
; ---------------------------------
_logicUpper::
	dec	sp
	dec	sp
;func/logicScorecard.c:18: unsigned int valueToCheck = 0;
	ld	bc, #0x0000
;func/logicScorecard.c:19: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:20: switch(cursorIndex){
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
;func/logicScorecard.c:21: case 8:
00101$:
;func/logicScorecard.c:22: valueToCheck = 1;
	ld	bc, #0x0001
;func/logicScorecard.c:23: break;
	jr	00107$
;func/logicScorecard.c:24: case 9:
00102$:
;func/logicScorecard.c:25: valueToCheck = 2;
	ld	bc, #0x0002
;func/logicScorecard.c:26: break;
	jr	00107$
;func/logicScorecard.c:27: case 10:
00103$:
;func/logicScorecard.c:28: valueToCheck = 3;
	ld	bc, #0x0003
;func/logicScorecard.c:29: break;
	jr	00107$
;func/logicScorecard.c:30: case 16:
00104$:
;func/logicScorecard.c:31: valueToCheck = 4;
	ld	bc, #0x0004
;func/logicScorecard.c:32: break;
	jr	00107$
;func/logicScorecard.c:33: case 17:
00105$:
;func/logicScorecard.c:34: valueToCheck = 5;
	ld	bc, #0x0005
;func/logicScorecard.c:35: break;
	jr	00107$
;func/logicScorecard.c:36: case 18:
00106$:
;func/logicScorecard.c:37: valueToCheck = 6;
	ld	bc, #0x0006
;func/logicScorecard.c:39: }
00107$:
;func/logicScorecard.c:40: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00111$:
;func/logicScorecard.c:41: if(diceValues[i] == valueToCheck){
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
;func/logicScorecard.c:42: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:40: for(i = 0; i != 5; i++){
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
;func/logicScorecard.c:45: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:46: }
	inc	sp
	inc	sp
	ret
;func/logicScorecard.c:49: void logicLower(){
;	---------------------------------
; Function logicLower
; ---------------------------------
_logicLower::
	add	sp, #-9
;func/logicScorecard.c:50: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:51: sortDice();
	call	_sortDice
;func/logicScorecard.c:59: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:52: switch(cursorIndex){
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
;func/logicScorecard.c:54: case 11:
00101$:
;func/logicScorecard.c:55: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
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
;func/logicScorecard.c:56: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00187$:
;func/logicScorecard.c:57: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:56: for(i = 0; i != 5; i++){
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
;func/logicScorecard.c:59: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:61: else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
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
;func/logicScorecard.c:62: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00189$:
;func/logicScorecard.c:63: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:62: for(i = 0; i != 5; i++){
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
;func/logicScorecard.c:65: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:67: else if(diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
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
;func/logicScorecard.c:68: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00191$:
;func/logicScorecard.c:69: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:68: for(i = 0; i != 5; i++){
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
;func/logicScorecard.c:71: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:74: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:75: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:77: break;
	jp	00203$
;func/logicScorecard.c:79: case 12:
00117$:
;func/logicScorecard.c:80: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
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
;func/logicScorecard.c:81: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00193$:
;func/logicScorecard.c:82: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:81: for(i = 0; i != 5; i++){
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
;func/logicScorecard.c:84: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:86: else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
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
;func/logicScorecard.c:87: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00195$:
;func/logicScorecard.c:88: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:87: for(i = 0; i != 5; i++){
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
;func/logicScorecard.c:90: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:93: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:94: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:96: break;
	jp	00203$
;func/logicScorecard.c:98: case 13:
00130$:
;func/logicScorecard.c:99: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
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
;func/logicScorecard.c:100: if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
;func/logicScorecard.c:99: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
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
;func/logicScorecard.c:100: if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
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
;func/logicScorecard.c:101: scoreBuf = 25;
	ld	hl, #_scoreBuf
	ld	a, #0x19
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:103: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:105: set_bkg_tile_xy(8, 30, 0x12); // 2
	ld	hl, #0x121e
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:106: set_bkg_tile_xy(9, 30, 0x15); // 5
	ld	hl, #0x151e
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00142$:
;func/logicScorecard.c:109: else if(diceValues[0] == diceValues[1]){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00139$
;func/logicScorecard.c:110: if(diceValues[1] != diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
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
;func/logicScorecard.c:111: scoreBuf = 25;
	ld	hl, #_scoreBuf
	ld	a, #0x19
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:113: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:115: set_bkg_tile_xy(8, 30, 0x12); // 2
	ld	hl, #0x121e
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:116: set_bkg_tile_xy(9, 30, 0x15); // 5
	ld	hl, #0x151e
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00139$:
;func/logicScorecard.c:120: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:121: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:123: break;
	jp	00203$
;func/logicScorecard.c:125: case 19:
00145$:
;func/logicScorecard.c:126: sortDice();
	call	_sortDice
;func/logicScorecard.c:127: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
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
;func/logicScorecard.c:59: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_cursorIndex
	ld	c, (hl)
;func/logicScorecard.c:127: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
;func/logicScorecard.c:59: scorecard[cursorIndex - 8] = scoreBuf;
;func/logicScorecard.c:127: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
;func/logicScorecard.c:59: scorecard[cursorIndex - 8] = scoreBuf;
;func/logicScorecard.c:127: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
	ld	(hl-), a
	ld	a, c
	add	a, #0xf8
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
;func/logicScorecard.c:59: scorecard[cursorIndex - 8] = scoreBuf;
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
;func/logicScorecard.c:127: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
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
;func/logicScorecard.c:59: scorecard[cursorIndex - 8] = scoreBuf;
	ld	c, e
	ld	b, d
	sla	c
	rl	b
;func/logicScorecard.c:127: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
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
;func/logicScorecard.c:128: scoreBuf = 30;
	ld	hl, #_scoreBuf
	ld	a, #0x1e
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:130: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_scorecard
	add	hl, bc
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:132: set_bkg_tile_xy(17, 28, 0x13); // 3
	ld	hl, #0x131c
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:133: set_bkg_tile_xy(18, 28, 0x10); // 0
	ld	hl, #0x101c
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00151$:
;func/logicScorecard.c:135: else if(diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1)){
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
;func/logicScorecard.c:136: scoreBuf = 30;
	ld	hl, #_scoreBuf
	ld	a, #0x1e
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:138: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_scorecard
	add	hl, bc
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:140: set_bkg_tile_xy(17, 28, 0x13); // 3
	ld	hl, #0x131c
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:141: set_bkg_tile_xy(18, 28, 0x10); // 0
	ld	hl, #0x101c
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00147$:
;func/logicScorecard.c:144: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:145: scorecard[cursorIndex - 8] = scoreBuf;
	ld	hl, #_scorecard
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:147: break;
	jp	00203$
;func/logicScorecard.c:149: case 20:
00155$:
;func/logicScorecard.c:150: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
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
;func/logicScorecard.c:151: scoreBuf = 40;
	ld	hl, #_scoreBuf
	ld	a, #0x28
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:153: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:155: set_bkg_tile_xy(17, 29, 0x14); // 4
	ld	hl, #0x141d
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:156: set_bkg_tile_xy(18, 29, 0x10); // 0
	ld	hl, #0x101d
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00157$:
;func/logicScorecard.c:159: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:160: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:162: break;
	jp	00203$
;func/logicScorecard.c:164: case 21:
00162$:
;func/logicScorecard.c:165: for(i = 0; i < 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00197$:
;func/logicScorecard.c:166: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:167: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:165: for(i = 0; i < 5; i++){
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
;func/logicScorecard.c:169: break;
	jp	00203$
;func/logicScorecard.c:171: case 14:
00164$:
;func/logicScorecard.c:172: match5 = 0;
	xor	a, a
	ld	hl, #_match5
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:173: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00199$:
;func/logicScorecard.c:174: if(diceValues[i] == diceValues[i + 1]){
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
;func/logicScorecard.c:175: match5++;
	ld	hl, #_match5
	inc	(hl)
	jr	NZ, 00596$
	inc	hl
	inc	(hl)
00596$:
00200$:
;func/logicScorecard.c:173: for(i = 0; i < 4; i++){
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
;func/logicScorecard.c:179: if(match5 == 4){
	ld	hl, #_match5
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00171$
;func/logicScorecard.c:181: scoreBuf = 50;
	ld	hl, #_scoreBuf
	ld	a, #0x32
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:182: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:184: set_bkg_tile_xy(17, 31, 0x15); // 5
	ld	hl, #0x151f
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:185: set_bkg_tile_xy(18, 31, 0x10); // 0
	ld	hl, #0x101f
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00203$
00171$:
;func/logicScorecard.c:187: else if(turn == 13){
	ld	hl, #_turn
	ld	a, (hl+)
	sub	a, #0x0d
;func/logicScorecard.c:188: scoreBuf = 0;
	or	a,(hl)
	jp	NZ,00203$
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:189: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:191: break;
	jp	00203$
;func/logicScorecard.c:192: case 15:
00173$:
;func/logicScorecard.c:193: match5 = 0;
	xor	a, a
	ld	hl, #_match5
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:194: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00201$:
;func/logicScorecard.c:195: if(diceValues[i] == diceValues[i + 1]){
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
;func/logicScorecard.c:196: match5++;
	ld	hl, #_match5
	inc	(hl)
	jr	NZ, 00605$
	inc	hl
	inc	(hl)
00605$:
00202$:
;func/logicScorecard.c:194: for(i = 0; i < 4; i++){
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
;func/logicScorecard.c:200: if(match5 == 4 && scorecard[6] != 255 && scorecard[6] != 0){
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
;func/logicScorecard.c:201: if(scorecard[cursorIndex - 8] < 1000){
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
;func/logicScorecard.c:203: scoreBuf = 100;
	ld	hl, #_scoreBuf
	ld	a, #0x64
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:204: if(scorecard[cursorIndex - 8] == 255){
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
;func/logicScorecard.c:205: scorecard[cursorIndex - 8] = scoreBuf;
	ld	a, #0x64
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	jr	00203$
00178$:
;func/logicScorecard.c:208: scorecard[cursorIndex - 8] += scoreBuf;
	ld	de, #0x64
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;func/logicScorecard.c:214: }
00203$:
;func/logicScorecard.c:215: }
	add	sp, #9
	ret
;func/logicScorecard.c:218: void bonusCheck(){
;	---------------------------------
; Function bonusCheck
; ---------------------------------
_bonusCheck::
;func/logicScorecard.c:220: unsigned int bonusCompare = 0;
	ld	bc, #0x0000
;func/logicScorecard.c:221: for(i = 0; i != 15; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00110$:
;func/logicScorecard.c:222: if(i <= 2 || i >= 7 && i <= 10){
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
;func/logicScorecard.c:223: if(scorecard[i] != 255){
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
;func/logicScorecard.c:224: bonusCompare += scorecard[i];
	add	hl, bc
	ld	c, l
	ld	b, h
00102$:
;func/logicScorecard.c:226: if(bonusCompare >= 63){
	ld	a, c
	sub	a, #0x3f
	ld	a, b
	sbc	a, #0x00
	jr	C, 00111$
;func/logicScorecard.c:227: scorecard[14] = 35;
	ld	hl, #(_scorecard + 28)
	ld	a, #0x23
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:228: set_bkg_tile_xy(17, 25, 0x13); // 3
	ld	hl, #0x1319
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:229: set_bkg_tile_xy(18, 25, 0x15); // 5
	ld	hl, #0x1519
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00111$:
;func/logicScorecard.c:221: for(i = 0; i != 15; i++){
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
;func/logicScorecard.c:233: }
	ret
;func/logicScorecard.c:236: void logicScorecard(){
;	---------------------------------
; Function logicScorecard
; ---------------------------------
_logicScorecard::
;func/logicScorecard.c:238: if(scorecardChangeA == scorecardChangeB){
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ret	NZ
;func/logicScorecard.c:239: scorecardChangeA = 0;
	ld	hl, #_scorecardChangeA
	ld	(hl), #0x00
;func/logicScorecard.c:240: scorecardChangeB = 0;
	ld	hl, #_scorecardChangeB
	ld	(hl), #0x00
;func/logicScorecard.c:241: if(scorecard[cursorIndex - 8] == 255){
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
;func/logicScorecard.c:242: for(i = 0; i != 14; i++){
	or	a,b
	jr	NZ, 00111$
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00116$:
;func/logicScorecard.c:243: if(scorecard[i] != 255){
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
;func/logicScorecard.c:244: scorecardChangeA++;
	ld	hl, #_scorecardChangeA
	inc	(hl)
00117$:
;func/logicScorecard.c:242: for(i = 0; i != 14; i++){
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
;func/logicScorecard.c:247: if(upperRegion == 1){
	ld	a, (#_upperRegion)
	dec	a
	jr	NZ, 00105$
;func/logicScorecard.c:248: logicUpper();
	call	_logicUpper
	jr	00106$
00105$:
;func/logicScorecard.c:251: logicLower();
	call	_logicLower
00106$:
;func/logicScorecard.c:253: for(i = 0; i != 14; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00118$:
;func/logicScorecard.c:254: if(scorecard[i] != 255){
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
;func/logicScorecard.c:255: scorecardChangeB++;
	ld	hl, #_scorecardChangeB
	inc	(hl)
00119$:
;func/logicScorecard.c:253: for(i = 0; i != 14; i++){
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
;func/logicScorecard.c:258: bonusCheck();
	call	_bonusCheck
;func/logicScorecard.c:259: setScoreUpper();
	call	_setScoreUpper
;func/logicScorecard.c:260: setScoreLower();
	call	_setScoreLower
;func/logicScorecard.c:261: scoreDisplay();
	call	_scoreDisplay
00111$:
;func/logicScorecard.c:263: if(scorecardChangeA != scorecardChangeB){
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ret	Z
;func/logicScorecard.c:264: rollsLeft = 0;
	xor	a, a
	ld	hl, #_rollsLeft
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:265: rollsEnabled = 0;
	ld	hl, #_rollsEnabled
	ld	(hl), #0x00
;func/logicScorecard.c:266: playView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_playView
	pop	hl
;func/logicScorecard.c:270: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
