Loop
{
	sleep, 1000
	ControlClick, Button1, Message from webpage
	sleep, 1000
}

;;;;;;;;;ALWAYS ON TOP;;;;;;;;;;;;;
^!SPACE::  Winset, Alwaysontop, , A

;;;;;;;;RUN PROGRAMS;;;;;;;;;;
#c::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Calculator.lnk
#e::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Outlook 2013.lnk
#j::Run http://hpv-contrprd01:8080/contour
#k::run https://kronoslogon.co.ihc.com/wfc/applications/wtk/html/ess/logon.jsp
#n::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Sticky Notes.lnk
#o::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\OneNote 2013.lnk
#w::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Word 2013.lnk
#x::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Excel 2013.lnk
#z::Run https://rsoweb.co.ihc.com/CAisd1/pdmweb.exe

;;;;;;;;Pause and Kill

^p::  ; Ctrl-P Pause and Resume hotkey.
DetectHiddenWindows, On 
WinGet, IDList ,List, ahk_class AutoHotkey
Loop %IDList%
  {
  ID:=IDList%A_Index%
  WinGetTitle, ATitle, ahk_id %ID%
  IfNotInString, ATitle, %A_ScriptName%
    {
    PostMessage, 0x111, 65305,,, %ATitle%  ; Suspend.
    PostMessage, 0x111, 65306,,, %ATitle%  ; Pause.
    }
  }
Return

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

