OptionsDescriptions:
	table_width 2
	dw .TextSpeed
	dw .BattleScene
	dw .BattleStyle
	dw .Sound
	dw .Running
	dw .MenuAccount
	dw .Frame
	dw .Font
	dw .RealTimeClock
	dw .Done
	assert_table_length NUM_OPTIONS

.TextSpeed:
	db "Change the speed<LINE>of game text.<PROMPT>@"

.BattleScene:
	db "Show animations<LINE>in battle.<PROMPT>@"

.BattleStyle:
	db "After you KO an<LINE>opponent:<PARA>Set: just sends<LINE>out the next foe.<PARA>Switch: lets you<LINE>switch first.<PROMPT>@"

.Sound:
	db "Audio output:<LINE>Mono (one channel)<PARA>Stereo (left and<LINE>right channels).<PROMPT>@"

.Running:
	db "On: Default run.<LINE>Hold B to walk.<PARA>Off: Default walk.<LINE>Hold B to run.<PROMPT>@"

.MenuAccount:
	db "Show description<LINE>for Menu options.<PROMPT>@"

.Frame:
	db "Change the frame<LINE>for textboxes.<PROMPT>@"

.Font:
	db "Change the font<LINE>of game text.<PROMPT>@"

.RealTimeClock:
	db "On: in-game time<LINE>runs in real-time.<PARA>Off: in-game time<LINE>runs at 6x speed.<PROMPT>@"

.Done:
	db "Save changes<LINE>and Exit.<PROMPT>@"
