	object_const_def
	const ROUTE24_ROCKET
	const ROUTE24_POKE_BALL

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .Location1
	applymovement ROUTE24_ROCKET, RocketExitMove1
	sjump .Continue

.Location1:
	applymovement ROUTE24_ROCKET, RocketExitMove2
.Continue:
	disappear ROUTE24_ROCKET
	playmapmusic
	end

Route24TMProtect:
	itemball TM_PROTECT

RocketExitMove1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

RocketExitMove2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

Route24RocketSeenText:
	text "Hey, kid! Me am a"
	line "Team Rocket member"
	cont "kind of guy!"

	para "Come from another"
	line "country, a trainer"
	cont "number one, me!"

	para "Think I did, if"
	line "stop the energy,"
	cont "be big panic for"
	cont "here people!"

	para "Secret it is my"
	line "mission, so tell"
	cont "you I not!"

	para "But! If win you do"
	line "versus me, a man I"
	cont "be and mine secret"
	cont "to you I tell."

	para "Hey, kid! Battle"
	line "begin we do!"
	done

Route24RocketBeatenText:
	text "Ayieeeh! No, no,"
	line "no, believe it I"
	cont "can't!"

	para "Strong very much"
	line "be you! Match I am"
	cont "not to you!"
	done

Route24RocketAfterBattleText:
	text "OK. Tell you mine"
	line "secret will I."

	para "Machine Part steal"
	line "by me, hide it I"
	cont "did in Gym of the"
	cont "Cerulean."

	para "Inside water put"
	line "it I did. Look for"
	cont "in water center of"
	cont "Gym at."

	para "But you forget me"
	line "not!"

	para "Beat you for sure"
	line "will Team Rocket."

	para "Come from Johto"
	line "will they, mine"
	cont "friends, yes. Will"
	cont "revenge they are."
	done

Route24RocketDisappearsText:
	text "…"

	para "You say what? Team"
	line "Rocket bye-bye a"
	cont "go-go? Broken it"
	cont "is says you?"

	para "Oh, no! Should I"
	line "do what now on"
	cont "from, me…?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
	object_event 17,  8, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, Route24TMProtect, EVENT_ROUTE_24_TM_PROTECT
