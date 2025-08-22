	object_const_def
	const ROUTE2_YOUNGSTER1
	const ROUTE2_YOUNGSTER2
	const ROUTE2_BEAUTY1
	const ROUTE2_BEAUTY2
	const ROUTE2_POKE_BALL1
	const ROUTE2_FRUIT_TREE

Route2_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBeautyCaroline:
	trainer BEAUTY, CAROLINE, EVENT_BEAT_BEAUTY_CAROLINE, BeautyCarolineSeenText, BeautyCarolineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCarolineAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCarlene:
	trainer BEAUTY, CARLENE, EVENT_BEAT_BEAUTY_CARLENE, BeautyCarleneSeenText, BeautyCarleneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCarleneAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperThomas:
	trainer CAMPER, THOMAS, EVENT_BEAT_CAMPER_THOMAS, CamperThomasSeenText, CamperThomasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperThomasAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLeroy:
	trainer CAMPER, LEROY, EVENT_BEAT_CAMPER_LEROY, CamperLeroySeenText, CamperLeroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLeroyAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2Elixer:
	itemball ELIXER

Route2PechaTree:
	fruittree FRUITTREE_ROUTE_2_PECHA

BeautyCarolineSeenText:
	text "I love visiting"
	line "the Museum, but"
	cont "I need a break."
	
	para "Let's battle to"
	line "pass the time."
	done

BeautyCarolineBeatenText:
	text "Aww, meanie!"
	done

BeautyCarolineAfterBattleText:
	text "I wonder if the"
	line "Museum will get"
	cont "new exhibits?"
	done

BeautyCarleneSeenText:
	text "I love how pretty"
	line "it is here."
	
	para "Oh! A battle?"
	line "Yeah! Let's do it!"
	done 

BeautyCarleneBeatenText:
	text "Well, that's"
	line "not pretty!"
	done

BeautyCarleneAfterBattleText:
	text "I'm sure the"
	line "forest is nice"
	cont "but, urgh, bugs."
	done

CamperThomasSeenText:
	text "I'm on a journey"
	line "to Johto!"
	done

CamperThomasBeatenText:
	text "So strong!"
	done

CamperThomasAfterBattleText:
	text "I can't wait to"
	line "visit the Lake"
	cont "of Rage."
	done

CamperLeroySeenText:
	text "I'm on a journey"
	line "from Johto!"
	done

CamperLeroyBeatenText:
	text "Blown away!"
	done

CamperLeroyAfterBattleText:
	text "I can't wait to"
	line "visit the Safari"
	cont "Zone in Fuchsia."
	done

Route2SignText:
	text "Route 2"

	para "Viridian City -"
	line "Pewter City"
	done

Route2DiglettsCaveSignText:
	text "Diglett's Cave"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15, 22, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 15, 45, ROUTE_2_GATE, 3
	warp_event 16, 45, ROUTE_2_GATE, 4
	warp_event 15, 41, ROUTE_2_GATE, 1
	warp_event 16, 41, ROUTE_2_GATE, 2
	warp_event 12,  9, DIGLETTS_CAVE, 3
	warp_event  3, 45, ROUTE_2_VIRIDIAN_FOREST_GATE, 1
	warp_event  4, 45, ROUTE_2_VIRIDIAN_FOREST_GATE, 2
	warp_event  1, 11, VIRIDIAN_FOREST_ROUTE_2_GATE, 3
	warp_event  2, 11, VIRIDIAN_FOREST_ROUTE_2_GATE, 4

	def_coord_events

	def_bg_events
	bg_event  6, 64, BGEVENT_READ, Route2Sign
	bg_event 14, 10, BGEVENT_READ, Route2DiglettsCaveSign

	def_object_events
	object_event  7,  7, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBeautyCaroline, -1
	object_event 11, 64, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBeautyCarlene, -1
	object_event  1, 52, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperThomas, -1
	object_event 16, 54, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperLeroy, -1
	object_event 13, 61, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
	object_event 18, 24, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2PechaTree, -1
