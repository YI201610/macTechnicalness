<?php

/**
 * @abstract 組み合わせの総数(nCr)を求める計算
 * 			 公式: n!/r!*(n-r)! 
 *
 * 			 バッファオーバーフローを防止するため、
 * 			 漸化式（ぜんかしき）で表現する。
 * 			 
 */
function combination($n = 0, $r = 0)
{
	$p = 1;
	for($i = 1; $i <= $r; $i++){
		$p = $p*($n-$i+1)/$i;
	}

	return $p;
}


/**
 * @abstract テストコード1
 */
echo PHP_EOL.'---------------------'.PHP_EOL;
$n=4; 
$r=3;
echo sprintf('%dC%d = %ld'."\t", $n, $r, combination($n, $r));


/**
 * @abstract テストコード2
 */
echo PHP_EOL.'---------------------'.PHP_EOL;
for($n = 0; $n <= 5; $n++){
	for($r = 0; $r <= $n; $r++){
		echo sprintf('%dC%d = %ld'."\t", $n, $r, combination($n, $r));
	}
	echo PHP_EOL;
}


?>
