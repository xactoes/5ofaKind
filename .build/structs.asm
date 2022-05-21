;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module structs
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_dice
	.globl ___func_dice
	.globl b___func_Di
	.globl ___func_Di
	.globl b___func_Coordinates
	.globl ___func_Coordinates
	.globl b___func_Sprite
	.globl ___func_Sprite
	.globl _dice
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_dice::
	.ds 150
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
	.area _CODE_1
;src/bank_1/structs.c:9: BANKREF(Sprite)
;	---------------------------------
; Function __func_Sprite
; ---------------------------------
	b___func_Sprite	= 1
___func_Sprite::
	.local b___func_Sprite 
	___bank_Sprite = b___func_Sprite 
	.globl ___bank_Sprite 
;src/bank_1/structs.c:12: BANKREF(Coordinates)
;	---------------------------------
; Function __func_Coordinates
; ---------------------------------
	b___func_Coordinates	= 1
___func_Coordinates::
	.local b___func_Coordinates 
	___bank_Coordinates = b___func_Coordinates 
	.globl ___bank_Coordinates 
;src/bank_1/structs.c:15: BANKREF(Di)
;	---------------------------------
; Function __func_Di
; ---------------------------------
	b___func_Di	= 1
___func_Di::
	.local b___func_Di 
	___bank_Di = b___func_Di 
	.globl ___bank_Di 
;src/bank_1/structs.c:18: BANKREF(dice)
;	---------------------------------
; Function __func_dice
; ---------------------------------
	b___func_dice	= 1
___func_dice::
	.local b___func_dice 
	___bank_dice = b___func_dice 
	.globl ___bank_dice 
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
