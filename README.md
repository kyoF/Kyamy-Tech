# Z Generation Library

## 環境構築

1. .envファイル作成

```
$ cp db/.env.sample db/.env
$ cp src/.env.sample src/.env
```

2. コンテナ起動

```
$ docker-compose up -d --build
```

3. フロントエンド確認
http://localhost:5000/account/login
```
ID : test
PASS : test
```

4. データベース確認
http://localhost:3306/
```
サーバ：db
ユーザ名：zgl
パスワード：zgl
データベース：zgl
```

### その他
#### コンテナ停止コマンド
```
$ docker-compose down
```
#### データベース初期化
```
$ docker-compose down --rmi all --volumes --remove-orphans
$ docker-compose up -d --build
```
