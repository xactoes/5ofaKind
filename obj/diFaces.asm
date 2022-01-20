;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module diFaces
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _diFace6
	.globl _diFace5
	.globl _diFace4
	.globl _diFace3
	.globl _diFace2
	.globl _diFace1
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
_diFace1::
	.ds 8
_diFace2::
	.ds 8
_diFace3::
	.ds 8
_diFace4::
	.ds 8
_diFace5::
	.ds 8
_diFace6::
	.ds 8
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
	.area _CODE
	.area _INITIALIZER
__xinit__diFace1:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
__xinit__diFace2:
	.dw #0x0001
	.dw #0x0002
	.dw #0x0002
	.dw #0x0001
__xinit__diFace3:
	.dw #0x0003
	.dw #0x0000
	.dw #0x0000
	.dw #0x0003
__xinit__diFace4:
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
__xinit__diFace5:
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
	.dw #0x0003
__xinit__diFace6:
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.dw #0x0004
	.area _CABS (ABS)
