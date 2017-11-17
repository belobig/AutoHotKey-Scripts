;;;;;;;;Frequent input;;;;;;;;;;;;;

F2::  ;Tab to No SSN Reason, then to Preferred Phone field
{
  SendInput, {Tab 9}
  Sleep, 700
  SendInput, u{Tab}
  sleep, 700
  SendInput, {Tab 18}
}
return
F3::  ;Encounter Information, tab to Nurse\Ambulatory, then medical service, then Attending/Rendering Physician
{
	SendInput, {Tab 2}
	sleep, 700
	SendInput, yy r
	sleep, 1700
	SendInput, {Tab 7}
}
return
F4::  ;Insurance Primary, tab to Employment Status, enter Sprint as employer
{
	SendInput, {Tab}s
	sleep, 3500
	SendInput, {Tab 12}
	sleep, 700
	SendInput, e
	sleep, 1700
	SendInput, {Tab}{Enter}
	sleep, 700
	SendInput, !f
	sleep, 700
	SendInput, {Tab 5}
	sleep, 700
	SendInput, sprint{Enter}
	sleep, 700
	SendInput, {Down}{Enter}
}
return
F5:: ;Insurance Primary in Register Patient, to get from Search Health Plans to Provider ID and input it
{
	SendInput, {Tab 17}
	Sleep, 700
	SendInput, 87654321
}
return

F6::
{
	SendInput, 8011231234{Tab 3}
	sleep, 700
	SendInput, register{Enter}
}
return

F7::
{
	SendInput, yy training - h{Enter}
	sleep, 700
	SendInput, {Enter}
}
return

F8::
{
	SendInput, {Tab 2}
	sleep, 700
	SendInput, ^+{Right}
	SendInput, ^c
	WinActivate, Reg Patients
	sleep, 700
	SendInput, ^f
	sleep, 700
	SendInput, ^v{Enter}
	sleep, 700
	SendInput, {Tab 4}{Enter}
}
return

F9::
{
	SendInput, ^c
	WinActivate, Access Management Office
	Sleep, 700
	SendInput, {Tab 22}
	sleep, 700
	SendInput, {Backspace 10}
	SendInput, %Clipboard%
}
return

F10:: SendInput, !c

F11:: 
{
	SendInput, !{Tab}
	WinActivate, Access Management Office
}
return

F12::
{
	SendInput, ^c
	WinActivate, Access Management Office
	Sleep, 700
	SendInput, {Tab 21}
	sleep, 700
	SendInput, {Backspace 10}
	SendInput, %Clipboard%
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
