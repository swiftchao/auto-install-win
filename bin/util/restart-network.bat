@echo OFF

@rem 声明采用UTF-8编码 解决输出中文乱码问题
chcp 65001

rem 禁用网卡
netsh interface set interface "以太网"disabled
rem 启用网卡
netsh interface set interface "以太网" enabled

pause