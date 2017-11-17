;;;;;;;;Frequent input;;;;;;;;;;;;;

F2::  ;Tab to date, enter date, tab to body, input note text
{
  SendInput, {Tab 2}
  Sleep, 500
  SendInput, 05/10/2014
  sleep, 500
  SendInput, {Tab}0800
  sleep,500
  SendInput, {Tab 2}{Down}
  sleep, 500
  SendInput, Patient presents with nasal fracture "while" ice skating.
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
