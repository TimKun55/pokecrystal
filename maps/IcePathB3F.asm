	object_const_def
	const ICEPATHB3F_POKE_BALL
	const ICEPATHB3F_ROCK

IcePathB3F_MapScripts:
	def_scene_scripts

	def_callbacks

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd SmashRockScript

IcePathB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 17,  7, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  9, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
	object_event  8,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FRock, -1
