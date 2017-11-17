;;;;;;;;PowerChart - Fix and Add Diagnoses;;;;;;;;;;;;;
SetTitleMatchMode, 2
F2::  ;Modify MVA diagnosis on Problem List menu component, then go to Hospitalist Workflow and add Ankle fracture and S/P surgical manipulation of ankle joint
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
	SendInput, {Click 41, 560} ;Click Problem List menu component
	sleep, 2500
    SendInput, {Click 429, 338} ;Click MVA diagnosis
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
	SendInput, {Click 97, 213} ;Click Hospitalist Workflow
	sleep, 2500
	SendInput, {Click 284, 441} ;Click Problem List within Hospitalist Workflow
	sleep, 3000
	SendInput, {Click 1365, 352} ;Click Problem Name search field
	sleep, 700
	SendInput, Ankle Fr
	sleep, 1000
	SendInput, {Click 1379, 369} ;Click Ankle Fracture
	sleep, 1000
	SendInput, {Click 1365, 352} ;Click Problem Name search field
	sleep, 700
	SendInput, S/P surgical manipulation of a
	sleep, 1000
	SendInput, {Click 1379, 369} ;Click S/P surgical manipulation of ankle joint
	sleep, 1000
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