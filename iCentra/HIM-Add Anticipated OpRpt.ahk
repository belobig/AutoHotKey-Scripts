;Add an Anticipated Operative Report for Melinda Williams in Patient Deficiency Analysis
F2::
{
	SendInput, !a
	sleep, 700
	SendInput, +{Tab}
	sleep, 700
	SendInput, williams test, mel
	sleep, 1000
	SendInput, {Click 54, 439}
	sleep, 700
	SendInput, !o
	sleep, 700
	SendInput, !c
	sleep, 700
	SendInput, ^n
}
return

F3:: ;Refuse the document in PowerChart while logged in as Melinda Williams Test
{
	Send, +{Tab 3}
	sleep, 700
	SendInput, r
	sleep, 700
	SendInput, {Tab 4}
	sleep, 700
	Send, please see my Cardiology Consult report
;	sleep, 1000
	SendInput, {Tab 3}
;	sleep, 700
;	SendInput, {Enter}
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