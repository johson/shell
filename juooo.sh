#########################################################################
# File Name: juooo.sh
# Author: johson
# mail: php.johson@gmail.com
# Created Time: 2017/12/05 11:12:26
#########################################################################
#!/bin/bash

URL="http://va.johson.cn/v5/juooo/jdata?page="
NUM=1
check() {
    RESULT=$(curl -s ${URL}${NUM})
    echo ${URL}${NUM}

    let NUM+=1;
    if [ "$RESULT" -eq "1" ] ; then
        echo "again"
        sleep 1
        check
    elif [ "$RESULT" -eq "0" ] ; then
        echo "exit"
        exit 0
    else
        echo "error"
    fi
}

check
