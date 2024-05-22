	object_const_def
	const ROUTE4ZAPDOSNEST_AGATHA
	const ROUTE4ZAPDOSNEST_ZAPDOS

Route4ZapdosNest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route4ZapdosNestAgathaCallback
	callback MAPCALLBACK_OBJECTS, Route4ZapdosNestZapdosCallback
	
Route4ZapdosNestAgathaCallback:
	checkevent EVENT_BEAT_GUARDIAN_AGATHA
	iftrue .NoAppear
	checkevent EVENT_LEGENDARY_GUARDIANS_ACTIVE
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear ROUTE4ZAPDOSNEST_AGATHA
	endcallback

.NoAppear:
	disappear ROUTE4ZAPDOSNEST_AGATHA
	endcallback

Route4ZapdosNestZapdosCallback:
	checkevent EVENT_ZAPDOS_NEST_ZAPDOS
	iftrue .NoAppear
	checkevent EVENT_BEAT_GUARDIAN_AGATHA
	iftrue .Appear
	sjump .NoAppear
	
.Appear:
	appear ROUTE4ZAPDOSNEST_ZAPDOS
	endcallback

.NoAppear:
	disappear ROUTE4ZAPDOSNEST_ZAPDOS
	endcallback

Route4ZapdosNestAgatha:
	faceplayer
	opentext
	writetext GuardianAgathaIntroText
	waitbutton
	closetext
	winlosstext GuardianAgathaWinLossText, 0
	loadtrainer AGATHA, AGATHA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUARDIAN_AGATHA
	opentext GuardianAgathaOutroText
	waitbutton
	closetext
	cry GENGAR
	applymovement ROUTE4ZAPDOSNEST_AGATHA, GuardianAgathaExitMovement
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	cry ZAPDOS
	pause 15
	playsound SFX_ESCAPE_ROPE
	disappear ROUTE4ZAPDOSNEST_AGATHA
	appear ROUTE4ZAPDOSNEST_ZAPDOS
	end
	
Route4ZapdosNestZapdos:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_ZAPDOS_NEST_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ZAPDOS, 70
	startbattle
	disappear ROUTE4ZAPDOSNEST_ZAPDOS
	reloadmapafterbattle
	checkevent EVENT_ARTICUNO_NEST_ARTICUNO
	iffalse .end
	checkevent EVENT_MOLTRES_NEST_MOLTRES
	iffalse .end
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	end
	
.end
	end

GuardianAgathaExitMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

GuardianAgathaIntroText:
	text "Ahh, another"
	line "challenger."
	
	para "I hope you'll"
	line "be better than"
	cont "the others…"
	
	para "They all claimed"
	line "to be strong."
	
	para "They were all"
	line "disappointments."
	
	para "Maybe my standards"
	line "are too high?"
	
	para "Maybe not."
	
	para "As a former ELITE"
	line "FOUR member, I"
	cont "expect only the"
	
	para "best from my"
	line "challengers."
	
	para "I hope you're"
	line "prepared for this."
	done
	
GuardianAgathaWinLossText:
	text "Well, well, well."
	line "Finally, someone"
	cont "actually strong."
	done
	
GuardianAgathaOutroText:
	text "You've done well,"
	line "young challenger."
	
	para "I really am"
	line "impressed with how"
	cont "you handled your"
	cont "#MON."
	
	para "At my age, it's"
	line "good to know that"
	cont "there are strong,"
	
	para "dedicated trainers"
	line "out there."
	
	para "Speaking of,"
	
	para "The former"
	line "CHAMPION, RED,"
	cont "asked me to watch"
	
	para "over ZAPDOS until"
	line "another strong,"
	cont "worthy trainer"
	cont "appeared."
	
	para "I'll now release"
	line "ZAPDOS and you"
	
	para "can try to"
	line "capture it."
	
	para "Good luck."
	line "You'll need it."
	
	para "Also, come to the"
	line "SOCIETY sometime,"
	
	para "I want to have"
	line "a rematch."
	
	para "Let's go, GENGAR."
	done

ZapdosText:
	text "ZAPDOS: Gshya!"
	done

Route4ZapdosNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 19, SPRITE_AGATHA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestAgatha, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event  8, 14, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route4ZapdosNestZapdos, EVENT_LEGENDARY_GUARDIANS_ACTIVE
