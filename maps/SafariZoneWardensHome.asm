	object_const_def
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	def_scene_scripts

	def_callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	writetextend WardensGranddaughterText1

.AlreadyMet:
	writetextend WardensGranddaughterText2

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd PictureBookshelfScript

WardensGranddaughterText1:
	text "My grandpa is the"
	line "Safari Zone War-"
	cont "den."

	para "At least he was…"

	para "He decided to go"
	line "on a vacation and"
	cont "took off overseas"
	cont "all by himself."

	para "He quit running"
	line "Safari Zone just"
	cont "like that."
	done

WardensGranddaughterText2:
	text "Many people were"
	line "sad that the"
	cont "Safari Zone had"
	cont "closed down."

	para "It's a good thing"
	line "my Dad was able to"
	cont "step in and keep"
	cont "it open for every-"
	cont "one!"
	done

WardenPhotoText:
	text "It's a photo of a"
	line "grinning old man"
	cont "who's surrounded"
	cont "by #mon."
	done

SafariZonePhotoText:
	text "It's a photo of a"
	line "huge grassy plain"
	cont "with rare #mon"
	cont "frolicking in it."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 5
	warp_event  3,  7, FUCHSIA_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	def_object_events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
