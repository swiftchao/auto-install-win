@echo OFF

@rem 声明采用UTF-8编码 解决输出中文乱码问题
chcp 65001

:LOOP
 
	set index=%1
 
	if %index%! == ! goto END
 
	echo 	File name :	%index%	MD5	SHA1	SHA256
	echo.
	certutil -hashfile "%index%" MD5
	echo.
	certutil -hashfile "%index%" SHA1
	echo.
	certutil -hashfile "%index%" SHA256
	echo.
	echo.
 
	shift
 
	goto LOOP
 
:END
 
echo "Checksum ends."
echo "方式一：打开文件夹，在地址栏输入 shell:sendto 打开了发送到目录，将hashfile.bat文件复制到此目录。"
echo "  经过上面两步，就可以实现选中一个或多个文件，右键单击，选择发送到(N)再选择hashfile.bat，就会自动计算校验和"
echo "方式二: 起一个命令行 cmd 执行 hashfile.bat 文件1 文件2 ..."
 
pause