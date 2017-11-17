;;;;;;;;PowerChart - Add Favorite Order;;;;;;;;;;;;;
SetTitleMatchMode, 2
F2::  ;Add NS Bolus 1000mg order from Favorites on xTestHospAdmitA patients
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
    SendInput, {Click 252, 222} ;Click order Add button
	WinWait,  Add Order,, 5
    if ErrorLevel
    {
      MsgBox, Add Order window never came up.
      return
    }
  else
	sleep, 1000
    SendInput, {Click 448, 125} ;Click Favorites Star
    sleep, 500
    SendInput, {Click 416, 181} ;Click NS Bolus order
    sleep, 1500
	SendInput, !d
	WinWait, Opened by
	sleep, 500
	SendInput, {Click 1871, 989} ;Click Sign
    sleep, 2500
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