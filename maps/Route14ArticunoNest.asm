	object_const_def
	const ROUTE14ARTICUNONEST_LORELEI
	const ROUTE14ARTICUNONEST_ARTICUNO

Route14ArticunoNest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route14ArticunoNestLoreleiCallback
	callback MAPCALLBACK_OBJECTS, Route14ArticunoNestArticunoCallback
	
Route14ArticunoNestLoreleiCallback:
	checkevent EVENT_BEAT_GUARDIAN_LORELEI
	iftrue .NoAppear
	checkevent EVENT_LEGENDARY_GUARDIANS_ACTIVE
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear ROUTE14ARTICUNONEST_LORELEI
	endcallback

.NoAppear:
	disappear ROUTE14ARTICUNONEST_LORELEI
	endcallback

Route14ArticunoNestArticunoCallback:
	checkevent EVENT_ARTICUNO_NEST_ARTICUNO
	iftrue .NoAppear
	checkevent EVENT_BEAT_GUARDIAN_LORELEI
	iftrue .Appear
	sjump .NoAppear
	
.Appear:
	appear ROUTE14ARTICUNONEST_ARTICUNO
	endcallback

.NoAppear:
	disappear ROUTE14ARTICUNONEST_ARTICUNO
	endcallback

Route14ArticunoNestLorelei:
	faceplayer
	opentext
	writetext GuardianLoreleiIntroText
	waitbutton
	closetext
	winlosstext GuardianLoreleiWinLossText, 0
	loadtrainer LORELEI, LORELEI1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_GUARDIAN_LORELEI
	opentext GuardianLoreleiOutroText
	waitbutton
	closetext
	cry LAPRAS
	applymovement ROUTE14ARTICUNONEST_LORELEI, GuardianLoreleiExitMovement
	playsound SFX_THROW_BALL
	pause 5
	playsound SFX_BALL_POOF
	pause 5
	cry ARTICUNO
	pause 15
	playsound SFX_ESCAPE_ROPE
	disappear ROUTE14ARTICUNONEST_LORELEI
	appear ROUTE14ARTICUNONEST_ARTICUNO
	end
	
Route14ArticunoNestArticuno:
	faceplayer
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_ARTICUNO_NEST_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ARTICUNO, 70
	startbattle
	disappear ROUTE14ARTICUNONEST_ARTICUNO
	reloadmapafterbattle
	checkevent EVENT_ZAPDOS_NEST_ZAPDOS
	iffalse .end
	checkevent EVENT_MOLTRES_NEST_MOLTRES
	iffalse .end
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	end
	
.end
	end

GuardianLoreleiExitMovement:
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step_end

GuardianLoreleiIntroText:
	text "So, you're the"
	line "newest challenger."
	
	para "You certainly look"
	line "stronger than the"
	cont "others, but"
	
	para "looks aren't"
	line "everything."
	
	para "As a former ELITE"
	line "FOUR member and as"
	
	para "the GUARDIAN of"
	line "ARTICUNO, let me"
	
	para "warn you; you had"
	line "best be prepared."
	
	para "ARTICUNO, let's"
	line "do this."
	done
	
GuardianLoreleiWinLossText:
	text "Oh my!"
	line "You truly"
	cont "are strong."
	done
	
GuardianLoreleiOutroText:
	text "Very well done."
	
	para "I did not expect"
	line "to be bested but"
	cont "there is only"
	
	para "pride in seeing"
	line "new, powerful"
	cont "trainers emerging."
	
	para "The former CHAMPION"
	line "gave us clear"
	cont "instructions;"
	
	para "I'll now release"
	line "ARTICUNO and you"
	
	para "can try to"
	line "capture it."
	
	para "Good luck."
	
	para "Come past the"
	line "SOCIETY sometime,"
	
	para "I'd like to have"
	line "a rematch."
	
	para "Let's go, LAPRAS."
	done

ArticunoText:
	text "ARTICUNO: Gshya!"
	done

Route14ArticunoNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 23, ROUTE_14, 1
	warp_event 11, 23, ROUTE_14, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 11, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route14ArticunoNestLorelei, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event 10,  6, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route14ArticunoNestArticuno, EVENT_LEGENDARY_GUARDIANS_ACTIVE
