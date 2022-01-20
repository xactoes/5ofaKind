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
	.globl _smStraightLogicB
	.globl _smStraightLogicA
	.globl _logicUpper
	.globl _sortDice
	.globl _scoreDisplay
	.globl _setScoreLower
	.globl _setScoreUpper
	.globl _playView
	.globl _betterDelay
	.globl _printf
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
;func/logicScorecard.c:18: void logicUpper(){
;	---------------------------------
; Function logicUpper
; ---------------------------------
_logicUpper::
	dec	sp
	dec	sp
;func/logicScorecard.c:19: unsigned int valueToCheck = 0;
	ld	bc, #0x0000
;func/logicScorecard.c:20: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:21: switch(cursorIndex){
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
;func/logicScorecard.c:22: case 8:
00101$:
;func/logicScorecard.c:23: valueToCheck = 1;
	ld	bc, #0x0001
;func/logicScorecard.c:24: break;
	jr	00107$
;func/logicScorecard.c:25: case 9:
00102$:
;func/logicScorecard.c:26: valueToCheck = 2;
	ld	bc, #0x0002
;func/logicScorecard.c:27: break;
	jr	00107$
;func/logicScorecard.c:28: case 10:
00103$:
;func/logicScorecard.c:29: valueToCheck = 3;
	ld	bc, #0x0003
;func/logicScorecard.c:30: break;
	jr	00107$
;func/logicScorecard.c:31: case 16:
00104$:
;func/logicScorecard.c:32: valueToCheck = 4;
	ld	bc, #0x0004
;func/logicScorecard.c:33: break;
	jr	00107$
;func/logicScorecard.c:34: case 17:
00105$:
;func/logicScorecard.c:35: valueToCheck = 5;
	ld	bc, #0x0005
;func/logicScorecard.c:36: break;
	jr	00107$
;func/logicScorecard.c:37: case 18:
00106$:
;func/logicScorecard.c:38: valueToCheck = 6;
	ld	bc, #0x0006
;func/logicScorecard.c:40: }
00107$:
;func/logicScorecard.c:41: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00111$:
;func/logicScorecard.c:42: if(diceValues[i] == valueToCheck){
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
;func/logicScorecard.c:43: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:41: for(i = 0; i != 5; i++){
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
;func/logicScorecard.c:47: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:48: }
	inc	sp
	inc	sp
	ret
;func/logicScorecard.c:51: void smStraightLogicA(){
;	---------------------------------
; Function smStraightLogicA
; ---------------------------------
_smStraightLogicA::
	add	sp, #-5
;func/logicScorecard.c:52: if(diceValues[0] == diceValues[1]){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_diceValues + 2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;func/logicScorecard.c:53: if(diceValues[1] == diceValues[2]){
;func/logicScorecard.c:56: else if(diceValues[2] == diceValues[3]){
;func/logicScorecard.c:59: else if(diceValues[3] == diceValues[4]){
;func/logicScorecard.c:53: if(diceValues[1] == diceValues[2]){
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00175$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00176$
00175$:
	xor	a, a
00176$:
	ldhl	sp,	#2
;func/logicScorecard.c:52: if(diceValues[0] == diceValues[1]){
	ld	(hl+), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00126$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00126$
;func/logicScorecard.c:53: if(diceValues[1] == diceValues[2]){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;func/logicScorecard.c:54: smStraightContinue = 0;
	xor	a, a
	ld	hl, #_smStraightContinue
	ld	(hl+), a
	ld	(hl), a
	jp	00128$
00108$:
;func/logicScorecard.c:56: else if(diceValues[2] == diceValues[3]){
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00105$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00105$
;func/logicScorecard.c:57: smStraightContinue = 0;
	xor	a, a
	ld	hl, #_smStraightContinue
	ld	(hl+), a
	ld	(hl), a
	jp	00128$
00105$:
;func/logicScorecard.c:59: else if(diceValues[3] == diceValues[4]){
	ld	hl, #(_diceValues + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jr	NZ, 00102$
	ld	a, h
	sub	a, b
	jr	NZ, 00102$
;func/logicScorecard.c:60: smStraightContinue = 0;
	xor	a, a
	ld	hl, #_smStraightContinue
	ld	(hl+), a
	ld	(hl), a
	jp	00128$
00102$:
;func/logicScorecard.c:63: smStraightContinue = 1;
	ld	hl, #_smStraightContinue
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jp	00128$
00126$:
;func/logicScorecard.c:56: else if(diceValues[2] == diceValues[3]){
	ld	de, #(_diceValues + 6)
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
;func/logicScorecard.c:67: if(diceValues[2] == diceValues[3]){
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NZ, 00183$
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00184$
00183$:
	xor	a, a
00184$:
	ld	c, a
;func/logicScorecard.c:66: else if(diceValues[1] == diceValues[2]){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
;func/logicScorecard.c:67: if(diceValues[2] == diceValues[3]){
	ld	a, c
	or	a, a
	jr	Z, 00114$
;func/logicScorecard.c:68: smStraightContinue = 0;
	xor	a, a
	ld	hl, #_smStraightContinue
	ld	(hl+), a
	ld	(hl), a
	jr	00128$
00114$:
;func/logicScorecard.c:70: else if(diceValues[3] == diceValues[4]){
	ld	hl, #(_diceValues + 8)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00111$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00111$
;func/logicScorecard.c:71: smStraightContinue = 0;
	xor	a, a
	ld	hl, #_smStraightContinue
	ld	(hl+), a
	ld	(hl), a
	jr	00128$
00111$:
;func/logicScorecard.c:74: smStraightContinue = 2;
	ld	hl, #_smStraightContinue
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00128$
00123$:
;func/logicScorecard.c:77: else if(diceValues[2] == diceValues[3]){
	ld	a, c
	or	a, a
	jr	Z, 00120$
;func/logicScorecard.c:78: if(diceValues[3] == diceValues[4]){
	ld	hl, #(_diceValues + 8)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00117$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00117$
;func/logicScorecard.c:79: smStraightContinue = 0;
	xor	a, a
	ld	hl, #_smStraightContinue
	ld	(hl+), a
	ld	(hl), a
	jr	00128$
00117$:
;func/logicScorecard.c:82: smStraightContinue = 3;
	ld	hl, #_smStraightContinue
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00128$
00120$:
;func/logicScorecard.c:86: smStraightContinue = 4;
	ld	hl, #_smStraightContinue
	ld	a, #0x04
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00128$:
;func/logicScorecard.c:88: }
	add	sp, #5
	ret
;func/logicScorecard.c:91: unsigned int smStraightLogicB(){
;	---------------------------------
; Function smStraightLogicB
; ---------------------------------
_smStraightLogicB::
	add	sp, #-4
;func/logicScorecard.c:92: smStraightLogicA();
	call	_smStraightLogicA
;func/logicScorecard.c:93: if(smStraightContinue == 1){
	ld	hl, #_smStraightContinue
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	NZ, 00131$
;func/logicScorecard.c:94: if(diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
	ld	de, #(_diceValues + 2)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00102$
	ld	hl, #_diceValues + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	dec	de
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00102$
	ld	hl, #_diceValues + 8
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	dec	hl
	ld	a, l
	sub	a, c
	jr	NZ, 00102$
	ld	a, h
	sub	a, b
	jr	NZ, 00102$
;func/logicScorecard.c:95: return 1;
	ld	de, #0x0001
	jp	00133$
00102$:
;func/logicScorecard.c:97: else return 0;
	ld	de, #0x0000
	jp	00133$
00131$:
;func/logicScorecard.c:99: else if(smStraightContinue == 2){
	ld	hl, #_smStraightContinue
	ld	a, (hl+)
	sub	a, #0x02
	or	a, (hl)
	jr	NZ, 00128$
;func/logicScorecard.c:100: if(diceValues[0] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00107$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00107$
	ld	hl, #_diceValues + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	dec	de
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00107$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00107$
	ld	hl, #_diceValues + 8
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	dec	hl
	ld	a, l
	sub	a, c
	jr	NZ, 00107$
	ld	a, h
	sub	a, b
	jr	NZ, 00107$
;func/logicScorecard.c:101: return 1;
	ld	de, #0x0001
	jp	00133$
00107$:
;func/logicScorecard.c:103: else return 0;
	ld	de, #0x0000
	jp	00133$
00128$:
;func/logicScorecard.c:105: else if(smStraightContinue == 3){
	ld	hl, #_smStraightContinue
	ld	a, (hl+)
	sub	a, #0x03
	or	a, (hl)
	jr	NZ, 00125$
;func/logicScorecard.c:106: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
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
	ld	c, a
	ld	b, (hl)
	dec	bc
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00112$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00112$
	ld	hl, #_diceValues + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	dec	de
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00112$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00112$
	ld	hl, #_diceValues + 8
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	dec	hl
	ld	a, l
	sub	a, c
	jr	NZ, 00112$
	ld	a, h
	sub	a, b
	jr	NZ, 00112$
;func/logicScorecard.c:107: return 1;
	ld	de, #0x0001
	jr	00133$
00112$:
;func/logicScorecard.c:109: else return 0;
	ld	de, #0x0000
	jr	00133$
00125$:
;func/logicScorecard.c:111: else if(smStraightContinue == 4){
	ld	hl, #_smStraightContinue
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00122$
;func/logicScorecard.c:112: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[4] - 1)){
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
	ld	c, a
	ld	b, (hl)
	dec	bc
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00117$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00117$
	ld	hl, #_diceValues + 4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	dec	de
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00117$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00117$
	ld	hl, #_diceValues + 8
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	dec	hl
	ld	a, l
	sub	a, c
	jr	NZ, 00117$
	ld	a, h
	sub	a, b
	jr	NZ, 00117$
;func/logicScorecard.c:113: return 1;
	ld	de, #0x0001
	jr	00133$
00117$:
;func/logicScorecard.c:115: else return 0;
	ld	de, #0x0000
	jr	00133$
00122$:
;func/logicScorecard.c:117: else return 0;
	ld	de, #0x0000
00133$:
;func/logicScorecard.c:118: }
	add	sp, #4
	ret
;func/logicScorecard.c:121: void logicLower(){
;	---------------------------------
; Function logicLower
; ---------------------------------
_logicLower::
	add	sp, #-7
;func/logicScorecard.c:122: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:123: sortDice();
	call	_sortDice
;func/logicScorecard.c:131: scorecard[cursorIndex - 8] = scoreBuf;
	ld	a, (#_cursorIndex)
	add	a, #0xf8
	ld	c, a
	rlca
	sbc	a, a
	sla	c
	adc	a, a
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
;func/logicScorecard.c:124: switch(cursorIndex){
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
	jp	Z,00158$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x0f
	or	a, (hl)
	jp	Z,00167$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x13
	or	a, (hl)
	jp	Z,00145$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x14
	or	a, (hl)
	jp	Z,00149$
	ld	hl, #_cursorIndex
	ld	a, (hl+)
	sub	a, #0x15
	or	a, (hl)
	jp	Z,00156$
	jp	00197$
;func/logicScorecard.c:126: case 11:
00101$:
;func/logicScorecard.c:127: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#2
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
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00498$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00499$
00498$:
	xor	a, a
00499$:
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00114$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00114$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00114$
;func/logicScorecard.c:128: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00181$:
;func/logicScorecard.c:129: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:128: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00503$
	inc	hl
	inc	(hl)
00503$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00181$
;func/logicScorecard.c:131: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00197$
00114$:
;func/logicScorecard.c:133: else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
	ld	hl, #_diceValues + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00506$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00507$
00506$:
	xor	a, a
00507$:
	ld	e, a
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
	ld	a, e
	or	a, a
	jr	Z, 00110$
;func/logicScorecard.c:134: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00183$:
;func/logicScorecard.c:135: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:134: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00509$
	inc	hl
	inc	(hl)
00509$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00183$
;func/logicScorecard.c:137: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00197$
00110$:
;func/logicScorecard.c:139: else if(diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
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
;func/logicScorecard.c:140: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00185$:
;func/logicScorecard.c:141: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:140: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00515$
	inc	hl
	inc	(hl)
00515$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00185$
;func/logicScorecard.c:143: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00197$
00106$:
;func/logicScorecard.c:146: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:147: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:149: break;
	jp	00197$
;func/logicScorecard.c:151: case 12:
00117$:
;func/logicScorecard.c:152: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3]){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#2
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
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00518$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00519$
00518$:
	xor	a, a
00519$:
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00126$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00126$
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00126$
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00126$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00126$
;func/logicScorecard.c:153: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00187$:
;func/logicScorecard.c:154: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:153: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00525$
	inc	hl
	inc	(hl)
00525$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00187$
;func/logicScorecard.c:156: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00197$
00126$:
;func/logicScorecard.c:158: else if(diceValues[1] == diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	Z, 00121$
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#4
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
;func/logicScorecard.c:159: for(i = 0; i != 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00189$:
;func/logicScorecard.c:160: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:159: for(i = 0; i != 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00533$
	inc	hl
	inc	(hl)
00533$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	or	a, (hl)
	jr	NZ, 00189$
;func/logicScorecard.c:162: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scoreBuf
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	jp	00197$
00121$:
;func/logicScorecard.c:165: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:166: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:168: break;
	jp	00197$
;func/logicScorecard.c:170: case 13:
00130$:
;func/logicScorecard.c:171: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_diceValues + 2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00536$
	inc	hl
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00537$
00536$:
	xor	a, a
00537$:
	ldhl	sp,	#4
;func/logicScorecard.c:172: if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
;func/logicScorecard.c:171: if(diceValues[0] == diceValues[1] && diceValues[1] == diceValues[2]){
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
;func/logicScorecard.c:172: if(diceValues[2] != diceValues[3] && diceValues[3] == diceValues[4]){
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00540$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00197$
00540$:
	ld	hl, #(_diceValues + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jp	NZ,00197$
	ld	a, h
	sub	a, b
	jp	NZ,00197$
;func/logicScorecard.c:173: scoreBuf = 25;
	ld	hl, #_scoreBuf
	ld	a, #0x19
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:175: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x19
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:177: set_bkg_tile_xy(8, 30, 0x12); // 2
	ld	hl, #0x121e
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:178: set_bkg_tile_xy(9, 30, 0x15); // 5
	ld	hl, #0x151e
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00197$
00142$:
;func/logicScorecard.c:181: else if(diceValues[0] == diceValues[1]){
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00139$
;func/logicScorecard.c:182: if(diceValues[1] != diceValues[2] && diceValues[2] == diceValues[3] && diceValues[3] == diceValues[4]){
	inc	hl
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00543$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00197$
00543$:
	ld	hl, #(_diceValues + 6)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jp	NZ,00197$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	NZ,00197$
	ld	hl, #(_diceValues + 8)
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, c
	jp	NZ,00197$
	ld	a, h
	sub	a, b
	jp	NZ,00197$
;func/logicScorecard.c:183: scoreBuf = 25;
	ld	hl, #_scoreBuf
	ld	a, #0x19
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:185: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x19
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:187: set_bkg_tile_xy(8, 30, 0x12); // 2
	ld	hl, #0x121e
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:188: set_bkg_tile_xy(9, 30, 0x15); // 5
	ld	hl, #0x151e
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00197$
00139$:
;func/logicScorecard.c:192: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:193: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:195: break;
	jp	00197$
;func/logicScorecard.c:197: case 19:
00145$:
;func/logicScorecard.c:198: if(smStraightLogicB()){
	call	_smStraightLogicB
	ld	a, d
	or	a, e
	jr	Z, 00147$
;func/logicScorecard.c:199: scoreBuf = 30;
	ld	hl, #_scoreBuf
	ld	a, #0x1e
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:201: scorecard[11] = scoreBuf;
	ld	hl, #(_scorecard + 22)
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:203: set_bkg_tile_xy(17, 28, 0x13); // 3
	ld	hl, #0x131c
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:204: set_bkg_tile_xy(18, 28, 0x10); // 0
	ld	hl, #0x101c
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:205: betterDelay(300);
	ld	de, #0x012c
	push	de
	call	_betterDelay
	pop	hl
;func/logicScorecard.c:206: printf("%u", smStraightContinue);
	ld	hl, #_smStraightContinue
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
	jp	00197$
00147$:
;func/logicScorecard.c:209: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:210: scorecard[cursorIndex - 8] = scoreBuf;
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
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:212: break;
	jp	00197$
;func/logicScorecard.c:214: case 20:
00149$:
;func/logicScorecard.c:215: if(diceValues[0] == (diceValues[1] - 1) && diceValues[1] == (diceValues[2] - 1) && diceValues[2] == (diceValues[3] - 1) && diceValues[3] == (diceValues[4] - 1)){
	ld	de, #_diceValues
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	de, #(_diceValues + 2)
	ld	a, (de)
	ldhl	sp,	#3
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
	jr	NZ, 00151$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00151$
	ld	de, #(_diceValues + 4)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00151$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00151$
	ld	hl, #_diceValues + 6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	dec	de
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00151$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00151$
	ld	hl, #_diceValues + 8
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	dec	hl
	ld	a, l
	sub	a, c
	jr	NZ, 00151$
	ld	a, h
	sub	a, b
	jr	NZ, 00151$
;func/logicScorecard.c:216: scoreBuf = 40;
	ld	hl, #_scoreBuf
	ld	a, #0x28
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:218: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	(hl), #0x28
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:220: set_bkg_tile_xy(17, 29, 0x14); // 4
	ld	hl, #0x141d
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:221: set_bkg_tile_xy(18, 29, 0x10); // 0
	ld	hl, #0x101d
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00197$
00151$:
;func/logicScorecard.c:224: scoreBuf = 0;
	xor	a, a
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:225: scorecard[cursorIndex - 8] = scoreBuf;
	ld	bc, #_scorecard+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:227: break;
	jp	00197$
;func/logicScorecard.c:229: case 21:
00156$:
;func/logicScorecard.c:230: for(i = 0; i < 5; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00191$:
;func/logicScorecard.c:231: scoreBuf += diceValues[i];
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
;func/logicScorecard.c:232: scorecard[cursorIndex - 8] = scoreBuf;
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
;func/logicScorecard.c:230: for(i = 0; i < 5; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00557$
	inc	hl
	inc	(hl)
00557$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x05
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00191$
;func/logicScorecard.c:234: break;
	jp	00197$
;func/logicScorecard.c:236: case 14:
00158$:
;func/logicScorecard.c:237: match5 = 0;
	xor	a, a
	ld	hl, #_match5
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:238: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00193$:
;func/logicScorecard.c:239: if(diceValues[i] == diceValues[i + 1]){
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
	jr	NZ, 00194$
	ld	a, h
	sub	a, b
	jr	NZ, 00194$
;func/logicScorecard.c:240: match5++;
	ld	hl, #_match5
	inc	(hl)
	jr	NZ, 00561$
	inc	hl
	inc	(hl)
00561$:
00194$:
;func/logicScorecard.c:238: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00562$
	inc	hl
	inc	(hl)
00562$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00193$
;func/logicScorecard.c:244: if(match5 == 4){
	ld	hl, #_match5
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00165$
;func/logicScorecard.c:246: scoreBuf = 50;
	ld	hl, #_scoreBuf
	ld	a, #0x32
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:247: scorecard[cursorIndex - 8] = scoreBuf;
	ld	de, #_scorecard
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	(hl), #0x32
	inc	bc
	ld	a, #0x00
	ld	(bc), a
;func/logicScorecard.c:249: set_bkg_tile_xy(17, 31, 0x15); // 5
	ld	hl, #0x151f
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:250: set_bkg_tile_xy(18, 31, 0x10); // 0
	ld	hl, #0x101f
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00197$
00165$:
;func/logicScorecard.c:252: else if(turn == 13){
	ld	hl, #_turn
	ld	a, (hl+)
	sub	a, #0x0d
;func/logicScorecard.c:253: scoreBuf = 0;
	or	a,(hl)
	jp	NZ,00197$
	ld	hl, #_scoreBuf
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:254: scorecard[cursorIndex - 8] = scoreBuf;
	ld	de, #_scorecard
	pop	hl
	push	hl
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;func/logicScorecard.c:256: break;
	jp	00197$
;func/logicScorecard.c:257: case 15:
00167$:
;func/logicScorecard.c:258: match5 = 0;
	xor	a, a
	ld	hl, #_match5
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:259: for(i = 0; i < 4; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00195$:
;func/logicScorecard.c:260: if(diceValues[i] == diceValues[i + 1]){
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
	jr	NZ, 00196$
	ld	a, h
	sub	a, b
	jr	NZ, 00196$
;func/logicScorecard.c:261: match5++;
	ld	hl, #_match5
	inc	(hl)
	jr	NZ, 00570$
	inc	hl
	inc	(hl)
00570$:
00196$:
;func/logicScorecard.c:259: for(i = 0; i < 4; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00571$
	inc	hl
	inc	(hl)
00571$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00195$
;func/logicScorecard.c:265: if(match5 == 4 && scorecard[6] != 255 && scorecard[6] != 0){
	ld	hl, #_match5
	ld	a, (hl+)
	sub	a, #0x04
	or	a, (hl)
	jr	NZ, 00197$
	ld	hl, #(_scorecard + 12)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	inc	a
	or	a, b
	jr	Z, 00197$
	ld	a, b
	or	a, c
	jr	Z, 00197$
;func/logicScorecard.c:266: if(scorecard[14] < 1000){
	ld	hl, #(_scorecard + 28)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	sbc	a, #0x03
	jr	NC, 00197$
;func/logicScorecard.c:268: scoreBuf = 100;
	ld	hl, #_scoreBuf
	ld	a, #0x64
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;func/logicScorecard.c:269: if(scorecard[14] == 255){
	ld	hl, #(_scorecard + 28)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	inc	a
	or	a, b
	jr	NZ, 00172$
;func/logicScorecard.c:270: scorecard[14] = scoreBuf;
	ld	hl, #(_scorecard + 28)
	ld	a, #0x64
	ld	(hl+), a
	ld	(hl), #0x00
	jr	00197$
00172$:
;func/logicScorecard.c:273: scorecard[14] += scoreBuf;
	ld	hl, #0x0064
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_scorecard + 28)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;func/logicScorecard.c:279: }
00197$:
;func/logicScorecard.c:280: }
	add	sp, #7
	ret
___str_0:
	.ascii "%u"
	.db 0x00
;func/logicScorecard.c:283: void bonusCheck(){
;	---------------------------------
; Function bonusCheck
; ---------------------------------
_bonusCheck::
;func/logicScorecard.c:285: unsigned int bonusCompare = 0;
	ld	bc, #0x0000
;func/logicScorecard.c:286: for(i = 0; i != 15; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00110$:
;func/logicScorecard.c:287: if(i <= 2 || i >= 8 && i <= 10){
	ld	hl, #_i
	ld	a, #0x02
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00105$
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x08
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
;func/logicScorecard.c:288: if(scorecard[i] != 255){
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
;func/logicScorecard.c:289: bonusCompare += scorecard[i];
	add	hl, bc
	ld	c, l
	ld	b, h
00102$:
;func/logicScorecard.c:291: if(bonusCompare >= 63){
	ld	a, c
	sub	a, #0x3f
	ld	a, b
	sbc	a, #0x00
	jr	C, 00111$
;func/logicScorecard.c:292: scorecard[7] = 35;
	ld	hl, #(_scorecard + 14)
	ld	a, #0x23
	ld	(hl+), a
	ld	(hl), #0x00
;func/logicScorecard.c:293: set_bkg_tile_xy(17, 25, 0x13); // 3
	ld	hl, #0x1319
	push	hl
	ld	a, #0x11
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;func/logicScorecard.c:294: set_bkg_tile_xy(18, 25, 0x15); // 5
	ld	hl, #0x1519
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00111$:
;func/logicScorecard.c:286: for(i = 0; i != 15; i++){
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
;func/logicScorecard.c:298: }
	ret
;func/logicScorecard.c:301: void logicScorecard(){
;	---------------------------------
; Function logicScorecard
; ---------------------------------
_logicScorecard::
;func/logicScorecard.c:303: if(scorecardChangeA == scorecardChangeB){
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ret	NZ
;func/logicScorecard.c:304: scorecardChangeA = 0;
	ld	hl, #_scorecardChangeA
	ld	(hl), #0x00
;func/logicScorecard.c:305: scorecardChangeB = 0;
	ld	hl, #_scorecardChangeB
	ld	(hl), #0x00
;func/logicScorecard.c:306: if(scorecard[cursorIndex - 8] == 255){
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
;func/logicScorecard.c:307: for(i = 0; i != 14; i++){
	or	a,b
	jr	NZ, 00111$
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00116$:
;func/logicScorecard.c:308: if(scorecard[i] != 255){
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
;func/logicScorecard.c:309: scorecardChangeA++;
	ld	hl, #_scorecardChangeA
	inc	(hl)
00117$:
;func/logicScorecard.c:307: for(i = 0; i != 14; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00173$
	inc	hl
	inc	(hl)
00173$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0e
	or	a, (hl)
	jr	NZ, 00116$
;func/logicScorecard.c:312: if(upperRegion == 1){
	ld	a, (#_upperRegion)
	dec	a
	jr	NZ, 00105$
;func/logicScorecard.c:313: logicUpper();
	call	_logicUpper
	jr	00106$
00105$:
;func/logicScorecard.c:316: logicLower();
	call	_logicLower
00106$:
;func/logicScorecard.c:318: for(i = 0; i != 14; i++){
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00118$:
;func/logicScorecard.c:319: if(scorecard[i] != 255){
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
;func/logicScorecard.c:320: scorecardChangeB++;
	ld	hl, #_scorecardChangeB
	inc	(hl)
00119$:
;func/logicScorecard.c:318: for(i = 0; i != 14; i++){
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00180$
	inc	hl
	inc	(hl)
00180$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, #0x0e
	or	a, (hl)
	jr	NZ, 00118$
00111$:
;func/logicScorecard.c:324: bonusCheck();
	call	_bonusCheck
;func/logicScorecard.c:325: setScoreUpper();
	call	_setScoreUpper
;func/logicScorecard.c:326: setScoreLower();
	call	_setScoreLower
;func/logicScorecard.c:327: scoreDisplay();
	call	_scoreDisplay
;func/logicScorecard.c:328: if(scorecardChangeA != scorecardChangeB){
	ld	a, (#_scorecardChangeA)
	ld	hl, #_scorecardChangeB
	sub	a, (hl)
	ret	Z
;func/logicScorecard.c:329: rollsLeft = 0;
	xor	a, a
	ld	hl, #_rollsLeft
	ld	(hl+), a
	ld	(hl), a
;func/logicScorecard.c:330: rollsEnabled = 0;
	ld	hl, #_rollsEnabled
	ld	(hl), #0x00
;func/logicScorecard.c:331: playView(backgroundMap);
	ld	de, #_backgroundMap
	push	de
	call	_playView
	pop	hl
;func/logicScorecard.c:335: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
