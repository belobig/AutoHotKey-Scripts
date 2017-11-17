:*:++::
loop
{ 
   FileReadLine, line, C:\Users\cgillett\Desktop\Insurance ADD\ADD.csv, %A_Index%
    if ErrorLevel
                break
                StringSplit, array, line, `,, %A_space% 
   loop, %array0% 
                tmp := array%a_index% 

PlanName = %array1%
Comments = %array2%
LogicalDomainID = %array3%
InsuranceCompanyName = %array4%
HealthPlanType = %array5%
FinancialClass = %array6%
AddressType = %array7%
StreetAddress1 = %array8%
StreetAddress2 = %array9%
StreetAddress3 = %array10%
StreetAddress4 = %array11%
City = %array12%
State = %array13%
ZIP = %array14%
Country = %array15%
ContactName = %array16%
PhoneType = %array17%
PhoneNumber = %array18%
ContactName2 = %array19%
HealthPlanIdentifierType = %array20%
HealthPlanAlias = %array21%

                                Send %PlanName%{tab}
                                Send %FinancialClass%{tab}
                                Send %HealthPlanType%{tab}
                                send %InsuranceCompanyName%{tab}{enter}
                                sleep, 2000
                                send {ShiftDown}{tab}{ShiftUp}%AddressType%{tab}
                                send %StreetAddress1%{tab}
                                send %StreetAddress2%{tab}
                                send %StreetAddress3%{tab}
                                send %StreetAddress4%{tab}
                                send %City%{tab}
                                send %State%{tab}
                                Send %ZIP%{tab 2}
                                Send %Country%{tab}
                                Send %ContactName%{AltDown}o{AltUp}
                                sleep, 5000
                                send {AltDown}n{AltUp}
                                sleep, 2000
                                send {ShiftDown}{tab 1}{ShiftUp}
                                ;send %PhoneType%{tab}
                                send {down 2}{tab}
                                send %PhoneNumber%{tab 2}
                                send %ContactName2%
                                sleep, 1000
                                                                loop
                                        {
                                        ImageSearch, FoundX, FoundY, -8, -8, 1696, 1026,  C:\Users\cgillett\Desktop\Insurance ADD\Ok.png
                                        If ErrorLevel = 0
                                        break
                                        }
                                Click %FoundX%, %FoundY%, left, 1
                                sleep, 2000
                                send {AltDown}n{AltUp}
                                sleep, 2000
                                send {AltDown}n{AltUp}
                                sleep, 2000
                                send Health Plan Alias{tab}
                                send %HealthPlanIdentifierType%{tab}
                                send %HealthPlanAlias%


}
msgbox, Done!
return
