	object_const_def
	const AZALEAMOVETUTORHOUSE_HIKER
	const AZALEAMOVETUTORHOUSE_BUG_MANIAC

AzaleaMoveTutorHouse_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaMoveTutor1Script:
	faceplayer
	opentext
	writetext AzaleaMoveTutorIronDefenseText
	waitbutton
	special PlaceMoneyTopRight
	writetext AzaleaMoveTutorIronDefenseAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, .NotEnough
	setval IRON_DEFENSE
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend AzaleaMoveTutorRefused
	
.TeachMove
	writetext AzaleaMoveTutorIronDefensePayment
	takemoney YOUR_MONEY, 3000
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend AzaleaMoveTutorIronDefenseTaught

.NotEnough
	writetextend AzaleaMoveTutorNotEnough

AzaleaMoveTutor2Script:
	faceplayer
	opentext
	writetext AzaleaMoveTutorSilverWindText
	waitbutton
	special PlaceMoneyTopRight
	writetext AzaleaMoveTutorSilverWindAskTeachText
	yesorno
	iffalse .TutorRefused
	checkmoney YOUR_MONEY, 5500
	ifequal HAVE_LESS, .NotEnough
	setval SILVER_WIND
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetextend AzaleaMoveTutorRefused
	
.TeachMove
	writetext AzaleaMoveTutorSilverWindPayment
	takemoney YOUR_MONEY, 5500
	waitbutton
	playsound SFX_TRANSACTION
	special PlaceMoneyTopRight
	writetextend AzaleaMoveTutorSilverWindTaught

.NotEnough
	writetextend AzaleaMoveTutorNotEnough

AzaleaMoveTutorIronDefenseText:
	ntag "Move Tutor"
	text "Yahooo!"
	
	para "Nothing like a"
	line "powerful physical"
	cont "defense!"
	
	para "Iron Defense has"
	line "helped me win"
	cont "many battles."
	done

AzaleaMoveTutorIronDefenseTaught:
	ntag "Move Tutor"
	text "Defense so high"
	line "the foe can't"
	cont "do anything."
	
	para "Just make sure"
	line "you can hit back,"
	cont "too!"
	done

AzaleaMoveTutorIronDefenseAskTeachText:
	ntag "Move Tutor"
	text "Shall I teach it"
	line "to your #mon"
	cont "for ¥3,000?"
	done

AzaleaMoveTutorIronDefensePayment:
	text "<PLAYER> gave the"
	line "Tutor ¥3,000."
	done

AzaleaMoveTutorSilverWindText:
	ntag "Move Tutor"
	text "Hi!"
	
	para "I've been training"
	line "to teach #mon"
	cont "how to use"
	cont "Silver Wind."
	done

AzaleaMoveTutorSilverWindAskTeachText:
	ntag "Move Tutor"
	text "Shall I teach it"
	line "to your #mon"
	cont "for ¥5,500?"
	done

AzaleaMoveTutorSilverWindPayment:
	text "<PLAYER> gave the"
	line "Tutor ¥5,500."
	done

AzaleaMoveTutorSilverWindTaught:
	ntag "Move Tutor"
	text "It does decent"
	line "damage and has a"
	cont "chance to raise"
	cont "all stats!"
	
	para "Bugsy helped me"
	line "develop it."
	done

AzaleaMoveTutorRefused:
	ntag "Move Tutor"
	text "Stop by again"
	line "if you change"
	cont "your mind."
	done

AzaleaMoveTutorNotEnough:
	ntag "Move Tutor"
	text "Sorry, you don't"
	line "have enough."
	done

AzaleaMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 9
	warp_event  4,  7, AZALEA_TOWN, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AzaleaMoveTutor1Script, -1
	object_event  2,  3, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaMoveTutor2Script, -1
