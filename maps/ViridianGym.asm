	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_ARCANINE
	const VIRIDIANGYM_COOLTRAINERM
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KANTO_LEADERS
	iftrue .BlueScript_Rematch
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_COOLTRAINERM_ERICK
	setevent EVENT_BEAT_BEAUTY_JULIE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	setevent EVENT_BEAT_KANTO_LEADERS
	setevent EVENT_FINAL_BATTLE_WITH_LYRA
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end
	
.BlueScript_Rematch
	writetext BlueRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext BlueWinLossRematchText, 0
	loadtrainer BLUE, BLUE2
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlueRematchAfterBattleText
	waitbutton
	closetext
	end
	
.EndRematch
	writetext BlueNextTimeText
	waitbutton
	closetext
	end
	
ViridianGymArcanine:
	opentext
	writetext ArcanineText
	cry ARCANINE
	waitbutton
	refreshscreen
	pokepic ARCANINE
	waitbutton
	closepokepic
	closetext
	end

TrainerCooltrainerMErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_COOLTRAINERM_ERICK, CooltrainerMErickSeenText, CooltrainerMErickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMErickAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBeautyJulie:
	trainer BEAUTY, JULIE, EVENT_BEAT_BEAUTY_JULIE, BeautyJulieSeenText, BeautyJulieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJulieAfterBattleText
	waitbutton
	closetext
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "Blue: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at Cinnabar,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "You're telling me"
	line "you conquered all"
	cont "the Gyms in Johto?"

	para "Heh! Johto's Gyms"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, Johto"
	line "Champ?"
	done

LeaderBlueWinText:
	text "Blue: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "the EarthBadge."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "the EarthBadge."
	done

LeaderBlueAfterText:
	text "Blue: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

LeaderBlueEpilogueText:
	text "Blue: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done
	
BlueRematchIntroText:
	text "Oh, <PLAYER>,"
	line "you're back!"
	
	para "Feel like having"
	line "a rematch?"
	done
	
BlueWinLossRematchText:
	text "Ahh, lost again?"
	done
	
BlueRematchAfterBattleText:
	text "You're still strong"
	line "but I'll beat you"
	cont "next time."
	
	para "Feel free to"
	line "come back for"
	cont "a rematch!"
	done
	
BlueNextTimeText:
	text "No? Well, come"
	line "back when you're"
	cont "feeling it."
	done
	
CooltrainerMErickSeenText:
	text "Wow, you made it"
	line "to our Gym!"
	cont "You must be good!"
	done
	
CooltrainerMErickBeatenText:
	text "Yep! Too good!"
	done
	
CooltrainerMErickAfterBattleText:
	text "This used to be"
	line "a ground-type Gym."
	done

BeautyJulieSeenText:
	text "Ooh, you're cute."
	line "But are you"
	cont "strong, too?"
	done
	
BeautyJulieBeatenText:
	text "Cute and strong!"
	done
	
BeautyJulieAfterBattleText:
	text "When Blue became"
	line "Leader he"
	cont "remodeled the Gym."
	
	para "It's much better"
	line "without all those"
	
	para "dumb warp tiles"
	line "around the place!"
	done

ViridianGymGuideText:
	text "Yo, Champ in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The Gym Leader is"
	line "a guy who battled"

	para "the Champion three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuideWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

ArcanineText:
	text "Arcanine: Awooo!!"
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  4,  3, SPRITE_ARCANINE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianGymArcanine, EVENT_VIRIDIAN_GYM_BLUE
	object_event  6, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulie, EVENT_VIRIDIAN_GYM_BLUE
	object_event  3,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerMErick, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
