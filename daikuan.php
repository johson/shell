<?php
/**
* Copyright (C) jiehun.com.cn 2018 All rights reserved.
*
* @author     ：Johson(php.johson@gmail.com)
* @date       ：2018/08/27 18:08:34
* @version    ：1.0
* @brief      ：
*/
debx();

function debx()
{
	$dkm   = 120; //贷款月数，20年就是240个月
	$dkTotal = 730000; //贷款总额
	$dknl  = 0.0588; //贷款年利率
	$emTotal = $dkTotal * $dknl / 12 * pow(1 + $dknl / 12, $dkm) / (pow(1 + $dknl / 12, $dkm) - 1); //每月还款金额
	$lxTotal = 0; //总利息
	for ($i = 0; $i < $dkm; $i++) {
		$lx   = $dkTotal * $dknl / 12;  //每月还款利息
		$em   = $emTotal - $lx; //每月还款本金
		echo "第" . ($i + 1) . "期", " 本金:", $em, " 利息:" . $lx, " 总额:" . $emTotal, PHP_EOL;
		$dkTotal = $dkTotal - $em;
		$lxTotal = $lxTotal + $lx;
	}
	echo "总利息:" . $lxTotal;
}


function debj()
{
	$dkm   = 120; //贷款月数，20年就是240个月
	$dkTotal = 730000; //贷款总额
	$dknl  = 0.0588; //贷款年利率

	$em   = $dkTotal / $dkm; //每个月还款本金
	$lxTotal = 0; //总利息
	for ($i = 0; $i < $dkm; $i++) {
		$lx   = $dkTotal * $dknl / 12; //每月还款利息
		echo "第" . ($i + 1) . "期", " 本金:", $em, " 利息:" . $lx, " 总额:" . ($em + $lx), PHP_EOL;
		$dkTotal -= $em;
		$lxTotal = $lxTotal + $lx;
	}
	echo "总利息:" . $lxTotal;
}


debj();
exit;
