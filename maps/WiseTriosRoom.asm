	object_const_def
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	def_scene_scripts
	scene_script WiseTriosRoomNoop1Scene, SCENE_WISETRIOSROOM_SAGE_BLOCKS
	scene_script WiseTriosRoomNoop2Scene, SCENE_WISETRIOSROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WiseTriosRoomWiseTrioCallback

WiseTriosRoomNoop1Scene:
WiseTriosRoomNoop2Scene:
	end

WiseTriosRoomWiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	endcallback

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, WiseTriosRoomSageBlocksPlayerMovement
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, WiseTriosRoomSageReturnsMovement
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetextend SageGakuAfterBattleText

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetextend SageMasaAfterBattleText

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	promptbutton
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, WiseTriosRoomSageAllowsPassageMovement
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_WISETRIOSROOM_NOOP
	end

.KojiAllowsPassage:
	opentext
	writetextend SageKojiAfterBattleFinalText

WiseTriosRoomSageBlocksPlayerMovement:
	step LEFT
	step LEFT
	step_end

WiseTriosRoomSageReturnsMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSageAllowsPassageMovement:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Astounding…"

	para "Suicune, Entei and"
	line "Raikou have arisen"
	cont "from their sleep…"

	para "Is the legend"
	line "coming true?"
	done

WiseTriosRoomSage2Text:
	text "We train at the"
	line "Burned Tower, but"
	cont "we've never heard"
	cont "of a hole opening"

	para "up there before."
	line "It must have been"
	cont "deliberately made"
	cont "by someone."
	done

WiseTriosRoomSage3BlocksExitText:
	text "Tin Tower may be"
	line "entered by those"
	cont "bearing Ecruteak's"
	cont "Gym Badge."

	para "However, now that"
	line "Suicune, Raikou"
	cont "and Entei have"
	cont "arisen, I ask you"
	cont "to refrain from"
	cont "entering!"
	done

WiseTriosRoomSage3Text:
	text "We, the Wise Trio,"
	line "are the protectors"
	cont "of the legendary"
	cont "#mon."
	done

SageGakuSeenText:
	text "Legend has it that"
	line "upon the emergence"
	cont "of a trainer who"
	cont "has the ability to"
	cont "touch the souls of"
	cont "#mon, a #mon"
	cont "will come forth to"
	cont "put that trainer"
	cont "to test at the Tin"
	cont "Tower."

	para "The legend has"
	line "come true!"

	para "The legendary"
	line "#mon Suicune"
	cont "has arrived!"

	para "We, the Wise Trio,"
	line "shall test your"
	cont "worthiness to go"
	cont "inside!"
	done

SageGakuBeatenText:
	text "Stronger than we"
	line "thought? Perhaps…"
	done

SageGakuAfterBattleText:
	text "Ah, so it is you"
	line "who claim to have"
	cont "seen Suicune,"
	cont "Entei and Raikou"
	cont "while they slept?"

	para "Unbelievable!"

	para "Legend has it that"
	line "they can't be seen"
	cont "while they sleep…"
	done

SageMasaSeenText:
	text "Can you be trusted"
	line "with the truth?"

	para "I must ascertain"
	line "your worthiness."
	done

SageMasaBeatenText:
	text "…I will tell you"
	line "the truth…"
	done

SageMasaAfterBattleText:
	text "In the past, there"
	line "were two nine-tier"
	cont "towers here."

	para "The Brass Tower,"
	line "which was said to"
	cont "awaken #mon,"
	cont "and the Tin Tower,"
	cont "where #mon were"
	cont "said to rest."

	para "The view from the"
	line "tops of the Towers"
	cont "must have been"
	cont "magnificent."

	para "At the time, an"
	line "immense, silver-"
	cont "colored #mon"
	cont "was said to make"
	cont "its roost atop the"
	cont "Brass Tower."

	para "However…"

	para "About 150 years"
	line "ago, a lightning"
	cont "bolt struck one of"
	cont "the Towers."

	para "It was engulfed in"
	line "flames that raged"
	cont "for three days."

	para "A sudden downpour"
	line "finally put out"
	cont "the blaze."

	para "And that is how"
	line "the Burned Tower"
	cont "came to be."
	done

SageKojiSeenText:
	text "Let me see your"
	line "power!"
	done

SageKojiBeatenText:
	text "Too strong!"
	line "Why?"
	done

SageKojiAfterBattleQuestionText:
	text "You… Are you the"
	line "trainer who is"
	cont "awaited by the"
	cont "legendary #mon?"
	done

SageKojiAfterBattleSpeechText:
	text "I see…"

	para "We, the Wise Trio,"
	line "have been given"
	cont "the responsibility"
	cont "of protecting the"
	cont "legendary #mon."
	
	para "We are to allow"
	line "passage only to"
	cont "those people who"
	cont "possess the power"
	cont "and soul of truth."

	para "Please, do go on"
	line "and enter the Tin"
	cont "Tower ahead."

	para "Suicune will put"
	line "you to the test."
	done

SageKojiAfterBattleFinalText:
	text "Please, do go on."

	para "Suicune will put"
	line "you to the test."
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  4, ECRUTEAK_CITY, 11
	warp_event  7,  5, ECRUTEAK_CITY, 12
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	def_coord_events
	coord_event  7,  4, SCENE_WISETRIOSROOM_SAGE_BLOCKS, WiseTriosRoom_CannotEnterTinTowerScript

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
