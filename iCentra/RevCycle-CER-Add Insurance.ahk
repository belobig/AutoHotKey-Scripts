;;;;;;;;;;;;; RevCycle - Add Guarantor and Insurance ;;;;;;;;;;;
;; Use a login such as IPPA52, login to RevCycle, then start with the encounter cell you want copied in your Excel sheet
#InstallKeybdHook
F2:: ; Add Guarantor and Insurance for Self Guarantor, and Self Subscriber
{
	WinActivate, Kelly's Copy of CER REG Data
	sleep, 500
	SendInput, ^c
	sleep, 500
	WinActivate, Revenue Cycle
	sleep, 500
	SendInput, {Click 101, 65} ; Click on Search box (set to encounter)
	sleep, 500
	SendInput, ^v{Enter}
	WinWait, Person Search - \\Remote,, 5
	if ErrorLevel
	{
		MsgBox, Person Search window didn't come up
		return
	}
	else
	{
		sleep, 500
		SendInput, {Enter}
		WinWait, Revenue Cycle
		sleep, 5000
		SendInput, {Click 1758, 141} ; Click Green Modify Pencil
		sleep, 3500
		SendInput, {Click 958, 457} ; Click to expand Guarantor
		sleep, 1000
		SendInput, {Click 979, 502} ; Click Add
		WinWait, Add Guarantor Person - \\Remote
		sleep, 500
		SendInput, {Click 1050, 863} ; Click OK
		WinWait, Invalid Address - \\Remote,, 5
		if ErrorLevel
		{
			MsgBox, Invalid Address window didn't come up
			return
		}
		else
		{
			sleep, 500
			SendInput, {Right}{Enter}
			WinWait, Revenue Cycle
			sleep, 500
			SendInput, {Click 967, 190} ; Click Insurance tab
			sleep, 700
			SendInput, {Click 942, 223} ; Click Add Insurance
			WinWait, Add Insurance - \\Remote
			sleep, 500
			SendInput, {Click 123, 82} ; Click Insurance tab within Add Insurance window
			sleep, 700
			SendInput, {Click 298, 135} ; Click Search magnifying glass
			WinWait, Health Plan Search - \\Remote
			sleep, 700
			SendInput, {Click 192, 128} ;Click Search By dropdown menu
			sleep, 500
			SendInput, e
			sleep, 700
			SendInput, {Enter}
			WinWait, Add Insurance - \\Remote
			sleep, 700
			SendInput, {Click 119, 400} ; Click Begin Date Field
			sleep, 500
			SendInput, 01012015
			sleep, 500
			SendInput, {Click 95, 501} ; Click Last Name field
			sleep, 500
			SendInput, same{Tab}
			sleep, 1000
			SendInput, {Click 1109, 783} ; Click OK
			WinWait, Revenue Cycle
			sleep, 1000
			SendInput, {Click 1778, 138} ; Click Save
		}
	}
	WinActivate, Kelly's Copy of CER REG Data
	sleep, 500
	SendInput, {Down}
}
return

F7:: ; Add Guarantor and Insurance for Self Guarantor, and SPOUSE Subscriber
{
	WinActivate, Kelly's Copy of CER REG Data
	sleep, 500
	SendInput, ^c
	sleep, 500
	WinActivate, Revenue Cycle
	sleep, 500
	SendInput, {Click 101, 65} ; Click on Search box (set to encounter)
	sleep, 500
	SendInput, ^v{Enter}
	WinWait, Person Search - \\Remote,, 5
	if ErrorLevel
	{
		MsgBox, Person Search window didn't come up
		return
	}
	else
	{
		sleep, 500
		SendInput, {Enter}
		WinWait, Revenue Cycle
		sleep, 6000
		SendInput, {Click 1758, 141} ; Click Green Modify Pencil
		sleep, 4500
		SendInput, {Click 958, 457} ; Click to expand Guarantor
		sleep, 1000
		SendInput, {Click 979, 502} ; Click Add
		WinWait, Add Guarantor Person - \\Remote
		sleep, 500
		SendInput, {Click 1050, 863} ; Click OK
		WinWait, Invalid Address - \\Remote,, 5
		if ErrorLevel
		{
			MsgBox, Invalid Address window didn't come up
			return
		}
		else
		{
			sleep, 500
			SendInput, {Right}{Enter}
			WinWait, Revenue Cycle
			sleep, 500
			SendInput, {Click 967, 190} ; Click Insurance tab
			sleep, 700
			SendInput, {Click 942, 223} ; Click Add Insurance
			WinWait, Add Insurance - \\Remote
			sleep, 1500
			SendInput, {Click 47, 164} ; Click Search radial button
			sleep, 700
			WinActivate, Kelly's Copy of CER REG Data ;Make sure to have Last and First Names of Subscriber concatenated in the field you're copying the subscriber name from
			sleep, 500
			SendInput, {Right 5}
			sleep, 500
			SendInput, ^c
			sleep, 500
			WinActivate, Add Insurance - \\Remote
			sleep, 500
			SendInput, {Click 170, 123} ; Click Search for Related Person field
			sleep, 500
			SendInput, ^v{Enter}
			WinWait, Person Search - \\Remote
			sleep, 500
			KeyWait, Enter, D ; It waits for you to select the correct subscriber with up/down arrow keys, then hit Enter
			sleep, 1000
			WinWait, Add Insurance - \\Remote
			sleep, 700
			SendInput, {Click 394, 123} ; Click Type field
			sleep, 500
			SendInput, sp
			sleep, 500
			SendInput, {Tab}
			sleep, 1500
			SendInput, {Click 123, 82} ; Click Insurance tab within Add Insurance window
			sleep, 700
			SendInput, {Click 298, 135} ; Click Search magnifying glass
			WinWait, Health Plan Search - \\Remote
			sleep, 700
			SendInput, {Click 192, 128} ;Click Search By dropdown menu
			sleep, 500
			SendInput, e
			sleep, 700
			SendInput, {Enter}
			WinWait, Add Insurance - \\Remote
			sleep, 2000
			SendInput, {Click 333, 441} ; Click Subscriber Member Number Field
			sleep, 500
			SendInput, ^a
			sleep, 500
			SendInput, ^c
			sleep, 500
			SendInput, +{Tab}
			sleep, 500
			SendInput, ^v
			sleep, 500
			SendInput, {Click 95, 501} ; Click Last Name field
			sleep, 500
			SendInput, same{Tab}
			sleep, 1000
			SendInput, {Click 1109, 783} ; Click OK
			WinWait, Revenue Cycle
			sleep, 2000
			SendInput, {Click 1778, 138} ; Click Save
		}
	}
	WinActivate, Kelly's Copy of CER REG Data
	sleep, 500
	SendInput, {Down}{Left 5}
}
return

F9:: ; Add Guarantor and Insurance for Self Guarantor, and SPOUSE Subscriber
{
	WinActivate, Kelly's Copy of CER REG Data
	sleep, 500
	SendInput, ^c
	sleep, 500
	WinActivate, Revenue Cycle
	sleep, 500
	SendInput, {Click 101, 65} ; Click on Search box (set to encounter)
	sleep, 500
	SendInput, ^v{Enter}
	WinWait, Person Search - \\Remote,, 5
	if ErrorLevel
	{
		MsgBox, Person Search window didn't come up
		return
	}
	else
	{
		sleep, 500
		SendInput, {Enter}
		WinWait, Revenue Cycle
		sleep, 3000
		SendInput, {Click 1758, 141} ; Click Green Modify Pencil
		sleep, 2500
		SendInput, {Click 958, 457} ; Click to expand Guarantor
		sleep, 1000
		SendInput, {Click 979, 502} ; Click Add
		WinWait, Add Guarantor Person - \\Remote
		sleep, 500
		SendInput, {Click 1050, 863} ; Click OK
		WinWait, Invalid Address - \\Remote,, 5
		if ErrorLevel
		{
			MsgBox, Invalid Address window didn't come up
			return
		}
		else
		{
			sleep, 500
			SendInput, {Right}{Enter}
			WinWait, Revenue Cycle
			sleep, 500
			SendInput, {Click 967, 190} ; Click Insurance tab
			sleep, 700
			SendInput, {Click 942, 223} ; Click Add Insurance
			WinWait, Add Insurance - \\Remote
			sleep, 1500
			SendInput, {Click 47, 164} ; Click Search radial button
			sleep, 700
			WinActivate, Kelly's Copy of CER REG Data ;Make sure to have Last and First Names of Subscriber concatenated in the field you're copying the subscriber name from
			sleep, 500
			SendInput, {Right 7}
			sleep, 500
			SendInput, ^c
			sleep, 500
			StringReplace, clipboard, clipboard, `r`n, , All
			spouse = %clipboard%
			WinActivate, Add Insurance - \\Remote
			sleep, 500
			SendInput, {Click 170, 123} ; Click Search for Related Person field
			sleep, 500
			SendInput, %spouse%{Enter}
			WinWait, Person Search - \\Remote
			sleep, 500
			KeyWait, Enter, D ; It waits for you to select the correct subscriber with up/down arrow keys, then hit Enter
			sleep, 1000
			WinWait, Add Insurance - \\Remote
			sleep, 700
			SendInput, {Click 394, 123} ; Click Type field
			sleep, 500
			SendInput, sp
			sleep, 500
			SendInput, {Tab}
			sleep, 1500
			SendInput, {Click 123, 82} ; Click Insurance tab within Add Insurance window
			sleep, 700
			SendInput, {Click 298, 135} ; Click Search magnifying glass
			WinWait, Health Plan Search - \\Remote
			sleep, 700
			SendInput, {Click 192, 128} ; Click Search By dropdown menu
			sleep, 500
			SendInput, e{Tab}
			sleep, 700
			SendInput, {Click 28, 208} ; Click expand arrow next to Select Value
			sleep, 700
			SendInput, {Down}{Enter}
			WinWait, Add Insurance - \\Remote
			sleep, 2000
			SendInput, {Click 333, 441} ; Click Subscriber Member Number Field
			sleep, 500
			SendInput, ^a
			sleep, 500
			SendInput, ^c
			sleep, 500
			SendInput, +{Tab}
			sleep, 500
			SendInput, ^v
			sleep, 500
			SendInput, {Click 95, 501} ; Click Last Name field
			sleep, 500
			SendInput, same{Tab}
			sleep, 1000
			SendInput, {Click 1109, 783} ; Click OK
			WinWait, Revenue Cycle
			sleep, 2000
			SendInput, {Click 1778, 138} ; Click Save
			sleep, 2000
		}
		; Double-click second encounter, then add guarantor and insurance
		SendInput, {Click 811, 262, 2}
		sleep, 3000
		SendInput, {Click 1758, 141} ; Click Green Modify Pencil
		sleep, 2500
		SendInput, {Click 958, 457} ; Click to expand Guarantor
		sleep, 1000
		SendInput, {Click 979, 502} ; Click Add
		WinWait, Add Guarantor Person - \\Remote
		sleep, 500
		SendInput, {Click 1050, 863} ; Click OK
		sleep, 500
		WinWait, Revenue Cycle
		sleep, 500
		SendInput, {Click 967, 190} ; Click Insurance tab
		sleep, 700
		SendInput, {Click 942, 223} ; Click Add Insurance
		WinWait, Add Insurance - \\Remote
		sleep, 1500
		SendInput, {Click 47, 164} ; Click Search radial button
		sleep, 700
		SendInput, {Click 170, 123} ; Click Search for Related Person field
		sleep, 500
		SendInput, %spouse%{Enter}
		WinWait, Person Search - \\Remote
		sleep, 500
		KeyWait, Enter, D ; It waits for you to select the correct subscriber with up/down arrow keys, then hit Enter
		sleep, 1000
		WinWait, Add Insurance - \\Remote
		sleep, 700
		SendInput, {Click 394, 123} ; Click Type field
		sleep, 500
		SendInput, sp
		sleep, 500
		SendInput, {Tab}
		sleep, 1500
		SendInput, {Click 123, 82} ; Click Insurance tab within Add Insurance window
		sleep, 700
		SendInput, {Click 298, 135} ; Click Search magnifying glass
		WinWait, Health Plan Search - \\Remote
		sleep, 700
		SendInput, {Click 192, 128} ; Click Search By dropdown menu
		sleep, 500
		SendInput, e{Tab}
		sleep, 700
		SendInput, {Click 28, 208} ; Click expand arrow next to Select Value
		sleep, 700
		SendInput, {Down}{Enter}
		WinWait, Add Insurance - \\Remote
		sleep, 2000
		SendInput, {Click 333, 441} ; Click Subscriber Member Number Field
		sleep, 500
		SendInput, ^a
		sleep, 500
		SendInput, ^c
		sleep, 500
		SendInput, +{Tab}
		sleep, 500
		SendInput, ^v
		sleep, 500
		SendInput, {Click 95, 501} ; Click Last Name field
		sleep, 500
		SendInput, same{Tab}
		sleep, 1000
		SendInput, {Click 1109, 783} ; Click OK
		WinWait, Revenue Cycle
		sleep, 2000
		SendInput, {Click 1778, 138} ; Click Save
	}
	WinActivate, Kelly's Copy of CER REG Data
	sleep, 500
	SendInput, {Up}{Left 7}
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