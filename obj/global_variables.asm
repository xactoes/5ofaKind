;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (Linux)
;--------------------------------------------------------
	.module global_variables
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _heldPosY
	.globl _rollPosY
	.globl _cursor
	.globl _diStartPosition
	.globl _diSpacing
	.globl _rollBCD
	.globl _turnBCD
	.globl _numOptBCD
	.globl _compareBCD
	.globl _totalScoreAdd
	.globl _totalScoreBCD
	.globl _lowerScoreBuf
	.globl _lowerScoreBCD
	.globl _upperScoreBuf
	.globl _upperScoreBCD
	.globl _rollsEnabled
	.globl _scorecardSummed
	.globl _scorecard
	.globl _diceValues
	.globl _scorecardChangeB
	.globl _scorecardChangeA
	.globl _bonus5
	.globl _viewMode
	.globl _upperRegion
	.globl _quickSwitch
	.globl _endGame
	.globl _buf
	.globl _turnsPassed
	.globl _turn
	.globl _smStraightContinue
	.globl _scoresSet
	.globl _scoreBuf
	.globl _rollsLeft
	.globl _match5
	.globl _len
	.globl _diFaceBuf
	.globl _cursorPosition
	.globl _currentFace
	.globl _cursorIndex
	.globl _k
	.globl _j
	.globl _i
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_i::
	.ds 2
_j::
	.ds 2
_k::
	.ds 2
_cursorIndex::
	.ds 2
_currentFace::
	.ds 8
_cursorPosition::
	.ds 4
_diFaceBuf::
	.ds 2
_len::
	.ds 2
_match5::
	.ds 2
_rollsLeft::
	.ds 2
_scoreBuf::
	.ds 2
_scoresSet::
	.ds 2
_smStraightContinue::
	.ds 2
_turn::
	.ds 2
_turnsPassed::
	.ds 2
_buf::
	.ds 10
_endGame::
	.ds 1
_quickSwitch::
	.ds 1
_upperRegion::
	.ds 1
_viewMode::
	.ds 1
_bonus5::
	.ds 1
_scorecardChangeA::
	.ds 1
_scorecardChangeB::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_diceValues::
	.ds 10
_scorecard::
	.ds 30
_scorecardSummed::
	.ds 30
_rollsEnabled::
	.ds 1
_upperScoreBCD::
	.ds 4
_upperScoreBuf::
	.ds 4
_lowerScoreBCD::
	.ds 4
_lowerScoreBuf::
	.ds 4
_totalScoreBCD::
	.ds 4
_totalScoreAdd::
	.ds 4
_compareBCD::
	.ds 4
_numOptBCD::
	.ds 4
_turnBCD::
	.ds 4
_rollBCD::
	.ds 4
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
_diSpacing:
	.dw #0x0018
_diStartPosition:
	.dw #0x0030
	.dw #0x0048
_cursor:
	.dw #0x0014
_rollPosY:
	.dw #0x0048
_heldPosY:
	.dw #0x0058
	.area _INITIALIZER
__xinit__diceValues:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
__xinit__scorecard:
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
__xinit__scorecardSummed:
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
	.dw #0x01ff
__xinit__rollsEnabled:
	.db #0x01	; 1
__xinit__upperScoreBCD:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__upperScoreBuf:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__lowerScoreBCD:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__lowerScoreBuf:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__totalScoreBCD:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__totalScoreAdd:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__compareBCD:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__numOptBCD:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__turnBCD:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__rollBCD:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
	.area _CABS (ABS)
