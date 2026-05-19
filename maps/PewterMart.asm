	object_const_def
	const PEWTERMART_CLERK
	const PEWTERMART_YOUNGSTER
	const PEWTERMART_SUPER_NERD

PewterMart_MapScripts:
	def_scene_scripts

	def_callbacks

PewterMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PEWTER
	closetext
	end

PewterMartYoungsterScript:
	jumptextfaceplayer PewterMartYoungsterText

PewterMartSuperNerdScript:
	jumptextfaceplayer PewterMartSuperNerdText

PewterMartYoungsterText:
	text "Hi! Check out my"
	line "Gyarados!"

	para "I raised it from a"
	line "Magikarp. I can't"
	cont "believe how strong"
	cont "it has become."
	done

PewterMartSuperNerdText:
	text "There once was a"
	line "weird old man who"
	cont "sold Magikarp."

	para "He was saying the"
	line "Magikarp from the"
	cont "Lake Of Rage were"
	cont "excellent."
	done

PewterMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, PEWTER_POKECENTER_1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartClerkScript, -1
	object_event  4,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartYoungsterScript, -1
	object_event  7,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMartSuperNerdScript, -1
