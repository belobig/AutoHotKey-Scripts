file = C:\Users\kjcostne\Desktop\Cerner Test\Test.doc

WordDoc := ComObjGet(file)

MsgBox, % WordDoc.Range.Text
