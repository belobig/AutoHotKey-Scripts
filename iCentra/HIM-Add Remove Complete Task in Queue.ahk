;;;;;;;;Patient Deficiency Analysis - Add Patients to Task Queue;;;;;;;;;;;;;


f1::
tooltip %A_Cursor%
return

F2::  ;Add task to queue with patient name from clipboard
Loop { ;Add Loop to beginning if task queue can keep up.
  WinActivate, Master T351 DP ;Name of patient spreadsheet
  sleep, 500
  SendInput, {Down}^c
  sleep, 500
  IfInString Clipboard, endx
  {
    MsgBox, Found the end
    return
  }else
  {
    WinActivate, ProFile: Task Queue
    sleep, 700
    SendInput, !t
    Sleep, 700
    SendInput, {Down 10}{Enter}
    sleep, 700
    SendInput, ^p
    sleep, 700
    SendInput, ^v
    sleep,700
    SendInput, {Enter}
    sleep, 700
    SendInput, {Tab}{Down 2}{Enter} ; May have to change # of down arrows depending on patient set to get to the right encounter. Most can be run with 2, but on HIMOPEN, change to 1
    sleep, 700
    SendInput, {Enter}
    sleep,700
    SendInput, !a
    sleep, 1000
    SendInput, {Tab 3}{End}
    sleep, 1000
  }
}
return

F3::  ;Add task to queue with FIN instead of name
Loop {
  WinActivate, Master T351 DP
  sleep, 500
  SendInput, {Down}^c
  sleep, 500
  IfInString Clipboard, endx
  {
    MsgBox, Found the end
    return
  }else
  {
    WinActivate, ProFile: Task Queue ;Change this to the title on top of the Task Queue Window
    sleep, 700
    SendInput, !t
    Sleep, 700
    SendInput, {Down 10}{Enter}
    sleep, 700
    SendInput, ^p
    sleep, 1000
    SendInput, {Tab 5}
    sleep, 700
    SendInput, ^v
    sleep,700
    SendInput, {Enter}
    sleep, 700
    SendInput, {Tab}{Enter}
    sleep, 700
    SendInput, {Enter}
    sleep,700
    SendInput, !a
    sleep, 1000
    SendInput, {Tab 3}{End}
  }
}
return

F4:: ;Remove tasks from queue until you tell it to stop with Ctrl+q. Have queue sorted with the ones you want removed at the top because it will reset to the top item after each one is removed.
Loop 
{
  /*Loop
  {
    Sleep, 700
    if A_Cursor <> Wait ;this would work if the cursor type wasn't always unknown in the Task Queue application
      break
  }
  */
  SendInput, {Up}
  sleep, 700 
  SendInput, !t
  sleep, 700
  SendInput, r
  Sleep, 6500 ;original delay was 700, slowed down for task queue to keep up.
}
return

F5:: ;Complete tasks in a queue with current date/time
Loop 
{
  SendInput, !t
  sleep, 700
  SendInput, c
  sleep, 700
  SendInput, {Enter}
  sleep, 700
  SendInput, {Up}
  sleep, 700
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