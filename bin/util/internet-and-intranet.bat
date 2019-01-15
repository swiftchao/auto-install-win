@echo off

route print 

pause

@echo off

echo "Please check your physical network and wireless network are ok now ."
echo "Restart compute,please type 1."
echo "Plug and unplug the physical cable ,please type 2."
echo "Thanks"

choice /c 12 /m:

if errorlevel 2 (
	route delete 0.0.0.0 mask 0.0.0.0 10.32.152.254
	echo "           "
	echo "           "
	echo "finished!!!"
	echo "           "
	echo "           "
	
)
if errorlevel 1 ( 
	route delete 0.0.0.0 mask 0.0.0.0 10.32.152.254
	echo "finished!!!"
	route add 10.0.0.0 mask 255.0.0.0 10.32.152.254
	echo "           "           
	echo "           " 
	echo "finished!!!"
	echo "           " 
	echo "           " 
)

cmd.exe