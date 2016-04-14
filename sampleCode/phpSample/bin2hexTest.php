<?php

/**
 *@abstract 
 */
$binaryData = 'This is test string.';

/**
 *	バイナリデータを16進数に変換
 */
$buffer = strtoupper(bin2hex($binaryData));


/**
 *	バイナリデータ長を求める
 *
 */
$bufferLength = strlen($buffer);


/**
 *	バイナリデータをコンソールに出力
 */
$idx = 0;
$length = 2;
$width = 0;

for($i = 0; $i < $bufferLength; $i+=$length){
	$chars = substr($buffer, $idx, $length); 
	$idx+=$length;
	echo $chars.' ';

	$width++;
	if($width == 16){
		echo PHP_EOL;
		$width = 0;
	}
}

echo PHP_EOL;

?>
