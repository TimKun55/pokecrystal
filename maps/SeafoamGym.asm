	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_MAGMAR
	const SEAFOAMGYM_MAGMORTAR
	const SEAFOAMGYM_FISHER1
	const SEAFOAMGYM_FISHER2
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KANTO_LEADERS
	iftrue .BlaineScript_Rematch
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_FIREBREATHER_DICK
	setevent EVENT_BEAT_FIREBREATHER_NED
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
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
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end
	
.afterbattle16
	setevent EVENT_BEAT_KANTO_LEADERS
	end
	
.BlaineScript_Rematch
	checkflag ENGINE_DAILY_BLAINE_REMATCH
	iftrue .skip_rematch
	writetext BlaineRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext BlaineWinLossRematchText, 0
	loadtrainer BLAINE, BLAINE2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_BLAINE_REMATCH
	opentext
	writetext BlaineRematchAfterBattleText
	waitbutton
	closetext
	end

.skip_rematch
	writetext BlaineComeBackTomorrowText
	waitbutton
	closetext
	end

.EndRematch
	writetext BlaineNextTimeText
	waitbutton
	closetext
	end
	
SeafoamGymMagmar:
	opentext
	writetext MagmarText
	cry MAGMAR
	waitbutton
	refreshscreen
	pokepic MAGMAR
	waitbutton
	closepokepic
	closetext
	end

SeafoamGymMagmortar:
	opentext
	writetext MagmortarText
	cry MAGMORTAR
	waitbutton
	refreshscreen
	pokepic MAGMORTAR
	waitbutton
	closepokepic
	closetext
	end

TrainerFirebreatherDick:
	trainer FIREBREATHER, DICK, EVENT_BEAT_FIREBREATHER_DICK, FirebreatherDickSeenText, FirebreatherDickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherDickAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherNed:
	trainer FIREBREATHER, NED, EVENT_BEAT_FIREBREATHER_NED, FirebreatherNedSeenText, FirebreatherNedBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherNedAfterBattleText
	waitbutton
	closetext
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLAINE
	iftrue .SeafoamGymGuideWinScript
	writetext SeafoamGymGuideText
	waitbutton
	closetext
	end

.SeafoamGymGuideWinScript:
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	end

SeafoamGymStatue:
	checkflag ENGINE_VOLCANOBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BLAINE, BLAINE1
	jumpstd GymStatue2Script

BlaineIntroText:
	text "Blaine: Waaah!"

	para "My original Gym"
	line "was burned down"
	cont "because of the"
	cont "eruption."

	para "But I will not"
	line "give up!"

	para "Take a look at"
	line "this cave; we"
	cont "have turned it"
	cont "into a Gym, and"
	cont "I'm still acting"
	cont "as Gym Leader!"

	para "If you can beat"
	line "me, I'll give you"
	cont "a Badge."

	para "Ha! You'd better"
	line "have Burn Heal!"
	done

BlaineWinLossText:
	text "Blaine: Awesome."
	line "I've burned out…"

	para "You've earned the"
	line "VolcanoBadge!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "the VolcanoBadge."
	done

BlaineAfterBattleText:
	text "Blaine: I did lose"
	line "this time, but I'm"
	cont "going to win the"
	cont "next time."
	
	para "I expect I'll be"
	line "seeing you again"
	cont "nice and soon…"
	done

BlaineFightDoneText:
	text "Blaine: My fire"
	line "#mon will be"
	cont "even stronger."
	cont "Just you watch!"
	done
	
BlaineRematchIntroText:
	text "Ah, <PLAYER>!"
	line "You've come back;"
	
	para "For a rematch?"
	done
	
BlaineWinLossRematchText:
	text "Lost the battle"
	line "but not spirit!"
	done
	
BlaineRematchAfterBattleText:
	text "A loss is a loss"
	line "but the fire"
	cont "hasn't gone out!"
	
	para "Come back for"
	line "a rematch"
	cont "sometime!"
	done

BlaineComeBackTomorrowText:
	text "Let's have another"
	line "battle tomorrow!"
	done

BlaineNextTimeText:
	text "A shame!"
	done

FirebreatherDickSeenText:
	text "Oh, a new trainer?"
	line "Time to fire up!"
	done

FirebreatherDickBeatenText:
	text "Extinguished!"
	done

FirebreatherDickAfterBattleText:
	text "We've been working"
	line "hard on getting"
	cont "the Gym back up"
	cont "and running."
	done

FirebreatherNedSeenText:
	text "Mera mera!"
	done

FirebreatherNedBeatenText:
	text "…mera…?"
	done

FirebreatherNedAfterBattleText:
	text "All burnt out…"
	
	para "…mera…"
	done

SeafoamGymGuideText:
	text "Yo! Champ in"
	line "making!"
	
	para "Welcome to the"
	line "relocated Gym!"
	
	para "It's not much at"
	line "the moment, but"
	cont "we've been working"
	cont "hard to rebuild."
	
	para "Blaine really"
	line "keeps us fired up!"
	done

SeafoamGymGuideWinText:
	text "The Gym Leader"
	line "rebuilding his Gym"
	cont "and the Trainer"
	cont "from Johto who has"
	cont "come to challenge"
	cont "that Gym Leader…"

	para "I have witnessed"
	line "a hot battle!"
	done

MagmarText:
	text "Magmar: Maaaar!!"
	line "MarMagmar!"
	done

MagmortarText:
	text "Magmortar: Mooor!"
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 17, SEAFOAM_ISLANDS_1F, 5

	def_coord_events

	def_bg_events
	bg_event  6, 15, BGEVENT_READ, SeafoamGymStatue
	bg_event 11, 15, BGEVENT_READ, SeafoamGymStatue

	def_object_events
	object_event  8,  3, SPRITE_BLAINE,    SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  9,  3, SPRITE_MAGMAR,    SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamGymMagmar, EVENT_SEAFOAM_GYM_MAGMAR
	object_event  9,  3, SPRITE_MAGMORTAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamGymMagmortar, EVENT_SEAFOAM_GYM_MAGMORTAR
	object_event  6, 11, SPRITE_FISHER,    SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherDick, -1
	object_event 11,  9, SPRITE_FISHER,    SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherNed, -1
	object_event  7, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, -1
