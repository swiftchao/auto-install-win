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

:force_delete_args_file
  set "FILE_TO_BE_DELETED=%1"
  if not defined FILE_TO_BE_DELETED (
      goto print_usage
  )
  set "FILE_TO_BE_DELETED=%FILE_TO_BE_DELETED:"=%"
  if exist "%FILE_TO_BE_DELETED%" (
    set /p=Force Delete "%FILE_TO_BE_DELETED%" -- <nul
	(
	  (dir /ad "%FILE_TO_BE_DELETED%" >nul 2>nul) && (rd /s /q "%FILE_TO_BE_DELETED%") || (del "%FILE_TO_BE_DELETED%")
	) && (@echo  >OK & findstr /a:A . OK*&del OK) || (@echo  >ERROR & findstr /a:C . ERROR*&del ERROR)
	if exist "%FILE_TO_BE_DELETED%" (
	  goto force_delete_args_file
	)
	goto :eof
  )
:eof

:print_usage
  if ""%1"" == """" (
    @echo %SPLIT_LINE%
	@echo %WORD_SEGMENTATION% Usage: %0 dir or file                  %WORD_SEGMENTATION%
	@echo %INTERVAL_SEGMENTATION%
    @echo %WORD_SEGMENTATION% Example1: %0 "d:\$RECYCLE.BIN"         %WORD_SEGMENTATION%
    @echo %WORD_SEGMENTATION% Example2: %0 "d:\$RECYCLE.BIN\tmp.txt" %WORD_SEGMENTATION%
	@echo %SPLIT_LINE%
  )
  
endlocal
