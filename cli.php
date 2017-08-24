<?php
/**
*   Copyright (C) Jiehun.com.cn 2016 All rights reserved.
*
*   FileName      ：cli.php
*   Author        ：qiaoxin
*   Email         ：qiaoxin@jiehun.com.cn
*   Date          ：2016/05/17 13:05:33
*   Version       ：1.0
*   Description   ：
*/
// ask for input
fwrite(STDOUT, "Enter your name: ");

// get input
$name = trim(fgets(STDIN));

// write input back
fwrite(STDOUT, "Hello, $name!");
