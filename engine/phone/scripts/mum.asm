MumPhoneCalleeScript:
	checkevent EVENT_TALKED_TO_MUM_AFTER_MYSTERY_EGG_QUEST
	iftrue .started_quest
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue MumPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MumPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue MumPhoneNoPokedexScript
	sjump MumPhoneNoPokemonScript

.started_quest
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MumPhoneHangUpScript
	farwritetext MumPhoneGreetingText
	promptbutton
	getcurlandmarkname STRING_BUFFER_3
	readvar VAR_ENVIRONMENT
	ifequal TOWN, MumPhoneInTown
	ifequal ROUTE, MumPhoneOnRoute
	sjump MumPhoneOther

MumPhoneLandmark:
	farwritetext MumPhoneLandmarkText
	promptbutton
	sjump MumSavingMoney

MumPhoneInTown:
	readvar VAR_MAPGROUP
	ifequal GROUP_NEW_BARK_TOWN, .newbark
	ifequal GROUP_CHERRYGROVE_CITY, .cherrygrove
	ifequal GROUP_VIOLET_CITY, .violet
	ifequal GROUP_AZALEA_TOWN, .azalea
	ifequal GROUP_GOLDENROD_CITY, .goldenrod
	farwritetext MumPhoneGenericAreaText
	promptbutton
	sjump MumSavingMoney

.newbark
	farwritetext MumPhoneNewBarkText
	promptbutton
	sjump MumSavingMoney

.cherrygrove
	farwritetext MumPhoneCherrygroveText
	promptbutton
	sjump MumSavingMoney

.violet
	getlandmarkname STRING_BUFFER_4, LANDMARK_SPROUT_TOWER
	sjump MumPhoneLandmark
.azalea
	getlandmarkname STRING_BUFFER_4, LANDMARK_SLOWPOKE_WELL
	sjump MumPhoneLandmark
.goldenrod
	getlandmarkname STRING_BUFFER_4, LANDMARK_RADIO_TOWER
	sjump MumPhoneLandmark

MumPhoneOnRoute:
	farwritetext MumOtherAreaText
	promptbutton
	sjump MumSavingMoney

MumPhoneOther:
	farwritetext MumDeterminedText
	promptbutton
	sjump MumSavingMoney

MumSavingMoney:
	checkflag ENGINE_MUM_SAVING_MONEY
	iffalse .NotSaving
	checkmoney MUMS_MONEY, 0
	ifequal HAVE_MORE, .SavingHasMoney
	sjump .SavingNoMoney

.NotSaving:
	checkmoney MUMS_MONEY, 0
	ifequal HAVE_MORE, .HasMoney
	sjump .NoMoney

.SavingHasMoney:
	getmoney STRING_BUFFER_3, MUMS_MONEY
	farwritetext MumCheckBalanceText
	yesorno
	iftrue MumPhoneSaveMoneyScript
	sjump MumPhoneWontSaveMoneyScript

.SavingNoMoney:
	farwritetext MumImportantToSaveText
	yesorno
	iftrue MumPhoneSaveMoneyScript
	sjump MumPhoneWontSaveMoneyScript

.NoMoney:
	farwritetext MumYoureNotSavingText
	yesorno
	iftrue MumPhoneSaveMoneyScript
	sjump MumPhoneWontSaveMoneyScript

.HasMoney:
	getmoney STRING_BUFFER_3, MUMS_MONEY
	farwritetext MumYouveSavedText
	yesorno
	iftrue MumPhoneSaveMoneyScript
	sjump MumPhoneWontSaveMoneyScript

MumPhoneSaveMoneyScript:
	setflag ENGINE_MUM_SAVING_MONEY
	farwritetext MumOKIllSaveText
	promptbutton
	sjump MumPhoneHangUpScript

MumPhoneWontSaveMoneyScript:
	clearflag ENGINE_MUM_SAVING_MONEY
	farwritetext MumPhoneWontSaveMoneyText
	promptbutton
	sjump MumPhoneHangUpScript

MumPhoneHangUpScript:
	farwritetext MumPhoneHangUpText
	end

MumPhoneNoPokemonScript:
	farwritetext MumPhoneNoPokemonText
	end

MumPhoneNoPokedexScript:
	farwritetext MumPhoneNoPokedexText
	end

MumPhoneNoGymQuestScript:
	farwritetext MumPhoneNoGymQuestText
	end

MumPhoneLectureScript:
	setevent EVENT_TALKED_TO_MUM_AFTER_MYSTERY_EGG_QUEST
	setflag ENGINE_MUM_ACTIVE
	specialphonecall SPECIALCALL_NONE
	farwritetext MumPhoneLectureText
	yesorno
	iftrue MumPhoneSaveMoneyScript
	sjump MumPhoneWontSaveMoneyScript
