### programsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|title|varchar(100)|||||
|season_id|varchar(100)|YES|INDEX|||

### program_slotsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|title|varchar(100)|||||
|episode_id|varchar(100)||INDEX|||
|channel_id|varchar(100)||INDEX|||

### channelsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|genre_id|varchar(100)||INDEX|||
|title|varchar(100)|||||

### genresテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|genre|varchar(100)|||||

### seasonsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|season|bigint(20)|||||

### episodesテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|season_id|varchar(100)||INDEX|||
|program_id|varchar(100)||INDEX|||
|episode_number|bigint(20)|||||
|episode_detail|text|||||
|time|date|||||
|opened_at|date|||||
|view|bigint|||||


