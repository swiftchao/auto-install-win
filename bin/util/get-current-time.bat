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

@rem judge sys os language
date /t | C:\Windows\System32\findstr.exe "^[0-9]">nul
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