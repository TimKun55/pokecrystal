	object_const_def
	const ECRUTEAKSWARMHOUSE_GRAMPS

EcruteakSwarmHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SwarmGrampsScript:
	faceplayer
	opentext
	checkflag ENGINE_SWARM
	iftrue .skiprandomswarm
	random 5
	ifequal 0, .dunsparce
	ifequal 1, .yanma
    ifequal 2, .qwilfish
	ifequal 3, .heracross
	ifequal 4, .mareep

.dunsparce
	setflag ENGINE_SWARM
	swarm DARK_CAVE_VIOLET_ENTRANCE
	writetext SwarmDunsparceText
	waitbutton
	closetext
	end

.yanma
	setflag ENGINE_SWARM
	swarm ROUTE_35
	writetext SwarmYanmaText
	waitbutton
	closetext
	end

.qwilfish
	setflag ENGINE_SWARM
	swarm ROUTE_32
	writetext SwarmQwilfishText
	waitbutton
	closetext
	end
	
.heracross
	setflag ENGINE_SWARM
	swarm ILEX_FOREST
	writetext SwarmHeracrossText
	waitbutton
	closetext
	end
	
.mareep
	setflag ENGINE_SWARM
	swarm ROUTE_36
	writetext SwarmMareepText
	waitbutton
	closetext
	end

.skiprandomswarm
	writetext SkipSwarmText
	waitbutton
	closetext
	end

SwarmDunsparceText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of DUNSPARCE"
	cont "at DARK CAVE."
	done
	
SwarmYanmaText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of YANMA"
	cont "on ROUTE 35."
	done
	
SwarmQwilfishText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of QWILFISH"
	cont "on ROUTE 32."
	done
	
SwarmHeracrossText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of HERACROSS"
	cont "in ILEX FOREST."
	done
	
SwarmMareepText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of MAREEP"
	cont "on ROUTE 36."
	done

SkipSwarmText:
	text "Often #MON"
	line "of unusual colors"

	para "are reported in"
	line "swarms."
	done

EcruteakSwarmHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 14
	warp_event  4,  7, ECRUTEAK_CITY, 14

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SwarmGrampsScript, -1
