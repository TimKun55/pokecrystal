RuinsOfAlphOmanyteWordRoom_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphOmanyteWordRoomFirstVisitScene, SCENE_RUINSOFALPHOMANYTEWORDROOM_FIRST_VISIT
	scene_script RuinsOfAlphOmanyteWordRoomNoopScene,       SCENE_RUINSOFALPHOMANYTEWORDROOM_NOOP

	def_callbacks

RuinsOfAlphOmanyteWordRoomFirstVisitScene:
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
	setflag ENGINE_UNLOCKED_UNOWNS_H_TO_N
	setscene SCENE_RUINSOFALPHOMANYTECHAMBER_NOOP
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	end

RuinsOfAlphOmanyteWordRoomNoopScene:
	end

RuinsOfAlphOmanyteWordRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  7, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 3
	warp_event 10,  7, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 4
	warp_event 17, 13, RUINS_OF_ALPH_INNER_CHAMBER, 4

	def_coord_events

	def_bg_events

	def_object_events
