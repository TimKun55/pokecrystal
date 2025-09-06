	object_const_def
	const BATTLETOWER2F_CLERK1
	const BATTLETOWER2F_CLERK2
	const BATTLETOWER2F_CLERK3
	const BATTLETOWER2F_CLERK4
	const BATTLETOWER2F_CLERK5
	const BATTLETOWER2F_CLERK6
	const BATTLETOWER2F_CLERK7
	const BATTLETOWER2F_CLERK8

BattleTower2F_MapScripts:
	def_scene_scripts

	def_callbacks

BattleTower2FClerk1:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_1_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext ChoiceBandExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse .ComeAgain
	readmem wBattlePoints
	ifless 40, .NotEnoughPoints
	addval -40
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse .NoRoom
.ComeAgain:
	writetextend ComeAgainText

.NotEnoughPoints:
	writetextend NotEnoughPointsText

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_1_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	verbosegiveitem CHOICE_BAND
	iffalse .NoRoom
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_1_HAS_ITEM
	sjump .ComeAgain

BattleTower2FClerk2:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_2_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext ChoiceSpecsExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse BattleTower2FClerk1.ComeAgain
	readmem wBattlePoints
	ifless 40, BattleTower2FClerk1.NotEnoughPoints
	addval -40
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	verbosegiveitem CHOICE_SPECS
	iffalse .NoRoom
	sjump BattleTower2FClerk1.ComeAgain

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_2_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	verbosegiveitem CHOICE_SPECS
	iffalse .NoRoom
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_2_HAS_ITEM
	sjump BattleTower2FClerk1.ComeAgain

BattleTower2FClerk3:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_3_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext MuscleBandExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse BattleTower2FClerk1.ComeAgain
	readmem wBattlePoints
	ifless 32, BattleTower2FClerk1.NotEnoughPoints
	addval -32
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	verbosegiveitem MUSCLE_BAND
	iffalse .NoRoom
	sjump BattleTower2FClerk1.ComeAgain

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_3_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	verbosegiveitem MUSCLE_BAND
	iffalse .NoRoom
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_3_HAS_ITEM
	sjump BattleTower2FClerk1.ComeAgain

BattleTower2FClerk4:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_4_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext WiseGlassesExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse BattleTower2FClerk1.ComeAgain
	readmem wBattlePoints
	ifless 32, BattleTower2FClerk1.NotEnoughPoints
	addval -32
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	verbosegiveitem WISE_GLASSES
	iffalse .NoRoom
	sjump BattleTower2FClerk1.ComeAgain

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_4_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	verbosegiveitem WISE_GLASSES
	iffalse .NoRoom
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_4_HAS_ITEM
	sjump BattleTower2FClerk1.ComeAgain

BattleTower2FClerk5:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_5_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext LifeOrbExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse BattleTower2FClerk1.ComeAgain
	readmem wBattlePoints
	ifless 48, BattleTower2FClerk1.NotEnoughPoints
	addval -48
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	verbosegiveitem LIFE_ORB
	iffalse .NoRoom
	sjump BattleTower2FClerk1.ComeAgain

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_5_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	verbosegiveitem WISE_GLASSES
	iffalse .NoRoom
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_5_HAS_ITEM
	sjump BattleTower2FClerk1.ComeAgain

BattleTower2FClerk6:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_6_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext HPUPProteinIronExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse BattleTower2FClerk1.ComeAgain
	readmem wBattlePoints
	ifless 48, BattleTower2FClerk1.NotEnoughPoints
	addval -48
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	giveitem HP_UP, 3
	giveitem PROTEIN, 3
	giveitem IRON, 3
	iffalse .NoRoom
	playsound SFX_ITEM
	waitsfx	
	writetext PlayerReceivedVitaminPack1
	promptbutton
	sjump BattleTower2FClerk1.ComeAgain

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_6_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	giveitem HP_UP, 3
	giveitem PROTEIN, 3
	giveitem IRON, 3
	iffalse .NoRoom
	playsound SFX_ITEM
	waitsfx	
	writetext PlayerReceivedVitaminPack1
	promptbutton
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_6_HAS_ITEM
	sjump BattleTower2FClerk1.ComeAgain

BattleTower2FClerk7:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_7_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext LuckyEggExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse BattleTower2FClerk1.ComeAgain
	readmem wBattlePoints
	ifless 25, BattleTower2FClerk1.NotEnoughPoints
	addval -25
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	verbosegiveitem LUCKY_EGG
	iffalse .NoRoom
	sjump BattleTower2FClerk1.ComeAgain

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_7_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	verbosegiveitem LUCKY_EGG
	iffalse .NoRoom
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_7_HAS_ITEM
	sjump BattleTower2FClerk1.ComeAgain

BattleTower2FClerk8:
	faceplayer
	opentext
	checkevent EVENT_BATTLE_TOWER_2F_CLERK_8_HAS_ITEM
	iftrue .TryGiveItem
	special PlaceBPTopRight
	writetext WelcomeBPExchangeText
	waitbutton
	writetext CalciumZincCarbosExchange
	promptbutton
	writetext ExchangePointsText
	yesorno
	iffalse BattleTower2FClerk1.ComeAgain
	readmem wBattlePoints
	ifless 48, BattleTower2FClerk1.NotEnoughPoints
	addval -48
	writemem wBattlePoints
	playsound SFX_TRANSACTION
	special PlaceBPTopRight
	writetext ExchangeThankYouText
	promptbutton
	giveitem CALCIUM, 3
	giveitem ZINC, 3
	giveitem CARBOS, 3
	iffalse .NoRoom
	playsound SFX_ITEM
	waitsfx
	writetext PlayerReceivedVitaminPack2
	promptbutton
	sjump BattleTower2FClerk1.ComeAgain

.NoRoom:
	setevent EVENT_BATTLE_TOWER_2F_CLERK_6_HAS_ITEM
	writetextend NotEnoughtRoomText

.TryGiveItem:
	writetext TryGiveItemText
	promptbutton
	giveitem CALCIUM, 3
	giveitem ZINC, 3
	giveitem CARBOS, 3
	iffalse .NoRoom
	playsound SFX_ITEM
	waitsfx	
	writetext PlayerReceivedVitaminPack2
	promptbutton
	clearevent EVENT_BATTLE_TOWER_2F_CLERK_6_HAS_ITEM
	sjump BattleTower2FClerk1.ComeAgain

WelcomeBPExchangeText:
	text "Welcome to Battle"
	line "Tower's Battle"
	cont "Point Exchange!"
	done

LifeOrbExchange:
	text "I can offer you"
	line "a Life Orb for"
	cont "48 Points."
	done

ChoiceBandExchange:
	text "I can offer you"
	line "a Choice Band for"
	cont "40 Points."
	done

ChoiceSpecsExchange:
	text "I can offer you"
	line "a Choice Specs for"
	cont "40 Points."
	done

MuscleBandExchange:
	text "I can offer you"
	line "a Muscle Band for"
	cont "32 Points."
	done

WiseGlassesExchange:
	text "I can offer you"
	line "Wise Glasses for"
	cont "32 Points."
	done

HPUPProteinIronExchange:
	text "I can offer you"
	line "a Vitamin 1 Pack;"
	cont "3 HP Up, 3 Protein"
	cont "and 3 Iron for"
	cont "48 Points."
	done	

CalciumZincCarbosExchange:
	text "I can offer you"
	line "a Vitamin 2 Pack;"
	cont "3 Calcium, 3 Zinc"
	cont "and 3 Carbos for"
	cont "48 Points."
	done

LuckyEggExchange:
	text "I can offer you"
	line "a Lucky Egg for"
	cont "25 Points."
	done

PlayerReceivedVitaminPack1:
	text "<PLAYER> received"
	line "Vitamin Pack 1."
	
	para "<PLAYER> put the"
	line "items in"
	cont "the Med. Pocket."
	done

PlayerReceivedVitaminPack2:
	text "<PLAYER> received"
	line "Vitamin Pack 2."
	
	para "<PLAYER> put the"
	line "items in"
	cont "the Med. Pocket."
	done

ExchangePointsText:
	text "Would you like to"
	line "make the exchange?"
	done

ComeAgainText:
	text "We hope to see"
	line "you again!"
	done

NotEnoughPointsText:
	text "Sorry, you don't"
	line "have enough Points"
	cont "to exchange."
	done

NotEnoughtRoomText:
	text "Oh, not enough"
	line "room for it?"
	
	para "I can hold onto"
	line "this until you"
	cont "make some room."
	done

TryGiveItemText:
	text "Oh, you're back!"
	
	para "Here's your item."
	done

ExchangeThankYouText:
	text "Thank you for"
	line "you Points!"
	done

BattleTower2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  1, BATTLE_TOWER_1F, 4
	warp_event 20,  1, BATTLE_TOWER_1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk1, -1
	object_event  6,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk2, -1
	object_event 15,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk3, -1
	object_event 16,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk4, -1
	object_event  1,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk5, -1
	object_event 20,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk6, -1
	object_event  2,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk7, -1
	object_event 19,  8, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower2FClerk8, -1
