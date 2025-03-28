	const_def
	const PAL_TOWNMAP_PGEAR    ; 0
	const PAL_TOWNMAP_EARTH    ; 1
	const PAL_TOWNMAP_MOUNTAIN ; 2
	const PAL_TOWNMAP_BORDER   ; 3
	const PAL_TOWNMAP_NEW_CITY ; 4
	const PAL_TOWNMAP_WATER    ; 5
	const PAL_TOWNMAP_CAVE     ; 6
	const PAL_TOWNMAP_ROUTE    ; 7

MACRO townmappals
	rept _NARG / 2
		dn PAL_TOWNMAP_\2, PAL_TOWNMAP_\1
		shift 2
	endr
ENDM

; gfx/pokegear/town_map.png
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals WATER,    WATER,    WATER,    NEW_CITY, ROUTE,    CAVE,     CAVE,     ROUTE
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals WATER,    WATER,    WATER,    ROUTE,    CAVE,     PGEAR,    BORDER,   BORDER
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals WATER,    WATER,    BORDER,   PGEAR,    PGEAR,    PGEAR,    BORDER,   BORDER
	townmappals ROUTE,    ROUTE,    ROUTE,    ROUTE,    ROUTE,    ROUTE,    ROUTE,    ROUTE
	townmappals ROUTE,    ROUTE,    ROUTE,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR
; gfx/pokegear/pokegear.png
	townmappals PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR
	townmappals PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR
	townmappals PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR
	townmappals PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    BORDER
	townmappals PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR
	townmappals PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR,    PGEAR
