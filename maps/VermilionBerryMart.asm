	object_const_def
	const VERMILIONBERRYMART_BEAUTY
	const VERMILIONBERRYMART_RATICATE

VermilionBerryMart_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionBerry:
	faceplayer
	opentext
	pokemart MARTTYPE_BERRY, MART_BERRY
	closetext
	end
	
VermilionBerryRaticate:
	opentext
	writetext VermilionBerryRaticateText
	cry RATICATE	
	waitbutton
	refreshscreen
	pokepic RATICATE
	waitbutton
	closepokepic
	closetext
	end
	
VermilionBerryRaticateText:
	text "RATICATE: Rati!"
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
	object_event  4,  5, SPRITE_RATICATE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionBerryRaticate, -1
