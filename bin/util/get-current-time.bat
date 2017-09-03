REM @echo off
rem ---------------------------------------------------------------------------
rem Get current time
rem
rem File Name: get-current-time.bat
rem Author: chaofei
rem E-Mail: chaofeibest@163.com
rem Since: 2016-6-16 23:55:25
rem ---------------------------------------------------------------------------

rem judge sys os language
date /t | findstr "^[0-9]">nul
if %errorlevel% == 0 (
  rem get time of english os
  for /f "tokens=1 delims=/ " %%i in ("%date%") do set "YEAR=%%i"
  for /f "tokens=2 delims=/ " %%i in ("%date%") do set "MONTH=%%i"
  for /f "tokens=3 delims=/ " %%i in ("%date%") do set "DAY=%%i"
) else (
  rem get time of chinese os
  for /f "tokens=2 delims=/ " %%i in ("%date%") do set "YEAR=%%i"
  for /f "tokens=3 delims=/ " %%i in ("%date%") do set "MONTH=%%i"
  for /f "tokens=4 delims=/ " %%i in ("%date%") do set "DAY=%%i"
)
for /f "tokens=1 delims=: " %%i in ("%time%") do set "HOUR=%%i"
for /f "tokens=2 delims=: " %%i in ("%time%") do set "MIN=%%i"
for /f "tokens=3 delims=:. " %%i in ("%time%") do set "SEC=%%i"
set "CURRENT_TIME=%YEAR%-%MONTH%-%DAY% %HOUR%:%MIN%:%SEC%"