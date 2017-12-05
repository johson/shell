#########################################################################
# File Name: rsync.sh
# Author: johson
# mail: php.johson@gmail.com
# Created Time: 2017/10/10 11:10:45
#########################################################################
#!/bin/bash
while(true)  
do
    rsync -ave ssh /Users/qiaoxin/phpstormProjects/ qiaoxin@101.201.237.201:/home/qiaoxin/projects/ --delete --exclude="va/storage/" --exclude="store/storage/logs/"
done  
