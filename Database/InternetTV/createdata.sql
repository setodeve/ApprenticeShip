-- ジャンルテーブルにデータ挿入
INSERT INTO Genres (genre) VALUES
    ('ドラマ'),
    ('アニメ'),
    ('スポーツ'),
    ('バラエティ');

-- シーズンテーブルにデータ挿入
INSERT INTO Seasons (season_no) VALUES
    (1),
    (2),
    (3);

-- 番組テーブルに10個分のデータ挿入
INSERT INTO Programs (title, season_id) VALUES
    ('Breaking Bad: Season 1', 1),
    ('Stranger Things: Season 2', 2),
    ('Game of Thrones: Season 3', 3),
    ('Friends: Season 1', 1),
    ('The Mandalorian: Season 1', 1),
    ('Naruto: Season 2', 2),
    ('Olympic Games 2024', 1),
    ('Comedy Central Special', 1),
    ('The Crown: Season 5', 3),
    ('Anime Expo 2023', 1);

-- チャンネルテーブルにデータ挿入
INSERT INTO Channels (title, genre_id) VALUES
    ('ドラマ', 1),
    ('アニメ', 2),
    ('スポーツ', 3),
    ('バラエティ', 4);

-- エピソードテーブルにデータ挿入
INSERT INTO Episodes (program_id, episode_no, episode_detail, episode_time, opened_at, view) VALUES
    (1, 1, 'Pilot: Breaking Bad', 45, '2023-11-01 20:00:00', 12000),
    (2, 1, 'Stranger Things Awakens', 50, '2023-11-02 21:30:00', 15000),
    (3, 1, 'The Game of Thrones Finale', 60, '2023-11-03 22:00:00', 18000),
    (4, 1, 'Friends Reunion', 40, '2023-11-04 19:00:00', 9000),
    (5, 1, 'The Mandalorian: New Adventures', 35, '2023-11-05 20:30:00', 13000),
    (6, 1, 'Naruto: The Next Chapter', 25, '2023-11-06 18:45:00', 10000),
    (7, 1, 'Olympic Games Opening Ceremony', 120, '2023-11-07 17:00:00', 25000),
    (8, 1, 'Comedy Central Special: Laughter Unlimited', 50, '2023-11-08 21:00:00', 12000),
    (9, 1, 'The Crown: Royal Intrigues', 55, '2023-11-09 19:30:00', 15000),
    (10, 1, 'Anime Expo Highlights', 30, '2023-11-10 18:15:00', 11000);

-- 番組枠テーブルにデータ挿入
INSERT INTO TimeSlots (episode_id, channel_id, start_time, end_time) VALUES
    (1, 1, '2023-11-01 20:00:00', '2023-11-01 20:45:00'),
    (2, 2, '2023-11-02 21:30:00', '2023-11-02 22:20:00'),
    (3, 3, '2023-11-03 22:00:00', '2023-11-04 00:00:00'),
    (4, 4, '2023-11-04 19:00:00', '2023-11-04 19:40:00'),
    (5, 1, '2023-11-05 20:30:00', '2023-11-05 21:05:00'),
    (6, 2, '2023-11-06 18:45:00', '2023-11-06 19:10:00'),
    (7, 3, '2023-11-07 17:00:00', '2023-11-07 19:00:00'),
    (8, 4, '2023-11-08 21:00:00', '2023-11-08 21:50:00'),
    (9, 1, '2023-11-09 19:30:00', '2023-11-09 20:25:00'),
    (10, 2, '2023-11-10 18:15:00', '2023-11-10 18:45:00');
