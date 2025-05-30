	object_const_def
	const OLIVINELIGHTHOUSE5F_SAILOR
	const OLIVINELIGHTHOUSE5F_YOUNGSTER
	const OLIVINELIGHTHOUSE5F_POKE_BALL1
	const OLIVINELIGHTHOUSE5F_POKE_BALL2
	const OLIVINELIGHTHOUSE5F_POKE_BALL3

OlivineLighthouse5F_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperDenis:
	trainer BIRD_KEEPER, DENIS, EVENT_BEAT_BIRD_KEEPER_DENIS, BirdKeeperDenisSeenText, BirdKeeperDenisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperDenisAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorErnest:
	trainer SAILOR, ERNEST, EVENT_BEAT_SAILOR_ERNEST, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorErnestAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse5FRareCandy:
	itemball RARE_CANDY

OlivineLighthouse5FSuperRepel:
	itemball SUPER_REPEL

OlivineLighthouse5FTMSwagger:
	itemball TM_SWAGGER

OlivineLighthouse5FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_OLIVINE_LIGHTHOUSE_5F_HIDDEN_HYPER_POTION

SailorErnestSeenText:
	text "I wanted to battle"
	line "Jasmine, but she's"

	para "not up to it now."
	line "So, how about you?"
	done

SailorErnestBeatenText:
	text "Whoa, whoa. You're"
	line "overwhelming!"
	done

SailorErnestAfterBattleText:
	text "A Gym Leader isn't"
	line "just about being"

	para "strong. A Leader"
	line "also needs to be"
	cont "compassionate."
	done

BirdKeeperDenisSeenText:
	text "We're pretty high"
	line "up here. My bird"

	para "#mon are in"
	line "prime form."
	done

BirdKeeperDenisBeatenText:
	text "Oops…They crashed…"
	done

BirdKeeperDenisAfterBattleText:
	text "My #mon learned"
	line "how to use Fly in"
	cont "Cianwood."

	para "Well, since I'm a"
	line "loser, I'll Fly"
	cont "across the sea…"
	done

OlivineLighthouse5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, OLIVINE_LIGHTHOUSE_6F, 1
	warp_event 15,  5, OLIVINE_LIGHTHOUSE_4F, 2
	warp_event  9,  7, OLIVINE_LIGHTHOUSE_4F, 3

	def_coord_events

	def_bg_events
	bg_event 14, 15, BGEVENT_ITEM, OlivineLighthouse5FHiddenHyperPotion

	def_object_events
	object_event  7, 10, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorErnest, -1
	object_event  9,  3, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBirdKeeperDenis, -1
	object_event  2, 12, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FRareCandy, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY
	object_event 11, 15, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FSuperRepel, EVENT_OLIVINE_LIGHTHOUSE_5F_SUPER_REPEL
	object_event 15, 15, SPRITE_BALL_BOOK_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse5FTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
