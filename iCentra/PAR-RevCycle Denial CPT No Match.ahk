
F1:: ;start with the cursor on the Claim # to be copied from your spreadsheet
{
	WinActivate, Kelly's Copy of MG
	sleep, 500
	SendInput, ^c
	Sleep, 500
	WinActivate, Revenue Cycle
	sleep, 500
	SendInput, {Click 120, 240} ;Click on Claim field
	sleep, 500
	SendInput, ^v
	sleep, 500
	SendInput, {Enter}
	sleep, 2500
	SendInput, {Tab}
	sleep, 500
	SendInput, {Delete}
	sleep, 500
	SendInput, {Tab 2}
	sleep, 500
	SendInput, {Delete}
	sleep, 500
	SendInput, {Tab 5}
	sleep, 500
	SendInput, 11 ;The Remark #
	sleep, 500
	SendInput, {Enter}
	sleep, 500
	SendInput, 51100 ;The Remark Amount
	sleep, 500
	SendInput, {Enter} ;Review data to ensure correct patient and visit date, then click Add on the Remittance
	sleep, 500
	SendInput, {Tab 3}
	sleep, 500
	SendInput, {Enter}
	sleep, 500
	WinActivate, Kelly's Copy of MG
	sleep, 500
	SendInput, {Right 7}
	sleep, 500
	SendInput, done
	sleep, 500
	SendInput, {Down}{Left 7}
}
return



^q:: ;Panic!!
DetectHiddenWindows, On 
WinGet, IDList ,List, ahk_class AutoHotkey 
Loop %IDList% 
  { 
  ID:=IDList%A_Index% 
  WinGetTitle, ATitle, ahk_id %ID% 
  IfNotInString, ATitle, %A_ScriptName% 
    WinClose, %ATitle% ;close instead of pause and suspend
  } 
ExitApp