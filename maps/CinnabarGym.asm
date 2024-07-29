	object_const_def
	const CINNABARGYM_BLAINE
	const CINNABARGYM_MAGMAR
	const CINNABARGYM_GYM_GUIDE

CinnabarGym_MapScripts:
	def_scene_scripts
	scene_script CinnabarGymNoopScene ; unusable

	def_callbacks

CinnabarGymNoopScene:
	end

CinnabarGymBlaineScript:
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
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	readvar VAR_BADGES
	ifequal 16, .afterbattle16
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
	
CinnabarGymMagmar:
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

CinnabarGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLAINE
	iftrue .CinnabarGymGuideWinScript
	writetext CinnabarGymGuideText
	waitbutton
	closetext
	end

.CinnabarGymGuideWinScript:
	writetext CinnabarGymGuideWinText
	waitbutton
	closetext
	end

BlaineIntroText:
	text "Blaine: Waaah!"

	para "My original Gym"
	line "burned down."

	para "My fire-breathing"
	line "#mon and I have"

	para "a new home inside"
	line "of the volcano."

	para "Haha!"

	para "Hope it's not too"
	line "hot for you!!"

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

CinnabarGymGuideText:
	text "Oh my, it's"
	line "so hot in here!"
	
	para "We're so high up!"
	
	para "There's LAVA!"
	
	para "I need water!"
	done

CinnabarGymGuideWinText:
	text "Huh? Wait!"

	para "It's over"
	line "already?"

	para "Sorry, sorry!"

	para "I was freaking"
	line "out about being"
	cont "in a VOLCANO!"

	para "A #mon Gym can"
	line "be anywhere as"

	para "long as the Gym"
	line "Leader is there."

	para "There's no need"
	line "for a building."
	
	para "Not sure there"
	line "needs to be quite"
	cont "so much lava…"
	done

MagmarText:
	text "Magmar: Maaaar!!"
	line "MarMagmar!"
	done

CinnabarGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, CINNABAR_VOLCANO_2F, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  6, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarGymBlaineScript, -1
	object_event  5,  6, SPRITE_MAGMAR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarGymMagmar, -1
	object_event  6, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarGymGuideScript, -1
