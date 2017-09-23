@echo off
@rem Licensed to the Apache Software Foundation (ASF) under one or more
@rem contributor license agreements.  See the NOTICE file distributed with
@rem this work for additional information regarding copyright ownership.
@rem The ASF licenses this file to You under the Apache License, Version 2.0
@rem (the "License"); you may not use this file except in compliance with
@rem the License.  You may obtain a copy of the License at
@rem
@rem     http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.

@rem Author: chaofei
@rem E-Mail: chaofeibest@163.com

setlocal

@rem The root of the auto install installation
set AUTO_INSTALL_HOME=%~dp0
@rem Delete the end of the directory
for %%i in (%AUTO_INSTALL_HOME%.) do (
  set AUTO_INSTALL_HOME=%%~dpi
)
for %%i in (%AUTO_INSTALL_HOME%.) do (
  set AUTO_INSTALL_HOME=%%~dpi
)
@rem Delete the end of the "\"
if "%AUTO_INSTALL_HOME:~-1%" == "\" (
  set AUTO_INSTALL_HOME=%AUTO_INSTALL_HOME:~0,-1%
)

if exist %AUTO_INSTALL_HOME%\conf\config.bat (
  call %AUTO_INSTALL_HOME%\conf\config.bat
) else (
  @echo Auto install config.bat not found.
)

set CMD_LINE_ARGS=%1
if ""%1""=="""" goto doneStart
shift
:getArgs
if ""%1""=="""" goto doneStart
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto getArgs
:doneStart

:kill_args_process_by_ports
  for %%i in (%CMD_LINE_ARGS%) do (
    call :kill_args_process_by_port %%i
  )
:eof

:kill_args_process_by_port
  set "PORT_TO_BE_KILLED=%1"
  if not defined PORT_TO_BE_KILLED (
      goto print_usage
  )
  set "PORT_TO_BE_KILLED=%PORT_TO_BE_KILLED:"=%"
  for /f "tokens=5" %%i in ('C:\Windows\System32\NETSTAT.EXE -ano ^| C:\Windows\System32\find ":%PORT_TO_BE_KILLED%" ') do (
    title Kill args process by port %PORT_TO_BE_KILLED% of pid %%i
    set /p=Kill args process by port %PORT_TO_BE_KILLED% of pid %%i -- <nul
    C:\Windows\System32\taskkill.exe /pid %%i /t >nul && (@echo  >OK & C:\Windows\System32\findstr.exe /a:A . OK*&del OK) || (@echo  >ERROR & C:\Windows\System32\findstr.exe /a:C . ERROR*&del ERROR)
  )
:eof

:print_usage
    if not defined CMD_LINE_ARGS (
      @echo %SPLIT_LINE%
      @echo %WORD_SEGMENTATION% Usage: %0 port of process           %WORD_SEGMENTATION%
      @echo %INTERVAL_SEGMENTATION%
      @echo %WORD_SEGMENTATION% Example: %0 8005                    %WORD_SEGMENTATION%
      @echo %SPLIT_LINE%
  )
:eof

endlocal