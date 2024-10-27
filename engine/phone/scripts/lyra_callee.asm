LyraPhoneCalleeScript:
	checktime MORN
	iftrue .morngreet
	checktime DAY
	iftrue .daygreet
	farwritetext LyraPhoneNiteGreetingText
	sjump .main

.morngreet
	farwritetext LyraPhoneMornGreetingText
	sjump .main

.daygreet
	farwritetext LyraPhoneDayGreetingText
	sjump .main

.main
	checkpoke MAGNETON
	iftrue .magneton
	promptbutton
	farwritetext LyraPhoneMainText
	sjump .hangup

.magneton
	promptbutton
	farwritetext LyraPhoneMagnetonText
	promptbutton	
	sjump .hangup

.hangup:
	promptbutton
	farwritetext LyraPhoneEndText
	end

LyraPhoneCallerScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_LYRAFIRSTBADGE, .firstbadge
	ifequal SPECIALCALL_LYRATHIRDBADGE, .thirdbadge
	ifequal SPECIALCALL_LYRASEGG, .lyrasegg
	specialphonecall SPECIALCALL_NONE
	sjump LyraPhoneCalleeScript

.firstbadge
	farwritetext LyraPhoneFirstBadgeText
	specialphonecall SPECIALCALL_NONE
	end

.thirdbadge
	farwritetext LyraPhoneThirdBadgeText
	specialphonecall SPECIALCALL_NONE
	end

.lyrasegg
	farwritetext LyraPhoneLyrasEggIntroText
	promptbutton
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .lyrasegg_totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .lyrasegg_chikorita
	farwritetext LyraPhoneLyrasEggChikoritaText
	sjump .lyrasegg_end

.lyrasegg_totodile
	farwritetext LyraPhoneLyrasEggCyndaquilText
	sjump .lyrasegg_end

.lyrasegg_chikorita:
	farwritetext LyraPhoneLyrasEggTotodileText
.lyrasegg_end
	promptbutton
	farwritetext LyraPhoneLyrasEggEndText
	setevent EVENT_LYRA_GAVE_AWAY_EGG
	specialphonecall SPECIALCALL_NONE
	end
