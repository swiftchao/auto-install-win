route ADD -p 192.168.100.0 mask 255.255.255.0 172.24.12.1
route ADD -p 172.16.62.0 mask 255.255.255.0 172.24.12.1
route ADD -p 10.121.0.0 mask 255.255.0.0 172.24.12.1
route ADD -p 10.127.0.0 mask 255.255.0.0 172.24.12.1
route ADD -p 10.126.0.0 mask 255.255.0.0 172.24.12.1
route ADD -p 10.128.0.0 mask 255.255.0.0 172.24.12.1
route ADD -p 10.171.0.0 mask 255.255.0.0 172.24.12.1
route ADD -p 10.16.0.0 mask 255.255.0.0 172.24.12.1
route ADD -p 10.7.0.0 mask 255.255.0.0 172.24.12.1
route ADD -p 10.132.0.0 mask 255.255.0.0 172.24.12.1
route print | findstr  "172.24.12.1"