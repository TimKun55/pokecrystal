	object_const_def
	const REDSHOUSE1F_REDS_MUM

RedsHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

RedHouse1FNoopScene:
	end

RedsMum:
	faceplayer
	opentext
	checkevent EVENT_MET_REDS_MUM
	iftrue .MetAlready
	setevent EVENT_MET_REDS_MUM	
	writetextend RedsMumText1

.MetAlready:
	checkevent EVENT_BEAT_RED
	iffalse .RedsMumFinish
	checkevent EVENT_GOT_CRYSTAL_TROPHY
	iftrue .RedsMumFinish
	writetext RedsMumSomethingForPlayerText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .PlayerMovesForRedsMum
	applymovement REDSHOUSE1F_REDS_MUM, RedsMumWalksUpstairsMovement
	sjump .RedsMumContinue

.PlayerMovesForRedsMum:
	applymovement PLAYER, PlayerMovesForRedsMumMovement
	applymovement REDSHOUSE1F_REDS_MUM, RedsMumWalksUpstairsMovement
.RedsMumContinue:
	playsound SFX_EXIT_BUILDING
	disappear REDSHOUSE1F_REDS_MUM
	waitsfx
	pause 30
	moveobject REDSHOUSE1F_REDS_MUM, 7, 0
	turnobject REDSHOUSE1F_REDS_MUM, DOWN
	playsound SFX_EXIT_BUILDING
	appear REDSHOUSE1F_REDS_MUM
	applymovement REDSHOUSE1F_REDS_MUM, RedsMumWalksBackMovement
	readvar VAR_FACING
	ifequal DOWN, .RedsMumLooksAtPlayer
	turnobject REDSHOUSE1F_REDS_MUM, DOWN
	sjump .RedsMumContinue2
	
.RedsMumLooksAtPlayer:
	turnobject REDSHOUSE1F_REDS_MUM, UP
.RedsMumContinue2:
	opentext
	writetext RedsMumTrophyText
	waitbutton
	writetext ReceivedCrystalTrophyText
	playsound SFX_KEY_ITEM
	waitsfx
	writetext CrystalTrophySentHomeText
	waitbutton
	writetext RedsMumTrophyAfterText
	waitbutton
	closetext
	setevent EVENT_GOT_CRYSTAL_TROPHY
	setevent EVENT_REDS_HOUSE_2F_TROPHY
	clearevent EVENT_PLAYERS_HOUSE_1F_CRYSTAL_TROPHY
	end

.RedsMumFinish:
	writetextend RedsMumText2

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMumWalksUpstairsMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

RedsMumWalksBackMovement:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end	

PlayerMovesForRedsMumMovement:
	step DOWN
	step LEFT
	turn_head UP
	step_end

RedsMumText1:
	text "Hi!"

	para "Red's been away"
	line "for a long time."

	para "He hasn't called"
	line "either, so I have"
	cont "no idea where he"
	cont "is or what he's"
	cont "been doing."

	para "They say that no"
	line "word is proof that"
	cont "he's doing fine,"
	cont "but I do worry"
	cont "about him."
	done

RedsMumText2:
	text "I worry about Red"
	line "getting hurt or"
	cont "sick, but he's"
	cont "growing up."

	para "I'm proud that he "
	line "is doing what he"
	cont "wants to do."
	done

RedsMumSomethingForPlayerText:
	text "Oh, it's you!"
	
	para "Red stopped by"
	line "and said he had"
	cont "a fantastic"
	cont "battle with a"
	cont "talented trainer."
	
	para "That was you,"
	line "wasn't it?"
	
	para "Wait here a"
	line "moment, please."
	cont "He wants you to"
	cont "have something."
	done

RedsMumTrophyText:
	text "This is a trophy"
	line "Red earned from"
	cont "being recognised"
	cont "as the strongest"
	cont "trainer."
	
	para "He's told me to"
	line "pass this on to"
	cont "you, which means"
	cont "he recognises you"
	cont "as the strongest."

	para "Here you go!"
	done

ReceivedCrystalTrophyText:
	text "<PLAYER> received"
	line "the Crystal"
	cont "Trophy."
	done

CrystalTrophySentHomeText:
	text "The Crystal Trophy"
	line "was sent home."
	done
	
RedsMumTrophyAfterText:
	text "I can't believe"
	line "you beat my Red."
	
	para "You must really"
	line "be a special"
	cont "trainer."
	
	para "I hope you visit"
	line "your Mum often!"
	done

RedsHouse1FTVText:
	text "They have programs"
	line "that aren't shown"
	cont "in Johto…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  5,  1, BGEVENT_READ, RedsHouse1FTV

	def_object_events
	object_event  5,  3, SPRITE_REDS_MUM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMum, EVENT_REDS_HOUSE_1F_REDS_MUM
