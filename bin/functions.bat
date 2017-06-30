REM @echo off
rem ---------------------------------------------------------------------------
rem Auto Install/Uninstall functions.bat
rem
rem File Name: functions.bat
rem Author: chaofei
rem E-Mail: chaofeibest@163.com
rem Created Time: 2016-6-16 1:37:25
rem ---------------------------------------------------------------------------

setlocal
set "CURRENT_DIR=%cd%"
if "%AUTO_INSTALL_HOME%" == "" set "AUTO_INSTALL_HOME=%CURRENT_DIR:\bin=%"
if not exist "%AUTO_INSTALL_HOME%\conf\config.bat" goto noConfig
set "CONFIG=%AUTO_INSTALL_HOME%\conf\config.bat"
call %CONFIG%
echo %SOFT_NAME%

echo [%1]
call :forceDeleteArgsFile %1

:forceDeleteArgsFile
:forceDeleteArgsFileStart
if "%1" == "" goto :eof
if exist “%1” (
  title Force Delete %1...
  rd /s /q %1
  if exist %1 (
    goto forceDeleteArgsFileStart
  ) else (
    goto :eof
  )
)

:noConfig
cd "%CURRENT_DIR%"
