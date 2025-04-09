	object_const_def
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY

EcruteakMart_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

EcruteakMartSuperNerdScript:
	jumptextfaceplayer EcruteakMartSuperNerdText

EcruteakMartGrannyScript:
	jumptextfaceplayer EcruteakMartGrannyText

EcruteakMartSuperNerdText:
	text "My Eevee evolved"
	line "into an Espeon."

	para "And my friend's"
	line "Eevee turned into"
	cont "an Umbreon."

	para "I used a Sun Stone"
	line "and he used a"
	cont "Moon Stone."
	
	para "The Kimono Girls"
	line "have an evolution"
	cont "we've never seen."
	
	para "I wonder what"
	line "they did?"
	done

EcruteakMartGrannyText:
	text "If you use Revive,"
	line "a #mon that's"

	para "fainted will wake"
	line "right up."
	done

EcruteakMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ECRUTEAK_CITY, 7
	warp_event  3,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartClerkScript, -1
	object_event  4,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakMartSuperNerdScript, -1
	object_event  8,  7, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartGrannyScript, -1
