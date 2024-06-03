	object_const_def
	const FUCHSIACITY_BIRD_KEEPER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_LAPRAS
	const FUCHSIACITY_NIDOKING
	const FUCHSIACITY_NIDOQUEEN
	const FUCHSIACITY_PINSIR
	const FUCHSIACITY_TAUROS

FuchsiaCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, FuchsiaCityFlypointCallback

FuchsiaCityFlypointCallback:
	setflag ENGINE_FLYPOINT_FUCHSIA
	endcallback

FuchsiaCityBirdKeeper:
	jumptextfaceplayer FuchsiaCityBirdKeeperText

FuchsiaCityPokefanM:
	jumptextfaceplayer FuchsiaCityPokefanMText

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText
	
FuchsiaCityLapras:
	jumptextfaceplayer FuchsiaCityLaprasText

FuchsiaCityTauros:
	jumptextfaceplayer FuchsiaCityTaurosText

FuchsiaCityPinsir:
	jumptextfaceplayer FuchsiaCityPinsirText

FuchsiaCityNidoking:
	jumptextfaceplayer FuchsiaCityNidokingText

FuchsiaCityNidoqueen:
	jumptextfaceplayer FuchsiaCityNidoqueenText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneParkSign:
	jumptext SafariZoneParkSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneSign:
	jumptext SafariZoneSignText

LaprasSign:
	refreshscreen
	pokepic LAPRAS
	cry LAPRAS
	waitbutton
	closepokepic
	opentext
	writetext LaprasSignText
	waitbutton
	closetext
	end
	
NidokingSign:
	refreshscreen
	pokepic NIDOKING
	cry NIDOKING
	waitbutton
	closepokepic
	opentext
	writetext NidokingSignText
	waitbutton
	closetext
	end
	
NidoqueenSign:
	refreshscreen
	pokepic NIDOQUEEN
	cry NIDOQUEEN
	waitbutton
	closepokepic
	opentext
	writetext NidoqueenSignText
	waitbutton
	closetext
	end
	
PinsirSign:
	refreshscreen
	pokepic PINSIR
	cry PINSIR
	waitbutton
	closepokepic
	opentext
	writetext PinsirSignText
	waitbutton
	closetext
	end
	
TaurosSign:
	refreshscreen
	pokepic TAUROS
	cry TAUROS
	waitbutton
	closepokepic
	opentext
	writetext TaurosSignText
	waitbutton
	closetext
	end

FuchsiaCityPokecenterSign:
	jumpstd PokecenterSignScript

FuchsiaCityMartSign:
	jumpstd MartSignScript

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaCityBirdKeeperText:
	text "One of the ELITE"
	line "FOUR used to be"

	para "the LEADER of"
	line "FUCHSIA's GYM."
	done

FuchsiaCityPokefanMText:
	text "KOGA's daughter"
	line "succeeded him as"

	para "the GYM LEADER"
	line "after he joined"
	cont "the ELITE FOUR."
	done

FuchsiaCityTeacherText:
	text "The SAFARI ZONE"
	line "has reopened. It's"
	cont "very good"

	para "considering it's"
	line "FUCHSIA's main"
	cont "attraction."
	done
	
FuchsiaCityLaprasText:
	text "LAPRAS: Laaap!"

FuchsiaCityTaurosText:
	text "TAUROS: Rosss!"

FuchsiaCityPinsirText:
	text "PINSIR: Sirrr!"

FuchsiaCityNidokingText:
	text "NIDOKING: Kinggg!"

FuchsiaCityNidoqueenText:
	text "NIDOQUEEN: Qweeen!"

FuchsiaCitySignText:
	text "FUCHSIA CITY"

	para "Behold! It's"
	line "Passion Pink!"
	done

FuchsiaGymSignText:
	text "FUCHSIA CITY"
	line "#MON GYM"
	cont "LEADER: JANINE"

	para "The Poisonous"
	line "Ninja Master"
	done

SafariZoneParkSignText:
	text "SAFARI ZONE PARK"

	para "Come and see"
	line "some rare #MON"
	cont "free of charge!"
	done

WardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done

SafariZoneSignText:
	text "SAFARI ZONE"
	line "Reopened!"

	para "Celebrating the"
	line "renovations with"
	cont "free entry!"
	done

LaprasSignText:
	text "LAPRAS"
	line "WATER/ICE"
	
	para "Once endangered"
	line "now thriving."
	done
	
NidokingSignText:
	text "NIDOKING"
	line "POISON/GROUND"
	
	para "Very versatile"
	line "and powerful."
	done
	
NidoqueenSignText:
	text "NIDOQUEEN"
	line "POISON/GROUND"
	
	para "Very versatile"
	line "and powerful."
	cont "Unable to breed."
	done
	
PinsirSignText:
	text "PINSIR"
	line "BUG"
	
	para "Crushes with its"
	line "vice-like pincers."
	done
	
TaurosSignText:
	text "TAUROS"
	line "NORMAL"
	
	para "Takes aim, charges"
	line "quickly and gores"
	cont "its foes."
	done

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 19, FUCHSIA_MART, 2
	warp_event  6, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_BROTHERS_HOUSE, 1
	warp_event 17, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 31, 25, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 22,  3, SAFARI_ZONE_FUCHSIA_GATE, 3
	warp_event 37, 20, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 21, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 33, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 33, ROUTE_19_FUCHSIA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 24, 18, BGEVENT_READ, FuchsiaCitySign
	bg_event  4, 27, BGEVENT_READ, FuchsiaGymSign
	bg_event 21, 15, BGEVENT_READ, SafariZoneParkSign
	bg_event 29, 27, BGEVENT_READ, WardensHomeSign
	bg_event 21,  5, BGEVENT_READ, SafariZoneSign
	bg_event 18, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event 14, 19, BGEVENT_READ, FuchsiaCityMartSign
	bg_event  9, 13, BGEVENT_READ, LaprasSign
	bg_event 17, 11, BGEVENT_READ, PinsirSign
	bg_event  9,  7, BGEVENT_READ, TaurosSign
	bg_event 27, 13, BGEVENT_READ, NidokingSign
	bg_event 35,  9, BGEVENT_READ, NidoqueenSign

	def_object_events
	object_event 23, 29, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityBirdKeeper, -1
	object_event 10, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 23, 22, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event 25,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
	object_event  8, 12, SPRITE_LAPRAS_SAFARI, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaCityLapras, -1
	object_event  8,  6, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTauros, -1
	object_event 16, 10, SPRITE_PINSIR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPinsir, -1
	object_event 26, 12, SPRITE_NIDOKING, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, FuchsiaCityNidoking, -1
	object_event 34,  8, SPRITE_NIDOQUEEN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaCityNidoqueen, -1
