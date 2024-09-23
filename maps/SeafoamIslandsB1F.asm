	object_const_def
	const SEAFOAMISLANDSB1F_POKE_BALL1
	const SEAFOAMISLANDSB1F_POKE_BALL2
	const SEAFOAMISLANDSB1F_BOULDER1
	const SEAFOAMISLANDSB1F_BOULDER2
	const SEAFOAMISLANDSB1F_BOULDER3
	const SEAFOAMISLANDSB1F_BOULDER4
	const SEAFOAMISLANDSB1F_BOULDER5

SeafoamIslandsB1F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB1FRareCandy:
	itemball RARE_CANDY

SeafoamIslandsB1FIceHeal:
	itemball ICE_HEAL

SeafoamIslandsB1FBoulder:
	jumpstd StrengthBoulderScript

SeafoamIslandsB1FHiddenEscapeRope:
	hiddenitem ESCAPE_ROPE, EVENT_SEAFOAM_ISLANDS_B1F_HIDDEN_ESCAPE_ROPE

SeafoamIslandsB1FHiddenIceHeal:
	hiddenitem ICE_HEAL, EVENT_SEAFOAM_ISLANDS_B1F_HIDDEN_ICE_HEAL

SeafoamIslandsB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 13, SEAFOAM_ISLANDS_1F, 2
	warp_event 21, 13, SEAFOAM_ISLANDS_B2F, 1
	warp_event 14,  5, SEAFOAM_ISLANDS_B2F, 2
	warp_event 11, 11, SEAFOAM_ISLANDS_B2F, 3
	warp_event  5, 13, SEAFOAM_ISLANDS_B2F, 4
	warp_event  3,  3, SEAFOAM_ISLANDS_1F, 3

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_ITEM, SeafoamIslandsB1FHiddenEscapeRope
	bg_event 20, 11, BGEVENT_ITEM, SeafoamIslandsB1FHiddenIceHeal

	def_object_events
	object_event 15,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB1FRareCandy, EVENT_SEAFOAM_ISLANDS_B1F_RARE_CANDY
	object_event 21,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB1FIceHeal, EVENT_SEAFOAM_ISLANDS_B1F_ICE_HEAL
	object_event 10,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB1FBoulder, -1
	object_event 26,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB1FBoulder, -1
	object_event 27,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB1FBoulder, -1
	object_event  4, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB1FBoulder, -1
	object_event  9, 13, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB1FBoulder, -1
	