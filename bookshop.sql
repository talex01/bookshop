-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 01 2017 г., 09:27
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
(2, 'Лев Толстой', 'lev.tolstoy@microsoft.com', '555-55-55'),
(3, 'Конан Дойл', 'k.doil@uk.com', '12345678'),
(4, 'Ремарк', 'remark@usa.com', '6543218790'),
(5, 'Н. Гоголь', 'gogol@author.com', '123456789'),
(6, 'Браун Б.', 'brown@msn.com', '+123456789'),
(7, 'Шекспир', 'shekspir@msn.com', '0123456789'),
(8, 'Есенин', 'esenin@gmail.com', '32659845120'),
(9, 'Стивен Кинг', 'king@kong.com', 'Ahr!'),
(10, 'Дэн Браун', 'brown01@msn.com', '987654');

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
(3, 'Война и мир', '«Война́ и мир» (рус. дореф. «Война и миръ») — роман-эпопея Льва Николаевича Толстого, описывающий русское общество в эпоху войн против Наполеона в 1805—1812 годах.', 30, 2, 2, 'https://upload.wikimedia.org/wikipedia/commons/4/41/War-and-peace_1873.gif'),
(4, 'Мертвые души', 'Поэма Н.В. Гоголя «Мёртвые души» вошла в историю русской литературы как вершина сатирического реализма. В своем бессмертном произведении, потрясшем, по словам Герцена, всю Россию, Гоголь нарисовал широкую панораму русской жизни, создал целую галерею незабываемых образов и характеров, очень тонко и правдиво отобразив черты современной ему эпохи. При этом мощь его писательского дарования оказалась такой, что книга и сегодня не утратила своей остроты и силы.', 90, 5, 3, 'http://knigoland.com.ua/image/cache/data/1/14923-165x228.jpg'),
(5, 'Триумфальная арка', 'Это — красивейший из европейских романов ХХ века. Роман о любви, войне и смерти.\r\nЭто — печальнейший из европейских романов ХХ века. Роман о женщине, у которой нет ничего, кроме жалких сиюсекундных побед, — и о мужчине, привыкшем к страху, ненависти и безнадежности, как к своему второму «я».\r\nЭто — «Триумфальная арка». Роман о страсти, что может и должна завершиться лишь трагедией.', 230, 4, 3, 'http://knigoland.com.ua/image/cache/data/4/47644-165x228.jpg'),
(6, 'Малое собрание сочинений. Толстой Л.', 'Вниманию читателей предлагается собрание лучших повестей и рассказов Л. Н. Толстого, каждый из которых - несомненный шедевр, оказавший беспримерное влияние не только на российскую, но и на зарубежную культуру ХХ века.', 220, 2, 2, 'http://knigoland.com.ua/image/cache/data/6/67566-165x228.jpg'),
(7, 'Записки о Шерлоке Холмсе', 'Авторский сборник рассказов из цикла о приключениях Шерлока Холмса.', 60, 3, 5, 'http://knigoland.com.ua/image/cache/data/7/78058-165x228.jpg'),
(8, 'Ангелы и демоны', 'Иллюминаты. Древний таинственный орден, прославившийся в Средние века яростной борьбой с официальной церковью. Легенда далекого прошлого? Возможно… Но — почему тогда на груди убитого при загадочных обстоятельствах ученого вырезан именно символ иллюминатов? Приглашенный из Гарварда специалист по символике и его напарница, дочь убитого, начинают собственное расследование — и вскоре приходят к невероятным результатам…', 125, 6, 5, 'http://knigoland.com.ua/image/cache/data/4/49367-165x228.jpg'),
(9, 'Сонеты', 'Не раз Любовь твердила мне: Пиши!.. - эти слова великого итальянского поэта эпохи Возрождения Франческо Петрарки как нельзя лучше отражают основную тему книги, которая откроет читателю волшебный мир любовной лирики - своеобразного поэтического дневника, посвященного любви поэта к Лауре.', 40, 7, 4, 'http://knigoland.com.ua/image/cache/data/3/30284-165x228.jpg'),
(10, 'Последний поэт деревни', 'Сергей Есенин - великий русский поэт, тонкий лирик, певец родной природы.\r\nВ стихотворениях, включенных в книгу, звучит неподдельная любовь поэта ко всему живому, к жизни, к родине.', 40, 8, 4, 'http://knigoland.com.ua/image/cache/data/3/30208-165x228.jpg'),
(11, 'Кто нашел, берет себе', '«Просыпайся, гений» – с этих слов начинается новый потрясающий роман Стивена Кинга, книга о силе Слова, в какой-то степени продолжающая историю, которую писатель начал в романе «Мистер Мерседес», и в то же время перекликающаяся с одним из лучших его произведений – «Мизери».\r\nГений – писатель Ротстайн, прежде бунтарь, а теперь затворник вот уже долгие годы ничего не публикует. Но это не значит, что он ничего не пишет. В его доме – множество черновиков, ждущих «своего часа». Сборники стихов, рассказы и даже продолжение знаменитой саги, изменившей судьбу едва ли не целого поколения фанатов Ротстайна. Но теперь крутой поворот делает судьба самого писателя – черновики похищают, а Ротстайна жестоко убивают…\r\nОднако пройдет много лет, прежде чем блокноты писателя вновь всплывут на поверхность, чтобы самым непостижимым образом соединить людей, имевших отношение к трагическим событиям, связанным с Мистером Мерседесом...', 260, 9, 6, 'http://knigoland.com.ua/image/cache/data/6/63917-165x228.jpg'),
(12, 'Код да Винчи', 'Ця історія про неймовірне розслідування і приголомшливі відкриття Роберта Ленґдона та Софі Неве, без перебільшення, перевернула світ. Ден Браун створив легенду, в яку повірили всі, – попри відчайдушний опір Ватикану. Скандали навкруг роману, здається, не вгамуються ніколи, чому сприяє недавня його екранізація. А секрет цього величезного успіху полягає в тому, що Денові Брауну вдалося, як нікому до нього, наочно довести, що так звана історія та політика – це тільки ширма, за якою приховані величезні таємниці...', 90, 10, 5, 'http://knigoland.com.ua/image/cache/data/3/39504-165x228.jpg');

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
(2, 'Роман-эпопея'),
(3, 'Классика'),
(4, 'Поэзия'),
(5, 'Детектив'),
(6, 'Боевик, триллер'),
(7, 'Мистика');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
