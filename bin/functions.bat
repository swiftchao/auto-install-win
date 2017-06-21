@echo off
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
if not exist "%AUTO_INSTALL_HOME%\conf\config.bat" got noConfig
set "CONFIG=%AUTO_INSTALL_HOME%\conf\config.bat"
call %CONFIG%
echo %SOFT_NAME%
:noConfig
cd "%CURRENT_DIR%"
