NonTrainerCallerNames:
; entries correspond to PHONECONTACT_* constants (see constants/trainer_constants.asm)
	table_width 2, NonTrainerCallerNames
	dw .none
	dw .mum
	dw .bikeshop
	dw .bill
	dw .elm
	dw .lyra
	dw .buena
	assert_table_length NUM_NONTRAINER_PHONECONTACTS + 1

.none:     db "----------@"
.mum:      db "Mum:@"
.bill:     db "Bill:@"
.elm:      db "Prof.Elm:@"
.bikeshop: db "Bike Shop:@"
.lyra:     db "Lyra:<LF>   <PK><MN> Trainer@"
.buena:    db "Buena:<LF>   Disc Jockey@"
