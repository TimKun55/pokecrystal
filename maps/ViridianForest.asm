	object_const_def
	const VIRIDIANFOREST_BUG_CATCHER1
	const VIRIDIANFOREST_BUG_CATCHER2
	const VIRIDIANFOREST_BUG_CATCHER3
	const VIRIDIANFOREST_BUG_MANIAC1
	const VIRIDIANFOREST_BUG_MANIAC2
	const VIRIDIANFOREST_BUG_MANIAC3
	const VIRIDIANFOREST_OFFICER
	const VIRIDIANFOREST_POKE_BALL1
	const VIRIDIANFOREST_POKE_BALL2
	const VIRIDIANFOREST_POKE_BALL3

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, ViridianForestNoTreeCallBack
	
ViridianForestNoTreeCallBack:
	checkevent EVENT_KANTO_ROCKET_DISBAND
	iffalse .end
	changeblock 4, 6, $59 ; cleared tree
.end
	endcallback

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugCatcherRobAfterBattleText

TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugCatcherEdAfterBattleText

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugCatcherDougAfterBattleText
	
TrainerBugManiacMatt:
	trainer BUG_MANIAC, MATT, EVENT_BEAT_BUG_MANIAC_MATT, BugManiacMattSeenText, BugManiacMattBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugManiacMattAfterBattleText
	
TrainerBugManiacTobi:
	trainer BUG_MANIAC, TOBI, EVENT_BEAT_BUG_MANIAC_TOBI, BugManiacTobiSeenText, BugManiacTobiBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BugManiacTobiAfterBattleText
	
ViridianForestOfficerScript:
	jumptextfaceplayer ViridianForestOfficerText

ViridianForest1Sign:
	jumptext ViridianForest1SignText

ViridianForest2Sign:
	jumptext ViridianForest2SignText

ViridianForestDireHit:
	itemball DIRE_HIT

ViridianForestMaxPotion:
	itemball MAX_POTION

ViridianForestCarbos:
	itemball CARBOS

ViridianForestHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_VIRIDIAN_FOREST_HIDDEN_MAX_ETHER

ViridianForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VIRIDIAN_FOREST_HIDDEN_FULL_HEAL

ViridianForestHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_VIRIDIAN_FOREST_HIDDEN_FULL_RESTORE

ViridianForestHiddenRevive:
	hiddenitem REVIVE, EVENT_VIRIDIAN_FOREST_HIDDEN_REVIVE

BugCatcherRobSeenText:
	text "My bug #mon are"
	line "tough. Prepare to"
	cont "lose!"
	done

BugCatcherRobBeatenText:
	text "I was whipped…"
	done

BugCatcherRobAfterBattleText:
	text "I'm going to look"
	line "for stronger bug"
	cont "#mon."
	done

BugCatcherEdSeenText:
	text "If you walk in"
	line "tall grass wearing"
	cont "shorts, do you get"
	cont "nicks and cuts?"
	done

BugCatcherEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

BugCatcherEdAfterBattleText:
	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

BugCatcherDougSeenText:
	text "Why don't girls"
	line "like bug #mon?"
	done

BugCatcherDougBeatenText:
	text "No good!"
	done

BugCatcherDougAfterBattleText:
	text "Bug #mon squish"
	line "like plush toys"
	cont "when you squeeze"
	cont "their bellies."

	para "I love how they"
	line "feel!"
	done

BugManiacMattSeenText:
	text "It's nice and"
	line "dark in here!"
	done

BugManiacMattBeatenText:
	text "Aww!!"
	done

BugManiacMattAfterBattleText:
	text "Maybe it's too"
	line "dark in here?"

	para "My #mon seem to"
	line "like it, though!"
	done

BugManiacTobiSeenText:
	text "I've been trying"
	line "to beat Brock for"
	cont "ages, and I think"
	cont "I'm finally ready!"
	done

BugManiacTobiBeatenText:
	text "Oh."
	line "I guess I'm not."
	done

BugManiacTobiAfterBattleText:
	text "I love my #mon"
	line "but their types"
	cont "are a bad matchup"
	cont "for Brock."
	done

ViridianForestOfficerText:
	text "We had a tip that"
	line "there's a house"
	cont "hidden close by."

	para "Apparently it's a"
	line "hideout for an ex-"
	cont "mob boss..."
	done

ViridianForest1SignText:
	text "Viridian Forest"
	done

ViridianForest2SignText:
	text "Viridian Forest"
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26, 39, ROUTE_2_VIRIDIAN_FOREST_GATE, 3
	warp_event 27, 39, ROUTE_2_VIRIDIAN_FOREST_GATE, 4
	warp_event 29, 21, VIRIDIAN_FOREST_HOUSE, 1
	warp_event  8,  5, VIRIDIAN_FOREST_ROUTE_2_GATE, 1
	warp_event  9,  5, VIRIDIAN_FOREST_ROUTE_2_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 31, 37, BGEVENT_READ, ViridianForest1Sign
	bg_event 11,  7, BGEVENT_READ, ViridianForest2Sign
	bg_event 27, 19, BGEVENT_ITEM, ViridianForestHiddenMaxEther
	bg_event 29, 11, BGEVENT_ITEM, ViridianForestHiddenFullHeal
	bg_event 26, 35, BGEVENT_ITEM, ViridianForestHiddenFullRestore
	bg_event 40, 17, BGEVENT_ITEM, ViridianForestHiddenRevive

	def_object_events
	object_event 39, 30, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherRob, -1
	object_event  8, 16, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event 21,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDoug, -1
	object_event 10, 33, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBugManiacMatt, -1
	object_event 36, 10, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBugManiacTobi, -1
	object_event 41,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianForestOfficerScript, -1
	object_event  4, 27, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestDireHit, EVENT_VIRIDIAN_FOREST_DIRE_HIT
	object_event 20, 28, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestMaxPotion, EVENT_VIRIDIAN_FOREST_MAX_POTION
	object_event 43, 35, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ViridianForestCarbos, EVENT_VIRIDIAN_FOREST_CARBOS
