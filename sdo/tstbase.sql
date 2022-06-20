-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 14 2022 г., 16:17
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tstbase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int NOT NULL,
  `kaf_id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `del` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `kaf_id`, `name`, `del`) VALUES
(1, 1, 'Ковригин А.В.', 0),
(2, 2, 'Носов А.И.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE `courses` (
  `id` int NOT NULL,
  `spec_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `del` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`id`, `spec_id`, `name`, `del`) VALUES
(1, 1, 'Проектирование и архитектура программного обеспечения', 0),
(2, 2, 'Информационные технологии', 0),
(3, 3, 'Экономическая теория', 0),
(4, 4, 'Уголовное право', 0),
(5, 1, 'Мультимедиа', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `courses_content`
--

CREATE TABLE `courses_content` (
  `id` int NOT NULL,
  `id_course` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `del` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `courses_content`
--

INSERT INTO `courses_content` (`id`, `id_course`, `name`, `content`, `del`) VALUES
(1, 2, 'Вводная лекция', '<h2>Зачем нужен этот предмет</h2>\r\n<p>Текст лекций</p>', 0),
(2, 1, 'Вводная лекция', '<h2>Зачем нужен этот предмет?</h2>\r\n<p>Нужен!</p>', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` int NOT NULL,
  `spec_id` int NOT NULL,
  `name` varchar(5) NOT NULL,
  `del` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `spec_id`, `name`, `del`) VALUES
(1, 1, 'ФИ901', 0),
(2, 2, 'ЭТ901', 0),
(3, 3, 'Э901', 0),
(4, 4, 'Ю901', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `kaf`
--

CREATE TABLE `kaf` (
  `id` int NOT NULL,
  `name_kaf` varchar(60) NOT NULL,
  `del` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `kaf`
--

INSERT INTO `kaf` (`id`, `name_kaf`, `del`) VALUES
(1, 'Кафедра информационных технологий', 0),
(2, 'Кафедра экономической теории', 0),
(3, 'Кафедра инноваций и предпринимательства', 0),
(4, 'Кафедра уголовного права и национальной безопасности', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modules`
--

CREATE TABLE `modules` (
  `id` int NOT NULL,
  `del` int NOT NULL DEFAULT '0',
  `alias` varchar(20) NOT NULL,
  `file_name` varchar(40) NOT NULL,
  `class_name` varchar(40) NOT NULL,
  `header` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `modules`
--

INSERT INTO `modules` (`id`, `del`, `alias`, `file_name`, `class_name`, `header`) VALUES
(1, 1, 'pages', 'Mpage.php', 'Mpage', 'Страницы'),
(2, 0, 'main', 'Mmain.php', 'Mmain', 'Главная'),
(3, 0, 'users', 'Musers.php', 'Musers', 'Пользователи'),
(4, 1, 'notes', 'Mnotes.php', 'Mnotes', 'Записи'),
(5, 0, 'lk', 'Mlk.php', 'Mlk', 'Личный кабинет'),
(6, 0, 'courses', 'Mcourse.php', 'Mcourse', 'Мои курсы');

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--

CREATE TABLE `notes` (
  `id` int NOT NULL,
  `del` int NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `date` date NOT NULL,
  `userid` varchar(40) NOT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `notes`
--

INSERT INTO `notes` (`id`, `del`, `name`, `date`, `userid`, `text`) VALUES
(1, 0, 'First Notes', '2021-11-29', '1', 'Hello world');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `del` int NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `val` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `del`, `name`, `val`) VALUES
(1, 0, 'systemName', 'НГУЭУ СДО'),
(2, 0, 'mainTemplate', 'page.html'),
(3, 0, 'loginTemplate', 'login.html'),
(4, 0, 'templateDir', 'template/');

-- --------------------------------------------------------

--
-- Структура таблицы `spec`
--

CREATE TABLE `spec` (
  `id` int NOT NULL,
  `kaf_id` int NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `spec`
--

INSERT INTO `spec` (`id`, `kaf_id`, `name`) VALUES
(1, 1, '02.03.02 Фундаментальная информатика и информационные технологии'),
(2, 2, '38.03.05 Бизнес - информатика'),
(3, 3, '38.03.01 Экономика'),
(4, 4, '40.03.01 Юриспруденция');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `del` int NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `position` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `login` varchar(40) NOT NULL,
  `passw` varchar(40) NOT NULL,
  `e_mail` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `user_img` varchar(60) DEFAULT 'img/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `del`, `name`, `position`, `date`, `login`, `passw`, `e_mail`, `group_id`, `user_img`) VALUES
(1, 0, 'Ломиворотов Вадим', 'Admin', '2000-06-14', '190695', '582', 'lomvad1406@mail.ru', 1, 'img/default.jpg'),
(13, 0, 'Новый пользователь', NULL, NULL, ' ', ' ', NULL, NULL, 'img/default.jpg'),
(14, 0, 'Новый пользователь', NULL, NULL, ' ', ' ', NULL, NULL, 'img/default.jpg'),
(15, 0, 'Новый пользователь', NULL, NULL, ' ', ' ', NULL, NULL, 'img/default.jpg'),
(16, 0, 'Новый пользователь', NULL, NULL, ' ', ' ', NULL, NULL, 'img/default.jpg'),
(17, 0, 'Новый пользователь', NULL, NULL, ' ', ' ', NULL, NULL, 'img/default.jpg'),
(18, 0, 'Новый пользователь', NULL, NULL, ' ', ' ', NULL, NULL, 'img/default.jpg'),
(19, 0, 'Новый пользователь', NULL, NULL, ' ', ' ', NULL, NULL, 'img/default.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `courses_content`
--
ALTER TABLE `courses_content`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `kaf`
--
ALTER TABLE `kaf`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `spec`
--
ALTER TABLE `spec`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `courses_content`
--
ALTER TABLE `courses_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `kaf`
--
ALTER TABLE `kaf`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `spec`
--
ALTER TABLE `spec`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
