CREATE DATABASE internetTV;
USE internetTV;
-- ジャンルテーブル
CREATE TABLE Genres (
    id bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre varchar(100) NOT NULL
);

-- シーズンテーブル
CREATE TABLE Seasons (
    id bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    season_no int NOT NULL
);

-- 番組テーブル
CREATE TABLE Programs (
    id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title varchar(300) NOT NULL,
    season_id bigint(20) NOT NULL,
    FOREIGN KEY (season_id) REFERENCES Seasons(id)  
);

-- チャンネルテーブル
CREATE TABLE Channels (
    id bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title varchar(300) NOT NULL,
    genre_id bigint(20) NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES Genres(id)  
);

-- エピソードテーブル
CREATE TABLE Episodes (
    id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
    program_id bigint,
    FOREIGN KEY (program_id) REFERENCES Programs(id),
    episode_no int NOT NULL,
    episode_detail text NOT NULL,
    episode_time int NOT NULL,
    opened_at DATETIME NOT NULL,
    view int NOT NULL
);

-- 番組枠テーブル
CREATE TABLE TimeSlots (
    id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
    episode_id bigint NOT NULL,
    FOREIGN KEY (episode_id) REFERENCES Episodes(id),
    channel_id bigint(20) NOT NULL,
    FOREIGN KEY (channel_id) REFERENCES Channels(id),
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL
);



