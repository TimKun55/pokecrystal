UndergroundPath_MapScripts:
	def_scene_scripts
	scene_script UndergroundPathNoop1Scene, SCENE_UNDERGROUNDPATH_NOOP
	scene_script UndergroundPathNoop2Scene, SCENE_UNDERGROUNDPATH_DOOR

	def_callbacks
	callback MAPCALLBACK_TILES, UndergroundPathHiddenDoorCallback

UndergroundPathNoop1Scene:
	end

UndergroundPathNoop2Scene:
	end

UndergroundPathHiddenDoorCallback:
	checkevent EVENT_UNDERGROUND_HIDDEN_ROOM
	iftrue .HiddendoorOpen
	endcallback

.HiddendoorOpen:
	changeblock  4, 12, $4a ; hidden door
	endcallback

UndergroundPathDoor:
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	pause 15
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 30
	showemote EMOTE_QUESTION, PLAYER, 30
	changeblock  4, 12, $4a ; hidden door
	reloadmappart
	pause 15
	opentext
	writetext SomethingOpenText
	waitbutton
	closetext
	setevent EVENT_UNDERGROUND_HIDDEN_ROOM
	setscene SCENE_UNDERGROUNDPATH_NOOP
	end

UndergroundPathHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_UNDERGROUND_PATH_HIDDEN_FULL_RESTORE

UndergroundPathHiddenXSpAtk:
	hiddenitem X_SP_ATK, EVENT_UNDERGROUND_PATH_HIDDEN_X_SP_ATK

SomethingOpenText:
	text "Did a door"
	line "open somewhere?"
	done

UndergroundPath_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  2, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  3, 24, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 3
	warp_event  5, 12, UNDERGROUND_ROOM, 1

	def_coord_events
	coord_event  1,  7, SCENE_UNDERGROUNDPATH_DOOR, UndergroundPathDoor
	coord_event  2,  7, SCENE_UNDERGROUNDPATH_DOOR, UndergroundPathDoor
	coord_event  3,  7, SCENE_UNDERGROUNDPATH_DOOR, UndergroundPathDoor
	coord_event  4,  7, SCENE_UNDERGROUNDPATH_DOOR, UndergroundPathDoor

	def_bg_events
	bg_event  3,  9, BGEVENT_ITEM, UndergroundPathHiddenFullRestore
	bg_event  1, 19, BGEVENT_ITEM, UndergroundPathHiddenXSpAtk

	def_object_events
