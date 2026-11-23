GenerateSwarmShiny:
	ld a, [wSwarmMapGroup]
	ld b, a
	ld a, [wSwarmMapNumber]
	ld c, a
	call GetWorldMapLocation
    cp LANDMARK_ROUTE_29
	jr z, .sentret	
    cp LANDMARK_ROUTE_32
	jr z, .qwilfish
    cp LANDMARK_ROUTE_35
    jr z, .yanma
	cp LANDMARK_ROUTE_36
	jr z, .mareep
	cp LANDMARK_ROUTE_38
	jr z, .miltank
	cp LANDMARK_ROUTE_41
	jr z, .mantine
	cp LANDMARK_ROUTE_43
	jr z, .girafarig
    cp LANDMARK_DARK_CAVE
	jr z, .dunsparce
	cp LANDMARK_ILEX_FOREST
	jr z, .heracross
    jr .skipshine

.sentret
    ld a, [wCurPartySpecies]
    cp SENTRET
    jr nz, .skipshine
    jr .rollshiny
.qwilfish
    ld a, [wCurPartySpecies]
    cp QWILFISH
    jr nz, .skipshine
    jr .rollshiny
.yanma
    ld a, [wCurPartySpecies]
    cp YANMA
    jr nz, .skipshine
    jr .rollshiny
.mareep
    ld a, [wCurPartySpecies]
    cp MAREEP
    jr nz, .skipshine
    jr .rollshiny
.miltank
    ld a, [wCurPartySpecies]
    cp MILTANK
    jr nz, .skipshine
    jr .rollshiny
.mantine
    ld a, [wCurPartySpecies]
    cp MANTINE
    jr nz, .skipshine
    jr .rollshiny
.girafarig
    ld a, [wCurPartySpecies]
    cp GIRAFARIG
    jr nz, .skipshine
    jr .rollshiny
.dunsparce
    ld a, [wCurPartySpecies]
    cp DUNSPARCE
    jr nz, .skipshine
    jr .rollshiny
.heracross
    ld a, [wCurPartySpecies]
    cp HERACROSS
    jr nz, .skipshine	
    jr .rollshiny
.rollshiny
    call Random
	cp 15 ; adjust to desired percentage
	jr nc, .trynext
	ld a, PERSONALITY_FORCE_SHINY
	ret
.trynext:
	call Random
	cp 15 ; adjust to desired percentage
	jr nc, .skipshine
	ld a, PERSONALITY_FORCE_SHINY
	ret

.skipshine:
	xor a
	ret
