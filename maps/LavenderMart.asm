	object_const_def
	const LAVENDERMART_CLERK
	const LAVENDERMART_HIKER
	const LAVENDERMART_ROCKER

LavenderMart_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
	end

LavenderMartHikerScript:
	jumptextfaceplayer LavenderMartHikerText

LavenderMartRockerScript:
	jumptextfaceplayer LavenderMartRockerText

LavenderMartHikerText:
	text "Repel is a neces-"
	line "sity if you are"

	para "going to explore a"
	line "cave."

	para "Even though I like"
	line "exploring, I still"

	para "haven't made it to"
	line "all the caves."
	done

LavenderMartRockerText:
	text "I heard about a"
	line "craftsman who"

	para "makes custom Balls"
	line "in the Johto town"

	para "of Azalea. I wish"
	line "I had some."
	done

LavenderMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartClerkScript, -1
	object_event  8,  7, SPRITE_HIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartHikerScript, -1
	object_event  7,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartRockerScript, -1
