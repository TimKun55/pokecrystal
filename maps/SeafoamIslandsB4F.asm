	object_const_def
	const SEAFOAMISLANDSB4F_LORELEI
	const SEAFOAMISLANDSB4F_ARTICUNO
	const SEAFOAMISLANDSB4F_POKE_BALL1
	const SEAFOAMISLANDSB4F_POKE_BALL2

SeafoamIslandsB4F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB4FLorelei:
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
	opentext 
	writetext GuardianLoreleiOutroText
	waitbutton
	closetext
	applymovement SEAFOAMISLANDSB4F_LORELEI, GuardianLoreleiExitMovement
	disappear SEAFOAMISLANDSB4F_LORELEI
	pause 30
	cry LAPRAS
	pause 50
	playsound SFX_THROW_BALL
	pause 5
	playsound SFX_BALL_POOF
	pause 15
	cry ARTICUNO
	pause 15
	playsound SFX_ESCAPE_ROPE
	appear SEAFOAMISLANDSB4F_ARTICUNO
	end

SeafoamIslandsB4FArticuno:
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ARTICUNO, 70
	startbattle
	disappear SEAFOAMISLANDSB4F_ARTICUNO
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_ARTICUNO
.nocatch
	checkevent EVENT_FOUGHT_ZAPDOS
	iffalse .end
	checkevent EVENT_FOUGHT_MOLTRES
	iffalse .end
	setevent EVENT_ENCOUNTERED_LEGENDARY_BIRDS
	end
	
.end
	end

GuardianLoreleiExitMovement:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

SeafoamIslandsB4FUltraBall:
	itemball ULTRA_BALL

SeafoamIslandsB4FZinc:
	itemball ZINC

GuardianLoreleiIntroText:
	text "So, you're the"
	line "newest challenger."
	
	para "You certainly look"
	line "stronger than the"
	cont "others, but"
	
	para "looks aren't"
	line "everything."
	
	para "As a former Elite"
	line "Four member and as"
	
	para "the Guardian of"
	line "Articuno, let me"
	
	para "warn you; you had"
	line "best be prepared."
	
	para "Articuno, let's"
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
	
	para "The last Champion"
	line "gave us clear"
	cont "instructions;"
	
	para "I'll now release"
	line "Articuno back to"
	
	para "its nest, and you"
	line "can try to"
	cont "capture it."
	
	para "Good luck."
	
	para "Come past the"
	line "Society sometime,"
	
	para "I'd like to have"
	line "a rematch."
	done

ArticunoText:
	text "Articuno: Gshya!"
	done

SeafoamIslandsB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  3, SEAFOAM_ISLANDS_B3F,  5
	warp_event 23,  3, SEAFOAM_ISLANDS_B3F,  6
	warp_event 20,  9, SEAFOAM_ISLANDS_B3F,  7
	warp_event  6, 13, SEAFOAM_ISLANDS_B3F,  8
	warp_event 36, 15, SEAFOAM_ISLANDS_B3F,  9
	warp_event 28, 15, SEAFOAM_ISLANDS_B3F, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event 35,  6, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FLorelei, EVENT_LEGENDARY_GUARDIANS_ACTIVE
	object_event 18, 15, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB4FArticuno, EVENT_ARTICUNO_NEST_ARTICUNO
	object_event 20,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FUltraBall, EVENT_SEAFOAM_ISLANDS_B4F_ULTRA_BALL
	object_event 30,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB4FZinc, EVENT_SEAFOAM_ISLANDS_B4F_ZINC
	