#!/bin/bash

# name,idcard,mobile # 数据源

log_file='result.log'
param_file=$1

log_cmd="tee -a $log_file"
i=1
for line in `cat $param_file`;
do
	echo "read line" $i ":" $line | tee -a $log_file
	let "i=$i+1"
	arr=(${line//,/ })

	curl_cmd="curl -d 'name=${arr[0]}&idcard=${arr[1]}&mobile=${arr[2]}' https://xd-t-api.vipiao.com/activate/addsceneworker"
	echo `date "+%Y-%m-%d %H:%M:%S"` "start ===>> " $curl_cmd | tee -a $log_file
	#eval "$curl_cmd 2>&1" | tee -a $log_file
	echo `date "+%Y-%m-%d %H:%M:%S"` "end <<===" $curl_cmd | tee -a $log_file
done

echo `date "+%Y-%m-%d %H:%M:%S"` "over: end of shell" | tee -a $log_file
