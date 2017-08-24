#########################################################################
# File Name: qiaoxin.sh
# Author: qiaoxin
# mail: qiaoxin@jiehun.com.cn
# Created Time: 2016/04/14 15:04:08
#########################################################################
#!/bin/bash

x=''
for ((i=0;$i<=100;i+=2))
do
    printf "正在登录:[%-50s]%d%%\r" $x $i
	sleep 0.01
	x=#$x
done
