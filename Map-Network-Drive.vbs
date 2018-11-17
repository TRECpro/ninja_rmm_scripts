'The Only thing you need to change is the line with "call mapdrive" (Example= call mapdrive("Z:","\\SERVERNAME-OR-IP\FOLDER-PATH","GIVE-IT-A-NAME"). Also, you must have entered your credentials in Windows Credential Manager
 
On Error Resume Next 
 
dim objNetwork, strDrive, objShell, objUNC 
dim strRemotePath, strDriveLetter, strNewName 
set wshNetwork = createObject("Wscript.Network") 
strUsername = wshNetwork.UserName 
 
 
call mapdrive("M:","\\My-Server\Shared Folder","My Shared Folder")

function mapdrive(strDriveLetter,strRemotePath,strNewName) 
    'Map the network drive 
    set objNetwork = createObject("WScript.Network")  
    objNetwork.MapNetworkDrive strDriveLetter, strRemotePath, TRUE 
     
    'Rename the Mapped Drive 
    set objShell = createObject("Shell.Application") 
    objShell.NameSpace(strDriveLetter).Self.name = strNewName 
     
end function 