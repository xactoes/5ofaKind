;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module sortDice
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sortDice
	.globl _printArray
	.globl _selectionSort
	.globl _swapDice
	.globl _puts
	.globl _printf
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
;func/sortDice.c:10: void swapDice(unsigned int* xp, unsigned int* yp){
;	---------------------------------
; Function swapDice
; ---------------------------------
_swapDice::
	add	sp, #-6
;func/sortDice.c:11: unsigned int temp = *xp;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;func/sortDice.c:12: *xp = *yp;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
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
	ld	(hl-), a
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
;func/sortDice.c:13: *yp = temp;
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(bc), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;func/sortDice.c:14: }
	add	sp, #6
	ret
;func/sortDice.c:17: void selectionSort(unsigned int arr[], unsigned int n){
;	---------------------------------
; Function selectionSort
; ---------------------------------
_selectionSort::
	add	sp, #-6
;func/sortDice.c:21: for (i = 0; i < n - 1; i++) {
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
	ldhl	sp,#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
00109$:
	ld	hl, #_i
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00111$
;func/sortDice.c:23: minDi = i;
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_i + 1)
	ldhl	sp,	#1
	ld	(hl), a
;func/sortDice.c:24: for (j = i + 1; j < n; j++)
	ld	a, (#_i)
	add	a, #0x01
	ld	(#_j),a
	ld	a, (#_i + 1)
	adc	a, #0x00
	ld	(#_j + 1),a
00106$:
;func/sortDice.c:25: if (arr[j] < arr[minDi])
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	e, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;func/sortDice.c:24: for (j = i + 1; j < n; j++)
	ld	de, #_j
	ldhl	sp,	#10
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00103$
;func/sortDice.c:25: if (arr[j] < arr[minDi])
	ld	hl, #_j
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	e, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
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
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00107$
;func/sortDice.c:26: minDi = j;
	ld	a, (#_j)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_j + 1)
	ldhl	sp,	#1
	ld	(hl), a
00107$:
;func/sortDice.c:24: for (j = i + 1; j < n; j++)
	ld	hl, #_j
	inc	(hl)
	jr	NZ, 00106$
	inc	hl
	inc	(hl)
	jr	00106$
00103$:
;func/sortDice.c:30: swapDice(&arr[minDi], &arr[i]);
	ld	hl, #_i
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	e, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	push	de
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_swapDice
	add	sp, #4
	pop	bc
;func/sortDice.c:21: for (i = 0; i < n - 1; i++) {
	ld	hl, #_i
	inc	(hl)
	jp	NZ,00109$
	inc	hl
	inc	(hl)
	jp	00109$
00111$:
;func/sortDice.c:32: }
	add	sp, #6
	ret
;func/sortDice.c:35: void printArray(unsigned int arr[], unsigned int size){
;	---------------------------------
; Function printArray
; ---------------------------------
_printArray::
;func/sortDice.c:36: for (i = 0; i < size; i++)
	xor	a, a
	ld	hl, #_i
	ld	(hl+), a
	ld	(hl), a
00103$:
	ld	de, #_i
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00101$
;func/sortDice.c:37: printf("%d ", arr[i]);
	ld	hl, #_i
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	ld	e, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	de, #___str_0
	push	de
	call	_printf
	add	sp, #4
;func/sortDice.c:36: for (i = 0; i < size; i++)
	ld	hl, #_i
	inc	(hl)
	jr	NZ, 00103$
	inc	hl
	inc	(hl)
	jr	00103$
00101$:
;func/sortDice.c:38: printf("\n");
	ld	de, #___str_2
	push	de
	call	_puts
	pop	hl
;func/sortDice.c:39: }
	ret
___str_0:
	.ascii "%d "
	.db 0x00
___str_2:
	.db 0x00
;func/sortDice.c:42: void sortDice(){
;	---------------------------------
; Function sortDice
; ---------------------------------
_sortDice::
;func/sortDice.c:47: selectionSort(diceValues, n);
	ld	de, #0x0005
	push	de
	ld	de, #_diceValues
	push	de
	call	_selectionSort
	add	sp, #4
;func/sortDice.c:50: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
