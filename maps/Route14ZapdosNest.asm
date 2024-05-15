	object_const_def
	const ROUTE14ZAPDOSNEST_ZAPDOS

Route14ZapdosNest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route14ZapdosNestZapdosCallback
	
Route14ZapdosNestZapdosCallback:
	checkevent EVENT_ZAPDOS_NEST_ZAPDOS
	iftrue .NoAppear
	checkevent EVENT_LEGENDARY_BIRDS_ACTIVE
	iftrue .Appear
	sjump .NoAppear
	
.Appear:
	appear ROUTE14ZAPDOSNEST_ZAPDOS
	endcallback

.NoAppear:
	disappear ROUTE14ZAPDOSNEST_ZAPDOS
	endcallback
	
Route14ZapdosNestZapdos:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_ZAPDOS_NEST_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTO_LEGEND
	loadwildmon ZAPDOS, 60
	startbattle
	disappear ROUTE14ZAPDOSNEST_ZAPDOS
	reloadmapafterbattle
	end

ZapdosText:
	text "Gshya!"
	done

Route14ZapdosNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 25, ROUTE_14, 1
	warp_event 15, 25, ROUTE_14, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 14,  8, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route14ZapdosNestZapdos, EVENT_LEGENDARY_BIRDS_ACTIVE
