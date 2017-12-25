<?php
function sum($n)
{
    if ($n < 3) {
        return 1;
    } else {
        return sum($n-1) + sum($n-2);
    }
}

function niubi($n) {
    if ($n < 3) {
        return 1;
    } else {
        $a = 1;
        $b = 1;
        for ($m = 3; $m <= $n; $m++) {
            $tmp = $a + $b;
            //准备下一级的前数
            $a = $b;
            //准备下一级的后数
            $b = $tmp;
        }
        return $tmp;
    }
}





echo sum(19);
echo sum(19);
