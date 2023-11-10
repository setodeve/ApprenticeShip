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

-- 番組テーブルに20個分のデータ挿入
INSERT INTO Programs (title, season_id) VALUES
    ('Breaking Bad: Season 1', 1),
    ('Stranger Things: Season 2', 2),
    ('Game of Thrones: Season 3', 3),
    ('Friends: Season 1', 1),
    ('The Mandalorian: Season 1', 1),
    ('Naruto: Season 2', 2),
    ('Olympic Games 2024', 3),
    ('Comedy Central Special', 1),
    ('The Crown: Season 3', 3),
    ('Anime Expo 2023', 2),
    ('Grey''s Anatomy: Season 1', 1),
    ('The Witcher: Season 1', 2),
    ('Premier League Football', 3),
    ('Late Night Show with Jimmy Fallon', 1),
    ('Stray Kids Variety Show', 2),
    ('Wimbledon 2023', 3),
    ('Saturday Night Live', 1),
    ('The Office: Season 1', 1),
    ('One Piece: Season 2', 2),
    ('Formula 1 Grand Prix', 3);

-- チャンネルテーブルにデータ挿入
INSERT INTO Channels (title, genre_id) VALUES
    ('ドラマ', 1),
    ('アニメ', 2),
    ('スポーツ', 3),
    ('バラエティ', 4);

-- エピソードテーブルにデータ挿入
INSERT INTO Episodes (program_id, episode_no, episode_title, episode_detail, episode_time, opened_at, view) VALUES
    (1, 1, 'Pilot: Breaking Bad', 'Chemistry teacher turned methamphetamine producer', 45, '2023-11-01 20:00:00', 12000),
    (2, 1, 'Stranger Things Awakens', 'Kids in a small town encounter strange occurrences', 50, '2023-11-02 21:30:00', 15000),
    (3, 1, 'The Game of Thrones Finale', 'Epic fantasy battles for the Iron Throne', 60, '2023-11-03 22:00:00', 18000),
    (4, 1, 'Friends Reunion', 'The cast of Friends gathers for a special reunion', 40, '2023-11-04 19:00:00', 9000),
    (5, 1, 'The Mandalorian: New Adventures', 'Bounty hunter in the Star Wars universe', 35, '2023-11-05 20:30:00', 13000),
    (6, 1, 'Naruto: The Next Chapter', 'Ninja battles and adventures continue', 25, '2023-11-06 18:45:00', 10000),
    (7, 1, 'Olympic Games Opening Ceremony', 'Global sports extravaganza begins', 120, '2023-11-07 17:00:00', 25000),
    (8, 1, 'Comedy Central Special: Laughter Unlimited', 'Top comedians in a special comedy event', 50, '2023-11-08 21:00:00', 12000),
    (9, 1, 'The Crown: Royal Intrigues', 'Drama depicting the British royal family', 55, '2023-11-09 19:30:00', 15000),
    (10, 1, 'Anime Expo Highlights', 'Showcasing the best moments from Anime Expo', 30, '2023-11-10 18:15:00', 11000),
    (11, 2, 'Grey''s Anatomy: Emotional Healing', 'Medical drama with emotional twists', 40, '2023-11-11 20:30:00', 9000),
    (12, 2, 'The Witcher: Dark Fantasy Adventures', 'Monster hunter in a medieval-inspired world', 55, '2023-11-12 21:45:00', 14000),
    (13, 2, 'Premier League Football', 'Top football clubs compete in the Premier League', 90, '2023-11-13 17:30:00', 18000),
    (14, 2, 'Late Night Show with Jimmy Fallon', 'Entertainment and comedy with celebrity guests', 50, '2023-11-14 23:00:00', 12000),
    (15, 2, 'Stray Kids Variety Show', 'K-pop group showcases variety skills', 30, '2023-11-15 18:15:00', 11000),
    (16, 3, 'Wimbledon 2023', 'Grand Slam tennis tournament', 120, '2023-11-16 15:00:00', 22000),
    (17, 3, 'Saturday Night Live', 'Iconic sketch comedy show', 60, '2023-11-17 22:30:00', 13000),
    (18, 3, 'Bank Rupt', 'Mockumentary sitcom at a paper company', 30, '2023-11-18 19:45:00', 11000),
    (19, 3, 'Luffy will die', 'Pirate adventures in a vast world', 35, '2023-11-19 18:00:00', 12000),
    (20, 3, 'Formula 1 Grand Prix', 'High-speed racing in the Formula 1 championship', 120, '2023-11-20 14:00:00', 20000),
    (21, 1, 'The Game of Thrones Real Finale', 'End Epic fantasy battles for the Iron Throne', 60, '2023-11-04 22:00:00', 18000);

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
    (10, 2, '2023-11-10 18:15:00', '2023-11-10 18:45:00'),
    (11, 1, '2023-11-11 20:30:00', '2023-11-11 21:10:00'),
    (12, 2, '2023-11-12 21:45:00', '2023-11-12 22:40:00'),
    (13, 3, '2023-11-13 17:30:00', '2023-11-13 19:00:00'),
    (14, 4, '2023-11-14 23:00:00', '2023-11-15 00:00:00'),
    (15, 1, '2023-11-15 18:15:00', '2023-11-15 18:45:00'),
    (16, 3, '2023-11-16 15:00:00', '2023-11-16 17:00:00'),
    (17, 4, '2023-11-17 22:30:00', '2023-11-17 23:30:00'),
    (18, 1, '2023-11-18 19:45:00', '2023-11-18 20:15:00'),
    (19, 2, '2023-11-19 18:00:00', '2023-11-19 18:35:00'),
    (20, 3, '2023-11-20 14:00:00', '2023-11-20 16:00:00');
    (21, 3, '2023-11-04 21:00:00', '2023-11-04 22:00:00');