	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CinnabarIslandFlypointCallback

CinnabarIslandFlypointCallback:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	readvar VAR_BADGES
	ifequal 15, .BlueBacktoGym
	writetext CinnabarIslandBlueText
	waitbutton
	closetext	
	end
	
.BlueBacktoGym
	writetext CinnabarIslandBlue2Text
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	setevent EVENT_CINNABAR_VOLCANO_1F_OFFICER
	setmapscene CINNABAR_VOLCANO_1F, SCENE_CINNABARVOLCANO1F_NOOP
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarRecoveryLabSign:
	jumptext CinnabarRecoveryLabSignText

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "My name's Blue."

	para "I was once the"
	line "Champion, although"

	para "it was for only a"
	line "short time…"

	para "That meddling Red"
	line "did me in…"

	para "Anyway, what do"
	line "you want? You want"

	para "to challenge me or"
	line "something?"

	para "…I hate to say"
	line "it, but I'm not in"

	para "the mood for a"
	line "battle now."

	para "Take a good look"
	line "around you…"

	para "A volcano erupts,"
	line "and just like"

	para "that, a whole town"
	line "disappears."

	para "We can go on win-"
	line "ning and losing in"

	para "#mon. But if"
	line "nature so much as"

	para "twitches, we can"
	line "lose in a second."

	para "…"

	para "That's the way it"
	line "is…"
	done

CinnabarIslandBlue2Text:
	text "Blue: <PLAYER>,"
	para "you're back."
	
	para "Oh, you've earned"
	line "all the other"
	cont "Kanto Badges?"

	para "If I see a strong"
	line "opponent, it makes"
	cont "me want to battle."

	para "If you want to"
	line "battle me, come to"
	cont "the Viridian Gym."

	para "I'll take you on."
	done

CinnabarIslandGymSignText:
	text "There's a notice"
	line "here…"

	para "Cinnabar Gym has"
	line "relocated to"
	cont "Seafoam Islands."

	para "Blaine"
	done

CinnabarIslandSignText:
	text "Cinnabar Island"

	para "The Fiery Town of"
	line "Burning Desire"
	done

CinnabarRecoveryLabSignText:
	text "Cinnabar"
	line "Recovery Lab"
	done	

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 17, CINNABAR_POKECENTER_1F, 1
	warp_event 24, 13, CINNABAR_VOLCANO_1F, 1

	def_coord_events

	def_bg_events
	bg_event 12, 17, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event 19, 19, BGEVENT_READ, CinnabarIslandGymSign
	bg_event 16, 18, BGEVENT_READ, CinnabarIslandSign
	bg_event 26, 15, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event 22, 14, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
