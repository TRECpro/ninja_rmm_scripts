# Simple .bat script that invokes a lock of the current workstation for security purposes like user termination
# Set to run as SYSTEM on an on-demand basis

rundll32.exe user32.dll, LockWorkStation
