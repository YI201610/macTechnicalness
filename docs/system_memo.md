-------------------------
2015/09/21 (月) 10:18

macでcakephp3。こんなエラー。

〜〜〜
CakePHP is NOT able to connect to the database.

Connection to database could not be established: SQLSTATE[HY000] [2002] No such file or directory
〜〜〜

なので、

find / -name "mysql.sock" 

/private/tmp/mysql.sock <--- あった

データソースの設定に、以下の行を追加。

〜〜〜
    'Datasources' => [
		〜〜〜中略〜〜〜
		'unix_socket' => '/private/tmp/mysql.sock',
〜〜〜

