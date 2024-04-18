Route10North_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	return

RockTunnelSign:
	jumptext RockTunnelSignText

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd PokecenterSignScript

RockTunnelSignText:
	text "ROCK TUNNEL"

	para "Through to"
	line "LAVENDER TOWN"
	done

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  1, ROCK_TUNNEL_1F, 1
	warp_event  9,  3, ROUTE_10_POKECENTER_1F, 1
	warp_event  7, 17, POWER_PLANT, 1

	def_coord_events

	def_bg_events
	bg_event  6,  2, BGEVENT_READ, RockTunnelSign
	bg_event  5, 19, BGEVENT_READ, PowerPlantSign
	bg_event 10,  3, BGEVENT_READ, Route10PokecenterSign

	def_object_events
