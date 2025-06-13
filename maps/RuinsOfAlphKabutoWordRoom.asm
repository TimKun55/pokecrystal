RuinsOfAlphKabutoWordRoom_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphKabutoWordRoomFirstVisitScene, SCENE_RUINSOFALPHKABUTOWORDROOM_FIRST_VISIT
	scene_script RuinsOfAlphKabutoWordRoomNoopScene,       SCENE_RUINSOFALPHKABUTOWORDROOM_NOOP

	def_callbacks

RuinsOfAlphKabutoWordRoomFirstVisitScene:
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
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_G
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setscene SCENE_RUINSOFALPHKABUTOWORDROOM_NOOP
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	end

RuinsOfAlphKabutoWordRoomNoopScene:
	end

RuinsOfAlphKabutoWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 3
	warp_event 10,  5, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 4
	warp_event 17, 11, RUINS_OF_ALPH_INNER_CHAMBER, 3

	def_coord_events

	def_bg_events

	def_object_events
