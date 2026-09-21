	object_const_def
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_MAIZIE1
	const KURTSHOUSE_SLOWPOKE
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_MAIZIE2

KurtsHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, KurtsHouseKurtCallback

KurtsHouseKurtCallback:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse .Done
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	disappear KURTSHOUSE_MAIZIE2
	appear KURTSHOUSE_MAIZIE1
	endcallback

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	disappear KURTSHOUSE_MAIZIE1
	appear KURTSHOUSE_MAIZIE2
.Done:
	endcallback

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedSlowpokeWell
	writetext KurtsHouseKurtMakingBallsMustWaitText
	waitbutton
	closetext
	special FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	readvar VAR_FACING
	ifequal UP, .RunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext KurtsHouseKurtHonoredToMakeBallsText
	promptbutton
	verbosegiveitem LURE_BALL, 5
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue .CanGiveGSBallToKurt
.NoGSBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .CheckApricorns
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .IMakeBallsFromApricorns
	closetext
	end

.IMakeBallsFromApricorns:
	writetextend KurtsHouseKurtBallsFromApricornsText

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	writetext KurtsHouseKurtGetStartedText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .PlayerWalksDownMovement
	ifequal RIGHT, .PlayerWalksDownRightTwiceMovement
	applymovement PLAYER, PlayerWalksToMaizieMovement
	sjump .FinishKurtApricornsMovements

.PlayerWalksDownMovement:
	applymovement PLAYER, PlayerWalksDownToMaizieMovement
	sjump .FinishKurtApricornsMovements

.PlayerWalksDownRightTwiceMovement:
	applymovement PLAYER, PlayerWalksDownThenRightToMaizieMovement
.FinishKurtApricornsMovements:
	turnobject KURTSHOUSE_MAIZIE1, LEFT
	applymovement KURTSHOUSE_KURT1, KurtWalkstoWorkTableMovement
	opentext
	writetext MaizieGrandpaIsQuickText
	waitbutton
	closetext
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 10
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	playsound SFX_STRENGTH
	waitsfx
	pause 10
	playsound SFX_BUMP
	waitsfx
	playsound SFX_BUMP
	waitsfx
	pause 10
	playsound SFX_2_BOOPS
	waitsfx
	playsound SFX_GLASS_TING_2
	waitsfx
	pause 10
	playsound SFX_BALL_BOUNCE
	waitsfx
	applymovement KURTSHOUSE_KURT1, KurtWalksBackMovement
	opentext
	writetext MaizieSeeText
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalksBackToKurtMovement
	sjump Kurt1
	end

.Cancel:
	writetextend KurtsHouseKurtThatsALetdownText

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LURE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar MOON_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GaveGSBallToKurt
	checkitem GS_BALL
	iffalse .NoGSBall
	writetext KurtsHouseKurtWhatIsThatText
	waitbutton
	closetext
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takeitem GS_BALL
	setflag ENGINE_KURT_MAKING_BALLS
	readvar VAR_FACING
	ifequal LEFT, .KurtWalksDownMovement
	applymovement KURTSHOUSE_KURT1, KurtWalkstoWorkTableMovement
	sjump .FinishKurtMovements

.KurtWalksDownMovement:
	applymovement KURTSHOUSE_KURT1, KurtWalksDowntoWorkTableMovement
.FinishKurtMovements:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, KURTSHOUSE_MAIZIE1, 30
	turnobject KURTSHOUSE_MAIZIE1, RIGHT
	opentext
	writetext MaizieWaitText
	waitbutton
	closetext
	applymovement KURTSHOUSE_MAIZIE1, MaizieMovement
	disappear KURTSHOUSE_MAIZIE1
	appear KURTSHOUSE_MAIZIE2
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalse .NotMakingBalls
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	writetextend KurtsHouseKurtAhHaISeeText

.NotMakingBalls:
	writetext KurtsHouseKurtThisBallStartedToShakeText
	waitbutton
	closetext
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special FadeOutMusic
	pause 20
	showemote EMOTE_SHOCK, KURTSHOUSE_KURT1, 30
	readvar VAR_FACING
	ifequal UP, .GSBallRunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	sjump .KurtHasLeftTheBuilding

.GSBallRunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	clearevent EVENT_AZALEA_TOWN_KURT
	waitsfx
	special RestartMapMusic
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL
	end

Kurt2:
	faceplayer
	opentext
	checkevent EVENT_BUGGING_KURT_FIRST_TIME
	iffalse KurtScript_ImCheckingItNow
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, UP
	end

Script_FirstTimeBuggingKurt:
	writetext KurtsHouseKurtMaizieHelpingWorkFasterText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	turnobject KURTSHOUSE_KURT2, UP
	setevent EVENT_BUGGING_KURT_FIRST_TIME
	writetextend KurtsHouseKurtAhHaISeeText

Maizie1:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue Maizie2Subscript
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue MaizieFunScript
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Lonely
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Dad
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SlowpokeBack
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue .Lonely
	opentext
	writetextend MaizieSlowpokeGoneText

.SlowpokeBack:
	opentext
	writetextend MaizieSlowpokeBackText

.Lonely:
	opentext
	writetextend MaizieLonelyText

.Dad:
	opentext
	writetextend MaizieDadText

Maizie2:
	faceplayer
Maizie2Subscript:
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GSBall
	writetext MaizieHelpText
	waitbutton
	closetext
	turnobject KURTSHOUSE_MAIZIE2, RIGHT
	end

.GSBall:
	writetext MaizieGSBallText
	waitbutton
	closetext
	turnobject KURTSHOUSE_MAIZIE2, RIGHT
	end

MaizieFunScript:
	opentext
	writetextend MaizieFunText

KurtsHouseSlowpoke:
	opentext
	writetext KurtsHouseSlowpokeText
	cry SLOWPOKE	
	waitbutton
	refreshscreen
	pokepic SLOWPOKE
	waitbutton
	closepokepic
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd DifficultBookshelfScript

KurtsHouseRadio:
	jumpstd Radio2Script

KurtsHouseKurtGoAroundPlayerThenExitHouseMovement:
	big_step RIGHT
KurtsHouseKurtExitHouseMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

KurtWalksDowntoWorkTableMovement:
	step DOWN
	step DOWN
	step DOWN
KurtWalkstoWorkTableMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

KurtWalksBackMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

MaizieMovement:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

PlayerWalksDownToMaizieMovement:
	step DOWN
	turn_head RIGHT
	step_end

PlayerWalksDownThenRightToMaizieMovement:
	step DOWN
	step RIGHT
PlayerWalksToMaizieMovement:
	step RIGHT
	step_end

PlayerWalksBackToKurtMovement:
	step LEFT
	turn_head UP
	step_end

KurtsHouseKurtGetStartedText:
	ntag " Kurt "
	text "I'll get started"
	line "right now!"
	
	para "Maizie will keep"
	line "you company."
	done

KurtsHouseKurtMakingBallsMustWaitText:
	ntag " Kurt "
	text "Hm? Who are you?"

	para "<PLAYER>, eh? You"
	line "want me to make"
	cont "some Balls?"

	para "Sorry, but that'll"
	line "have to wait."

	para "Do you know Team"
	line "Rocket? Ah, don't"
	cont "worry. I'll tell"
	cont "you anyhow."

	para "Team Rocket's an"
	line "evil gang that"
	cont "uses #mon for"
	cont "their dirty work."

	para "They're supposed"
	line "to have disbanded"
	cont "three years ago."

	para "Anyway, they're at"
	line "the Well, cutting"
	cont "off SlowpokeTails"
	cont "for sale!"

	para "So I'm going to"
	line "go give them a"
	cont "lesson in pain!"

	para "Hang on, Slowpoke!"
	line "Old Kurt is on his"
	cont "way!"
	done

KurtsHouseKurtHonoredToMakeBallsText:
	ntag " Kurt "
	text "Hi, <PLAYER>!"

	para "You handled your-"
	line "self like a real"
	cont "hero at the Well."

	para "I like your style!"

	para "I would be honored"
	line "to make Balls for"
	cont "a trainer like"
	cont "you."

	para "This is all I have"
	line "now, but take it."
	done

KurtsHouseKurtBallsFromApricornsText:
	ntag " Kurt "
	text "I make Balls from"
	line "Apricorns."

	para "Collect them from"
	line "trees and bring"
	cont "'em to me."

	para "I'll make Balls"
	line "out of them."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	ntag " Kurt "
	text "You have an"
	line "Apricorn for me?"

	para "Fine! I'll turn it"
	line "into a Ball."
	done

KurtsHouseKurtThatsALetdownText:
	ntag " Kurt "
	text "Oh…"
	line "That's a letdown."
	done

KurtsHouseKurtDontBotherMeText:
	ntag " Kurt "
	text "I'm working!"
	line "Don't bother me!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	ntag " Kurt "
	text "Ah, <PLAYER>!"
	line "I just finished."
	cont "Here!"
	done

KurtsHouseKurtTurnedOutGreatText:
	ntag " Kurt "
	text "That turned out"
	line "great."

	para "Try catching"
	line "#mon with it."
	done

KurtsHouseKurtMaizieHelpingWorkFasterText:
	ntag " Kurt "
	text "Now that Maizie is"
	line "helping me, I can"
	cont "work much faster."
	done

KurtsHouseKurtWhatIsThatText:
	ntag " Kurt "
	text "Wh-what is that?"

	para "It looks a lot"
	line "like a # Ball,"
	cont "but it appears to"
	cont "be something else."

	para "I've never seen"
	line "something like"
	cont "this before."

	para "Let me check it"
	line "for you."
	done

KurtsHouseKurtImCheckingItNowText:
	ntag " Kurt "
	text "I'm checking it"
	line "now."
	done

KurtsHouseKurtAhHaISeeText:
	ntag " Kurt "
	text "Ah-ha! I see!"
	line "So…"
	done

KurtsHouseKurtThisBallStartedToShakeText:
	ntag " Kurt "
	text "<PLAYER>!"

	para "This Ball started"
	line "to shake while I"
	cont "was checking it."

	para "There must be"
	line "something to this!"
	
	para "I wonder if the"
	line "Shrine…"
	done

MaizieSlowpokeGoneText:
	text "The Slowpoke are"
	line "gone… Were they"
	cont "taken away by bad"
	cont "people?"
	done

MaizieLonelyText:
	text "Grandpa's gone…"
	line "I'm so lonely…"
	done

MaizieSlowpokeBackText:
	text "The Slowpoke my"
	line "dad gave me came"
	cont "back! Its Tail is"
	cont "growing back too!"
	done

MaizieDadText:
	text "Dad works at Silph"
	line "where he studies"
	cont "# Balls."

	para "I have to stay"
	line "home with Grandpa"
	cont "and Slowpoke."
	done

MaizieWaitText:
	text "Wait for me,"
	line "Grandpa!"
	done

MaizieHelpText:
	text "Not only is"
	line "Grandpa good, he"
	cont "works fast, too."

	para "Trainers love"
	line "coming to us!"
	done

MaizieFunText:
	text "It's fun to make"
	line "Balls!"
	done

MaizieGrandpaIsQuickText:
	text "Don't worry,"
	line "Grandpa works"
	cont "really fast!"
	done

MaizieSeeText:
	text "See?"
	done

MaizieGSBallText:
	text "Grandpa's checking"
	line "a Ball right now."

	para "So I'm waiting"
	line "till he's done."
	done

KurtsHouseSlowpokeText:
	ntag " Slowpoke "
	text "…"
	line "Yawn?"
	done

KurtsHouseOakPhotoText:
	text "…A young Prof."
	line "Oak?"
	done

KurtsHouseCelebiStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done

KurtsHouse_MapEvents:

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, KurtsHouseRadio
	bg_event  8,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  9,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, KurtsHouseCelebiStatue

	def_object_events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Maizie1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	object_event  6,  3, SPRITE_SLOWPOKE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseSlowpoke, EVENT_KURTS_HOUSE_SLOWPOKE
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event 11,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Maizie2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2