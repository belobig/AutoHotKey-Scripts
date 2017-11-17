; Login to PMOffice and have Cancel Discharge conversation selected


F1::  ;Add task to queue with FIN instead of name
Loop 
{
  WinActivate, Book1
  sleep, 500
  SendInput, {Down}^c
  sleep, 500
  IfInString Clipboard, endx
  {
    MsgBox, Found the end
    return
  }else
  {
    WinActivate, Access Management ;Change this to the title on top of the Window
    sleep, 700
    SendInput, {Enter}
    Sleep, 3500
    SendInput, ^v
    sleep, 700
    SendInput, {Enter}
    sleep, 1500
    SendInput, {Enter}
    sleep, 3500
    SendInput, +{Tab 4}
    sleep,700
    SendInput, t
    sleep, 700
    SendInput, ^!+{F4}
    sleep, 700
    SendInput, daking
    sleep,700
    SendInput, {Enter}
    sleep, 1000
	SendInput, {Enter}
    sleep, 700
    SendInput, !c
	sleep, 1000
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