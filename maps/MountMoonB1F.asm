	object_const_def

MountMoonB1F_MapScripts:
	def_scene_scripts

	def_callbacks

MountMoonB1FHiddenStarPiece:
	hiddenitem STAR_PIECE, EVENT_MOUNT_MOON_B1F_HIDDEN_STAR_PIECE

MountMoonB1FHiddenMoonStone:
	hiddenitem MOON_STONE, EVENT_MOUNT_MOON_B1F_HIDDEN_MOON_STONE

MountMoonB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  3, MOUNT_MOON_1F, 2 ; from MountMoonSquare
	warp_event 33,  5, MOUNT_MOON_1F, 3
	warp_event 15, 21, MOUNT_MOON_1F, 4
	warp_event  3, 17, MOUNT_MOON_1F, 5
	warp_event 21, 13, MOUNT_MOON_B2F, 1
	warp_event 21, 21, MOUNT_MOON_B2F, 2
	warp_event 17, 29, MOUNT_MOON_B2F, 3
	warp_event 33, 25, MOUNT_MOON_B2F, 4
	warp_event 29, 27, MOUNT_MOON_B1F, 10 ; to MountMoonSquare
	warp_event 17,  3, MOUNT_MOON_B1F, 9 ; from MountMoonSquare
	warp_event 31, 29, ROUTE_4, 1
	warp_event  5,  5, MOUNT_MOON_SQUARE, 1
	warp_event 17,  5, MOUNT_MOON_SQUARE, 2

	def_coord_events

	def_bg_events
	bg_event 30,  9, BGEVENT_ITEM, MountMoonB1FHiddenMoonStone
	bg_event  5, 22, BGEVENT_ITEM, MountMoonB1FHiddenStarPiece

	def_object_events
