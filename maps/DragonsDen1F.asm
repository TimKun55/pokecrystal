DragonsDen1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .UnsetClairScene

.UnsetClairScene:
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_NOOP
	endcallback

DragonsDen1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, BLACKTHORN_CITY, 7
	warp_event  5,  3, DRAGONS_DEN_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
