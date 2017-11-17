;;;;;;;;Frequent input;;;;;;;;;;;;;

F2::  ;Tab to No SSN Reason, then to Preferred Phone field
{
  SendInput, {Tab 9}
  Sleep, 700
  SendInput, {BackSpace}{Tab}
  sleep, 1000
  SendInput, !e
}
return

F3::
{
	SendInput, {Tab 7}
	sleep, 700
	SendInput, ^+{End}
	sleep, 700
	SendInput, {BackSpace}cholecystectomy
	sleep, 500
	Send, {Tab 12}
	sleep, 700
	SendInput, {Del}
	sleep, 700
	SendInput, moesinger, robert
	sleep, 700
	SendInput, {Tab}{Space}
	sleep, 700
	SendInput, {Enter}
	sleep, 2000
	SendInput, !p
}
return

F4::  SendInput, {Tab}s ;Insurance Primary, set Self as Relationship, set SelectMed as Health Plan
	
F5::
{
	SendInput, !h
	sleep, 1000
	SendInput, !p
	sleep, 1000
	SendInput, {Tab 7}
	sleep, 700
	SendInput, {Space}
	sleep, 700
	SendInput, +{Tab 7}
	sleep, 700
	SendInput, selectmed{Enter}
	sleep, 700
	SendInput, {Tab}{Enter}
}
return

F6:: ;Insurance Primary in Register Patient, to get from Search Health Plans to Provider ID and input it
{
	SendInput, {Tab 17}
	Sleep, 700
	SendInput, 800123852
}
return

F7::
{
	SendInput, ^!+{F4}
	sleep, 700
	SendInput, daking{Enter}
	sleep, 700
	SendInput, {Enter}
}
return

F8:: SendInput, !c

F9::
{
	SendInput, {Tab 44}
	sleep, 700
	SendInput, {Tab 3}
	sleep, 700
	SendInput, !m
	sleep, 500
	Send, {Tab}
	sleep, 700
	send, {Delete}	
	Send, {Tab}
	sleep, 700
	send, {Delete}
}
return

!s::SendInput, selectmed{Enter}{Tab}{Enter}
return
!l::SendInput, 4646 W Lake Park Blvd{Tab}{Tab}84120{Tab}
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