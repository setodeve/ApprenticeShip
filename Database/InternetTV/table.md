### programsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint||PRIMARY||YES|
|title|varchar(100)|||||
|season_id|varchar(100)|YES|INDEX|||

### program_slotsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint||PRIMARY||YES|
|episode_id|bigint||INDEX|||
|channel_id|bigint(20)||INDEX|||
|start_time|datetime|||||
|end_time|datetime|||||


### channelsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|genre_id|bigint(20)||INDEX|||
|title|varchar(100)|||||

### genresテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|genre|varchar(100)|||||

### seasonsテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint||PRIMARY||YES|
|season|bigint(20)|||||

### episodesテーブル
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint||PRIMARY||YES|
|program_id|bigint||INDEX|||
|episode_number|bigint(20)|||||
|episode_detail|text|||||
|time|date|||||
|opened_at|date|||||
|view|bigint|||||


