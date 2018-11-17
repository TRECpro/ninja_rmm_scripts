@echo off
REM There are 5 things to change in this script. Search for "FOLDER-FOR-LOG" and input your own folder name for DiskFreeSpaceScan.log to print to. Each time this is ran, it will append to the same log file. Log shows current Date, Time, CPU Utilization, Total Memory, Used Memory and Available Memory.

@echo off

if not exist "C:\FOLDER-FOR-LOG" mkdir C:\FOLDER-FOR-LOG

rem Don't destroy an existing file
if exist "C:\FOLDER-FOR-LOG\DiskFreeSpaceScan.log" goto _nocreate
:: Create the zero-byte file
type nul>C:\FOLDER-FOR-LOG\DiskFreeSpaceScan.log
:_nocreate

SetLocal
For /f "UseBackQ Tokens=1-2 Delims==" %%A In (`WMIc LogicalDisk Where^
 "DeviceID = '%CD:~,2%'" Get FreeSpace^, Size /Value`) Do If "%%B" NEq "" (
   Call Set _%%A=%%B)
Rem Set/a _FreePercent=%_FreeSpace:~,-3% / %_Size:~,-5%
Set/a _FreePercent=%_FreeSpace:~,-6% / %_Size:~,-8%
If %_FreeSpace:~,-6% lss 214748 (Set/a _FreeSpace=%_FreeSpace:~,-6%*9313/10000
   ) Else (Set/a _FreeSpace=%_FreeSpace:~,-6%/1074*1000)

(
  echo %date% - %time%
  echo.
  Echo(HD Drive %CD:~,2% %_FreeSpace:~,-3% GB Of Free Space = %_FreePercent%%%^
 available
  Echo -----------------------------------------------------------------------------
) >> "C:\FOLDER-FOR-LOG\DiskFreeSpaceScan.log"