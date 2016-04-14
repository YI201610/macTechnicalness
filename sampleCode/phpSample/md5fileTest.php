<?php

/**
 * @abstract 第１引数で指定されたファイルのmd5ハッシュ値を求める
 */
if(isset($argv[1]) && file_exists($argv[1]))
{
	$filePath = $argv[1];
	$md5HashValue = md5_file($filePath);
	echo $md5HashValue.PHP_EOL;
}else{
	echo 'Error: File not founded.'.PHP_EOL;
}

?>
