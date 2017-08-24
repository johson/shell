#########################################################################
# File Name: code.sh
# Author: qiaoxin
# mail: qiaoxin@jiehun.com.cn
# Created Time: 2016/07/18 15:07:05
#########################################################################
#!/bin/bash
if [ $# != 1 ]
then
    sed -i -e '99s|^|//|' /home/qiaoxin/jiehun/user/page-gl/accounts/ActionController.php
elif [ $1 == 'bj' ]
then
    sed -i -e '97s|^|//|' /home/qiaoxin/jiehun/user/page/accounts/ActionController.php
fi
