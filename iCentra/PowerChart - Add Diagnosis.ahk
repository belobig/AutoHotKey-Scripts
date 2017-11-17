;;;;;;;;PowerChart - Fix Diagnosis;;;;;;;;;;;;;
SetTitleMatchMode, 2
F2::  ;Modify a diagnosis on Problem List menu component
Loop 
{
  WinActivate, Opened by ; Powerchart window
  sleep, 500
  SendInput, {Click 1688, 117} ;Click Next button
  sleep, 500
  WinWait, Assign a Relationship,, 5
  if ErrorLevel
  {
    MsgBox, This patient may already be done, or you may be at the end of the list
    return
  }
  else
    sleep, 500
    SendInput, {Down}{Enter}
    WinWait, Opened by
    sleep, 2500
    SendInput, {Click 429, 338} ;Click top diagnosis
	sleep, 1000
    SendInput, {Click 358, 284} ;Click Modify
    sleep, 700
    SendInput, {Click 368, 635} ;Click Type dropdown
    sleep, 700
	SendInput, d
	sleep, 500
	SendInput, {Tab}
    sleep, 1000
	SendInput, {Click 1826, 878} ;Click OK
	sleep, 1500
}
return

F5::  ;Modify 4 diagnoses on Problem List menu component
Loop 
{
  WinActivate, Opened by ; Powerchart window
  sleep, 500
  SendInput, {Click 1688, 117} ;Click Next button
  sleep, 500
  WinWait, Assign a Relationship,, 5
  if ErrorLevel
  {
    MsgBox, This patient may already be done, or you may be at the end of the list
    return
  }
  else
    sleep, 500
    SendInput, {Down}{Enter}
    WinWait, Opened by
    sleep, 2500
    SendInput, {Click 429, 338} ;Click top diagnosis
	sleep, 1000
    SendInput, {Click 358, 284} ;Click Modify
    sleep, 700
    SendInput, {Click 368, 635} ;Click Type dropdown
    sleep, 700
	SendInput, d
	sleep, 500
	SendInput, {Tab}
    sleep, 1000
	SendInput, {Click 1826, 878} ;Click OK
	sleep, 1500
    
    SendInput, {Click 429, 357} ;Click second diagnosis
	sleep, 1000
    SendInput, {Click 358, 284} ;Click Modify
    sleep, 700
    SendInput, {Click 368, 635} ;Click Type dropdown
    sleep, 700
	SendInput, d
	sleep, 500
	SendInput, {Tab}
    sleep, 1000
	SendInput, {Click 1826, 878} ;Click OK
	sleep, 1500
    
    SendInput, {Click 429, 373} ;Click third diagnosis
	sleep, 1000
    SendInput, {Click 358, 284} ;Click Modify
    sleep, 700
    SendInput, {Click 368, 635} ;Click Type dropdown
    sleep, 700
	SendInput, d
	sleep, 500
	SendInput, {Tab}
    sleep, 1000
	SendInput, {Click 1826, 878} ;Click OK
	sleep, 1500
    
    SendInput, {Click 429, 392} ;Click fourth diagnosis
	sleep, 1000
    SendInput, {Click 358, 284} ;Click Modify
    sleep, 700
    SendInput, {Click 368, 635} ;Click Type dropdown
    sleep, 700
	SendInput, d
	sleep, 500
	SendInput, {Tab}
    sleep, 1000
	SendInput, {Click 1826, 878} ;Click OK
	sleep, 1500
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