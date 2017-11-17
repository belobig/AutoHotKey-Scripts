;  Use this script to add encounter notes to tasks in AccessHIM

F2::
{
	SendInput, {AppsKey}
	
	SendInput, n
	sleep,700
	SendInput, {Enter}
	sleep, 700
	SendInput, +{Tab}
	
	SendInput, e{Tab}
	
	SendInput, ^v ;Have your note text copied to the clipboard so it will paste in the text you want
	sleep, 700
	SendInput, +{Tab 2}
	sleep, 700
	SendInput, {Enter}
	
	SendInput, {Esc}
	sleep, 700
	SendInput, {Down}	

}
return

F3:: ;Pass and add pass reason
{
	SendInput, {AppsKey}
	SendInput, p
	sleep,700
	SendInput, coding - received op ; change to 'coding - o' for operations clarification or 'coding - received op' for received op report
	sleep, 700
	SendInput, {Enter}
	sleep, 700
	SendInput, {Down}
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