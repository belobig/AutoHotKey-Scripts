Loop
{   DetectHiddenWindows, On
	IfWinExist, Service Desk
	{
		WinActivate
		SendInput !a
		sleep, 900000
	}
}