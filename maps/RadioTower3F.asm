	object_const_def
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUIDE
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST
	const RADIOTOWER3F_PETREL

RadioTower3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RadioTower3FCardKeyShutterCallback
	callback MAPCALLBACK_OBJECTS, RadioTower3FPetrelCallback

RadioTower3FCardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	endcallback

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	endcallback

RadioTower3FPetrelCallback:
	checkevent EVENT_BEAT_PETREL_3
	iftrue .Appear
	disappear RADIOTOWER3F_PETREL
	endcallback

.Appear:
	appear RADIOTOWER3F_PETREL
	endcallback
	
RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetextend RadioTower3FGymGuideText_Rockets

.NoRockets:
	writetextend RadioTower3FGymGuideText

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EGG_TICKET_FROM_RADIO_TOWER
	iftrue .GotEggTicket
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetextend RadioTower3FCooltrainerFPleaseSaveDirectorText

.UsedCardKey:
	writetextend RadioTower3FCooltrainerFIsDirectorSafeText

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegiveitem EGG_TICKET
	iffalse .NoRoom
	setevent EVENT_GOT_EGG_TICKET_FROM_RADIO_TOWER	
	writetextend RadioTower3FCooltrainerFEggTicketText

.GotEggTicket:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntM7AfterBattleText

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntM8AfterBattleText

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext GruntM9AfterBattleText

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext ScientistMarcAfterBattleText
	
RadioTower3FPetrelScript:
	faceplayer
	opentext
	writetext RadioTower3FPetrelText
	waitbutton
	turnobject RADIOTOWER3F_PETREL, DOWN
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	takeitem CARD_KEY
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	reloadmappart
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "We have recordings"
	line "of the cries of"
	cont "all #mon that"
	cont "have been found."

	para "We must have about"
	line "200 kinds."
	done

RadioTower3FGymGuideText_Rockets:
	text "To trainers, #-"
	line "mon are their"
	cont "beloved partners."

	para "It's terrible how"
	line "Team Rocket is"
	cont "trying to control"
	cont "#mon."
	done

RadioTower3FGymGuideText:
	text "We run 24 hours a"
	line "day to broadcast"
	cont "entertaining pro-"
	cont "grams."

	para "I'll do my best to"
	line "run around the"
	cont "clock too!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "The Team Rocket"
	line "boss has locked"
	cont "himself in."

	para "But the Director"
	line "can open it."

	para "He's up on the"
	line "fifth floor."

	para "Please save him!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "Is the Director"
	line "safe?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "Thank you!"
	line "You're my hero!"

	para "This is a token of"
	line "my appreciation."
	done

RadioTower3FCooltrainerFEggTicketText:
	text "Bring that to the"
	line "Day-Care Man, and"
	cont "he'll give you a"
	cont "rare Egg!"
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "You were simply"
	line "marvelous!"
	done

GruntM7SeenText:
	text "I've been given"
	line "strict orders."

	para "I'm to crush any-"
	line "one who challenges"
	cont "Team Rocket!"
	done

GruntM7BeatenText:
	text "What?!"
	done

GruntM7AfterBattleText:
	text "I failed in my"
	line "duties…"

	para "I'll be docked pay"
	line "for this…"
	done

GruntM8SeenText:
	text "It feels great"
	line "ordering #mon"
	cont "to commit crimes."
	done

GruntM8BeatenText:
	text "You're kidding!"
	done

GruntM8AfterBattleText:
	text "I feel lousy over"
	line "losing!"

	para "Darn it! I hate"
	line "useless #mon!"
	done

GruntM9SeenText:
	text "Why did the shut-"
	line "ter open? Did you"

	para "have something to"
	line "do with this?"
	done

GruntM9BeatenText:
	text "I'm done for!"
	done

GruntM9AfterBattleText:
	text "What?! You made it"
	line "past our men in"
	cont "the Underground?"

	para "How could you?"
	done

ScientistMarcSeenText:
	text "An unknown child"
	line "wandering here?"

	para "Who are you?"
	done

ScientistMarcBeatenText:
	text "Tch! I took you"
	line "too lightly!"
	done

ScientistMarcAfterBattleText:
	text "Bwahahaha…"

	para "I can transmit as"
	line "strong a signal as"
	cont "I need from here."
	done
	
RadioTower3FPetrelText:
	text "I came here to"
	line "apologise to"
	cont "everyone, but"
	cont "no one wants to"
	cont "talk to me."

	para "I get it,"
	line "but still…"
	done

RadioTower3FCardKeySlotText:
	text "It's the Card Key"
	line "slot."
	done

InsertedTheCardKeyText:
	text "<PLAYER> inserted"
	line "the Card Key."
	done

RadioTower3FPersonnelSignText:
	text "3F Personnel"
	done

RadioTower3FPokemonMusicSignText:
	text "#mon Music with"
	line "Host DJ Ben"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  1, SPRITE_PETREL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower3FPetrelScript, EVENT_REPENTING_ROCKETS
