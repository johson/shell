<?php
/**
* Copyright (C) jiehun.com.cn 2018 All rights reserved.
*
* @author     ：Johson(php.johson@gmail.com)
* @date       ：2018/05/29 00:05:47
* @version    ：1.0
* @brief      ：
*/
function lcs($str1, $str2)
{
    // 存储生成的二维矩阵
    $dp = array();
    // 最大子串长度
    $max = 0;

    for ($i = 0; $i < strlen($str1); $i++) {
        for ($j = 0; $j < strlen($str2); $j++) {
            if ($str1[$i] == $str2[$j]) {
                $dp[$i][$j] = isset($dp[$i-1][$j-1]) ? $dp[$i-1][$j-1] + 1 : 1;
            } else {
                $dp[$i-1][$j] = isset($dp[$i-1][$j]) ? $dp[$i-1][$j] : 0;
                $dp[$i][$j-1] = isset($dp[$i][$j-1]) ? $dp[$i][$j-1] : 0;

                $dp[$i][$j] = $dp[$i-1][$j] > $dp[$i][$j-1] ? $dp[$i-1][$j] : $dp[$i][$j-1];
            }

            $max = $dp[$i][$j] > $max ? $dp[$i][$j] : $max;
        }
    }

    for ($i = 0; $i < strlen($str1); $i++) {
        for ($j = 0; $j < strlen($str2); $j++) {
            echo $dp[$i][$j] . " ";
        }
        echo "<br />";
    }

    var_dump($max);
}

lcs("abcbdabeeef", "bdcabaef");
