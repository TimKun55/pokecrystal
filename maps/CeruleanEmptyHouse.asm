	object_const_def

CeruleanEmptyHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EmptyHouseBookshelf:
	opentext
	checkitem SECRET_KEY
	iftrue .hiddenstairs
	writetext BookshelfText
	waitbutton
	closetext
	end

.hiddenstairs
	writetext BookshelfHiddenHoleText
	promptbutton
	yesorno
	iffalse .DidntUseKey
	writetext UsedKeyText
	waitbutton
	playsound SFX_FAINT
	changeblock 6, 0, $9a ; stairs
	reloadmappart
	closetext
	waitsfx
	end

.DidntUseKey
	writetext DidntUseKeyText
	waitbutton
	closetext
	end

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
	cont "one of them…"
	
	para "Try using the"
	line "Secret Key?"
	done

UsedKeyText:
	text "KER-CHUNK"
	done

DidntUseKeyText:
	text "Better not."
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

