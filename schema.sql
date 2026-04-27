-- Пользователи
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    nickname TEXT NOT NULL,
    rating INTEGER DEFAULT 1200,
    solved INTEGER DEFAULT 0,
    country TEXT DEFAULT 'ru',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Задачи
CREATE TABLE problems (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT UNIQUE NOT NULL,
    title TEXT NOT NULL,
    difficulty TEXT CHECK(difficulty IN ('easy', 'medium', 'hard')),
    statement TEXT NOT NULL,
    time_limit INTEGER DEFAULT 2,
    memory_limit INTEGER DEFAULT 256,
    solved_count INTEGER DEFAULT 0
);

-- Отправки решений
CREATE TABLE submissions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    problem_id INTEGER,
    language TEXT,
    code TEXT,
    verdict TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (problem_id) REFERENCES problems(id)
);

-- Турниры
CREATE TABLE contests (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    start_time DATETIME,
    duration INTEGER,
    problems TEXT
);

-- Обсуждения
CREATE TABLE discussions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT,
    author_id INTEGER,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    replies INTEGER DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

-- Сообщения в обсуждениях
CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    discussion_id INTEGER,
    author_id INTEGER,
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (discussion_id) REFERENCES discussions(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);
