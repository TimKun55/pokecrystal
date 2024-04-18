	object_const_def
	const VERMILIONBERRYMART_BEAUTY
	const VERMILIONBERRYMART_BELLOSSOM
	const VERMILIONBERRYMART_VILEPLUME

VermilionBerryMart_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionBerry:
	faceplayer
	opentext
	pokemart MARTTYPE_BERRY, MART_BERRY
	closetext
	end
	
VermilionBerryBellossom:
	opentext
	writetext VermilionBerryBellossomText
	cry BELLOSSOM	
	waitbutton
	refreshscreen
	pokepic BELLOSSOM
	waitbutton
	closepokepic
	closetext
	end
	
VermilionBerryOddish:
	opentext
	writetext VermilionBerryOddishText
	cry ODDISH	
	waitbutton
	refreshscreen
	pokepic ODDISH
	waitbutton
	closepokepic
	closetext
	end

VermilionBerryBellossomText:
	text "BELLOSSOM: Bel!"
	line "Lossom!!"
	done
	
VermilionBerryOddishText:
	text "ODDISH: Odd!"
	line "Oddish!!"
	done

VermilionBerryMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 10
	warp_event  3,  7, VERMILION_CITY, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionBerry, -1
	object_event  4,  5, SPRITE_BELLOSSOM, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionBerryBellossom, -1
	object_event  6,  3, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionBerryOddish, -1
