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
::echo [-] Loading: Text styles...
set "reset=!ESC![0m"
set "bold=!ESC![1m"
set "underline=!ESC![4m"
:::::::::::::::::::::::::::::::::::::::::::::::: END OF SECTION

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
ping localhost -n 3 > nul
cd "Plugins"
cls


set "_dataPATH="

if "!_locaMode!" == "true" (
    set "_dataPATH=%cd%\"
) else (
    set "_dataPATH=P:\Composite\All Students\"
)

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

if "%_canPass%" == "false" (
    echo   !red_black!^| UNWHITELISTED USER : ACCESS DENIED ^|!reset!
    pause > nul
    exit
) else (
    echo   !green_black!^| WHITELISTED USER : ACCESS GRANTED ^|!reset!
)
echo.
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
) else ( goto continue_2 )

:continue_2
echo.
ping localhost -n 2 > nul
if "%_canPass2%" == "true" (
    echo   !green_black!^| CORRECT PASSWORD - LOADING ^|!reset!
    %PRINT%^ ^ 
    echo [ PRESS ANY KEY ]
    pause > nul
    exit
) else (
    echo   !red_black!^| INVALID PASSWORD - EXITING ^|!reset!
    timeout /t 3 > nul
    exit
)

::set /p authInput_1=""

::%PRINT%{171;5;27}TEST Red
pause > nul
