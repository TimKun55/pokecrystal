	object_const_def
	const ROUTE37_TWIN1
	const ROUTE37_TWIN2
	const ROUTE37_SCHOOLBOY
	const ROUTE37_BUG_MANIAC
	const ROUTE37_SUNNY
	const ROUTE37_ENTEI	
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3
	const ROUTE37_POKE_BALL

Route37_MapScripts:
	def_scene_scripts
	scene_script Route37Noop1Scene, SCENE_ROUTE37_NOOP
	scene_script Route37Noop2Scene, SCENE_ROUTE37_ENTEI1
	scene_script Route37Noop3Scene, SCENE_ROUTE37_ENTEI2

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route37SunnyCallback

Route37Noop1Scene:
Route37Noop2Scene:
Route37Noop3Scene:
	end

Route37SunnyCallback:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

Route37Entei1aScript:
	readvar VAR_FACING
	ifequal RIGHT, .Entei1aContinue
	turnobject PLAYER, RIGHT
.Entei1aContinue
	turnobject ROUTE37_ENTEI, LEFT
	showemote EMOTE_SHOCK, ROUTE37_ENTEI, 15
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	sjump Route37Entei1bScript.Entei1Leave

Route37Entei1bScript:
	readvar VAR_FACING
	ifequal UP, .Entei1bContinue
	turnobject PLAYER, UP
.Entei1bContinue
	turnobject ROUTE37_ENTEI, DOWN
	showemote EMOTE_SHOCK, ROUTE37_ENTEI, 15
	pause 15
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	applymovement PLAYER, Route37PlayerMovement1
.Entei1Leave
	playsound SFX_WARP_FROM
	applymovement ROUTE37_ENTEI, Route37Entei1Movement
	disappear ROUTE37_ENTEI
	pause 10
	setscene SCENE_ROUTE37_NOOP
	clearevent EVENT_SAW_ENTEI_ON_ROUTE_30
	setmapscene ROUTE_30, SCENE_ROUTE30_ENTEI
	end

Route37Entei2aScript:
	readvar VAR_FACING
	ifequal RIGHT, .Entei2aContinue
	turnobject PLAYER, RIGHT
.Entei2aContinue
	turnobject ROUTE37_ENTEI, LEFT
	showemote EMOTE_SHOCK, ROUTE37_ENTEI, 15
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	applymovement PLAYER, Route37PlayerMovement2
	sjump Route37Entei2bScript.Entei2Leave

Route37Entei2bScript:
	readvar VAR_FACING
	ifequal UP, .Entei2bContinue
	turnobject PLAYER, UP
.Entei2bContinue
	turnobject ROUTE37_ENTEI, DOWN
	showemote EMOTE_SHOCK, ROUTE37_ENTEI, 15
	pause 15
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
.Entei2Leave
	playsound SFX_WARP_FROM
	applymovement ROUTE37_ENTEI, Route37Entei2Movement
	disappear ROUTE37_ENTEI
	pause 10
	setscene SCENE_ROUTE37_NOOP
	clearevent EVENT_BURNED_TOWER_B1F_ENTEI
	end

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext TwinsAnnandanne1AfterBattleText

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext TwinsAnnandanne2AfterBattleText

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext PsychicGregAfterBattleText

TrainerBugManiacCarl:
	trainer BUG_MANIAC, CARL, EVENT_BEAT_BUG_MANIAC_CARL, BugManiacCarlSeenText, BugManiacCarlBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugManiacCarlAfterBattleText

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	promptbutton
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	promptbutton
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetextend SunnyGaveGiftText

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetextend SunnyNotSundayText

Route37Sign:
	jumptext Route37SignText

Route37RedApricornTree:
	fruittree FRUITTREE_ROUTE_37_RED_APRICORN

Route37BluApricornTree:
	fruittree FRUITTREE_ROUTE_37_BLU_APRICORN

Route37BlkApricornTree:
	fruittree FRUITTREE_ROUTE_37_BLK_APRICORN

Route37TMBulldoze:
	itemball TM_BULLDOZE

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

Route37PlayerMovement1:
	big_step LEFT
	turn_head RIGHT
	step_end

Route37PlayerMovement2:
	big_step DOWN
	turn_head UP
	step_end

Route37Entei1Movement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step DOWN
	remove_sliding
	step_end

Route37Entei2Movement:
	set_sliding
	fast_jump_step LEFT
	fast_jump_step UP
	fast_jump_step LEFT
	fast_jump_step LEFT
	remove_sliding
	step_end

TwinsAnnandanne1SeenText:
	text "Ann: Anne and I"
	line "are in this to-"
	cont "gether!"
	done

TwinsAnnandanne1BeatenText:
	text "Ann & Anne: Nnn… A"
	line "little too strong."
	done

TwinsAnnandanne1AfterBattleText:
	text "Ann: I can tell"
	line "what my sister and"
	cont "my #mon are"
	cont "thinking."
	done

TwinsAnnandanne2SeenText:
	text "Anne: Ann and I"
	line "are in this to-"
	cont "gether!"
	done

TwinsAnnandanne2BeatenText:
	text "Ann & Anne: Nnn… A"
	line "little too strong."
	done

TwinsAnnandanne2AfterBattleText:
	text "Anne: We share the"
	line "same feelings as"
	cont "our #mon."
	done

PsychicGregSeenText:
	text "#mon can't do a"
	line "thing if they are"
	cont "asleep."

	para "I'll show you how"
	line "scary that is!"
	done

PsychicGregBeatenText:
	text "I lost. That's"
	line "pretty sad…"
	done

PsychicGregAfterBattleText:
	text "Putting #mon to"
	line "sleep or paralyz-"
	cont "ing them are good"
	cont "battle techniques."
	done

BugManiacCarlSeenText:
	text "I caught some"
	line "strong #mon in"
	cont "the Park!"
	done

BugManiacCarlBeatenText:
	text "Well…"
	done

BugManiacCarlAfterBattleText:
	text "Haha, guess I"
	line "should train more"

	para "before mouthing"
	line "off, hey?"
	done

MeetSunnyText:
	text "Sunny: Hi!"

	para "I'm Sunny of Sun-"
	line "day, meaning it's"
	cont "Sunday today!"
	done

SunnyGivesGiftText1:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGivesGiftText2:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGaveGiftText:
	text "Sunny: That thing…"

	para "Um…"

	para "… What was it now…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #mon that"
	line "knows electric"
	cont "moves should hold"
	cont "it."

	para "My sis Monica said"
	line "it powers up"
	cont "electric moves!"
	done

SunnySundayText:
	text "Sunny: My sisters"
	line "and brothers are"
	cont "Monica, Tuscany,"
	cont "Wesley, Arthur,"
	cont "Frieda and Santos."

	para "They're all older"
	line "than me!"
	done

SunnyNotSundayText:
	text "Sunny: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done

Route37SignText:
	text "Route 37"
	done

Route37_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events
	coord_event 14,  2, SCENE_ROUTE37_ENTEI1, Route37Entei1aScript
	coord_event 15,  3, SCENE_ROUTE37_ENTEI1, Route37Entei1bScript
	coord_event 14,  2, SCENE_ROUTE37_ENTEI2, Route37Entei2aScript
	coord_event 15,  3, SCENE_ROUTE37_ENTEI2, Route37Entei2bScript

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, Route37Sign
	bg_event 10,  2, BGEVENT_ITEM, Route37HiddenEther

	def_object_events
	object_event  6, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event  7, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event  6,  6, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 15, 11, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBugManiacCarl, -1
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 15,  2, SPRITE_ENTEI, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_ENTEI_ON_ROUTE_37
	object_event 13,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37RedApricornTree, -1
	object_event 16,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37BluApricornTree, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37BlkApricornTree, -1
	object_event 12,  7, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, Route37TMBulldoze, EVENT_ROUTE_37_TM_BULLDOZE
