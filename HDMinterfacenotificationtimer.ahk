#Persistent




SetTimer, Chronos, 500

Return






Chronos:

FormatTime, TimeToMeet,,mm
StringTrimLeft, time, TimeToMeet, 2






	If Time = 03 ; If current time ends in a 03 for example 10:03 the script would be triggered.
	{
	run C:\Users\cernerburner\Desktop\interfacenotification.ahk
	sleep, 70000
	}
	
	;;;else if Time = 5 ; If current time ends in a 5 for example 10:15 the script would be triggered.
	;;;{
	;;;run C:\Users\cernerburner\Desktop\master.ahk
	;;;sleep, 70000
	;;;}

	;else if Time = 7 ; If current time ends in a 7 for example 10:17 the script would be triggered.
	;{
	;run C:\Users\kjcostne\Desktop\interfacenotification.ahk
	;sleep, 70000
	;}