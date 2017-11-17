F1:: ;Start on FIN you want copied into search in Rev Cycle
Loop
{
	WinActivate, Kelly's Copy of MG
	sleep, 500
	SendInput, ^c
	Sleep, 500
	IfInString Clipboard, endx
  {
    MsgBox, Found the end
    return
  }else
  {
	WinActivate, Revenue Cycle
	sleep, 500
	SendInput, {Click 188, 64} ;Click on Search Dropdown
	sleep, 500
	SendInput, e
	sleep, 500
	SendInput, +{Tab}
	sleep, 500
	SendInput, ^v
	sleep, 500
	SendInput, {Enter}
	WinWait, Person Search
	WinActivate, Person Search
	sleep, 500
	SendInput, {Enter}
	sleep, 1000
	SendInput, {Click 569, 62} ;Click on Patient Account perspective
	sleep, 3500
	SendInput, {Click 195, 621} ;Click on Claims tab
	sleep, 1500
	SendInput, {Click 207, 741, 2} ;DoubleClick on Claim
	sleep, 2500
	SendInput, {Click 1062, 227, 2} ;DoubleClick on Claim Number
	sleep, 500
	SendInput, ^c
	sleep, 500
	WinActivate, Kelly's Copy of MG
	sleep, 500
	SendInput, {Right}^v
	sleep, 500
	SendInput, {Down}{Left}
	}
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