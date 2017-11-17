^d:: ;Ctrl+d to initiate
Loop
{
    ImageSearch, FoundX, FoundY, 1650, 109, 1750, 140, C:\Users\kjcostne\Documents\AutoHotkey\Kelly\iCentra\DischargeOrdersPhasedtoInitiated\NextArrow.png
    if ErrorLevel = 2
        MsgBox Could not conduct the search.
    else if ErrorLevel = 1
        MsgBox Icon could not be found on the screen.
    else
        Click %FoundX%, %FoundY%
    sleep 1000
        
    IfWinExist, Assign a Relationship
        SendInput {Down}
        sleep 500
        SendInput {Enter}
        
    sleep 1700
    ImageSearch, Found2X, Found2Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\kjcostne\Documents\AutoHotkey\Kelly\iCentra\DischargeOrdersPhasedtoInitiated\DisOrdersPlanned.png

    if ErrorLevel = 2
        MsgBox Could not conduct the search.
    else if ErrorLevel = 1
        MsgBox "Dishcarge Orders Phased" could not be found. Please create one.
    else
        phase1x := (Found2X + 20)
        phase1y := (Found2Y + 25)
        Click %phase1x%, %phase1y% right
        sleep 500
        SendInput {Down}
        sleep 500
        SendInput {Enter}
        
    sleep 1500

    ImageSearch, Found3X, Found3Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\kjcostne\Documents\AutoHotkey\Kelly\iCentra\DischargeOrdersPhasedtoInitiated\OrdersForSign.png

    if ErrorLevel = 2
        MsgBox Could not conduct the search.
    else if ErrorLevel = 1
        MsgBox Orders for Signature button could not be found.
    else
        Click %Found3X%, %Found3Y%

    sleep 1500

    ImageSearch, Found4X, Found4Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\kjcostne\Documents\AutoHotkey\Kelly\iCentra\DischargeOrdersPhasedtoInitiated\Sign.png

    if ErrorLevel = 2
        MsgBox Could not conduct the search.
    else if ErrorLevel = 1
        MsgBox Sign button could not be found.
    else
        Click %Found4X%, %Found4Y%

    sleep 1000

    IfWinExist Order Services
        SendInput {Enter}
        sleep 1500
        SendInput {Down}
        sleep 500
        SendInput {Enter}
        sleep 500
        Click %Found4X%, %Found4Y%
    IfWinNotExist Order Services
        Click %Found4X%, %Found4Y%
    
    sleep 1700
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
