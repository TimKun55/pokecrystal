	object_const_def
	const CELADONHOTELPOOL_TWIN
	const CELADONHOTELPOOL_SWIMMER_GUY
	const CELADONHOTELPOOL_POKEFAN_M
	const CELADONHOTELPOOL_SURFING_PIKACHU

CeladonHotelPool_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmerMTony:
	trainer SWIMMERM, TONY, EVENT_BEAT_SWIMMERM_TONY, SwimmerMTonySeenText, SwimmerMTonyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SwimmerMTonyAfterText
	waitbutton
	closetext
	end

CeladonHotelPoolTwinScript:
	jumptextfaceplayer CeladonHotelPoolTwinText

CeladonHotelPoolPokefanMScript:
	jumptextfaceplayer CeladonHotelPoolPokefanMText

CeladonHotelPoolSurfingPikachuScript:
	faceplayer
	opentext
	writetext SurfingPikachuText
	cry PIKACHU
	closetext
	end

SwimmerMTonySeenText:
	text "Oh, you're a"
	line "trainer?"
	
	para "I'm on vacation"
	line "but I feel like"
	cont "a battle!"
	done

SwimmerMTonyBeatenText:
	text "Washed up, washed"
	line "out, washed away!"
	done

SwimmerMTonyAfterText:
	text "We're not from"
	line "Kanto, but we"
	cont "visit often."
	
	para "I've got to keep"
	line "up my training,"
	cont "though."
	done

CeladonHotelPoolTwinText:
	text "Whee!"
	
	para "Look at my"
	line "Pikachu go!"
	done

CeladonHotelPoolPokefanMText:
	text "Well, color me"
	line "impressed."

	para "This hotel's"
	line "facilities are"
	cont "second-to-none!"
	done

SurfingPikachuText:
	text "Pikachu: Pikapi!"
	done

CeladonHotelPool_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10,  7, CELADON_HOTEL_1F, 3
	warp_event 11,  7, CELADON_HOTEL_1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonHotelPoolTwinScript, -1
	object_event  3,  4, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SWIM_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerSwimmerMTony, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonHotelPoolPokefanMScript, -1
	object_event  7,  3, SPRITE_SURFING_PIKACHU, SPRITEMOVEDATA_SWIM_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, CeladonHotelPoolSurfingPikachuScript, -1
