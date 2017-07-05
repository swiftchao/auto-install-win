REM @echo off
rem ---------------------------------------------------------------------------
rem Delete args file
rem
rem File Name: froce-delete-args-file.bat
rem Author: chaofei
rem E-Mail: chaofeibest@163.com
rem Since: 2016-6-16 1:37:25
rem ---------------------------------------------------------------------------

setlocal
set "CURRENT_DIR=%cd%"
if "%AUTO_INSTALL_HOME%" == "" set "AUTO_INSTALL_HOME=%CURRENT_DIR:\bin=%"
if not exist "%AUTO_INSTALL_HOME%\conf\config.bat" goto noConfig
set "CONFIG=%AUTO_INSTALL_HOME%\conf\config.bat"
call %CONFIG%

:killArgsProcessByFile
if ""%1""=="""" goto killArgsProcessByFileEnd
for /f "eol=; tokens=2 delims= " %%i in ('tasklist /v ^|find /i %1') do (
  echo %%i
  taskkill /PID %%i /T
)
goto :eof
:killArgsProcessByFileEnd

:forceDeleteArgsFile
:forceDeleteArgsFileStart
if ""%1""=="""" goto forceDeleteArgsFileEnd
title Force Delete %1
if exist %1 (
  title Force Delete %1...
  rd /s /q %1
  if exist %1 (
    ping -n 5 127.0.0.1 >nul
    goto forceDeleteArgsFileStart
  ) else (
    goto :eof
  )
)


:noConfig
cd "%CURRENT_DIR%"
