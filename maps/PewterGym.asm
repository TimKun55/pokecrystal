	object_const_def
	const PEWTERGYM_BROCK
	const PEWTERGYM_ONIX
	const PEWTERGYM_YOUNGSTER1
	const PEWTERGYM_YOUNGSTER2
	const PEWTERGYM_GYM_GUIDE

PewterGym_MapScripts:
	def_scene_scripts

	def_callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KANTO_LEADERS
	iftrue .BrockScript_Rematch
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	readvar VAR_BADGES
	ifequal 9, .FirstBadge
	ifequal 11, .Lyra3Badges
	ifequal 13, .LyrasEgg
	sjump .Finish
.FirstBadge:
	specialphonecall SPECIALCALL_LYRAFIRSTBADGE
	sjump .Finish
.Lyra3Badges:
	specialphonecall SPECIALCALL_LYRATHIRDBADGE
	sjump .Finish
.LyrasEgg:
	specialphonecall SPECIALCALL_LYRASEGG
.Finish:
	writetextend BrockBoulderBadgeText

.FightDone:
	writetextend BrockFightDoneText

.BrockScript_Rematch
	checkflag ENGINE_DAILY_BROCK_REMATCH
	iftrue .skip_rematch
	writetext BrockRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext BrockWinLossRematchText, 0
	loadtrainer BROCK, BROCK2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_BROCK_REMATCH
	opentext
	writetextend BrockRematchAfterBattleText

.skip_rematch
	writetextend BrockComeBackTomorrowText
	
.EndRematch
	writetextend BrockNextTimeText

PewterGymOnix:
	opentext
	writetext OnixText
	cry ONIX
	waitbutton
	refreshscreen
	pokepic ONIX
	waitbutton
	closepokepic
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CamperJerryAfterBattleText

TrainerCamperDavid:
	trainer CAMPER, DAVID, EVENT_BEAT_CAMPER_DAVID, CamperDavidSeenText, CamperDavidBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CamperDavidAfterBattleText

PewterGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuideWinScript
	writetextend PewterGymGuideText

.PewterGymGuideWinScript:
	writetextend PewterGymGuideWinText

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd GymStatue2Script

BrockIntroText:
	text "Brock: Wow, it's"
	line "not often that we"
	cont "get a challenger"
	cont "from Johto."

	para "I'm Brock, the"
	line "Pewter Gym Leader."

	para "I'm an expert on"
	line "rock-type #mon."

	para "My #mon are im-"
	line "pervious to most"
	cont "physical attacks."
	
	para "You'll have a hard"
	line "time inflicting"
	cont "any damage."

	para "Come on!"
	done

BrockWinLossText:
	text "Brock: Your #-"
	line "mon's powerful at-"
	cont "tacks overcame my"
	cont "rock-hard defense…"

	para "You're stronger"
	line "than I expected…"

	para "Go ahead--take"
	line "this Badge."
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> received"
	line "the BoulderBadge."
	done

BrockBoulderBadgeText:
	text "Brock: <PLAY_G>,"
	line "thanks. I enjoyed"
	cont "battling you, even"
	cont "though I am a bit"
	cont "upset."
	
	para "The BoulderBadge"
	line "shows your sturdy"
	cont "commitment to"
	cont "raising #mon."
	
	para "Wear it proudly."
	done

BrockFightDoneText:
	text "Brock: The world"
	line "is huge."

	para "There are still"
	line "many strong"
	cont "trainers like you."

	para "Just wait and see."
	line "I'm going to be-"
	cont "come a lot strong-"
	cont "er too."
	done
	
BrockRematchIntroText:
	text "<PLAYER>!"
	line "Good to see"
	cont "you again."
	
	para "Feel like having"
	line "a rematch?"
	done
	
BrockWinLossRematchText:
	text "All rocked out!"
	done
	
BrockRematchAfterBattleText:
	text "You're still"
	line "so strong!"
	
	para "Come back for"
	line "a rematch"
	cont "sometime!"
	done

BrockComeBackTomorrowText:
	text "Come back tomorrow"
	line "and we'll battle"
	cont "again."
	done

BrockNextTimeText:
	text "No problem."
	done

CamperJerrySeenText:
	text "The trainers of"
	line "this Gym use rock-"
	cont "type #mon."

	para "The rock-type has"
	line "high Defense."

	para "Battles could end"
	line "up going a long"
	cont "time. Are you"
	cont "ready for this?"
	done

CamperJerryBeatenText:
	text "I have to win"
	line "these battles…"
	done

CamperJerryAfterBattleText:
	text "Hey, you! Trainer"
	line "from Johto!"
	
	para "Brock is tough."

	para "He'll punish you"
	line "if you dont' take"
	cont "him seriously."
	done

CamperDavidSeenText:
	text "We will rock you!"
	done

CamperDavidBeatenText:
	text "You've got mud"
	line "on your face."
	done

CamperDavidAfterBattleText:
	text "I lost;"
	line "big disgrace."
	done

PewterGymGuideText:
	text "Yo! Champ in"
	line "making! You're"
	cont "really rocking."
	
	para "Are you battling"
	line "the Gym Leaders of"
	cont "Kanto?"

	para "They're strong and"
	line "dedicated people,"
	cont "just like Johto's"
	cont "Gym Leaders."
	done

PewterGymGuideWinText:
	text "Yo! Champ in"
	line "making! That Gym"
	cont "didn't give you"
	cont "much trouble."

	para "The way you took"
	line "charge was really"
	cont "inspiring. I mean"
	cont "that seriously."
	done
	
OnixText:
	text "Onix: Nix!!"
	line "Onixnix!"
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 21, PEWTER_CITY, 2
	warp_event  5, 21, PEWTER_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  2, 19, BGEVENT_READ, PewterGymStatue
	bg_event  7, 19, BGEVENT_READ, PewterGymStatue

	def_object_events
	object_event  5,  2, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  4,  2, SPRITE_ONIX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_EMOTE, OBJECTTYPE_SCRIPT, 0, PewterGymOnix, -1
	object_event  4, 15, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperJerry, -1
	object_event  5, 11, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerCamperDavid, -1
	object_event  6, 19, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuideScript, -1
