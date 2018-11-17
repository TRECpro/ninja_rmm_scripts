@echo off
REM There are 5 things to change in this script. Search for "FOLDER-FOR-LOG" and input your own folder name for ResourceScan.log to print to. Each time this is ran, it will append to the same log file. Log shows current Date, Time, CPU Utilization, Total Memory, Used Memory and Available Memory.

@echo off

setlocal enabledelayedexpansion

set Times=0

for /f "skip=1" %%p in ('wmic cpu get loadpercentage') do (

set Cpusage!Times!=%%p

set /A Times=!Times! + 1

)


echo CPU Utilitzation = %Cpusage0%%%
Echo.

@echo off

if not exist "C:\FOLDER-FOR-LOG" mkdir C:\FOLDER-FOR-LOG

rem Don't destroy an existing file
if exist "C:\FOLDER-FOR-LOG\ResourceScan.log" goto _nocreate
:: Create the zero-byte file
type nul>C:\FOLDER-FOR-LOG\ResourceScan.log
:_nocreate

set totalMem=
set availableMem=
set usedMem=
REM You need to make a loop
for /f "tokens=4" %%a in ('systeminfo ^| findstr Physical') do if defined totalMem (set availableMem=%%a) else (set totalMem=%%a)
set totalMem=%totalMem:,=%
set availableMem=%availableMem:,=%
set /a usedMem=totalMem-availableMem

set /a totalMemGB=totalMem/1024
set /a usedMemGB=usedMem/1024
set /a availableMemGB=availableMem/1024

Echo Total Memory (MB): %totalMem%MB
Echo Used Memory (MB): %usedMem%MB
Echo Available Memory (MB): %availableMem%MB

(
  echo %date% - %time%
  echo.
  echo CPU Utilitzation: %Cpusage0%%%
  echo.
  Echo Total Memory: %totalMem% MB
  Echo Used Memory: %usedMem% MB
  Echo Available Memory: %availableMem% MB
  Echo -----------------------------------------------------------------------------
) >> "C:\FOLDER-FOR-LOG\ResourceScan.log"
pause