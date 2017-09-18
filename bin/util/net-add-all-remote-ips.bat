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

:net_add_all_remote_ips
  for %%i in (%ALL_IPS_USERS_PWDS%) do (
    @rem get ip
    for /f "tokens=1 delims=: " %%j in ("%%i") do (
    @rem get user
      for /f "tokens=2 delims=: " %%k in ("%%i") do (
      @rem get pwd
        for /f "tokens=3 delims=: " %%m in ("%%i") do (
          title Net add all remote ips of %%j
          set /p=Net add all remote ips of %%j -- <nul
		  @rem add \\192.168.0.1\IPC$ to avoid input password
		  @rem net use \\192.168.0.1 #AutoInstall! /user:China\Administrator
          C:\Windows\System32\net.exe use \\%%j %%m /user:%%k && (@echo  >OK & C:\Windows\System32\findstr.exe /a:A . OK*&del OK) || (@echo  >ERROR & C:\Windows\System32\findstr.exe /a:C . ERROR*&del ERROR)
        )
      )
    )
  )
:eof

endlocal
