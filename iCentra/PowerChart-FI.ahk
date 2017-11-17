;;;;;;;;Frequent input;;;;;;;;;;;;;

F2:: ;Enter physician and void reason
{
	SendInput, cern,c
	sleep, 1000
	SendInput, {Tab 4}
	sleep, 700
	SendInput, w
	sleep, 500
	SendInput, {Enter}
}
return	

F3:: SendInput, iv pu{Enter}
return

F4::  ;paste in text
{
	SendInput, ^+{Home}
	sleep, 700
	SendInput, up to 10 mg as directed for cardioversion
}
return
F5::  ;Change Max Dose and Dose Range
{
	SendInput, +{Tab}
	sleep, 700
	SendInput, 100
	sleep, 700
	SendInput, {Tab}25-100 mcg
}
return

F6:: ;Enter Dynamic Group details
{
	SendInput, p{Tab}ff{Tab}{Space}{Tab}
	sleep, 700
	SendInput, {Down 2}
}
return
	

F7:: ;Type in Left Arm
{
	SendInput, left arm{Tab}
	sleep, 700
	SendInput, !a
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
