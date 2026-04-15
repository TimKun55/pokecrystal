	object_const_def
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPHCO1F_SCIENTIST1
	const SILPHCO1F_CLERK1
	const SILPHCO1F_GENTLEMAN
	const SILPHCO1F_CLERK2
	const SILPHCO1F_CLERK3
	const SILPHCO1F_CLERK4
	const SILPHCO1F_SCIENTIST2

SilphCo1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCo1FOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_UP_GRADE
	iftrue .GotUpGrade
	writetext SilphCo1FOfficerText
	promptbutton
	verbosegiveitem UP_GRADE
	iffalse .NoRoom
	setevent EVENT_GOT_UP_GRADE
.GotUpGrade:
	writetext SilphCo1FOfficerText_GotUpGrade
	waitbutton
.NoRoom:
	closetext
	end

SilphCoScientistMorn:
	jumptextfaceplayer SilphCoScientistMornText

SilphCoEmployeeMorn:
	jumptextfaceplayer SilphCoEmployeeMornText

SilphCoGentlemanDay:
	jumptextfaceplayer SilphCoGentlemanDayText

SilphCoEmployeeDay:
	faceplayer
	opentext
	checkevent EVENT_GOT_PREMIER_BALLS_FROM_SILPH
	iftrue .SilphCoEmployeeDayFamily
	writetext SilphCoEmployeeDayBallFamilyText
	waitbutton
	giveitem PREMIER_BALL, 5
	iffalse .BagFull
	writetext SilphCoEmployeeDayGotBallText
	playsound SFX_ITEM
	waitsfx
	writetext SilphCoEmployeeBallInBagText
	waitbutton
	setevent EVENT_GOT_PREMIER_BALLS_FROM_SILPH
	writetextend SilphCoEmployeeDayBallFavouriteText
	
.SilphCoEmployeeDayFamily:
	writetextend SilphCoEmployeeDayFamilyText

.BagFull
	writetextend SilphCoEmployeeDayBagFullText

SilphCo1FPorygonScientist:
	faceplayer
	opentext
	checkevent EVENT_SILPH_CO_PLAYER_RETURNING
	iftrue .Returning
	checkevent EVENT_SILPH_CO_SCIENTIST_INTRO_TEXT
	iftrue .SkipIntro
	writetext SilphCo1FPorygonScientistIntroText
	waitbutton
	setevent EVENT_SILPH_CO_SCIENTIST_INTRO_TEXT
.SkipIntro
	writetext SilphCo1FPorygonScientistHelpUsText
	yesorno
	iffalse .RefusedToHelp
	writetext SilphCo1FPorygonScientistExcitedText
	waitbutton
	closetext
	setevent EVENT_SILPH_CO_PLAYER_RETURNING
	sjump .GetOnElevator

.Returning
	writetext SilphCo1FPorygonScientistReturningText
	yesorno
	iffalse .RefusedToHelp
	writetext SilphCo1FPorygonScientistLetsGoText
	waitbutton
	closetext
.GetOnElevator
	follow SILPHCO1F_SCIENTIST2, PLAYER
	applymovement SILPHCO1F_SCIENTIST2, SilphCo1FPorygonScientistWalkMovement
	playsound SFX_ENTER_DOOR
	disappear SILPHCO1F_SCIENTIST2
	stopfollow
	applymovement PLAYER, SilphCo1FStepUpMovement
	playsound SFX_ENTER_DOOR
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	setevent EVENT_SILPH_CO_ELEVATOR_UP
	warpfacing UP, SILPH_CO_ELEVATOR, 2, 3
	end

.RefusedToHelp:
	writetextend SilphCo1FPorygonScientistDisappointedText

SilphCoEmployee1Night:
	jumptextfaceplayer SilphCoEmployee1NightText

SilphCoEmployee2Night:
	jumptextfaceplayer SilphCoEmployee2NightText

SilphCoDisplayCase:
	jumptext SilphCoDisplayCaseText

SilphCoElevator:
	jumptext SilphCoElevatorText

SilphCoElevatorSign:
	jumptext SilphCoElevatorSignText

SilphCoVendingMachine:
	jumpstd VendingMachineScript

SilphCo1FPorygonScientistWalkMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
SilphCo1FStepUpMovement:
	step UP
	step_end

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s Head"
	cont "Office Building."
	done

SilphCo1FOfficerText:
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "But since you came"
	line "such a long way,"

	para "have this neat"
	line "little souvenir."
	done

SilphCo1FOfficerText_GotUpGrade:
	text "It's Silph Co.'s"
	line "latest product."

	para "It's not for sale"
	line "anywhere in Kanto"
	cont "just yet."

	para "Though I believe"
	line "Madam Items in"
	cont "Blackthorn City"

	para "has been supplied"
	line "with some stock."
	done

SilphCoDisplayCaseText:
	text "There are some"
	line "old products on"
	cont "display."

	para "Looks like a"
	line "# Ball, and a"
	cont "pair of goggles."
	done

SilphCoElevatorText:
	text "…… ……"

	para "There's no"
	line "response…"
	done

SilphCoElevatorSignText:
	text "Scan employee"
	line "I.D. for elevator"
	cont "access."
	done

SilphCo1FPorygonScientistIntroText:
	text "Hello there!"
	
	para "Are you a trainer?"
	
	para "You are? That's"
	line "wonderful!"
	
	para "My department on"
	line "on 3F is looking"
	cont "for a trainer to"
	cont "help us out with"
	cont "our Porygon Farm."
	
	para "We've been having"
	line "some glitches in"
	cont "our system lately"
	cont "and the Porygon"
	cont "have started"
	cont "fighting us."
	
	para "We're scientists,"
	line "not trainers!"

	para "We know they're"
	line "just scared."
	
	para "We really want to"
	line "help them…"
	
	para "Be aware, though,"
	line "we would need to"
	cont "digitize your body"
	cont "as Porygon live in"
	cont "a virtual world."
	done

SilphCo1FPorygonScientistHelpUsText:
	text "Are you able to"
	line "help us out?"
	done

SilphCo1FPorygonScientistExcitedText:
	text "You will?"
	line "Amazing! Thank"
	cont "you!"
	
	para "Please follow me"
	line "closely as the"
	cont "general public are"
	cont "not allowed to go"
	cont "upstairs."
	done

SilphCo1FPorygonScientistReturningText:
	text "<PLAYER>!"
	
	para "Want to go back"
	line "to 3F?"
	done

SilphCo1FPorygonScientistLetsGoText:
	text "Follow me, then!"
	done

SilphCo1FPorygonScientistDisappointedText:
	text "Oh…"
	
	para "No, I understand."
	
	para "It's a lot to ask."
	
	para "Thank you for"
	line "your time."
	done

SilphCoScientistMornText:
	text "Good morning."
	line "I work up on the"
	cont "11th floor."

	para "I forgot my I.D."
	line "upstairs, so I've"
	cont "got to climb all"
	cont "those stairs…"
	done

SilphCoEmployeeMornText:
	text "We used to have"
	line "teleport pads"
	cont "installed to help"
	cont "us get around"
	cont "faster."

	para "The problem was"
	line "that they weren't"
	cont "programmed well"
	cont "and took us to"
	cont "random floors!"
	
	para "Was a total"
	line "nightmare!"
	done

SilphCoGentlemanDayText:
	text "We're always work-"
	line "ing on new TMs."

	para "Some have been"
	line "discontinued, but"
	cont "others are so pop-"
	cont "ular that they"
	cont "haven't changed in"
	cont "over 20 years!"
	done

SilphCoEmployeeDayBallFamilyText:
	text "I'm from a family"
	line "of # Ball"
	cont "creators."

	para "My father Kurt is"
	line "teaching my daugh-"
	cont "ter how to make"
	cont "Apricorn Balls"
	cont "while I'm busy"
	cont "working here."

	para "You helped them"
	line "out in Azalea"
	cont "Town? Great!"

	para "I'm glad my Maizie"
	line "is doing well."

	para "Take these as a"
	line "thank-you!"
	done

SilphCoEmployeeDayBagFullText:
	text "Oh, looks like"
	line "your bag is full."
	done

SilphCoEmployeeDayGotBallText:
	text "<PLAYER> received"
	line "5 Premier Balls."
	done

SilphCoEmployeeBallInBagText:
	text "<PLAYER> put the"
	line "Premier Balls in"
	cont "the Ball Pocket."
	done

SilphCoEmployeeDayBallFavouriteText:
	text "Ron: They don't"
	line "have any special"
	cont "effects like some"
	cont "other # balls,"
	cont "I just like the"
	cont "way they look."
	done

SilphCoEmployeeDayFamilyText:
	text "I love my job, but"
	line "I miss being with"
	cont "my family."
	done
	
SilphCoEmployee1NightText:
	text "We recently part-"
	line "nered with Devon"
	cont "Corp. in Hoenn."

	para "We've been making"
	line "lots of new"
	cont "products!"
	done

SilphCoEmployee2NightText:
	text "Man, I hate the"
	line "night shift."

	para "I can barely keep"
	line "my eyes open…"

	para "…… yawn ……"
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 11, SAFFRON_CITY, 8
	warp_event 11, 11, SAFFRON_CITY, 9

	def_coord_events

	def_bg_events
	bg_event 14,  0, BGEVENT_READ, SilphCoElevator
	bg_event 15,  0, BGEVENT_READ, SilphCoElevatorSign
	bg_event  6,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event  7,  1, BGEVENT_UP, SilphCoVendingMachine
	bg_event 17,  4, BGEVENT_UP, SilphCoDisplayCase
	bg_event 18,  4, BGEVENT_UP, SilphCoDisplayCase

	def_object_events
	object_event  3,  3, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 17,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCo1FOfficerScript, -1
	object_event 20,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, SilphCoScientistMorn, EVENT_SILPHCO1F_EMPLOYEE
	object_event  1,  9, SPRITE_CLERK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, MORN, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoEmployeeMorn, EVENT_SILPHCO1F_EMPLOYEE
	object_event  8,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, SilphCoGentlemanDay, EVENT_SILPHCO1F_EMPLOYEE
	object_event 15,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, DAY, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilphCoEmployeeDay, EVENT_SILPHCO1F_EMPLOYEE
	object_event  5,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, EVE | NITE, 0, OBJECTTYPE_SCRIPT, 0, SilphCoEmployee1Night, EVENT_SILPHCO1F_EMPLOYEE
	object_event 18,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, EVE | NITE, 0, OBJECTTYPE_SCRIPT, 0, SilphCoEmployee2Night, EVENT_SILPHCO1F_EMPLOYEE
	object_event 10,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo1FPorygonScientist, -1
