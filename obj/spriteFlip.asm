;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module spriteFlip
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _spriteFlip
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
;func/spriteFlip.c:6: void spriteFlip(){
;	---------------------------------
; Function spriteFlip
; ---------------------------------
_spriteFlip::
;func/spriteFlip.c:7: for(i = 1; i <= 17; i = i + 4){
	ld	hl, #_i
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00107$:
;func/spriteFlip.c:8: set_sprite_prop(i, S_FLIPX);
	ld	hl, #_i
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1372: shadow_OAM[nb].prop=prop;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x20
;func/spriteFlip.c:7: for(i = 1; i <= 17; i = i + 4){
	ld	hl, #_i
	ld	a, (hl)
	add	a, #0x04
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl-), a
	ld	a, #0x11
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00107$
;func/spriteFlip.c:11: for(i = 2; i <= 18; i = i + 4){
	ld	hl, #_i
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00109$:
;func/spriteFlip.c:12: set_sprite_prop(i, S_FLIPY);
	ld	hl, #_i
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1372: shadow_OAM[nb].prop=prop;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x40
;func/spriteFlip.c:11: for(i = 2; i <= 18; i = i + 4){
	ld	hl, #_i
	ld	a, (hl)
	add	a, #0x04
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl-), a
	ld	a, #0x12
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00109$
;func/spriteFlip.c:15: for(i = 3; i <= 19; i = i + 4){
	ld	hl, #_i
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00111$:
;func/spriteFlip.c:16: set_sprite_prop(i, S_FLIPX | S_FLIPY);
	ld	hl, #_i
	ld	c, (hl)
;/opt/gbdk/include/gb/gb.h:1372: shadow_OAM[nb].prop=prop;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x60
;func/spriteFlip.c:15: for(i = 3; i <= 19; i = i + 4){
	ld	hl, #_i
	ld	a, (hl)
	add	a, #0x04
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl-), a
	ld	a, #0x13
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00111$
;func/spriteFlip.c:18: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
