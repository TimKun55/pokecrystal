; Local equivalent of Polished's `dr` macro: one-byte relative offset.
MACRO dr
	db \1 - @
ENDM

NatureNames:
	table_width 1
	dr .Hardy
	dr .Lonely
	dr .Brave
	dr .Adamant
	dr .Naughty
	dr .Bold
	dr .Docile
	dr .Relaxed
	dr .Impish
	dr .Lax
	dr .Timid
	dr .Hasty
	dr .Serious
	dr .Jolly
	dr .Naive
	dr .Modest
	dr .Mild
	dr .Quiet
	dr .Bashful
	dr .Rash
	dr .Calm
	dr .Gentle
	dr .Sassy
	dr .Careful
	dr .Quirky
	dr .NoNature
	assert_table_length NUM_NATURES + 1

.Hardy:    db "Hardy@"
.Lonely:   db "Lonely@"
.Brave:    db "Brave@"
.Adamant:  db "Adamant@"
.Naughty:  db "Naughty@"
.Bold:     db "Bold@"
.Docile:   db "Docile@"
.Relaxed:  db "Relaxed@"
.Impish:   db "Impish@"
.Lax:      db "Lax@"
.Timid:    db "Timid@"
.Hasty:    db "Hasty@"
.Serious:  db "Serious@"
.Jolly:    db "Jolly@"
.Naive:    db "Naive@"
.Modest:   db "Modest@"
.Mild:     db "Mild@"
.Quiet:    db "Quiet@"
.Bashful:  db "Bashful@"
.Rash:     db "Rash@"
.Calm:     db "Calm@"
.Gentle:   db "Gentle@"
.Sassy:    db "Sassy@"
.Careful:  db "Careful@"
.Quirky:   db "Quirky@"
.NoNature: db "---@"
