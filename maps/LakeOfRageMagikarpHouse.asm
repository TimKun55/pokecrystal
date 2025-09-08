	object_const_def
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	writetextend MagikarpLengthRaterText_LakeOfRageHistory

.ExplainedHistory:
	writetextend MagikarpLengthRaterText_MenInBlack

.ClearedRocketHideout:
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	writetextend MagikarpLengthRaterText_WorldsLargestMagikarp

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXER
	iffalse .NoRoom
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY	
	writetextend MagikarpLengthRaterText_Bonus

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetextend MagikarpLengthRaterText_TooShort

.NotMagikarp:
	writetextend MagikarpLengthRaterText_NotMagikarp

.Refused:
	writetextend MagikarpLengthRaterText_Refused

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_LakeOfRageHistory:
	text "Lake Of Rage is"
	line "actually a crater"
	cont "made by rampaging"
	cont "Gyarados."

	para "The crater filled"
	line "up with rainwater"
	cont "and the Lake was"
	cont "formed."

	para "That's the story"
	line "passed on from my"
	cont "Grandpa's great-"
	cont "great-grandpa."

	para "It used to be that"
	line "you could catch"
	cont "lively Magikarp"
	cont "there, but…"

	para "I don't understand"
	line "what's happening."
	done

MagikarpLengthRaterText_MenInBlack:
	text "The Lake hasn't"
	line "been normal since"
	cont "those men wearing"
	cont "black arrived."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Lake Of Rage is"
	line "back to normal."

	para "The Magikarp have"
	line "returned."

	para "I may yet realize"
	line "my dream of see-"
	cont "ing the world's"
	cont "largest Magikarp."

	para "Do you have a Rod?"
	line "Please help me if"
	cont "you do."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, you have a"
	line "Magikarp!"

	para "Let's see how big"
	line "that baby is."
	done

MagikarpLengthRaterText_Memento:
	text "Wow! This one is"
	line "outstanding!"

	para "I tip my hat to"
	line "you!"

	para "Take this as a"
	line "memento!"
	done

MagikarpLengthRaterText_Bonus:
	text "The record is the"
	line "important thing."

	para "Think of that as"
	line "a bonus!"
	done

MagikarpLengthRaterText_TooShort:
	text "Wow! This one is"
	line "outstanding!"

	para "…I wish I could"
	line "say that, but I've"
	cont "seen a bigger one"
	cont "before."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "What? That's not a"
	line "Magikarp!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh… So you didn't"
	line "get one good"
	cont "enough to show me?"
	cont "Maybe next time."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "Current Record"

	para "@"
	text_ram wStringBuffer3
	text " caught by"
	line "@"
	text_ram wStringBuffer4
	text_end

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
