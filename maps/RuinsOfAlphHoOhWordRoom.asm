RuinsOfAlphHoOhWordRoom_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphHoOhWordRoomFirstVisitScene, SCENE_RUINSOFALPHHOOHWORDROOM_FIRST_VISIT
	scene_script RuinsOfAlphHoOhWordRoomNoopScene,       SCENE_RUINSOFALPHHOOHWORDROOM_NOOP

	def_callbacks

RuinsOfAlphHoOhWordRoomFirstVisitScene:
	pause 30
	cry UNOWN
	turnobject PLAYER, LEFT
	pause 16
	turnobject PLAYER, RIGHT
	pause 16
	turnobject PLAYER, DOWN
	showemote EMOTE_QUESTION, PLAYER, 15
	pause 16
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setflag ENGINE_UNLOCKED_UNOWNS_V_TO_QUESTION
	setscene SCENE_RUINSOFALPHHOOHCHAMBER_NOOP
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
RuinsOfAlphHoOhWordRoomNoopScene:
	end

RuinsOfAlphHoOhWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  9, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 3
	warp_event 10,  9, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 4
	warp_event 17, 21, RUINS_OF_ALPH_INNER_CHAMBER, 2

	def_coord_events

	def_bg_events

	def_object_events
