	object_const_def
	const SAFFRONODDISHDOLLHOUSE_POKEFAN_F

SaffronOddishDollHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronOddishDollHousePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PokefanFWantToGoShoppingText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	checkevent EVENT_DECO_ODDISH_DOLL
	iftrue .LotsOfShopping
	showemote EMOTE_SHOCK, SAFFRONODDISHDOLLHOUSE_POKEFAN_F, 15
	writetext SaffronOddishDollHousePokefanF_ReturnedMachinePartText
	waitbutton
	setevent EVENT_DECO_ODDISH_DOLL
	playsound SFX_ITEM
	waitsfx
	writetext OddishDollSentText
	waitbutton
.LotsOfShopping
	writetext SaffronOddishDollHousePokefanF_ShoppingText
	waitbutton
	closetext
	end

PokefanFWantToGoShoppingText:
	text "I really wish the"
	line "Train was running."

	para "I need to go"
	line "shopping in"
	cont "Goldenrod…"
	done

SaffronOddishDollHousePokefanF_ReturnedMachinePartText:
	text "Wait! It's you!"

	para "You helped get the"
	line "Train running!"

	para "I can finally go"
	line "shopping again!"

	para "Here, take this"
	line "as thanks!"
	done

OddishDollSentText:
	text "The Oddish Doll"
	line "was sent home."
	done

SaffronOddishDollHousePokefanF_ShoppingText:
	text "Now I'm finally"
	line "free to shop,"
	cont "shop, shop! Haha!"
	done

SaffronOddishDollHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFFRON_CITY, 17
	warp_event  3,  7, SAFFRON_CITY, 17

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronOddishDollHousePokefanFScript, -1
