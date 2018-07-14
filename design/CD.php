<?php
/**
* Copyright (C) jiehun.com.cn 2018 All rights reserved.
*
* @author     ：Johson(php.johson@gmail.com)
* @date       ：2018/07/14 16:07:28
* @version    ：1.0
* @brief      ：
*/
class CD
{
    public $list;

    public function __construct()
    {
        $this->list = [];
    }

    public function addList($stack)
    {
        $this->list[] = $stack;
    }

    public function getList()
    {
        $out = '';
        foreach ($this->list as $k => $l) {
            $out .= ( $k + 1 ) . ' => ' . $l;
        }
        return $out;
    }
}

class CDCaps
{
    private $list;

    public function __construct(CD $cd)
    {
        $this->list = $cd; 
    }

    public function makeCaps()
    {
        foreach ($this->list->list as &$l) {
            $l = strtoupper($l);
        }
    }
}
$cd = new CD();
$cd->addList('abcd');
$cd->addList('efgh');
$cd->addList('ijkl');

$a = new CDCaps($cd);
$a->makeCaps();

echo $cd->getList();
