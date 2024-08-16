	const_def
	const PAL_TOWNMAP_BORDER   ; 0
	const PAL_TOWNMAP_EARTH    ; 1
	const PAL_TOWNMAP_MOUNTAIN ; 2
	const PAL_TOWNMAP_CITY     ; 3
	const PAL_TOWNMAP_NEW_CITY ; 4
	const PAL_TOWNMAP_WATER    ; 5
	const PAL_TOWNMAP_EXTRA1   ; 6
	const PAL_TOWNMAP_EXTRA2   ; 7

MACRO townmappals
	rept _NARG / 2
		dn PAL_TOWNMAP_\2, PAL_TOWNMAP_\1
		shift 2
	endr
ENDM

; gfx/pokegear/town_map.png
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals WATER,    WATER,    WATER,    EARTH,    NEW_CITY, MOUNTAIN, MOUNTAIN, MOUNTAIN
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals WATER,    MOUNTAIN, WATER,    BORDER,   BORDER,   BORDER,   EXTRA2,   EXTRA2
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals WATER,    WATER,    BORDER,   BORDER,   BORDER,   BORDER,   EXTRA2,   EXTRA2
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
; gfx/pokegear/pokegear.png
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   NEW_CITY, NEW_CITY, NEW_CITY, BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     BORDER
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
