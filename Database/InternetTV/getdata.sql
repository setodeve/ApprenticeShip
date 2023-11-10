--よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
SELECT episode_title as "エピソードタイトル", view as "視聴者数" 
from Episodes 
ORDER BY view DESC 
Limit 3 ;


--よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
--エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
SELECT title as "番組タイトル",season_no as "シーズン数" ,episode_no as "エピソード数", episode_title as "エピソードタイトル", view as "視聴数"
from Episodes as ep
INNER JOIN Programs as pr
ON pr.id = ep.program_id
INNER JOIN Seasons as se
ON se.id = pr.season_id
ORDER BY view DESC
Limit 3 ;

--本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
--本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
--なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
SELECT ch.title as "チャンネル名", start_time as "放送開始時刻(日付+時間)" ,end_time as "放送終了時刻" ,season_no as "シーズン数" ,episode_no as "エピソード数", episode_title as "エピソードタイトル", episode_detail as "エピソード詳細"
from TimeSlots as ti
INNER JOIN Episodes as ep
ON ep.id = ti.episode_id
INNER JOIN Channels as ch
ON ch.id = ti.channel_id
INNER JOIN Genres as ge
ON ge.id = ch.genre_id  
INNER JOIN Programs as pr
ON pr.id = ep.program_id
INNER JOIN Seasons as se
ON se.id = pr.season_id
WHERE start_time = LIKE "2023-11-01 %"
;

--ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
--ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
SELECT start_time as "放送開始時刻" ,end_time as "放送終了時刻" ,season_no as "シーズン数" ,episode_no as "エピソード数", episode_title as "エピソードタイトル", episode_detail as "エピソード詳細"
from TimeSlots as ti
INNER JOIN Episodes as ep
ON ep.id = ti.episode_id
INNER JOIN Channels as ch
ON ch.id = ti.channel_id
INNER JOIN Genres as ge
ON ge.id = ch.genre_id  
INNER JOIN Programs as pr
ON pr.id = ep.program_id
INNER JOIN Seasons as se
ON se.id = pr.season_id
WHERE ch.title = "ドラマ" and start_time >= "2023-11-01 00:00:00" and start_time <= "2023-11-08 00:00:00"
;