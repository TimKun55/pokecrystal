	object_const_def
	const GOLDENRODARTGALLERYWESTWING_TWIN1
	const GOLDENRODARTGALLERYWESTWING_COOLTRAINER_M
	const GOLDENRODARTGALLERYWESTWING_GRANNY
	const GOLDENRODARTGALLERYWESTWING_TWIN2

GoldenrodArtGalleryWestWing_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodArtGalleryWestWingStudent1Script:
	jumptextfaceplayer GoldenrodArtGalleryWestWingStudent1Text

GoldenrodArtGalleryWestWingCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodArtGalleryWestWingCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODARTGALLERYWESTWING_COOLTRAINER_M, UP
	end

GoldenrodArtGalleryWestWingGrannyScript:
	jumptextfaceplayer GoldenrodArtGalleryWestWingGrannyText

GoldenrodArtGalleryWestWingStudent2Script:
	jumptextfaceplayer GoldenrodArtGalleryWestWingStudent2Text

GoldenrodArtGalleryWestWingPichuPaintingScript:
	refreshscreen
	paintingpic PICHU_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingPichuText
	end

GoldenrodArtGalleryWestWingCleffaPaintingScript:
	refreshscreen
	paintingpic CLEFFA_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingCleffaText
	end

GoldenrodArtGalleryWestWingIgglybuffPaintingScript:
	refreshscreen
	paintingpic IGGLYBUFF_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingIgglybuffText
	end

GoldenrodArtGalleryWestWingAipomPaintingScript:
	refreshscreen
	paintingpic AIPOM_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingAipomText
	end

GoldenrodArtGalleryWestWingStantlerPaintingScript:
	refreshscreen
	paintingpic STANTLER_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingStantlerText
	end

GoldenrodArtGalleryWestWingSmoochumPaintingScript:
	refreshscreen
	paintingpic SMOOCHUM_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingSmoochumText
	end

GoldenrodArtGalleryWestWingElekidPaintingScript:
	refreshscreen
	paintingpic ELEKID_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingElekidText
	end

GoldenrodArtGalleryWestWingMagbyPaintingScript:
	refreshscreen
	paintingpic MAGBY_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingMagbyText
	end

GoldenrodArtGalleryWestWingSpearowPaintingScript:
	refreshscreen
	paintingpic SPEAROW_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingSpearowText
	end

GoldenrodArtGalleryWestWingFearowPaintingScript:
	refreshscreen
	paintingpic FEAROW_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingFearowText
	end

GoldenrodArtGalleryWestWingGoldeenPaintingScript:
	refreshscreen
	paintingpic GOLDEEN_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingGoldeenText
	end

GoldenrodArtGalleryWestWingSeakingPaintingScript:
	refreshscreen
	paintingpic SEAKING_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingSeakingText
	end

GoldenrodArtGalleryWestWingLickitungPaintingScript:
	refreshscreen
	paintingpic LICKITUNG_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryWestWingLickitungText
	end

GoldenrodArtGalleryWestWingStudent1Text:
	text "Wow!"
	
	para "I've never seen"
	line "these #mon!"
	done

GoldenrodArtGalleryWestWingCooltrainerMText:
	text "… … …"
	
	para "What even is"
	line "this #mon?!"
	
	para "I … I can't stop"
	line "looking at it … "
	done

GoldenrodArtGalleryWestWingGrannyText:
	text "Maybe it's my old"
	line "age, but I'm sure"
	
	para "I've seen and"
	line "raised some of"
	cont "these #mon…"
	done

GoldenrodArtGalleryWestWingStudent2Text:
	text "Sigh, I'm so"
	line "bored…"
	
	para "I just want to"
	line "go home…"
	done

GoldenrodArtGalleryWestWingPichuText:
	text "Pichu"
	line "Electric"
	
	para "It is unskilled at"
	line "storing electric"
	cont "power."
	
	para "Any kind of shock"
	line "causes it to dis-"
	cont "charge energy"
	cont "spontaneously."
	done

GoldenrodArtGalleryWestWingCleffaText:
	text "Cleffa"
	line "Fairy"
	
	para "If the impact site"
	line "of a meteorite is"
	cont "found, this #-"
	
	para "mon is certain to"
	line "be within the"
	cont "immediate area."
	done

GoldenrodArtGalleryWestWingIgglybuffText:
	text "Igglybuff"
	line "Normal/Fairy"
	
	para "Instead of walking"
	line "with its short"
	cont "legs, it moves"
	
	para "around by bouncing"
	line "on its soft,"
	cont "tender body."
	done

GoldenrodArtGalleryWestWingAipomText:
	text "Aipom"
	line "Normal"
	
	para "It uses its tail"
	line "to hang on to"
	cont "tree branches."
	
	para "It uses its momen-"
	line "tum to swing from"
	cont "one branch to"
	cont "another."
	done

GoldenrodArtGalleryWestWingStantlerText:
	text "Stantler"
	line "Normal"
	
	para "The round balls"
	line "found on the fal-"
	cont "len antlers can be"
	
	para "ground into a"
	line "powder that aids"
	cont "in sleeping."
	done

GoldenrodArtGalleryWestWingSmoochumText:
	text "Smoochum"
	line "Ice/Psychic"
	
	para "The sensitivity of"
	line "its lips develops"
	cont "most quickly."

	para "It uses them to"
	line "try to identify"
	cont "unknown objects."
	done

GoldenrodArtGalleryWestWingElekidText:
	text "Elekid"
	line "Electric"
	
	para "It loves violent"
	line "thunder. The space"
	cont "between its horns"
	
	para "flickers bluish-"
	line "white when it is"
	cont "charging energy."
	done

GoldenrodArtGalleryWestWingMagbyText:
	text "Magby"
	line "Fire"
	
	para "It naturally"
	line "spits a 600"
	cont "-degree flame."
	
	para "It is said when"
	line "many appear, it"
	cont "heralds a volcanic"
	cont "eruption."
	done

GoldenrodArtGalleryWestWingSpearowText:
	text "Spearow"
	line "Normal/Flying"
	
	para "To protect its"
	line "territory, it"
	cont "flies around"
	
	para "ceaselessly,"
	line "making high-"
	cont "pitched cries."
	done

GoldenrodArtGalleryWestWingFearowText:
	text "Fearow"
	line "Normal/Flying"
	
	para "It uses its long"
	line "beak to attack."
	
	para "It has a surpri-"
	line "singly long reach,"
	
	para "so it must be"
	line "treated with"
	cont "caution."
	done

GoldenrodArtGalleryWestWingGoldeenText:
	text "Goldeen"
	line "Water"
	
	para "During spawning"
	line "season, they swim"
	cont "gracefully in the"
	
	para "water, searching"
	line "for their perfect"
	cont "mate."
	done

GoldenrodArtGalleryWestWingSeakingText:
	text "Seaking"
	line "Water"
	
	para "When autumn comes,"
	line "the males patrol"
	cont "the area around"
	
	para "their nests in"
	line "order to protect"
	cont "their offspring."
	done

GoldenrodArtGalleryWestWingLickitungText:
	text "Lickitung"
	line "Normal"
	
	para "It has a tongue"
	line "that is over 2<BOLD_m>"
	cont "long. It uses"

	para "this long tongue"
	line "to lick its body"
	cont "clean."
	done

GoldenrodArtGalleryWestWing_MapEvents:

	def_warp_events
	warp_event 15,  4, GOLDENROD_ART_GALLERY, 3
	warp_event 15,  5, GOLDENROD_ART_GALLERY, 4
	warp_event  7, 19, GOLDENROD_ART_GALLERY, 5
	warp_event  8, 19, GOLDENROD_ART_GALLERY, 6

	def_coord_events

	def_bg_events
	bg_event  0, 10, BGEVENT_READ, GoldenrodArtGalleryWestWingPichuPaintingScript
	bg_event  2, 10, BGEVENT_READ, GoldenrodArtGalleryWestWingCleffaPaintingScript
	bg_event  4, 10, BGEVENT_READ, GoldenrodArtGalleryWestWingIgglybuffPaintingScript
	bg_event 10, 10, BGEVENT_READ, GoldenrodArtGalleryWestWingAipomPaintingScript
	bg_event 12, 10, BGEVENT_READ, GoldenrodArtGalleryWestWingStantlerPaintingScript
	bg_event  0, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingSmoochumPaintingScript
	bg_event  2, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingElekidPaintingScript
	bg_event  4, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingMagbyPaintingScript
	bg_event 10, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingSpearowPaintingScript
	bg_event 12, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingFearowPaintingScript
	bg_event 14, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingGoldeenPaintingScript
	bg_event 16, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingSeakingPaintingScript
	bg_event 18, 16, BGEVENT_READ, GoldenrodArtGalleryWestWingLickitungPaintingScript

	def_object_events
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryWestWingStudent1Script, -1
	object_event 18, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryWestWingCooltrainerMScript, -1
	object_event 16, 11, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryWestWingGrannyScript, -1
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryWestWingStudent2Script, -1
