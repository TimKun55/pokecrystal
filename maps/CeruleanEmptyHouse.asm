	object_const_def

CeruleanEmptyHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CeruleanEmptyHouseStaircaseCallback

CeruleanEmptyHouseStaircaseCallback:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_CERULEAN_EMPTY_HOUSE
	iffalse .HideStairs
	endcallback

.HideStairs:
	changeblock 6, 0, $99 ; Bookshelf, no stairs
	endcallback

EmptyHouseBookshelf:
	opentext
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_CERULEAN_EMPTY_HOUSE
	iftrue .keystuck
	checkitem SECRET_KEY
	iftrue .hiddenstairs
	writetextend BookshelfText

.hiddenstairs
	writetext BookshelfHiddenHoleText
	yesorno
	iffalse .DidntUseKey
	writetext UsedKeyText
	waitbutton
	closetext
	takeitem SECRET_KEY
	setevent EVENT_UNCOVERED_STAIRCASE_IN_CERULEAN_EMPTY_HOUSE
	playsound SFX_FAINT
	changeblock 6, 0, $9a ; stairs
	reloadmappart
	waitsfx
	end

.DidntUseKey
	writetextend DidntUseKeyText

.keystuck
	writetextend KeyStuckInBookText

BookshelfText:
	text "It's full of"
	line "difficult books."
	done
	
BookshelfHiddenHoleText:
	text "It's full of"
	line "difficult books."
	
	para "Wait."
	
	para "There's a hole"
	line "in the spine of"
	cont "one of them."
	
	para "It looks like"
	line "a keyhole…"
	
	para "Try using the"
	line "Secret Key?"
	done

UsedKeyText:
	text "KER-CHUNK!"
	
	para "The key got stuck"
	line "in the hole."
	done

DidntUseKeyText:
	text "Better not."
	done

KeyStuckInBookText:
	text "The Secret Key is"
	line "stuck inside one"
	cont "of the books."
	done

CeruleanEmptyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 7
	warp_event  3,  7, CERULEAN_CITY, 7
	warp_event  7,  1, CERULEAN_EMPTY_HOUSE_UNDERGROUND, 1

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, EmptyHouseBookshelf

	def_object_events

