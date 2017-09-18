@echo off
set /p="This is -- "<nul
echo  >ERROR & C:\Windows\System32\findstr.exe /a:C . ERROR*&del ERROR
set /p="This is -- "<nul
echo  >OK & C:\Windows\System32\findstr.exe /a:A . OK*&del OK