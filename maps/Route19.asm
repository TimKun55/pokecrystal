	object_const_def
	const ROUTE19_SWIMMER_GIRL1
	const ROUTE19_SWIMMER_GIRL2
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_SWIMMER_GUY4
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2
	const ROUTE19_SURFING_PIKACHU
	const ROUTE19_ROCK1
	const ROUTE19_ROCK2
	const ROUTE19_ROCK3

Route19_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, Route19SurfingCompetitionOverCallback

Route19SurfingCompetitionOverCallback:
	checkevent EVENT_CINNABAR_SURFING_COMPETITION_OVER
	iftrue .Done
	changeblock  6,  4, $c2 ; barrier
	changeblock  8,  4, $c2 ; barrier
	changeblock 10,  4, $c2 ; barrier
	changeblock 12,  4, $c3 ; barrier
.Done:
	endcallback

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfJill:
	trainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJillAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermWalter:
	trainer SWIMMERM, WALTER, EVENT_BEAT_SWIMMERM_WALTER, SwimmermWalterSeenText, SwimmermWalterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermWalterAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_SURFING_COMPETITION_OVER
	iftrue .CompetitionOver
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.CompetitionOver:
	writetext Route19Fisher1Text_CompetitionOver
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_SURFING_COMPETITION_OVER
	iftrue .CompetitionOver
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.CompetitionOver:
	writetext Route19Fisher2Text_CompetitionOver
	waitbutton
	closetext
	end

Route19SurfingPikachuScript:
	faceplayer
	opentext
	writetext Route19SurfingPikachuText
	waitbutton
	cry PIKACHU
	writetext Route19SurfingPikachuWinnerText
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText
	
Route19Rock:
	jumpstd SmashRockScript

SwimmermHaroldSeenText:
	text "Have you ever gone"
	line "swimming in the"
	cont "sea at night?"
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "At night, the sea"
	line "turns black. It"

	para "feels like it will"
	line "swallow you up."
	done

SwimmermTuckerSeenText:
	text "Pant, pant…"
	line "Just… a little…"

	para "farther… to…"
	line "Fuchsia…"
	done

SwimmermTuckerBeatenText:
	text "I'm drowning!"
	done

SwimmermTuckerAfterBattleText:
	text "I… asked my girl-"
	line "friend to swim to"
	cont "Fuchsia… Gasp…"
	done

SwimmermWalterSeenText:
	text "I'm great at"
	line "swimming, but how"

	para "about we try"
	line "a battle?"
	done

SwimmermWalterBeatenText:
	text "Ahh, a defeat!"
	done

SwimmermWalterAfterBattleText:
	text "One day…"
	line "One day, I'll get"
	cont "a date with Misty!"
	done

SwimmerfDawnSeenText:
	text "I'm disgusted by"
	line "wimpy people!"
	done

SwimmerfDawnBeatenText:
	text "I could beat you"
	line "at swimming…"
	done

SwimmerfDawnAfterBattleText:
	text "It's a quick swim"
	line "between Fuchsia"

	para "and Seafoam Is-"
	line "lands…"

	para "Sheesh, some big"
	line "man my boyfriend"

	para "is! What a wimp!"
	done

SwimmerfJillSeenText:
	text "I get up every day"
	line "at 5am to train!"
	done

SwimmerfJillBeatenText:
	text "I need to wake"
	line "up earlier…"
	done

SwimmerfJillAfterBattleText:
	text "If I get up at 5am"
	line "and you beat me,"

	para "what time do you"
	line "wake up?!"
	done

SwimmermJeromeSeenText:
	text "Swimming?"
	line "I'm lousy at it."

	para "I'm just splashing"
	line "around in these"
	cont "shallow waters."
	done

SwimmermJeromeBeatenText:
	text "I thought I could"
	line "win."
	done

SwimmermJeromeAfterBattleText:
	text "I might be bad at"
	line "swimming, but I"
	cont "love the sea."
	done

Route19Fisher1Text:
	text "Sorry. This road"
	line "is closed for"
	cont "the Competition."

	para "If you want to get"
	line "to Cinnabar, you'd"

	para "better go south"
	line "from Pallet Town."
	done

Route19Fisher1Text_CompetitionOver:
	text "That was such fun!"
	line "Now I want to go"
	cont "for a swim!"
	done

Route19Fisher2Text:
	text "Who knows how long"
	line "the Surfing Comp-"
	cont "etition will last…"
	done

Route19Fisher2Text_CompetitionOver:
	text "The Competition is"
	line "finally finished."

	para "Now I can go"
	line "fishing again."
	done

Route19SurfingPikachuText:
	text "Pikachu: Chuu!!"
	done

Route19SurfingPikachuWinnerText:
	text "He's wearing a"
	line "Gold Medal!"
	done 

Route19SignText:
	text "Route 19"

	para "Fuchsia City -"
	line "Seafoam Islands"
	done

CarefulSwimmingSignText:
	text "Please be careful"
	line "if you are swim-"
	cont "ming to Seafoam"
	cont "Islands."

	para "Fuchsia Police"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  1, ROUTE_19_FUCHSIA_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 11, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	def_object_events
	object_event  9, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 15, 35, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfJill, -1
	object_event  6, 36, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 25, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  3, 20, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmermWalter, -1
	object_event  9,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
	object_event 12, 30, SPRITE_SURFING_PIKACHU, SPRITEMOVEDATA_SWIM_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, Route19SurfingPikachuScript, -1
	object_event 13,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route19Rock, -1
	object_event 13,  2, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route19Rock, -1
	object_event  5, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route19Rock, -1
