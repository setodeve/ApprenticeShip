## 1. データ型
文字、文字列、整数/少数のデータを保存する列かを指定

## 2. NULL
データとして存在しない状態。

## 3. プライマリーキー
そのテーブルのどの行のデータであるか特定できるキーのこと

## 4. 初期値
データが追加された時に指定がない場合に設定されるデフォルト値

## 5. AUTO INCREMENT
データ追加毎に自動でプラス１するという列の設定
例えば主キーのIDに設定される

## 6. 外部キー制約
別のテーブルから別のテーブルのIDを参照できるようにする設定

## 7. ユニークキー制約
データが重複する場合にエラーを出すようにする設定

## 8. テーブル定義
EC サイトの ER 図を、テーブル定義しましょう。各テーブルのテーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）、外部キー制約、ユニークキー制約を設定してください。

### usersテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|name|varchar(100)|||||
|created_at|timestamp|||||
|update_at|timestamp|||||

### productsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|name|varchar(100)|||||
|category_id|varchar(100)|YES|INDEX|||
|created_at|timestamp|||||
|update_at|timestamp|||||
- 外部キー制約：category_id に対して、category テーブルの id カラムから設定

### categoriesテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|name|varchar(100)|||||
|created_at|timestamp|||||
|update_at|timestamp|||||

### user_productsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|user_id|varchar(100)|YES|INDEX|||
|product_id|varchar(100)|YES|INDEX|||
|created_at|timestamp|||||
|update_at|timestamp|||||
- 外部キー制約：
  - user_id に対して、userテーブルの id カラムから設定
  - product_id に対して、productテーブルの id カラムから設定
