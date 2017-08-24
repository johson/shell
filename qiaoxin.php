<?php
    /**
     *   Copyright (C) Jiehun.com.cn 2015 All rights reserved.
     *
     *   FileName      ：qiaoxin.php
     *   Author        ：qiaoxin
     *   Email         ：qiaoxin@jiehun.com.cn
     *   Date          ：2015/12/03 18:12:25
     *   Version       ：1.0
     *   Description   ：
     */
    for ($i = 0; $i <= 50; $i++) {
        printf(" %s  [%-50s]%d%%\r", "-\\|/"[$i%4], str_repeat('#', $i), $i * 2);
        usleep(100000);
    }
    echo "\n";