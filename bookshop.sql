-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Янв 28 2017 г., 18:51
-- Версия сервера: 5.7.17-0ubuntu0.16.04.1
-- Версия PHP: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bookshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`, `email`, `phone`) VALUES
(1, 'Сергей Лукьяненко', 'sergey.lukyanenko@gmail.com', '012345678'),
(2, 'Лев Толстой', 'lev.tolstoy@microsoft.com', '555-55-55');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `author_fk_id` int(11) NOT NULL,
  `category_fk_id` int(11) NOT NULL,
  `img_src` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `price`, `author_fk_id`, `category_fk_id`, `img_src`) VALUES
(1, 'Прозрачные витражи', '«Прозрачные витражи» (1999) — фантастическая повесть Сергея Лукьяненко, заключительная часть трилогии «Лабиринт отражений».\r\n\r\nКнига начинается с детских воспоминаний Карины о том, как она собирала большой пазл. На пазле было изображение стены замка и окна, за которым стоят рыцарь и принцесса с грустными лицами. Карина придумывала себе историю про их любовь. Но последний кусочек пазла — между руками рыцаря и принцессы — куда-то потерялся. И Карина поняла, что грусть принцессы и рыцаря от того, что они не смогут быть вместе и понимают это. Она разломала свой пазл и перестала верить в любовь.', 250, 1, 1, 'https://www.litmir.co/data/Book/0/34000/34077/BC2_1453755916.jpg'),
(2, 'Недотепа', 'Нелегко придется юному герцогу, желающему отомстить узурпатору и вернуть себе трон. Ведь есть так много путей, чтобы добиться справедливости!\r\n\r\nСтать оруженосцем могущественного рыцаря и научиться владеть оружием. Напроситься в ученики к волшебнику… Потребовать справедливости у верховного короля.\r\n\r\nИли пытаться все сделать сразу?\r\n\r\nА еще придется подружиться с бродячими актерами, обзавестись личной феей… очень маленькой, питающейся пыльцой… А еще – сразиться с коварными магами-витамантами, влюбиться в прекрасную княгиню Тиану, спасти ее из плена и случайно превратить… ой, нет, этого лучше не рассказывать!', 120, 1, 1, 'http://knizhnik.org/covers/page_261_luk_nedotepa.jpg'),
(3, 'Война и мир', '«Война́ и мир» (рус. дореф. «Война и миръ») — роман-эпопея Льва Николаевича Толстого, описывающий русское общество в эпоху войн против Наполеона в 1805—1812 годах.', 30, 2, 2, 'https://upload.wikimedia.org/wikipedia/commons/4/41/War-and-peace_1873.gif');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `book_id`) VALUES
(1, 1),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Фантастика'),
(2, 'Роман-эпопея');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
