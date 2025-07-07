	object_const_def
	const MOUNTMOON1F_RIVAL
	const MOUNTMOON1F_BUG_MANIAC
	const MOUNTMOON1F_LASS
	const MOUNTMOON1F_SUPER_NERD
	const MOUNTMOON1F_HIKER1
	const MOUNTMOON1F_HIKER2
	const MOUNTMOON1F_POKE_BALL1
	const MOUNTMOON1F_POKE_BALL2

MountMoon1F_MapScripts:
	def_scene_scripts
	scene_script MountMoon1FRivalEncounterScene, SCENE_MOUNTMOON1F_RIVAL_BATTLE
	scene_script MountMoon1FNoopScene,           SCENE_MOUNTMOON1F_NOOP

	def_callbacks

MountMoon1FRivalEncounterScene:
	sdefer MountMoon1FRivalBattleScript
	end

MountMoon1FNoopScene:
	end

MountMoon1FRivalBattleScript:
	pause 25
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementBefore
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MountMoon1FRivalTextBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext MountMoon1FRivalTextWin, MountMoon1FRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Totodile:
	winlosstext MountMoon1FRivalTextWin, MountMoon1FRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.Chikorita:
	winlosstext MountMoon1FRivalTextWin, MountMoon1FRivalTextLoss
	setlasttalked MOUNTMOON1F_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishBattle

.FinishBattle:
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MountMoon1FRivalTextAfter
	waitbutton
	closetext
	applymovement MOUNTMOON1F_RIVAL, MountMoon1FRivalMovementAfter
	disappear MOUNTMOON1F_RIVAL
	setscene SCENE_MOUNTMOON1F_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end

TrainerBugManiacVan:
	trainer BUG_MANIAC, VAN, EVENT_BEAT_BUG_MANIAC_VAN, BugManiacVanSeenText, BugManiacVanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugManiacVanAfterBattleText
	waitbutton
	closetext
	end

TrainerLassVerity:
	trainer LASS, VERITY, EVENT_BEAT_LASS_VERITY, LassVeritySeenText, LassVerityBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassVerityAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdDave:
	trainer SUPER_NERD, DAVE, EVENT_BEAT_SUPER_NERD_DAVE, SuperNerdDaveSeenText, SuperNerdDaveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdDaveAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDan:
	trainer HIKER, DAN, EVENT_BEAT_HIKER_DAN, HikerDanSeenText, HikerDanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerMicky:
	trainer HIKER, MICKY, EVENT_BEAT_HIKER_MICKY, HikerMickySeenText, HikerMickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMickyAfterBattleText
	waitbutton
	closetext
	end

MountMoon1FRivalMovementBefore:
	step DOWN
	step DOWN
	step DOWN
	step_end

MountMoon1FRivalMovementAfter:
	step UP
	step UP
	step UP
	step UP
	step_end

MountMoon1FRareCandyScript:
	itemball RARE_CANDY

MountMoon1FReviveScript:
	itemball REVIVE

MountMoon1FCalcium:
	itemball CALCIUM

MountMoon1FHiddenPearl:
	hiddenitem PEARL, EVENT_MT_MOON_1F_HIDDEN_PEARL

MountMoon1FHiddenBigNugget:
	hiddenitem BIG_NUGGET, EVENT_MT_MOON_1F_HIDDEN_BIG_NUGGET

MountMoon1FRivalTextBefore:
	text "<……> <……> <……>"

	para "It's been a while,"
	line "<PLAYER>."

	para "…Since I lost to"
	line "you, I thought"

	para "about what I was"
	line "lacking with my"
	cont "#mon…"

	para "And we came up"
	line "with an answer."

	para "<PLAYER>, now we'll"
	line "show you!"
	done

MountMoon1FRivalTextWin:
	text "<……> <……> <……>"

	para "I thought I raised"
	line "my #mon to be"

	para "the best they"
	line "could be…"

	para "…But it still "
	line "wasn't enough…"
	done

MountMoon1FRivalTextAfter:
	text "<……> <……> <……>"

	para "…You won, fair"
	line "and square."

	para "I admit it. But"
	line "this isn't the"
	cont "end."

	para "I'm going to be"
	line "the greatest #-"
	cont "mon trainer ever."

	para "Because these guys"
	line "are behind me."

	para "…Listen, <PLAYER>."

	para "One of these days"
	line "I'm going to prove"

	para "how good I am by"
	line "beating you."
	done

MountMoon1FRivalTextLoss:
	text "<……> <……> <……>"

	para "I've repaid my"
	line "debt to you."

	para "With my #mon,"
	line "I'm going to beat"

	para "the Champion and"
	line "become the world's"
	cont "greatest trainer."
	done

BugManiacVanSeenText:
	text "You there!"
	line "What day is it?!"
	done

BugManiacVanBeatenText:
	text "A battle…?"
	line "I lost?"
	done

BugManiacVanAfterBattleText:
	text "I've been in here"
	line "for days looking"
	cont "for rare #mon."
	done

LassVeritySeenText:
	text "Hey!"
	
	para "Can you not get"
	line "in my way, please?"
	done

LassVerityBeatenText:
	text "Wow, too strong!"
	done

LassVerityAfterBattleText:
	text "I'm on the lookout"
	line "for Clefable!"
	done

SuperNerdDaveSeenText:
	text "I saw a red-haired"
	line "boy training here."

	para "Have you battled"
	line "him?"
	done

SuperNerdDaveBeatenText:
	text "You got me!"
	done

SuperNerdDaveAfterBattleText:
	text "Team Rocket used"
	line "to lurk around"
	cont "here."

	para "I wonder if the"
	line "red-haired boy has"
	cont "any connection to"
	cont "them?"
	done

HikerDanSeenText:
	text "I hiked here from"
	line "Rock Tunnel and"
	cont "I'm still going!"
	done

HikerDanBeatenText:
	text "I've been rocked!"
	done

HikerDanAfterBattleText:
	text "My goal is to"
	line "hike all the way"
	cont "to Mt. Mortar!"
	done

HikerMickySeenText:
	text "No matter where,"
	line "if there's a"
	cont "mountain, I'll"
	cont "climb it!"
	done

HikerMickyBeatenText:
	text "I fell!"
	done

HikerMickyAfterBattleText:
	text "I may have lost"
	line "the battle, but"
	cont "I'll never lose"
	cont "at climbing."
	done

MountMoon1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 23, ROUTE_3, 1
	warp_event 15, 17, MOUNT_MOON_B1F, 1 ; to MountMoonSquare
	warp_event 23, 13, MOUNT_MOON_B1F, 2
	warp_event 11,  9, MOUNT_MOON_B1F, 3
	warp_event  5,  5, MOUNT_MOON_B1F, 4

	def_coord_events

	def_bg_events
	bg_event  2, 17, BGEVENT_ITEM, MountMoon1FHiddenPearl
	bg_event 25,  2, BGEVENT_ITEM, MountMoon1FHiddenBigNugget

	def_object_events
	object_event 11, 19, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MT_MOON_RIVAL
	object_event  4, 18, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBugManiacVan, -1
	object_event 20,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, -0, OBJECTTYPE_TRAINER, 2, TrainerLassVerity, -1
	object_event 20, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdDave, -1
	object_event 27, 14, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerDan, -1
	object_event  4,  6, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerMicky, -1
	object_event 16, 22, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoon1FRareCandyScript, EVENT_MT_MOON_1F_RARE_CANDY
	object_event  3,  2, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoon1FReviveScript, EVENT_MT_MOON_1F_REVIVE
	object_event  2, 20, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMoon1FCalcium, EVENT_MT_MOON_1F_CALCIUM
