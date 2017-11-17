file = C:\Users\cgillett\Desktop\Cerner Test\Coding Summary br.docx
 
WordDoc := ComObjGet(file)
 
myvar := % WordDoc.Range.text
 
 
msgbox, %myvar%    ;this is the word document listed above converted into a variable. Remove first semicolon and run script to see.
 
 
StringGetPos, bensucks, myvar, Unit Num,
 
StringMid, almost , myvar, bensucks, 20,  
stringmid, chris, almost, 11, 9
 
MsgBox, %chris%    ;this is our account number we are needing. This should work on all of these documents with how it is being pulled. Remove first semicolon and run script to see.
FileMove, C:\Users\cgillett\Desktop\Cerner Test\Coding Summary br.docx, C:\Users\cgillett\Desktop\Cerner Test\%chris%.docx
