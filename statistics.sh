#########################################################################
# File Name: qss.sh
# Author: qiaoxin
# mail: qiaoxin@jiehun.com.cn
# Created Time: 2016/05/23 17:05:44
#########################################################################
#!/bin/bash
#!/bin/sh   
  
#定义源文件和临时文件   
srcfile=word.txt   
tempfile_words=tempfile_words   
tempfile_words_uniq=tempfile_words_uniq   

#取出所有单词，存入临时文件$tempfile_words，一行一个单词   
#去除$tempfile_words中重复单词，并把换行符替换为空格，存入临时文件$tempfile_words_uniq   
tr "[\015]" "[\n]"<$srcfile|sed 's/[^0-9a-zA-Z ]*\([0-9a-zA-Z]*\)[^0-9a-zA-Z]*/\1\n/g'|sed '/^$/d'>$tempfile_words   
sort $tempfile_words|uniq|tr "[\n]" "[ ]">$tempfile_words_uniq   

#遍历所有单词，统计数目   
words=$(cat $tempfile_words_uniq)   
for word in $words   
do   
	word_num=$(grep $word $tempfile_words|wc -l)   
	echo $word $word_num   
done
#也可以用这种方法
#tr -s "\t| " "\n" <word.txt|sort|uniq -c
