	object_const_def
	const SLOWPOKEWELLENTRANCE_KURT

SlowpokeWellEntrance_MapScripts:
	def_scene_scripts

	def_callbacks

SlowpokeWellEntranceKurtScript:
	jumptextfaceplayer SlowpokeWellEntranceKurtText

SlowpokeWellEntranceKurtText:
	text "Kurt: Hey there,"
	line "<PLAYER>!"

	para "The guard up top"
	line "took off when I"
	cont "shouted at him."

	para "But then I took a"
	line "tumble down the"
	cont "Well."

	para "I slammed down"
	line "hard on my back,"
	cont "so I can't move."

	para "Rats! If I were"
	line "fit, my #mon"

	para "would've punished"
	line "them…"

	para "Ah, it can't be"
	line "helped."

	para "<PLAYER>, show them"
	line "how gutsy you are"
	cont "in my place!"
	done

SlowpokeWellEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, AZALEA_TOWN, 6
	warp_event  7, 5, SLOWPOKE_WELL_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 8, 10, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellEntranceKurtScript, EVENT_SLOWPOKE_WELL_KURT
