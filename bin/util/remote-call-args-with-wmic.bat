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

:remote_call_args_with_wmic
  set "EXEC_FILE=%1"
  if not defined EXEC_FILE (
      goto print_usage
  )
  set "EXEC_FILE=%EXEC_FILE:"=%"
  for %%i in (%ALL_IPS_USERS_PWDS%) do (
    @rem get ip
    for /f "tokens=1 delims=: " %%j in ("%%i") do (
    @rem get user
      for /f "tokens=2 delims=: " %%k in ("%%i") do (
      @rem get pwd
        for /f "tokens=3 delims=: " %%m in ("%%i") do (
          title Remote call args "%EXEC_FILE%" with wmic on %%j
        set /p=Remote call args "%EXEC_FILE%" with wmic on %%j -- <nul
        C:\Windows\System32\wbem\WMIC.exe /node:%%j /user:%%k /password:%%m process call create "%EXEC_FILE%" && (@echo  >OK & C:\Windows\System32\findstr.exe /a:A . OK*&del OK) || (@echo  >ERROR & C:\Windows\System32\findstr.exe /a:C . ERROR*&del ERROR)
      )
      )
    )
  )
:eof

:local_call_args
  set "EXEC_FILE=%1"
  if not defined EXEC_FILE (
      goto print_usage
  )
  set "EXEC_FILE=%EXEC_FILE:"=%"
  for %%i in (%ALL_IPS_USERS_PWDS%) do (
    @rem get ip
    for /f "tokens=1 delims=: " %%j in ("%%i") do (
      for /f "tokens=14" %%n in ('C:\Windows\System32\ipconfig.exe ^| C:\Windows\System32\find.exe /i "ipv4"') do (
        if %%j == %%n (
          title Local call args "%EXEC_FILE%" on %%j
          set /p=Local call args "%EXEC_FILE%" on %% -- <nul
          call "%EXEC_FILE%" && (@echo  >OK & C:\Windows\System32\findstr.exe /a:A . OK*&del OK) || (@echo  >ERROR & C:\Windows\System32\findstr.exe /a:C . ERROR*&del ERROR)
        )
      )
    )
  )
:eof

:print_usage
  if ""%1"" == """" (
    @echo %SPLIT_LINE%
    @echo %WORD_SEGMENTATION% Usage: %0 exec file                %WORD_SEGMENTATION%
    @echo %INTERVAL_SEGMENTATION%
    @echo %WORD_SEGMENTATION% Example: %0 "d:\tmp\test.bat"      %WORD_SEGMENTATION%
    @echo %SPLIT_LINE%
  )
  
endlocal
