USE internetTV;

-- よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
SELECT episode_title as "エピソードタイトル", view as "視聴者数" 
from Episodes 
ORDER BY view DESC 
Limit 3 ;

-- よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。
-- エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
SELECT title as "番組タイトル",season_no as "シーズン数" ,episode_no as "エピソード数", episode_title as "エピソードタイトル", view as "視聴数"
from Episodes as ep
INNER JOIN Programs as pr
ON pr.id = ep.program_id
INNER JOIN Seasons as se
ON se.id = pr.season_id
ORDER BY view DESC
Limit 3 ;

-- 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。
-- 本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。
-- なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
-- 2023-11-01を起点とする
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

-- ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
-- ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
-- 2023-11-01を起点とする
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
WHERE ch.title = "ドラマ" 
and start_time >= "2023-11-01 00:00:00" 
and start_time <= "2023-11-08 00:00:00"
;

-- (advanced) 直近一週間で最も見られた番組が知りたいです。
-- 直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください
-- 2023-11-06を起点とする
SELECT title as "番組タイトル",SUM(view) as "視聴数"
from Episodes as ep
INNER JOIN Programs as pr
ON pr.id = ep.program_id
INNER JOIN Seasons as se
ON se.id = pr.season_id
INNER JOIN TimeSlots as ti
ON ti.episode_id = ep.id
where start_time <= "2023-11-06 00:00:00"
GROUP BY pr.id
ORDER BY SUM(view) DESC
Limit 3 ;

-- (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。
-- 番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。
-- ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください
WITH GenreProgramRanking AS (
    SELECT
        G.genre AS genre_name,
        P.title AS program_title,
        AVG(E.view) AS average_view
    FROM
        Genres G
        JOIN Channels C ON G.id = C.genre_id
        JOIN TimeSlots TS ON C.id = TS.channel_id
        JOIN Episodes E ON TS.episode_id = E.id
        JOIN Programs P ON E.program_id = P.id
    GROUP BY
        G.genre, P.title
)
SELECT
    genre_name,
    program_title,
    average_view
FROM
    (
        SELECT
            genre_name,
            program_title,
            average_view,
            ROW_NUMBER() OVER (PARTITION BY genre_name ORDER BY average_view DESC) AS ranking
        FROM
            GenreProgramRanking
    ) ranked
WHERE
    ranking = 1;
