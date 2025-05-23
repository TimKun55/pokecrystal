	object_const_def
	const ICEPATHB1F_BOULDER1
	const ICEPATHB1F_BOULDER2
	const ICEPATHB1F_BOULDER3
	const ICEPATHB1F_BOULDER4
	const ICEPATHB1F_POKE_BALL

IcePathB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, IcePathB1FSetUpStoneTableCallback

IcePathB1FSetUpStoneTableCallback:
	usestonetable .StoneTable
	endcallback

.StoneTable:
	stonetable 3, ICEPATHB1F_BOULDER1, .Boulder1
	stonetable 4, ICEPATHB1F_BOULDER2, .Boulder2
	stonetable 5, ICEPATHB1F_BOULDER3, .Boulder3
	stonetable 6, ICEPATHB1F_BOULDER4, .Boulder4
	db -1 ; end

.Boulder1:
	disappear ICEPATHB1F_BOULDER1
	clearevent EVENT_BOULDER_IN_ICE_PATH_1A
	sjump .FinishBoulder

.Boulder2:
	disappear ICEPATHB1F_BOULDER2
	clearevent EVENT_BOULDER_IN_ICE_PATH_2A
	sjump .FinishBoulder

.Boulder3:
	disappear ICEPATHB1F_BOULDER3
	clearevent EVENT_BOULDER_IN_ICE_PATH_3A
	sjump .FinishBoulder

.Boulder4:
	disappear ICEPATHB1F_BOULDER4
	clearevent EVENT_BOULDER_IN_ICE_PATH_4A
	sjump .FinishBoulder

.FinishBoulder:
	pause 30
	scall .BoulderFallsThrough
	opentext
	writetext IcePathBoulderFellThroughText
	waitbutton
	closetext
	end

.BoulderFallsThrough:
	playsound SFX_STRENGTH
	earthquake 80
	end

IcePathB1FBoulder:
	jumpstd StrengthBoulderScript

IcePathB1FIron:
	itemball IRON

IcePathB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_ICE_PATH_B1F_HIDDEN_MAX_POTION

IcePathBoulderFellThroughText:
	text "The boulder fell"
	line "through."
	done

IcePathB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, ICE_PATH_1F, 3
	warp_event 19,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 1
	warp_event 13,  4, ICE_PATH_B2F_MAHOGANY_SIDE, 3 ; hole
	warp_event  6,  9, ICE_PATH_B2F_MAHOGANY_SIDE, 4 ; hole
	warp_event  7, 14, ICE_PATH_B2F_MAHOGANY_SIDE, 5 ; hole
	warp_event 14, 15, ICE_PATH_B2F_MAHOGANY_SIDE, 6 ; hole
	warp_event  7, 27, ICE_PATH_1F, 4
	warp_event 13, 29, ICE_PATH_B2F_BLACKTHORN_SIDE, 1

	def_coord_events

	def_bg_events
	bg_event 19, 32, BGEVENT_ITEM, IcePathB1FHiddenMaxPotion

	def_object_events
	object_event 13,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_1
	object_event  9, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_2
	object_event 10, 11, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_3
	object_event 19,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	object_event  7, 37, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_POKE_BALL, OBJECTTYPE_ITEMBALL, 0, IcePathB1FIron, EVENT_ICE_PATH_B1F_IRON
