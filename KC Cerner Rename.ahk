Loop, C:\Users\kjcostne\Desktop\Cerner Test\Autosaved*.doc,
{
file = %A_LoopFileName%

msgbox, %file%
path = %A_LoopFileFullPath%

WordDoc := ComObjGet(path)
;MsgBox, % WordDoc.Range.Text

myvar := % WordDoc.Range.text

StringGetPos, bensucks, myvar, Unit Num

StringMid, almost, myvar, bensucks, 20
stringmid, chris, almost, 11, 9

MsgBox, %chris%

FileMove, C:\Users\kjcostne\Desktop\Cerner Test\%A_LoopFileName%, C:\Users\kjcostne\Desktop\Cerner Test\%chris%.doc


}