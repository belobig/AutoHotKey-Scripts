#persistent
Loop
{   DetectHiddenWindows, On
	WinGet PrevActvWin,, A
	IfWinExist, Service Desk
	{
		WinActivate
		SendInput !a
		sleep, 500
		WinActivate ahk_id %PrevActvWin%
		sleep, 900000
	}
}