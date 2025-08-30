	object_const_def
	const ROCKETUNDERGROUNDTUNNEL_DISGUISED

RocketUndergroundTunnel_MapScripts:
	def_scene_scripts
	scene_script RocketUndergroundTunnelNoop1Scene, SCENE_ROCKETUNDERGROUNDTUNNEL_DISGUISED
	scene_script RocketUndergroundTunnelNoop2Scene, SCENE_ROCKETUNDERGROUNDTUNNEL_NOOP

	def_callbacks

RocketUndergroundTunnelNoop1Scene:
	end

RocketUndergroundTunnelNoop2Scene:
	end

RocketUndergroundTunnelPetrel:
	pause 10
	opentext
	writetext RocketUndergroundTunnelPetrelHuffText
	waitbutton
	closetext
	applymovement ROCKETUNDERGROUNDTUNNEL_DISGUISED, RocketUndergroundTunnelSlowStep1
	opentext
	writetext RocketUndergroundTunnelPetrelComplainText
	waitbutton
	closetext
	applymovement ROCKETUNDERGROUNDTUNNEL_DISGUISED, RocketUndergroundTunnelSlowStep2
	opentext
	writetext RocketUndergroundTunnelPetrelSighText
	waitbutton
	closetext
	applymovement ROCKETUNDERGROUNDTUNNEL_DISGUISED, RocketUndergroundTunnelLeaveMovement
	disappear ROCKETUNDERGROUNDTUNNEL_DISGUISED
	setscene SCENE_ROCKETUNDERGROUNDTUNNEL_NOOP
	end

RocketUndergroundTunnelSlowStep1:
	slow_step UP
	step_end

RocketUndergroundTunnelSlowStep2:
	slow_step LEFT
	slow_step UP
	turn_head UP
	step_end

RocketUndergroundTunnelLeaveMovement:
	step UP
	step UP
	step_end

RocketUndergroundTunnelPetrelHuffText:
	text "???: Huff… huff…"
	done

RocketUndergroundTunnelPetrelComplainText:
	text "Sneaking around,"
	line "digging out this"
	cont "tunnel, and being"
	cont "the lookout…"
	
	para "All while wearing"
	line "this ridiculous"
	cont "disguise!"

	para "Argh! That kid!"
	
	para "……"
	
	para "I'd better get"
	line "going before I"
	cont "get yelled at."
	done

RocketUndergroundTunnelPetrelSighText:
	text "Sigh…"
	done

RocketUndergroundTunnel_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 11, CELADON_ROCKET_HIDEOUT_B4F, 1
	warp_event 29,  3, ROUTE_7_UNDERGROUND_PATH_ENTRANCE, 3

	def_coord_events
	coord_event 22, 11, SCENE_ROCKETUNDERGROUNDTUNNEL_DISGUISED, RocketUndergroundTunnelPetrel

	def_bg_events

	def_object_events
	object_event 19, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCKET_UNDERGROUND_TUNNEL_DISGUISED_PETREL