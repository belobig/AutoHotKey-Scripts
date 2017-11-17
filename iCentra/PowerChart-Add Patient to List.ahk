;;;;;;;;PowerChart - Add Patients to Patient List;;;;;;;;;;;;;

F2::  ;Add patient to list with patient name from clipboard
Loop {
  WinActivate, Book1 ; Make this the window name of the sheet your names are on
  sleep, 500
  SendInput, {Down}^c
  sleep, 500
  IfInString Clipboard, endx
  {
    MsgBox, Found the end
    return
  }else
  {
    WinActivate, PowerChart Organizer
    sleep, 700
    SendInput, !pp
    Sleep, 700
    SendInput, {Down 2}{Enter}
    sleep, 700
    SendInput, ^v
    sleep,700
    SendInput, {Enter}
    sleep, 700
    SendInput, {Tab}{Down 2}{Enter} ; May have to change # of down arrows depending on patient set to get to the right encounter.
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