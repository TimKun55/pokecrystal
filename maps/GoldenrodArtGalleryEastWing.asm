	object_const_def
	const GOLDENRODARTGALLERYEASTWING_TWIN1
	const GOLDENRODARTGALLERYEASTWING_TWIN2
	const GOLDENRODARTGALLERYEASTWING_GRANNY

GoldenrodArtGalleryEastWing_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodArtGalleryEastWingStudent1Script:
	jumptextfaceplayer GoldenrodArtGalleryEastWingStudent1Text

GoldenrodArtGalleryEastWingStudent2Script:
	jumptextfaceplayer GoldenrodArtGalleryEastWingStudent2Text

GoldenrodArtGalleryEastWingGrannyScript:
	jumptextfaceplayer GoldenrodArtGalleryEastWingGrannyText

GoldenrodArtGalleryEastWingKleavorPaintingScript:
	refreshscreen
	paintingpic KLEAVOR_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingKleavorText
	end

GoldenrodArtGalleryEastWingUrsalunaPaintingScript:
	refreshscreen
	paintingpic URSALUNA_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingUrsalunaText
	end

GoldenrodArtGalleryEastWingWyrdeerPaintingScript:
	refreshscreen
	paintingpic WYRDEER_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingWyrdeerText
	end

GoldenrodArtGalleryEastWingAnnihilapePaintingScript:
	refreshscreen
	paintingpic ANNIHILAPE_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingAnnihilapeText
	end

GoldenrodArtGalleryEastWingFarigirafPaintingScript:
	refreshscreen
	paintingpic FARIGIRAF_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingFarigirafText
	end

GoldenrodArtGalleryEastWingDudunsparcePaintingScript:
	refreshscreen
	paintingpic DUDUNSPARCE_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingDudunsparceText
	end

GoldenrodArtGalleryEastWingLickilickyPaintingScript:
	refreshscreen
	paintingpic LICKILICKY_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingLickilickyText
	end

GoldenrodArtGalleryEastWingAmbipomPaintingScript:
	refreshscreen
	paintingpic AMBIPOM_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingAmbipomText
	end

GoldenrodArtGalleryEastWingLeafeonPaintingScript:
	refreshscreen
	paintingpic LEAFEON_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingLeafeonText
	end

GoldenrodArtGalleryEastWingGlaceonPaintingScript:
	refreshscreen
	paintingpic GLACEON_PAINTING
	waitbutton
	closepaintingpic
	opentext
	writetextend GoldenrodArtGalleryEastWingGlaceonText
	end

GoldenrodArtGalleryEastWingStudent1Text:
	text "I'm supposed to"
	line "be taking notes."
	
	para "I'm so bored."
	done

GoldenrodArtGalleryEastWingStudent2Text:
	text "I've been taking"
	line "so many notes."
	
	para "Just taking a"
	line "quick break!"
	done

GoldenrodArtGalleryEastWingGrannyText:
	text "Ahh, what could"
	line "have been."
	done

GoldenrodArtGalleryEastWingKleavorText:
	text "Kleavor"
	line "Bug/Rock"
	
	para "A violent creature"
	line "that fells tower-"
	cont "ing trees with its"
	
	para "crude axes and"
	line "shields itself"
	cont "with hard stone."
	done

GoldenrodArtGalleryEastWingUrsalunaText:
	text "Ursaluna"
	line "Ground/Normal"
	
	para "This #mon has a"
	line "burly physique and"
	cont "a newfound capa-"
	
	para "city to manipulate"
	line "peat at will."
	done

GoldenrodArtGalleryEastWingWyrdeerText:
	text "Wyrdeer"
	line "Normal/Psychic"
	
	para "The fur shed from"
	line "its beard retains"
	cont "heat well and is"
	
	para "a highly useful"
	line "material for"
	cont "winter clothing."
	done

GoldenrodArtGalleryEastWingAnnihilapeText:
	text "Annihilape"
	line "Fighting/Ghost"
	
	para "When its anger"
	line "rose beyond a cri-"
	cont "tical point, it"

	para "gained power unfe-"
	line "ttered by its"
	cont "physical body."
	done

GoldenrodArtGalleryEastWingFarigirafText:
	text "Farigiraf"
	line "Normal/Psychic"

	para "Now that the brain"
	line "waves from its"
	cont "head and tail are"

	para "synced up, its"
	line "psychic power is"
	cont "10 times stronger."
	done

GoldenrodArtGalleryEastWingDudunsparceText:
	text "Dudunsparce"
	line "Normal"

	para "It makes its nest"
	line "with its hard tail"
	cont "by boring holes"

	para "into deep bedrock."
	line "The nest can reach"
	cont "over six miles."
	done

GoldenrodArtGalleryEastWingLickilickyText:
	text "Lickilicky"
	line "Normal"
	
	para "The long tongue is"
	line "always soggy with"
	cont "slobber. The"

	para "saliva contains a"
	line "solvent that"
	cont "causes numbness."
	done

GoldenrodArtGalleryEastWingAmbipomText:
	text "Ambipom"
	line "Normal"

	para "Split in two, the"
	line "tails are so adept"
	cont "at handling and"

	para "doing things."
	line "Ambipom rarely"
	cont "uses its hands."
	done

GoldenrodArtGalleryEastWingLeafeonText:
	text "Leafeon"
	line "Grass"

	para "Just like a plant,"
	line "it uses photosyn-"
	cont "thesis. As a"

	para "result, it is"
	line "always enveloped"
	cont "in clear air."
	done

GoldenrodArtGalleryEastWingGlaceonText:
	text "Glaceon"
	line "Ice"

	para "It causes small"
	line "ice crystals to"
	cont "form by lowering"

	para "the temperature of"
	line "the surrounding"
	cont "atmosphere."
	done

GoldenrodArtGalleryEastWing_MapEvents:

	def_warp_events
	warp_event  6,  4, GOLDENROD_ART_GALLERY,  7
	warp_event  6,  5, GOLDENROD_ART_GALLERY,  8
	warp_event 13, 19, GOLDENROD_ART_GALLERY,  9
	warp_event 14, 19, GOLDENROD_ART_GALLERY, 10

	def_coord_events

	def_bg_events
	bg_event 16, 10, BGEVENT_READ, GoldenrodArtGalleryEastWingKleavorPaintingScript
	bg_event 18, 10, BGEVENT_READ, GoldenrodArtGalleryEastWingUrsalunaPaintingScript
	bg_event 20, 10, BGEVENT_READ, GoldenrodArtGalleryEastWingWyrdeerPaintingScript
	bg_event  2, 16, BGEVENT_READ, GoldenrodArtGalleryEastWingAnnihilapePaintingScript
	bg_event  4, 16, BGEVENT_READ, GoldenrodArtGalleryEastWingFarigirafPaintingScript
	bg_event  6, 16, BGEVENT_READ, GoldenrodArtGalleryEastWingDudunsparcePaintingScript
	bg_event  8, 16, BGEVENT_READ, GoldenrodArtGalleryEastWingLickilickyPaintingScript
	bg_event 10, 16, BGEVENT_READ, GoldenrodArtGalleryEastWingAmbipomPaintingScript
	bg_event 17, 16, BGEVENT_READ, GoldenrodArtGalleryEastWingLeafeonPaintingScript
	bg_event 19, 16, BGEVENT_READ, GoldenrodArtGalleryEastWingGlaceonPaintingScript

	def_object_events
	object_event 17,  6, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryEastWingStudent1Script, -1
	object_event  8,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryEastWingStudent2Script, -1
	object_event  5, 18, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodArtGalleryEastWingGrannyScript, -1
