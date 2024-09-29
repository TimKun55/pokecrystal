NurseMornText:
	text "Good morning!"
	line "Welcome to our"
	cont "#mon Center."
	done

NurseDayText:
	text "Hello!"
	line "Welcome to our"
	cont "#mon Center."
	done

NurseNiteText:
	text "Good evening!"
	line "You're out late."

	para "Welcome to our"
	line "#mon Center."
	done

NurseMornChampText:
	text "Good morning,"
	line "Champion <PLAYER>!"
	
	para "Welcome to our"
	line "#mon Center."
	done

NurseDayChampText:
	text "Hello, Champion"
	line "<PLAYER>!"
	
	para "Welcome to our"
	line "#mon Center."
	done

NurseNiteChampText:
	text "Good evening,"
	line "Champion <PLAYER>!"
	cont "You're out late."

	para "Welcome to our"
	line "#mon Center."
	done

NurseMornGrandChampText:
	text "Good morning,"
	line "Grand Champion"
	cont "<PLAYER>!"
	
	para "Welcome to our"
	line "#mon Center."
	done

NurseDayGrandChampText:
	text "Hello, Grand"
	line "Champion <PLAYER>!"
	
	para "Welcome to our"
	line "#mon Center."
	done

NurseNiteGrandChampText:
	text "Good evening,"
	line "Grand Champion"
	cont "<PLAYER>!"
	cont "You're out late."

	para "Welcome to our"
	line "#mon Center."
	done

NurseAskHealText:
	text "We can heal your"
	line "#mon to perfect"
	cont "health."

	para "Shall we heal your"
	line "#mon?"
	done

NurseTakePokemonText:
	text "OK, may I see your"
	line "#mon?"
	done

NurseReturnPokemonText:
	text "Thank you for"
	line "waiting."

	para "Your #mon are"
	line "fully healed."
	done

NurseGoodbyeText:
	text "We hope to see you"
	line "again."
	done

; not used
	text "We hope to see you"
	line "again."
	done

NursePokerusText:
	text "Your #mon"
	line "appear to be"

	para "infected by tiny"
	line "life forms."

	para "Your #mon are"
	line "healthy and seem"
	cont "to be fine."

	para "But we can't tell"
	line "you anything more"

	para "at a #mon"
	line "Center."
	done

PokeComNursePokerusText:
	text "Your #mon"
	line "appear to be"

	para "infected by tiny"
	line "life forms."

	para "Your #mon are"
	line "healthy and seem"
	cont "to be fine."

	para "But we can't tell"
	line "you anything more."
	done

DifficultBookshelfText:
	text "It's full of"
	line "difficult books."
	done

PictureBookshelfText:
	text "A whole collection"
	line "of #mon picture"
	cont "books!"
	done

MagazineBookshelfText:
	text "#mon magazines…"
	line "#mon Pal,"

	para "#mon Handbook,"
	line "#mon Graph…"
	done

TeamRocketOathText:
	text "Team Rocket Oath"

	para "Steal #mon for"
	line "profit!"

	para "Exploit #mon"
	line "for profit!"

	para "All #mon exist"
	line "for the glory of"
	cont "Team Rocket!"
	done

IncenseBurnerText:
	text "What is this?"

	para "Oh, it's an"
	line "incense burner!"
	done

MerchandiseShelfText:
	text "Lots of #mon"
	line "merchandise!"
	done

LookTownMapText:
	text "It's the Town Map."
	done

WindowText:
	text "My reflection!"
	line "Lookin' good!"
	done

TVText:
	text "It's a TV."
	
	para "… … …"
	line "There's nothing"
	cont "good on."
	done

GrannyStreamScariesText:
	text "There's an elderly"
	line "woman playing a"
	cont "scary game."
	
	para "Woah! She's"
	line "screaming a lot!"
	
	para "She seems to be"
	line "enjoying herself…?"
	
	para "Oh, she's picked"
	line "up her handbag"
	cont "and walked out…"
	done

GrannyStreamText:
	text "There's an elderly"
	line "woman playing"
	cont "video games."
	
	para "She seems to be"
	line "enjoying herself!"
	done

HomepageText:
	text "#mon Journal"
	line "Home Page…"

	para "It hasn't been"
	line "updated…"
	done

; not used
	text "#mon Radio!"

	para "Call in with your"
	line "requests now!"
	done

TrashCanText:
	text "There's nothing in"
	line "here…"
	done

; not used
	text "A #mon may be"
	line "able to move this."
	done

; not used
	text "Maybe a #mon"
	line "can break this."
	done

PokeCenterSignText:
	text "Heal Your #mon!"
	line "#mon Center"
	done

MartSignText:
	text "For All Your"
	line "#mon Needs"

	para "#mon Mart"
	done

ContestResults_ReadyToJudgeText:
	text "We will now judge"
	line "the #mon you've"
	cont "caught."

	para "<……>"
	line "<……>"

	para "We have chosen the"
	line "winners!"

	para "Are you ready for"
	line "this?"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER>, the No.@"
	text_ram wStringBuffer3
	text_start
	line "finisher, wins"
	cont "@"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "Please join us for"
	line "the next Contest!"
	done

ContestResults_ConsolationPrizeText:
	text "Everyone else gets"
	line "an Oran Berry"
	cont "as a consolation"
	cont "prize!"
	done

ContestResults_DidNotWinText:
	text "We hope you do"
	line "better next time."
	done

ContestResults_ReturnPartyText:
	text "We'll return the"
	line "#mon we kept"

	para "for you."
	line "Here you go!"
	done

ContestResults_PartyFullText:
	text "Your party's full,"
	line "so the #mon was"

	para "sent to your Box"
	line "in Bill's PC."
	done

GymStatue_CityGymText:
	text_ram wStringBuffer3
	text_start
	line "#mon Gym"
	done

GymStatue_WinningTrainersText:
	text "Leader: @"
	text_ram wStringBuffer4
	text_start
	para "Winning Trainers:"
	line "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Welcome to the"
	line "Game Corner."
	done

CoinVendor_NoCoinCaseText:
	text "Do you need game"
	line "coins?"

	para "Oh, you don't have"
	line "a Coin Case for"
	cont "your coins."
	done

CoinVendor_IntroText:
	text "Do you need some"
	line "game coins?"

	para "It costs ¥1000 for"
	line "50 coins, or"
	
	para "¥10000 for"
	line "500 coins."	
	
	para "Do you want some?"
	done

CoinVendor_Buy50CoinsText:
	text "Thank you!"
	line "Here are 50 coins."
	done

CoinVendor_Buy500CoinsText:
	text "Thank you! Here"
	line "are 500 coins."
	done

CoinVendor_NotEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

CoinVendor_CoinCaseFullText:
	text "Whoops! Your Coin"
	line "Case is full."
	done

CoinVendor_CancelText:
	text "No coins for you?"
	line "Come again!"
	done

BugContestPrizeNoRoomText:
	text "Oh? Your Pack is"
	line "full."

	para "We'll keep this"
	line "for you today, so"

	para "come back when you"
	line "make room for it."
	done

HappinessText3:
	text "Wow! You and your"
	line "#mon are really"
	cont "close!"
	done

HappinessText2:
	text "#mon get more"
	line "friendly if you"

	para "spend time with"
	line "them."
	done

HappinessText1:
	text "You haven't tamed"
	line "your #mon."

	para "If you aren't"
	line "nice, it'll pout."
	done

RegisteredNumber1Text:
	text "<PLAYER> registered"
	line "@"
	text_ram wStringBuffer3
	text "'s number."
	done

RegisteredNumber2Text:
	text "<PLAYER> registered"
	line "@"
	text_ram wStringBuffer3
	text "'s number."
	done

PokeCenterChanseyText:
	text "Chansey: Chansey!!"
	done

VendingMachineText:
	text "A vending machine!"
	line "Here's the menu."
	done

VendingMachineClangText:
	text "Clang!"

	para "@"
	text_ram wStringBuffer3
	text ""
	line "popped out."
	done

VendingMachineScoreText:
	text "Score! An extra"

	line "@"
	text_ram wStringBuffer3
	text ""
	cont "popped out."
	done

VendingMachineNoMoneyText:
	text "Oops, not enough"
	line "money…"
	done

VendingMachineNoSpaceText:
	text "There's no more"
	line "room for stuff…"
	done
