## GET /todos
すべてのtodoを取得します。
* リクエストヘッダー
  * N/A
* クエリパラメータ（リクエストのパラメータ）
  * N/A
* リクエストボディ
  * N/A
* リクエストの例
  * http://localhost:3000/todos
* レスポンス
  * Todoの配列を返します
* レスポンスの例
```json
{
    "status": "success",
    "data": [
        {
            "id": 16,
            "title": "dd",
            "created_at": "2023-12-24T22:50:14.240Z",
            "updated_at": "2023-12-24T23:00:47.691Z"
        }
    ]
}
```
* エラーレスポンス
  * N/A
* エラーレスポンスの例
  * N/A
***

## POST /todos
リクエストボディに渡されたtodoを登録します。
* リクエストヘッダー
```json
 "Content-Type": "application/json"
```
* クエリパラメータ（リクエストのパラメータ）
  * N/A
* リクエストボディ
```json
{
  "todo": {
    "title": "勉強する"
  }
}
```
* リクエストの例
  * http://localhost:3000/todos
* レスポンス
  * 追加したTodoを返します。
* レスポンスの例
```json
{
    "status": "success",
    "data": {
        "id": 18,
        "title": "勉強する",
        "created_at": "2023-12-26T05:08:34.866Z",
        "updated_at": "2023-12-26T05:08:34.866Z"
    }
}
```
* エラーレスポンス
  * N/A
* エラーレスポンスの例
  * N/A
***

## PUT /todos/{id}
リクエストボディに渡されたtodoに変更します。
* リクエストヘッダー
```json
 "Content-Type": "application/json"
```
* クエリパラメータ（リクエストのパラメータ）
  * N/A
* リクエストボディ
```json
{
  "todo": {
    "title": "提出する"
  }
}
```
* リクエストの例
  * http://localhost:3000/todos/16
* レスポンス
  * 変更されたtodoを返却します。
* レスポンスの例
```json
{
    "status": "success",
    "data": {
        "title": "提出する",
        "id": 16,
        "created_at": "2023-12-24T22:50:14.240Z",
        "updated_at": "2023-12-26T05:48:04.680Z"
    }
}
```
* エラーレスポンス
  * N/A
* エラーレスポンスの例
  * N/A
***

## DELETE /todos/{id}
* リクエストヘッダー
  * N/A
* クエリパラメータ（リクエストのパラメータ）
  * N/A
* リクエストボディ
  * N/A
* リクエストの例
  * http://localhost:3000/todos/16

* レスポンス
  * 削除されたtodoを返却します。
* レスポンスの例
```json
{
    "data": {
        "id": 16,
        "title": "提出する",
        "created_at": "2023-12-24T22:50:14.240Z",
        "updated_at": "2023-12-26T05:48:04.680Z"
    },
    "status": 204
}
```
* エラーレスポンス
  * N/A
* エラーレスポンスの例
  * N/A