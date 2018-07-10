<?php
/**
* Copyright (C) jiehun.com.cn 2018 All rights reserved.
*
* @author     ：Johson(php.johson@gmail.com)
* @date       ：2018/05/28 23:05:17
* @version    ：1.0
* @brief      ：
*/
function eatDuck(array $arr)
{
    $count = count($arr);
    if (count(array_unique($arr)) != $count) {
        return false;//对子
    }
    if (max($arr) - min($arr) != $count - 1) {
        return false;
    }
    return true;
}
var_dump(eatDuck([1, 3, 5, 2, 4]));
var_dump(eatDuck([10, 13, 11, 12, 14]));
var_dump(eatDuck([1, 3, 5, 7, 9]));
