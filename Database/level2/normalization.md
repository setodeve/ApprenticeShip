## 第一正規形
### ユーザーテーブル
- ID
- 名前
- プライマリーキー：ID

### 商品テーブル
- ID
- 名前
- カテゴリID
- カテゴリ名 
- 値段
- プライマリーキー：ID

### 購入商品テーブル
- ID
- ユーザーID
- ユーザー名
- 商品ID
- 商品名
- 購入日
- プライマリーキー：ID

## 第二正規形 / 第三正規形
### ユーザーテーブル
- ID
- 名前
- プライマリーキー：ID

### 商品テーブル
- ID
- 名前
- カテゴリID
- 値段
- プライマリーキー：ID

### 商品カテゴリテーブル
- ID
- 名前
- プライマリーキー：ID
- 
### 購入商品テーブル
- ID
- ユーザーID
- 商品ID
- 購入日
- プライマリーキー：ID

