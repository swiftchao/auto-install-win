@echo off
set /p="This is -- "<nul
echo  >ERROR & findstr /a:C . ERROR*&del ERROR
set /p="This is -- "<nul
echo  >OK & findstr /a:A . OK*&del OK