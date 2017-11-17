#SingleInstance Force
#NoEnv
SetBatchLines -1
#MaxHotkeysPerInterval 199

nq = 0F.02.10.03.11.12.05.13.06.14.07.15.16.09.17.0A.18.19.0C.1A.0D.1B.0E.2B ; Scan Acodes for TAB+` key rows
nz = 2A.1E.2C.1F.2D.2E.21.2F.22.30.23.31.32.25.33.26.34.35.28.136.1C         ; Scan Acodes for Shift+CapsLock rows

KEYS := ".", MidiDevice := 0
Program1  := 1, Program2  :=  1
Velocity1 := 64, Velocity2 := 127
BaseNote1 := 60, BaseNote2 := 36    ; C4 = 261.63Hz, C2 = 65.41Hz

OnExit CleanUp
OpenCloseMidiAPI()
h_midiout := midiOutOpen(MidiDevice)
midiOutShortMsg(h_midiout, 191, 1, Program1, 0) ; Program Change
midiOutShortMsg(h_midiout, 191, 2, Program2, 0) ; Program Change

Gui Add, Edit, ReadOnly x5 y13 w190 vKEYS
Gui Show,,Midi Keyboard

#IfWinActive Midi Keyboard ahk_class AutoHotkeyGUI
Loop Parse, nq, .                   ; Tab-Q key row
{
   n%A_LoopField% := A_Index - 1    ; note number 0..
   c%A_LoopField% := 1              ; note played in channel 1
   HotKey sc%A_LoopField%, KEY      ; Scan Code hotkey
   HotKey sc%A_LoopField% UP, KEYup ; key-up hotkey
}
Loop Parse, nz, .                   ; Shift-Z key row
{
   n%A_LoopField% := A_Index - 1
   c%A_LoopField% := 2              ; note played in channel 2
   HotKey sc%A_LoopField%, KEY
   HotKey sc%A_LoopField% UP, KEYup
}

Up::
   Program2 += Program2 > 126 ? 0 : 1
   TrayTip,,Program2 = %Program2%
   midiOutShortMsg(h_midiout, 191, 2, Program2, 0) ; Program Change
Return

Down::
   Program2 -= Program2 < 1 ? 0 : 1
   TrayTip,,Program2 = %Program2%
   midiOutShortMsg(h_midiout, 191, 2, Program2, 0) ; Program Change
Return

GuiClose:
!z::ExitApp

CleanUp:
   midiOutClose(h_midiout)
   OpenCloseMidiAPI()
ExitApp


KEY:
   k := SubStr(A_ThisHotKey,3)
   IfInString KEYS, %k%, Return
   IfEqual n%k%,, Return
   channel := c%k%,  KEYS .= k . "."
   midiOutShortMsg(h_midiout, 143, channel, BaseNote%channel% + n%k%, Velocity%channel%) ; NoteOn
   GuiControl,,KEYS, %KEYS%
Return

KEYup:
   k := SubStr(A_ThisHotKey,3,StrLen(A_ThisHotKey)-5)
   channel := c%k%
   StringReplace KEYS, KEYS, .%k%., ., All
   midiOutShortMsg(h_midiout, 127, channel, BaseNote%channel% + n%k%, Velocity%channel%) ; NoteOff
   GuiControl,,KEYS, %KEYS%
Return

OpenCloseMidiAPI() {  ; at the beginning to load, at the end to unload winmm.dll
   Static hModule
   If hModule
      DllCall("FreeLibrary", UInt,hModule), hModule := ""
   If (0 = hModule := DllCall("LoadLibrary",Str,"winmm.dll")) {
      MsgBox Cannot load libray winmm.dll
      ExitApp
   }
}

midiOutOpen(uDeviceID = 0) { ; Open midi port for sending individual midi messages --> handle
   strh_midiout = 0000
   result := DllCall("winmm.dll\midiOutOpen", UInt,&strh_midiout, UInt,uDeviceID, UInt,0, UInt,0, UInt,0, UInt)
   If (result or ErrorLevel) {
      MsgBox There was an error opening the midi port.`nError code %result%`nErrorLevel = %ErrorLevel%
      Return -1
   }
   Return NumGet(&strh_midiout)
}

midiOutShortMsg(h_midiout, Event, Channel, Param1, Param2) {
; Event: NoteOn 143, NoteOff 127, CC 175, PolyAT 159, ChanAT 207, PChange 191, Wheel 223
  result := DllCall("winmm.dll\midiOutShortMsg", UInt,h_midiout, UInt, Event+Channel|(Param1<<8)|(Param2<<16), UInt)
  If (result or ErrorLevel)  {
    MsgBox Error sending the midi event: (%result%`, %ErrorLevel%)
    Return -1
  }
}

midiOutClose(h_midiout) {  ; Close MidiOutput
   Loop {
      result := DllCall("winmm.dll\midiOutClose", UInt,h_midiout)
      If !(result or ErrorLevel)
         Return
      If (A_Index > 3) {
         MsgBox Error [%result%]-[%ErrorLevel%] in closing the midi output port.`nThere may still be midi events being processed.
         Return -1  ; result MIDIERR_STILLPLAYING 65, MMSYSERR_INVALHANDLE 5, MMSYSERR_NOMEM 7
      }
      Sleep 500
   }
}

MidiOutsEnumerate() { ; Returns #midi output devices, creates global array MidiOutPortName with their names
  Local NumPorts, PortID
  VarSetCapacity(MidiOutCaps, 50, 0)
  NumPorts := DllCall("winmm.dll\midiOutGetNumDevs") ; #midi output devices on system, first device ID = 0

  Loop %NumPorts% {
    PortID := A_Index -1
    result := DllCall("winmm.dll\midiOutGetDevCapsA", UInt,uDeviceID, UInt,&MidiOutCaps, UInt,50, UInt)
    If (result OR ErrorLevel) {
      MsgBox Error %result% (EL = %ErrorLevel%) in retrieving the name of midi output %uDeviceID%
      Return -1
    }
    VarSetCapacity(PortName, 32)                                         ; PortNameSize 32
    DllCall("RtlMoveMemory", Str,PortName, Uint,&MidiOutCaps+8, Uint,32) ; PortNameOffset 8, PortNameSize 32
    MidiOutPortName%PortID% := PortName
  }
  Return NumPorts
}
/* MidiStatus byte: http://www.harmony-central.com/MIDI/Doc/table1.html
MIDIOUTCAPS struct
  WORD      wMid;
  WORD      wPid;
  MMVERSION vDriverVersion;
  CHAR      szPname[MAXPNAMELEN];
  WORD      wTechnology;
  WORD      wVoices;
  WORD      wNotes;
  WORD      wChannelMask;
  DWORD     dwSupport;
*/