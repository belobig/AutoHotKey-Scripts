;;;;;;;;PowerChart - Plan Admission Orders Reconciliation;;;;;;;;;;;;;
SetTitleMatchMode, 2
F2::  ;Click Plan on Admission Orders Reconciliation - start on previous patient
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
    WinWait, Discern: Open Chart,, 5
    if ErrorLevel
    {
      MsgBox, Document Catheter window never came up.
      return
    }
  else
    sleep, 500
    SendInput, {Enter}
    WinWait, Opened by
    sleep, 3200
    SendInput, {Click 537, 219} ;Click Reconciliation
    sleep, 1000
    SendInput, {Click 524, 243} ;Click Admission
    WinWait, Order Reconciliation,, 5
    if ErrorLevel
    {
      MsgBox, Admission Orders Rec window never came up.
      return
    }
  else
    sleep, 500
    SendInput, {Click 693, 694} ;Click Plan
    sleep, 500
}
return

F3::  ;Click Plan on Admission Orders Reconciliation, after discontinuing the home meds - start on previous patient
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
    sleep, 500
    WinWait, Opened by
    sleep, 3200
    SendInput, {Click 537, 219} ;Click Reconciliation
    sleep, 1000
    SendInput, {Click 524, 243} ;Click Admission
    WinWait, Order Reconciliation,, 5
    if ErrorLevel
    {
      MsgBox, Admission Orders Rec window never came up.
      return
    }
  else
    sleep, 500
    SendInput, {Click 509, 186} ;Click Stop on lisinopril
    sleep, 500
    SendInput, {Click 510, 220} ;Click Stop on metFORMIN
    sleep, 500
    SendInput, {Click 510, 284} ;Click Stop on multivitamin
    sleep, 500
    SendInput, {Click 693, 694} ;Click Plan
    sleep, 500
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