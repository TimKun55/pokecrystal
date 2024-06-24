; Pokémon swarms in water

SwarmWaterWildMons:

    ; qwilfish
    map_id ROUTE_32
    db 6 percent ; encounter rate
	;   %, species,		 min, max
	db 60, QWILFISH,      20,  22
	db 30, QWILFISH,      23,  26
	db 10, POLIWHIRL,     23,  26
	
    ; mantine
    map_id ROUTE_41
    db 6 percent ; encounter rate
	;   %, species,		 min, max
	db 20, REMORAID,      23,  26
	db 60, MANTINE,       24,  27
	db 20, CORSOLA,       24,  27

	db -1 ; end
