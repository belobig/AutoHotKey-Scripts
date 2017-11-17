;;;;;;;;; First Open Prefmaint.exe in T351C, then run this script ;;;;;;
if !WinExist("HNAM Logon")
{
  MsgBox, Please open Prefmaint.exe in T351C first, then run this script again.
  ExitApp
}else {
  WinActivate, HNAM Logon
  sleep, 500
  SendInput, lsfloat06
  sleep, 500
  SendInput, {Tab}cerner{Enter}
  sleep, 2500
  WinActivate, Preference Form
  sleep, 500
  PostMessage, 0x112, 0xF030,,, Preference Form  ; 0x112 = WM_SYSCOMMAND, 0xF030 = SC_MAXIMIZE
  sleep, 500
  SendInput, {Down}{Tab}
  sleep, 500
  SendInput, ri{Tab}
  sleep, 1500
  SendInput, {Click 88, 129}
  sleep, 1500
  SendInput, {Click 54, 162}
  sleep, 1500
  SendInput, {Click 75, 484}
  sleep, 1500
  SendInput, {Click 149, 499}
  sleep, 1500
  SendInput, {Tab}{Right}{Down 7}
  sleep, 500
  Clipboard = mp_common_driver
  SendInput, ^v
  sleep, 500
  SendInput, {Down}
  sleep, 500
  Clipboard = "mine", $PAT_PERSONID$, $VIS_ENCNTRID$, $USR_PERSONID$,"I:\\Winintel\\static_content\\pm_mp_observation_events", "pm_mp_observation_events.html", "powerchart.exe", "cer_install:",$USR_PositionCd$, $PAT_PPRCode$, 0
  SendInput, ^v
  sleep, 500
  MsgBox, Now click "Apply" and "OK" to commit changes, then Exit Prefmaint.

  ExitApp
}


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