<?php
/**
 * @abstract POSTデータをファイルに書き込む
 */

 //書き込み用ファイルの名称を決定する
//$filename = gmdate('Ymdhis', time()).'_postDataLog.txt';
$filename = 'postDataLog.txt';

 //書き込み用ファイルを開く
if(!$file_id = fopen($filename, 'a+')) {
	die('NG, Error Code 001: '.$filename);
}

 //書き込み用バッファを初期化する
$buffer = '';

 //リクエストのbody部を読み込むため、読み込み専用のストリームを開く
$stdin = fopen('php://input', 'r');
if(!$stdin) {
	die('NG, Error Code: 002');
}

//ファイル終端まで、入力ストリームからデータを読み込む
while(!feof($stdin)) {
	$buffer .= fgets( $stdin, 10000 );
}
fclose( $stdin ); 	

//書き込み用ファイルにログ日時と、受信データを書き込む
fputs($file_id, '----'.gmdate('Y/m/d h:i:s', time()).'----'."\n");
fputs($file_id, $buffer."\n");

//書き込み用ファイルを閉じる
fclose($file_id);

//処理を正常終了する
die('OK');

?>
