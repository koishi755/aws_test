<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>Hello World</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
</head>
<body>

<table border="1">
    <tr>
        <th>タイトル</th>
        <th>本文</th>
    </tr>

<?php
const DB_HOST = 'mysql:dbname=myblog;host=127.0.0.1;charset=utf8';
const DB_USER = 'root';
const DB_PASSWORD = 'password';

//例外処理
try {
    $pdo = new PDO(DB_HOST, DB_USER, DB_PASSWORD,[
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, //DBの情報を連想配列で取得する
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, //例外を表示する
        PDO::ATTR_EMULATE_PREPARES => false, //SQLインジェクション対策
    ]);

    //query
    $sql = 'select * from blog';
    $stmt = $pdo->query($sql);
    $result = $stmt->fetchAll();
    
    foreach($result as $blog){
        echo'<tr><td>';
        echo ($blog['title']);
        echo'</td><td>';
        echo $blog['detail'];
        echo'</td></tr>';

    }

} catch (PDOException $e) {
    echo '接続失敗' . $e->getMessage() . "\n";
    exit();
}
?>
</table>
</body>
</html>
