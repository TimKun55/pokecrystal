	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_MAGMAR
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
	writetext BlaineRematchIntroText
	yesorno
	iffalse .EndRematch
	closetext
	winlosstext BlaineWinLossRematchText, 0
	loadtrainer BLAINE, BLAINE2
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlaineRematchAfterBattleText
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

BlaineIntroText:
	text "Blaine: Waaah!"

	para "My original Gym"
	line "was burned down"

	para "because of the"
	line "eruption."

	para "But I will not"
	line "give up!"

	para "Take a look at"
	line "this cave; we"
	
	para "have turned it"
	line "into a Gym, and"

	para "I'm still acting"
	line "as Gym Leader!"

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

	para "going to win the"
	line "next time."
	done

BlaineFightDoneText:
	text "Blaine: My fire"
	line "#mon will be"

	para "even stronger."
	line "Just you watch!"
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
	
	para "the Gym back up"
	line "and running."
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
	
	para "we've been working"
	line "hard to rebuild."
	
	para "Blaine really"
	line "keeps us fired up!"
	done

SeafoamGymGuideWinText:
	text "The Gym Leader"
	line "rebuilding his Gym"

	para "and the Trainer"
	line "from Johto who has"

	para "come to challenge"
	line "that Gym Leader…"

	para "I have witnessed"
	line "a hot battle!"
	done

MagmarText:
	text "Magmar: Maaaar!!"
	line "MarMagmar!"
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, SEAFOAM_ISLANDS_1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  3, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  9,  3, SPRITE_MAGMAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeafoamGymMagmar, -1
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherDick, -1
	object_event 11,  9, SPRITE_FISHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherNed, -1
	object_event  7, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, -1
