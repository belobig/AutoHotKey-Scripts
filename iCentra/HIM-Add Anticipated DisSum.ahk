;Add an Anticipated Discharge Summary for Cerner, Cerner in Patient Deficiency Analysis
F2::
{
	SendInput, !a
	sleep, 700
	SendInput, {Tab}
	sleep, 700
	SendInput, cern c
	sleep, 1000
	SendInput, {Click 53, 552}
	sleep, 700
	SendInput, !o
	sleep, 700
	SendInput, !c
	sleep, 700
	SendInput, !t
	SendInput, x
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