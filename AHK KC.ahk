
;;;;;;;;;ALWAYS ON TOP;;;;;;;;;;;;;
^!SPACE::  Winset, Alwaysontop, , A

;;;;;;;;RUN PROGRAMS;;;;;;;;;;
#c::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Calculator.lnk
#u::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Outlook 2013.lnk
#k::run https://kronoslogon.co.ihc.com/wfc/applications/wtk/html/ess/logon.jsp
#n::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories\Sticky Notes.lnk
#o::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\OneNote 2013.lnk
#w::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Word 2013.lnk
#x::Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office 2013\Excel 2013.lnk


;;;;;;;;Frequently typed phrases;;;;;;;;;;;;;

F2::  ;Tab to No SSN Reason, then to Address field
{
  SendInput, {Tab 9}
  Sleep, 700
  SendInput, u{Tab}
  sleep, 700
  SendInput, {Tab 15}
}
return
F3::SendInput, {Tab 17} ;Insurance Primary in Register Patient, to get from Search Health Plans to Provider ID
return

F4::  ;Tab to PreReg Status, in PreReg conversation, then input C for complete, then go to Encounter Information tab and tab to Patient Type and arrow down to Prereg
{
  SendInput, {Tab 22}
  sleep, 700
  SendInput, c
  sleep, 900
  SendInput, !e
  sleep, 3500
  SendInput, {Tab 3}
  sleep, 700
  SendInput, {Down 3}
}
return

F5:: ;To input required info when creating patients in PM Office, Add/Modify Person
{
  SendInput, {Tab 7}
  Sleep, 700
  SendInput, m{Tab 2} ;Gender
  sleep, 700
  SendInput, u{Tab}  ;No SSN Reason
  sleep, 700
  SendInput, 01011948 ;DOB
  sleep, 1500
  SendInput, {Tab 10}
}
return

F6::SendInput, {Tab 13} ;Insurance Primary in Create Person, to get from Self to Search Health Plans
return

F7::SendInput, {Tab 16} ;Insurance Primary in Create Person, to get from Search Health Plans to Provider ID
return

!a::SendInput, anderson, t{Tab 3}0800{Enter}
return
!c::SendInput, coding - waiting for d{Enter}
return
!l::SendInput, 4646 W Lake Park Blvd{Tab}{Tab}84120{Tab}
return
!n::SendInput, +{Tab}e{Tab}AC- Need Discharge Summary Anne Blackett
return
!s::SendInput, selectmed{Enter}{Tab}
return
!y::SendInput, yy coding - o{Tab}{Enter}
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
