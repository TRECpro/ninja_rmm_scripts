Option Explicit

Const timeout   = 120 'seconds
Const sleeptime = 600  'seconds
Const timeUp    = -1

Dim sh, rebootChoice, wmi, os, endtime

Set sh = CreateObject("WScript.Shell")

Do While True
  rebootChoice = sh.Popup("A system update requires a reboot. Please ensure all programs and documents are saved and click Yes to reboot now. "  & vbNewLine & vbNewLine & _
                          "Choose No to be asked again in 10 minutes." & vbNewLine & vbNewLine & vbNewLine & "Thank You," & vbNewLine & "Your Favorite Techs" & vbNewLine & "The Best Tech Company", timeout, _
                          "NOTICE - REBOOT REQUIRED", _
                          vbYesNo + vbExclamation + vbDefaultButton2)

  Select Case rebootChoice
    Case vbYes
      Set wmi = GetObject("winmgmts:" & _
                          "{impersonationLevel=impersonate,(Shutdown)}!" & _
                          "\\.\root\cimv2")
      For Each os In wmi.ExecQuery("SELECT * FROM Win32_OperatingSystem")
        os.Reboot 1
      Next
    Case vbNo, timeUp
      endtime = DateAdd("s", sleeptime, Now)
      Do Until Now >= endtime
        WScript.Sleep 500
      Loop
  End Select
Loop