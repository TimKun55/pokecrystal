	object_const_def
	const GOLDENRODMAGNETTRAINSTATION_OFFICER
	const GOLDENRODMAGNETTRAINSTATION_GENTLEMAN

GoldenrodMagnetTrainStation_MapScripts:
	def_scene_scripts
	scene_script GoldenrodMagnetTrainStationNoopScene, SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON

	def_callbacks

GoldenrodMagnetTrainStationNoopScene:
	end

GoldenrodMagnetTrainStationOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	iffalse .RocketTakeover
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .MagnetTrainToSaffron
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .TrainHasntComeIn
	writetext GoldenrodMagnetTrainStationOfficerNoPassText
	waitbutton
	closetext
	end

.RocketTakeover:
	writetext GoldenrodMagnetTrainStationOfficerRocketTakeoverText
	waitbutton
	closetext
	end

.TrainHasntComeIn:
	writetext GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText
	waitbutton
	closetext
	end

.MagnetTrainToSaffron:
	writetext GoldenrodMagnetTrainStationOfficerAreYouComingAboardText
	yesorno
	iffalse .DecidedNotToRide
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iffalse .NoPass
	writetext GoldenrodMagnetTrainStationOfficerRightThisWayText
	waitbutton
	closetext
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement
	setval FALSE
	special MagnetTrain
	warpcheck
	newloadmap MAPSETUP_TRAIN
	applymovement PLAYER, .MovementBoardTheTrain
	wait 20
	end

.MovementBoardTheTrain:
	turn_head DOWN
	step_end

.NoPass:
	writetext GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText
	waitbutton
	closetext
	end

.DecidedNotToRide:
	writetext GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText
	waitbutton
	closetext
	end

Script_ArriveFromSaffron:
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerArriveFromSaffronDoorMovement
	applymovement PLAYER, GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement
	applymovement GOLDENRODMAGNETTRAINSTATION_OFFICER, GoldenrodMagnetTrainStationOfficerReturnToBoardingGateArriveMovement
	opentext
	writetext GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText
	waitbutton
	closetext
	end
	
GoldenrodMagnetTrainStationVendingMachine:
	jumpstd VendingMachineScript

GoldenrodMagnetTrainStationGentlemanScript:
	jumptextfaceplayer GoldenrodMagnetTrainStationGentlemanText

GoldenrodMagnetTrainStationOfficerApproachTrainDoorMovement:
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

GoldenrodMagnetTrainStationOfficerArriveFromSaffronDoorMovement:
	step UP
	step UP
	step LEFT
	turn_head RIGHT
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateMovement:
	step LEFT
	step DOWN
	step DOWN
	step_end

GoldenrodMagnetTrainStationOfficerReturnToBoardingGateArriveMovement:
	step RIGHT
	step DOWN
	step DOWN
	step_end

GoldenrodMagnetTrainStationPlayerApproachAndEnterTrainMovement:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

GoldenrodMagnetTrainStationPlayerLeaveTrainAndEnterStationMovement:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	turn_head UP
	step_end

GoldenrodMagnetTrainStationOfficerNoPassText:
	text "Hello there!"

	para "May I see your"
	line "rail pass, please?"

	para "Oh, you don't"
	line "have one?"
	
	para "I'm sorry, you"
	line "need a rail pass"
	cont "to ride the train."	
	done

GoldenrodMagnetTrainStationOfficerTheTrainHasntComeInText:
	text "The train hasn't"
	line "come in…"

	para "I know! I'll carry"
	line "the passengers on"
	cont "my back!"

	para "That won't work."
	
	para "I hope everything"
	line "is OK in Saffron…"
	done

GoldenrodMagnetTrainStationOfficerRocketTakeoverText:
	text "I'm so sorry."
	line "With Team Rocket"
	cont "being active,"
	
	para "Saffron City is"
	line "refusing to send"
	cont "the Train over."
	done

GoldenrodMagnetTrainStationOfficerAreYouComingAboardText:
	text "We'll soon depart"
	line "for Saffron."

	para "Are you coming"
	line "aboard?"
	done

GoldenrodMagnetTrainStationOfficerRightThisWayText:
	text "May I see your"
	line "rail Pass, please?"

	para "OK. Right this"
	line "way, please."
	done

GoldenrodMagnetTrainStationOfficerYouDontHaveARailPassText:
	text "Sorry. You don't"
	line "have a rail Pass."
	done

GoldenrodMagnetTrainStationOfficerHopeToSeeYouAgainText:
	text "We hope to see you"
	line "again!"
	done

GoldenrodMagnetTrainStationOfficerArrivedInGoldenrodText:
	text "We have arrived in"
	line "Goldenrod."

	para "We hope to see you"
	line "again."
	done

GoldenrodMagnetTrainStationGentlemanText:
	text "I'm the President."

	para "My dream was to"
	line "build a train that"

	para "is faster than any"
	line "#mon."

	para "It really brings"
	line "Johto much closer"
	cont "to Kanto."
	done
	
GoldenrodMagnetTrainStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 21, GOLDENROD_CITY, 5
	warp_event  9, 21, GOLDENROD_CITY, 6
	warp_event  6,  5, SAFFRON_MAGNET_TRAIN_STATION, 4
	warp_event 11,  5, SAFFRON_MAGNET_TRAIN_STATION, 3

	def_coord_events
	coord_event 11,  6, SCENE_GOLDENRODMAGNETTRAINSTATION_ARRIVE_FROM_SAFFRON, Script_ArriveFromSaffron

	def_bg_events
	bg_event  4, 19, BGEVENT_UP, GoldenrodMagnetTrainStationVendingMachine
	bg_event  5, 19, BGEVENT_UP, GoldenrodMagnetTrainStationVendingMachine
	bg_event  6, 19, BGEVENT_UP, GoldenrodMagnetTrainStationVendingMachine
	bg_event  7, 19, BGEVENT_UP, GoldenrodMagnetTrainStationVendingMachine

	def_object_events
	object_event  9,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationOfficerScript, -1
	object_event 11, 16, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodMagnetTrainStationGentlemanScript, EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
