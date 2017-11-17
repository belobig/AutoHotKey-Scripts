;;;;;;;;Frequent input in PMOffice, PreReg Conversation;;;;;;;;;;;;;

F2:: ;select Org
{
	SendInput, mk_mckay-dee h{Enter}
	sleep, 700
	SendInput, {Enter}
}
return

F3::  ;Copy Phone from spreadsheet, then Tab to Preferred Phone field, paste in phone
{
  WinActivate, PreReg_Patients per Profile
  SendInput, {Tab}
  sleep, 700
  SendInput, ^c
  WinActivate, Access Management Office
  Sleep, 700
  SendInput, {Tab 34}
  sleep, 700
  SendInput, h
  sleep, 1000
  SendInput, {Backspace 20}
  SendInput, %Clipboard%
}
return
F4::  ;Encounter Information, enter building, Nurse\Ambulatory, Patient Type, then medical service, then Attending/Rendering Physician, then Estimated Arrive Date and Time
{
	SendInput, {Tab}
	sleep, 700
	SendInput, mk_mckay-
	sleep, 500
	SendInput, {Tab}
	sleep, 500
	SendInput, mk_ss_o
	sleep, 500
	SendInput, {Tab}
	sleep, 500
	SendInput, preer
	sleep, 1000
	SendInput, {Tab}
	sleep, 700
	SendInput, s
	sleep, 700
	SendInput, {Tab 3}
	sleep, 700
	SendInput, tonsil/adenoidectomy
	sleep, 700
	Send, {Tab 12}
	sleep, 700
	SendInput, scheuller,m
	sleep, 1700
	SendInput, {Tab 14}
	sleep, 700
	SendInput, t
	sleep, 700
	SendInput, {Tab}
	sleep, 700
	SendInput, 0800
	sleep, 700
}
return

F5::  SendInput, {Tab}s ;Insurance Primary, set Self as Relationship, set PEHP Summit as Health Plan
	
F6::
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
	SendInput, pehp summit{Enter}
	sleep, 700
	SendInput, {Tab}{Enter}
}
return
F7:: ;Insurance Primary in Register Patient, to get from Search Health Plans to Provider ID and input it
{
	SendInput, {Tab 17}
	Sleep, 700
	SendInput, 174100123456
}
return

F8::
{
	SendInput, ^!+{F4}
	sleep, 700
	SendInput, daking{Enter}
}
return

F9:: SendInput, !c


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
