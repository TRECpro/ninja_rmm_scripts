@echo off
REM Change the last word (WORKGROUP) to whatever name you would like to name the Windows workgroup to be.

Wmic computersystem where name="%computername%" call joindomainorworkgroup name=WORKGROUP