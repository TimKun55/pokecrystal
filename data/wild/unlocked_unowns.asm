MACRO unown_set
rept _NARG
	db UNOWN_\1
	shift
endr
	db -1
ENDM

UnlockedUnownLetterSets:
; entries correspond to UNLOCKED_UNOWNS_* constants
	table_width 2
	dw .Set_A_G ; UNLOCKED_UNOWNS_A_TO_G_F
	dw .Set_H_N ; UNLOCKED_UNOWNS_H_TO_N_F
	dw .Set_O_U ; UNLOCKED_UNOWNS_O_TO_U_F
	dw .Set_V_Question ; UNLOCKED_UNOWNS_V_TO_QUESTION_F
	assert_table_length NUM_UNLOCKED_UNOWN_SETS

.Set_A_G:
	unown_set A, B, C, D, E, F, G
.Set_H_N:
	unown_set H, I, J, K, L, M, N
.Set_O_U:
	unown_set O, P, Q, R, S, T, U
.Set_V_Question:
	unown_set V, W, X, Y, Z, EXCLAMATION, QUESTION
