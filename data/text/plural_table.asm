MACRO plural
	for i, CHARLEN(\1)
		db STRCHAR(\1, CHARLEN(\1) - 1 - i)
	endr
	db "@", \2, "@"
ENDM

PluralTable:
	; specific / irregular entries first
	plural "Sand",  "Sand"
	plural "Milk",  "Milk"
	plural "der",   "der"
	plural "ns",    "nses"
	plural "c.",    "cs."
	plural "f.",    "fs."
	plural "k.",    "ks."
	; general suffix rules
	plural "ay",    "ays"
	plural "y",     "ies"
	plural "x",     "xes"
	plural "h",     "hes"
	plural "f",     "ves"
	plural "s",     "s"
	plural "",      "s"