	object_const_def
	const ROUTE2NUGGETHOUSE_FAT_GUY

Route2NuggetHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route2NuggetHouseFatGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotNugget
	writetext Route2NuggetHouseFatGuyText
	promptbutton
	verbosegiveitem NUGGET
	iffalse .NoRoom
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotNugget:
	writetext Route2NuggetHouseFatGuyText_GotNugget
	waitbutton
.NoRoom:
	closetext
	end

Route2NuggetHouseFatGuyText:
	text "Hi! Wow, I'm glad"
	line "to see you."

	para "You're the first"
	line "visitor I've had"
	cont "in a long time."

	para "I'm super-happy!"
	line "Let me give you a"
	cont "little present."
	done

Route2NuggetHouseFatGuyText_GotNugget:
	text "That's a Nugget."

	para "I can't give you"
	line "any nuggets of"
	cont "wisdom, so that'll"
	cont "have to do!"
	done

Route2NuggetHouse_MapEvents:

	def_warp_events
	warp_event  2,  7, ROUTE_2, 1
	warp_event  3,  7, ROUTE_2, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_FAT_GUY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2NuggetHouseFatGuyScript, -1
