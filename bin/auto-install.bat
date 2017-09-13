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

@rem the root of the Auto install installation
set AUTO_INSTALL_HOME=%~dp0
for %%i in (%AUTO_INSTALL_HOME%.) do (
  set AUTO_INSTALL_HOME=%%~dpi
)
if "%AUTO_INSTALL_HOME:~-1%" == "\" (
  set AUTO_INSTALL_HOME=%AUTO_INSTALL_HOME:~0,-1%
)

if not defined AUTO_INSTALL_BIN_PATH ( 
  set AUTO_INSTALL_BIN_PATH=%~dp0
)

if "%AUTO_INSTALL_BIN_PATH:~-1%" == "\" (
  set AUTO_INSTALL_BIN_PATH=%AUTO_INSTALL_BIN_PATH:~0,-1%
)

set DEFAULT_CONF_DIR=%AUTO_INSTALL_BIN_PATH%\..\conf
if not defined DEFAULT_CONF_DIR (
  set AUTO_INSTALL_CONF_DIR=%DEFAULT_CONF_DIR%
)

if exist %AUTO_INSTALL_CONF_DIR%\config.bat (
  call %AUTO_INSTALL_CONF_DIR%\config.bat
) else if exist %AUTO_INSTALL_HOME%\conf\config.bat (
  call %AUTO_INSTALL_HOME%\conf\config.bat
) else (
  echo Auto install config.bat not found.
)

echo [%SOFT_NAME%]
:eof
