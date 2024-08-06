	object_const_def
	const MAHOGANYBAKERY_POKEFAN_F
	const MAHOGANYBAKERY_GRAMPS
	const MAHOGANYBAKERY_LASS
	const MAHOGANYBAKERY_TEDDIURSA

MahoganyBakery_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyBakery:
	faceplayer
	opentext
	checkevent EVENT_GAVE_POFFIN_CHERI
	iftrue .GiveSpicyPoffin
	checkevent EVENT_GAVE_POFFIN_CHESTO
	iftrue .GiveDryPoffin
	checkevent EVENT_GAVE_POFFIN_PECHA
	iftrue .GiveSweetPoffin
	checkevent EVENT_GAVE_POFFIN_RAWST
	iftrue .GiveBitterPoffin
	checkevent EVENT_GAVE_POFFIN_ASPEAR
	iftrue .GiveSourPoffin
	checkevent EVENT_GAVE_POFFIN_PERSIM
	iftrue .GiveRichPoffin
	checkevent EVENT_GAVE_POFFIN_ORAN
	iftrue .GiveMildPoffin
	checkevent EVENT_GAVE_POFFIN_SITRUS
	iftrue .GiveSaltyPoffin
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .CheckBerries
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .CheckBerries
	writetext BakeryPoffinsFromBerryText
	waitbutton
.CheckBerries:
	checkitem CHERI_BERRY
	iftrue .AskBerry
	checkitem CHESTO_BERRY
	iftrue .AskBerry
	checkitem PECHA_BERRY
	iftrue .AskBerry
	checkitem RAWST_BERRY
	iftrue .AskBerry
	checkitem ASPEAR_BERRY
	iftrue .AskBerry
	checkitem PERSIM_BERRY
	iftrue .AskBerry
	checkitem ORAN_BERRY
	iftrue .AskBerry
	checkitem SITRUS_BERRY
	iftrue .AskBerry
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .LooksDelicious
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .IMakePoffinsFromBerries
	closetext
	end

.IMakePoffinsFromBerries:
	writetext BakeryPoffinsFromBerryText
	waitbutton
	closetext
	end

.AskBerry:
	writetext BakeryAskYouHaveABerryText
	promptbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special SelectBerryForPoffin
	ifequal FALSE, .Cancel
	ifequal CHESTO_BERRY, .Cst
	ifequal PECHA_BERRY, .Pec
	ifequal RAWST_BERRY, .Raw
	ifequal ASPEAR_BERRY, .Asp
	ifequal PERSIM_BERRY, .Per
	ifequal ORAN_BERRY, .Ora
	ifequal SITRUS_BERRY, .Sit
; .Che
	setevent EVENT_GAVE_POFFIN_CHERI
	sjump .GavePoffinBerrys

.Cst:
	setevent EVENT_GAVE_POFFIN_CHESTO
	sjump .GavePoffinBerrys

.Pec:
	setevent EVENT_GAVE_POFFIN_PECHA
	sjump .GavePoffinBerrys

.Raw:
	setevent EVENT_GAVE_POFFIN_RAWST
	sjump .GavePoffinBerrys

.Asp:
	setevent EVENT_GAVE_POFFIN_ASPEAR
	sjump .GavePoffinBerrys

.Per:
	setevent EVENT_GAVE_POFFIN_PERSIM
	sjump .GavePoffinBerrys

.Ora:
	setevent EVENT_GAVE_POFFIN_ORAN
	sjump .GavePoffinBerrys

.Sit:
	setevent EVENT_GAVE_POFFIN_SITRUS
	sjump .GavePoffinBerrys

.GavePoffinBerrys:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext BakeryGetStartedText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playsound SFX_WARP_TO
	waitsfx
	pause 35
	sjump MahoganyBakery
	end

.Cancel:
	writetext BakeryThatsAShameText
	waitbutton
	closetext
	end

._LooksDelicious:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.LooksDelicious:
	writetext BakeryTurnedOutGreatText
	waitbutton
.NoRoomForPoffin:
	closetext
	end

.GiveSpicyPoffin:
	verbosegiveitemvar SPICY_POFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_CHERI
	sjump ._LooksDelicious

.GiveDryPoffin:
	verbosegiveitemvar DRY_POFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_CHESTO
	sjump ._LooksDelicious

.GiveSweetPoffin:
	verbosegiveitemvar SWEET_POFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_PECHA
	sjump ._LooksDelicious

.GiveBitterPoffin:
	verbosegiveitemvar BITTERPOFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_RAWST
	sjump ._LooksDelicious

.GiveSourPoffin:
	verbosegiveitemvar SOUR_POFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_ASPEAR
	sjump ._LooksDelicious

.GiveRichPoffin:
	verbosegiveitemvar RICH_POFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_PERSIM
	sjump ._LooksDelicious

.GiveMildPoffin:
	verbosegiveitemvar MILD_POFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_ORAN
	sjump ._LooksDelicious

.GiveSaltyPoffin:
	verbosegiveitemvar SALTY_POFFIN, VAR_POFFIN_BERRYS
	iffalse .NoRoomForPoffin
	clearevent EVENT_GAVE_POFFIN_SITRUS
	sjump ._LooksDelicious

MahoganyBakeryGramps:
	jumptextfaceplayer BakeryGrampsPoffinExplainText

MahoganyBakeryLass:
	jumptextfaceplayer MahoganyBakeryLassText

MahoganyBakeryTeddiursa:
	opentext
	writetext MahoganyBakeryTeddiursaText
	cry TEDDIURSA
	waitbutton
	refreshscreen
	pokepic TEDDIURSA
	waitbutton
	closepokepic
	closetext
	end

BakeryPoffinsFromBerryText:
	text "We make Poffins"
	line "from Berries."

	para "Collect them from"
	line "trees and bring"
	cont "them to us."

	para "We'll make Poffins"
	line "out of them."
	done

BakeryAskYouHaveABerryText:
	text "Do you have any"
	line "Berries for me?"

	para "Good! I'll make"
	line "some Poffins!"
	done

BakeryGetStartedText:
	text "I'll get started!"
	done
	
BakeryThatsAShameText:
	text "Oh, that's"
	line "a shame."
	done

BakeryTurnedOutGreatText:
	text "They turned"
	line "out great."

	para "Try letting your"
	line "#mon hold"
	cont "one in battle!"
	done

BakeryGrampsPoffinExplainText:
	text "When a #mon"
	line "holding a Poffin"
	
	para "gets hit in"
	line "battle, it eats"
	
	para "the Poffin and"
	line "gets a stat boost!"
	
	para "Our Poffins are"
	line "quite popular!"
	done

MahoganyBakeryLassText:
	text "My Teddiursa has"
	line "a high Atk stat"
	
	para "and loves to eat"
	line "Spicy Poffins!"
	
	para "In battle, it"
	line "makes Teddiursa"
	cont "even stronger!"
	done

MahoganyBakeryTeddiursaText:
	text "Teddiursa: Diur!"
	done

MahoganyBakery_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, MAHOGANY_TOWN, 7
	warp_event  5,  9, MAHOGANY_TOWN, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyBakery, -1
	object_event 10,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyBakeryGramps, -1
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyBakeryLass, -1
	object_event  1,  2, SPRITE_TEDDIURSA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyBakeryTeddiursa, -1
