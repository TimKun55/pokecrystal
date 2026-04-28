	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetextend BillEeveeMayEvolveText

.NoRoom:
	writetextend BillPartyFullText

.Refused:
	writetextend BillNoEeveeText

.GotEevee:
	writetextend BillPopWontWorkText

BillsMumScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetextend BillsMumText_BeforeEcruteak

.HaventMetBill:
	writetextend BillsMumText_AfterEcruteak

BillsYoungerSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsYoungerSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetextend BillsYoungerSisterStorageSystemText

.Refused:
	writetextend BillsYoungerSisterRefusedNumberText

.NoRoom:
	writetext BillsYoungerSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillTakeThisEeveeText:
	ntag "Bill"
	text "Hi, <PLAYER>!"

	para "On my way back"
	line "from Ecruteak"
	cont "this Eevee decided"
	cont "to follow me!"

	para "I don't like"
	line "being outside"
	cont "but someone should"
	cont "take care of it."

	para "Can I count on you"
	line "to play with it,"
	cont "<PLAYER>?"
	done

BillImCountingOnYouText:
	ntag "Bill"
	text "I knew you'd"
	line "come through!"

	para "Way to go! You're"
	line "the real deal!"

	para "OK, I'm counting"
	line "on you."

	para "Take good care of"
	line "it!"
	done

ReceivedEeveeText:
	text "<PLAYER> received"
	line "the Eevee!"
	done

BillEeveeMayEvolveText:
	ntag "Bill"
	text "Prof.Elm claims"
	line "Eevee may evolve"
	cont "in new and"
	cont "unknown ways."
	done

BillPartyFullText:
	ntag "Bill"
	text "Whoa, wait. You"
	line "can't carry any"
	cont "more #mon."
	done

BillNoEeveeText:
	ntag "Bill"
	text "Oh… Now what to"
	line "do?"
	done

BillPopWontWorkText:
	ntag "Bill"
	text "My pop, he"
	line "won't work."

	para "All he does is"
	line "goof off all day"
	cont "long."

	para "He's getting to be"
	line "a real headache…"
	done

BillsMumText_BeforeEcruteak:
	text "Oh, you collect"
	line "#mon? My son"
	cont "Bill is an expert."

	para "He just got called"
	line "to the #mon"
	cont "Center in Ecruteak"
	cont "City."

	para "My husband went"
	line "off to the Game"
	cont "Corner without"
	cont "being called…"
	done

BillsMumText_AfterEcruteak:
	text "My husband was"
	line "once known as a"
	cont "#Maniac."

	para "Bill must have"
	line "taken after his"
	cont "father."
	done

BillsYoungerSisterUsefulNumberText:
	text "Are you a trainer?"

	para "I've got a useful"
	line "phone number for"
	cont "you."
	done

RecordedBillsNumberText:
	text "<PLAYER> recorded"
	line "Bill's number."
	done

BillsYoungerSisterRefusedNumberText:
	text "My brother made"
	line "the PC #mon"
	cont "storage system."

	para "I was going to"
	line "give you Bill's"
	cont "number…"
	done

BillsYoungerSisterPhoneFullText:
	text "You can't record"
	line "any more numbers."
	done

BillsYoungerSisterStorageSystemText:
	text "My big brother"
	line "Bill made the PC"
	cont "#mon storage"
	cont "system."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMumScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsYoungerSisterScript, -1
