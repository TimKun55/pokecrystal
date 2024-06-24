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
	random 9
	ifequal 0, .dunsparce
	ifequal 1, .yanma
    ifequal 2, .qwilfish
	ifequal 3, .heracross
	ifequal 4, .mareep
	ifequal 5, .sentret
	ifequal 6, .miltank
	ifequal 7, .mantine
	ifequal 8, .girafarig

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

.sentret
	setflag ENGINE_SWARM
	swarm ROUTE_29
	writetext SwarmSentretText
	waitbutton
	closetext
	end

.miltank
	setflag ENGINE_SWARM
	swarm ROUTE_38
	writetext SwarmMiltankText
	waitbutton
	closetext
	end

.mantine
	setflag ENGINE_SWARM
	swarm ROUTE_41
	writetext SwarmMantineText
	waitbutton
	closetext
	end

.girafarig
	setflag ENGINE_SWARM
	swarm ROUTE_43
	writetext SwarmGirafarigText
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

SwarmSentretText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of SENTRET"
	cont "on ROUTE 29."
	done
	
SwarmMiltankText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of MILTANK"
	cont "on ROUTE 38."
	done

SwarmMantineText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of MANTINE"
	cont "on ROUTE 41."
	done

SwarmGirafarigText:
	text "Let me see…"
	line "What did the news"
	cont "say?"

	para "Oh yes! There's a"
	line "swarm of GIRAFARIG"
	cont "on ROUTE 43."
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
