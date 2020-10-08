-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 08 2020 г., 22:15
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `anutacookie`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category-name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `category-name`) VALUES
(1, 'corporate'),
(2, '14fev'),
(3, '23fev'),
(4, '8march'),
(5, 'foto-print'),
(6, 'topper'),
(7, 'wedding'),
(8, 'teacher'),
(9, 'school'),
(10, 'birthday'),
(11, 'new-year'),
(12, 'thematic');

-- --------------------------------------------------------

--
-- Структура таблицы `category-products`
--

CREATE TABLE `category-products` (
  `id_cp` int(11) NOT NULL,
  `id_caregory` int(4) NOT NULL,
  `id_product` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category-products`
--

INSERT INTO `category-products` (`id_cp`, `id_caregory`, `id_product`) VALUES
(1, 10, 2),
(2, 9, 2),
(3, 9, 4),
(4, 8, 5),
(5, 8, 3),
(6, 8, 5),
(7, 8, 8),
(8, 8, 9),
(9, 8, 10),
(10, 8, 11),
(12, 9, 3),
(13, 9, 4),
(14, 9, 5),
(15, 6, 6),
(16, 8, 7),
(17, 4, 8),
(18, 4, 9),
(19, 4, 10),
(20, 4, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `p_count` varchar(255) DEFAULT NULL,
  `p_seze` varchar(255) DEFAULT NULL,
  `p_price` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `show_product` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `p_count`, `p_seze`, `p_price`, `img_url`, `show_product`) VALUES
(2, 'Пряники Мишки', 'От 10 шт', 'Размер: 9 см', 'Цена: 130р', 'http://anutacookie.ru/images/5d63c660b519d8a5ff2f943d_Photo26084.jpeg', 1),
(3, 'Набор Осенний', '3 пряника в коробочке', 'Размер коробки: 15х22 см', 'Цена: 650р', 'http://anutacookie.ru/images/5d8df3ca86d4c030901a1b39_Photo27097.jpg', 1),
(4, 'Пряники для класса', 'От 10 шт', 'Размер квадрата: 9 см', 'Цена: 135р', 'http://anutacookie.ru/images/5d63c660a93ad978bfd59a8e_Photo26082.jpeg', 1),
(5, 'Набор для учителя', '4 пряника в коробочке', 'Размер коробки: 20х20 см', 'Цена: 600р', 'http://anutacookie.ru/images/5d8de42c7b0ad712f5b11e68_Photo27091.jpg', 1),
(6, 'Цифра 5', 'От 10 шт.', 'Размер: 10 см', 'Цена: 140р', 'http://anutacookie.ru/images/5f298faa5cd7a28fbc23de4a_WaterMark_2020-08-04-09-56-19.jpg', 1),
(7, 'Набор на день учителя', '4 пряника в коробочке', 'Размер коробки: 20х20 см', 'Цена: 650р', 'http://anutacookie.ru/images/5ba24585b46dc2d7c5fb12b3_proho00159.jpg', 1),
(8, 'Набор №1 8 Марта', '3 пряника в наборе', 'Размер: 15 и 10 см', 'Цена: 900р', 'http://anutacookie.ru/images/58aefe0c2a1c75e518f7a31d_photo66.jpg', 1),
(9, 'Букет Для учителя', '5 пряников на палочке', 'Размер пряника: 10 см', 'Цена: 1200р', 'http://anutacookie.ru/images/5d63c65fe3123d84324cfded_Photo26083.jpeg', 1),
(10, 'Букет Роз', '5 пряников', 'Размер: 9 см', 'Цена: 1500р', 'http://anutacookie.ru/images/59ec71d5f4f8560001ca1226_photo00074.jpg', 1),
(11, 'Набор Роза', 'Ваша надпись', 'Размер коробки: 15х22 см', 'Цена: 650р', 'http://anutacookie.ru/images/5e29a0105915477fd7009d7c_photo_feb236.jpg', 1),
(12, 'Печать на пряниках', 'Лого, картинка, фото', 'Пищевая печать на прянике', 'Цена: от 45р', 'http://anutacookie.ru/images/5ba10e186cf3f881acf78d93_proho00150.jpg', 1),
(13, 'Букет тюльпанов', '3 пряника на палочке', 'Размер: 9 см', 'Цена: 800р', 'http://anutacookie.ru/images/5ba10e15fa0db5636446b97f_proho00144.jpg', 1),
(14, 'Набор Лаванда', 'Любая надпись', 'Размер коробки: 20х20 см', 'Цена: 650р', 'http://anutacookie.ru/images/5e4fe1ede6a456010eb0c78b_photo_feb22_3.jpg', 1),
(15, 'Круглые пряники', 'Печать лого/картинка', 'Размер : 9 см', 'Цена: 130р', 'http://anutacookie.ru/images/5c4f44751a30a8f9ef39f9c2_photo221.jpg', 1),
(16, 'Набор Тюльпаны', 'Любое поздравление', 'Размер коробки: 15х22 см', 'Цена: 650р', 'http://anutacookie.ru/images/5e4ea69b59528a82526896ed_IMG_20200220_133008_353.jpg', 1),
(17, 'Свадебные пряники', 'От 20 (Пищевая печать)', 'Размер: 11 см', 'Цена: от 100р', 'http://anutacookie.ru/images/5baa84ca4b2baf24eedaf075_proho00170.jpg', 1),
(18, 'Голуби на крестины', 'От 10 шт', 'Размер : 10 см', 'Цена: 180р', 'http://anutacookie.ru/images/5e2960286cab06249916c688_photo_feb227_.jpg', 1),
(19, 'Сердца с фото', 'От 20 шт', 'Размер : 10 см', 'Цена: от 135р', 'http://anutacookie.ru/images/5c4f4475dfbd6c1ec4287993_photo223.jpg', 1),
(20, 'Топеры для тортов', 'Срочные заказы', 'Размер: 5-12 см', 'Цена: от 200р', 'http://anutacookie.ru/images/5ca5b73bade0bcd7e8f807e6_proto_00123.jpg', 1),
(21, 'Набор в мешочке Love', '30 пряников', 'Размер: 4,5 см', 'Цена: 1200р', 'http://anutacookie.ru/images/59fa093a3b3286000184195c_photo00103.jpg', 1),
(22, 'Пасхальные яйца', 'От 5 шт', 'Размер : 9,5 на 7,5 см', 'Цена: 130р', 'http://anutacookie.ru/images/5ca5b652daf05accf41f0d4c_proto_00122.jpg', 1),
(23, 'Свадебные пряники', 'Ручная роспись от 50 шт', 'Размер: 9,5 см', 'Цена: от 130р', 'http://anutacookie.ru/images/5ad9fed08fb8e563e6aa0e60_photo00137.jpg', 1),
(24, 'Круглые пряники', 'Печать на пряниках', 'Размер пряника: 7 см', 'Цена: 100р', 'http://anutacookie.ru/images/5c4f44811a30a819d639f9ce_photo227.jpg', 1),
(25, 'Птички', 'От 30 шт', 'Размер: 10 см', 'Цена: от 110р', 'http://anutacookie.ru/images/59ecb60be8bbc50001a50fca_photo00111.jpg', 1),
(26, 'Футбольные мячи', 'От 10 шт на палочке', 'Размер: 9 см', 'Цена: 150р', 'http://anutacookie.ru/images/5ad9fed1d9a6514063dad5c0_photo00134.jpg', 1),
(27, 'Набор На 1 годик', '4 Пряника', 'Размер коробки: 15x15 см', 'Цена: 480р', 'http://anutacookie.ru/images/5c4f4475e346b70f9db3772f_photo222.jpg', 1),
(28, 'Набор Дэд Пул', '9 Пряников', 'Размер коробки: 26x26 см', 'Цена: 1900р', 'http://anutacookie.ru/images/5c4f448acea36f28fb3538a0_photo238.jpg', 1),
(29, 'Набор Love is..', '4 котика, 4 сердца', 'Размер: 9,5х6,5 см', 'Цена: 1200р', 'http://anutacookie.ru/images/57fbd9648ae3efd95b4e74e3_photo42.jpg', 1),
(30, 'Свадебные', 'От 50 шт', 'Размер: 8 см', 'Цена: от 80р', 'http://anutacookie.ru/images/59ecb6019d16950001e28a2f_photo00095.jpg', 1),
(31, 'Набор Pusheen cat', '10 пряников (Ваша надпись)', 'Размер коробки: 26x26 см', 'Цена: 1900р', 'http://anutacookie.ru/images/5c4f4483dfbd6c802028799d_photo230.jpg', 1),
(32, 'Набор Любовь', '3 бол. и 8 мал. сердечка', 'Размер: 11 и 4,5 см', 'Цена: 1800р', 'http://anutacookie.ru/images/59ecb6049d16950001e28a31_photo00091.jpg', 1),
(33, 'Набор Новогодние ОНА', 'Набор пряников 4 шт', 'Размер коробки: 20x20 см', 'Цена: 550р', 'http://anutacookie.ru/images/5c152298e7c04615c90ebc77_photo-200.jpg', 1),
(34, 'Набор Новогодний 3', 'Набор пряников 3 шт', 'Размер коробки: 20x10 см', 'Цена: 600р', 'http://anutacookie.ru/images/5be58af0520fa6086e05d02d_proho0081.jpg', 1),
(35, 'Набор Поросята 4 шт', 'Набор пряников 4 шт', 'Размер коробки: 14x14 см', 'Цена: 450р', 'http://anutacookie.ru/images/5be58ade2967d42d337c05af_proho0093.jpg', 1),
(36, 'Набор Новогодний ОН', 'Набор пряников 4 шт', 'Размер коробки: 20x20 см', 'Цена: 550р', 'http://anutacookie.ru/images/5c1522995ba956923db4a6eb_photo-201.jpg', 1),
(37, 'Набор Новогодний 5', 'Набор из 5 пряников', 'Размер коробки: 20x20 см', 'Цена: 940р', 'http://anutacookie.ru/images/5be58af520e89e6d46f5a3d9_proho0079.jpg', 1),
(38, 'Пряники Новогодние', 'Штучно от 5 шт', 'Размер: 9 см', 'Цена: 220р', 'http://anutacookie.ru/images/5be58ae51b2491f1d6cdef15_proho0085.jpg', 1),
(39, 'Пряник Снеговик', 'От 5 шт', 'Размер: 11 см', 'Цена: 320р', 'http://anutacookie.ru/images/5bdcb7352139674fc622b145_proho0074.jpg', 1),
(40, 'Набор Поросята 9 шт', 'Набор из 9 пряников', 'Размер коробки: 21x21 см', 'Цена: 845р', 'http://anutacookie.ru/images/5be58adce6875c72bf310116_proho0096.jpg', 1),
(41, 'Пряники Свинка', 'Штучно от 5 шт', 'Размер: 10 см', 'Цена: 250 р', 'http://anutacookie.ru/images/5be58ae5777b609ec1bf96cb_proho0086.jpg', 1),
(42, 'Пряник Дед мороз', 'От 5 шт', 'Размер: 11 см', 'Цена: 320р', 'http://anutacookie.ru/images/5bdcb97e213967abee22b1f2_proho0073.jpg', 1),
(43, 'Нарядный мишка', 'От 5 шт', 'Размер: 11 см', 'Цена: 320р', 'http://anutacookie.ru/images/5bdcb7370f0962428dc11762_proho0072.jpg', 1),
(44, 'Топеры для тортов', 'Пищевая печать за 1 день.', 'Размер: 5-12 см', 'Цена: от 200р', 'http://anutacookie.ru/images/5ba10e17fa0db5b51146b984_proho00146.jpg', 1),
(45, 'Набор Хэллоуин', 'От 10 шт', 'Размер: 11х8 см', 'Цена: 150р/шт', 'http://anutacookie.ru/images/59ecb601f4f8560001ca3c80_photo00094.jpg', 1),
(46, 'Набор Зверята', '9 Пряников в коробке', 'Размер: 6 см', 'Цена: 900р', 'http://anutacookie.ru/images/5baa84c5b879a9808f413a8c_proho00171.jpg', 1),
(47, 'Топеры ручной работы', 'От 3х шт', 'Размер: 5-12 см', 'Цена: от 300р/шт', 'http://anutacookie.ru/images/5ba10e180777e73945fb00eb_proho00151.jpg', 1),
(48, 'Набор Лисята', '4 Пряника', 'Размер коробки: 15x15 см', 'Цена: 550р', 'http://anutacookie.ru/images/5c4f448ce346b7cda2b3775e_photo220.jpg', 1),
(49, 'Набор Зайчата', '4 Пряника', 'Размер коробки: 15x15 см', 'Цена: 550р', 'http://anutacookie.ru/images/5c4f4482e346b76ba3b3774f_photo228.jpg', 1),
(50, 'Влюбленные котики', 'От 10 шт', 'Размер коробки: 20х20 см', 'Цена: 180р', 'http://anutacookie.ru/images/5e29602c6cab060ad316c689_photo_feb23320.jpg', 1),
(51, 'Набор Зайцы хулиганы', 'В наборе 10 пряников', 'Размер коробки: 20х20 см', 'Цена: 700р', 'http://anutacookie.ru/images/5e29602b74cbdab5e719bc2e_photo_feb23120.jpg', 1),
(52, 'Набор Я люблю тебя', '6 пряников в коробочке', 'Размер коробки: 15х15 см', 'Цена: 500р', 'http://anutacookie.ru/images/5e29602b64852b2907d9b280_photo_feb23220.jpg', 1),
(53, 'Морской набор', 'От 10 шт', 'Размер: 9-11 см', 'Цена: 200р', 'http://anutacookie.ru/images/5ad9fed1d9a6510e12dad5bf_photo00135.jpg', 1),
(54, 'Поздравительный набор', '8 пряников в коробке', 'Размер: 9 см', 'Цена: 1500р', 'http://anutacookie.ru/images/5ad9fed004651dde8549805c_photo00136.jpg', 1),
(55, 'Набор для папы', '5 пряников в наборе', 'Размер: 11 см', 'Цена: 1200р', 'http://anutacookie.ru/images/5ad9fecef7f274eb22ca2e6e_photo00138.jpg', 1),
(56, 'Вкусняшки', 'От 10 шт', 'Размер: 9 см', 'Цена: 150р', 'http://anutacookie.ru/images/5ad9feced9a6519f48dad5bd_photo00140.jpg', 1),
(57, 'Топперы', 'От 10 шт', 'Размер: 7-10см', 'Цена: 150р', 'http://anutacookie.ru/images/5ad9fece8fb8e5f52aaa0e5f_photo00139.jpg', 1),
(58, 'Для любимых', 'От 10 шт', 'Размер: 10 см', 'Цена: 150р', 'http://anutacookie.ru/images/5ad9fece6037d0aa7eb82b4d_photo00141.jpg', 1),
(59, 'Набор №2 8 Марта', '4 пряника', 'Размер: 11 и 9см', 'Цена: 900р', 'http://anutacookie.ru/images/58aefe094451abf5773496ec_photo65.jpg', 1),
(60, 'Букет тюльпанов 3 шт.', '3 пряника на палочке', 'Размер: 9 см', 'Цена: 500р', 'http://anutacookie.ru/images/58aefe092a1c75e518f7a31b_photo63.jpg', 1),
(61, 'Чих и Той', 'Цена за 1 шт', 'Размер: 10,5 см', 'Цена: 300р', 'http://anutacookie.ru/images/5a018c10ba379800017761ed_photo00122.jpg', 1),
(62, 'Торт три шоколада', 'Декор на выбор', 'Вес 3 кг', 'Цена: от 3500р', 'http://anutacookie.ru/images/5ad9fed204651d2fa849805d_photo00131.jpg', 1),
(63, 'Печенье Медвежата', '750 грамм', 'Размер: 7 см', 'Цена: 1500р', 'http://anutacookie.ru/images/59fa09e1ea359e0001083680_photo000105.jpg', 1),
(64, 'Голуби', 'От 10 шт', 'Размер: 10 см', 'Цена: 100р', 'http://anutacookie.ru/images/59fa09e13b328600018419c6_photo000104.jpg', 1),
(65, 'Набор Детский', '19 пряников', 'Размер: 6-11 см', 'Цена: 3600р', 'http://anutacookie.ru/images/59ec70c041b4090001b58b97_photo00079.jpg', 1),
(66, 'Набор Стар Варс', '10 пряников', 'Размер: 8,5см', 'Цена: 1500р', 'http://anutacookie.ru/images/59ec70c0f4f8560001ca1184_photo00080.jpg', 1),
(67, 'Путешествие', 'От 8 шт', 'Размер: 8 см', 'Цена: 150р', 'http://anutacookie.ru/images/59fa1eaac9a5280001e57507_photo00107.jpg', 1),
(68, 'Торт Молочный', 'С пряничным декором', 'Вес: 2,5 кг', 'Цена: от 3000р', 'http://anutacookie.ru/images/5ad9fed28fb8e51efcaa0e62_photo00133.jpg', 1),
(69, 'Бабочки', 'От 10 шт', 'Размер: 9 см', 'Цена: 150р', 'http://anutacookie.ru/images/59fa1d8b3b32860001843369_photo00106.jpg', 1),
(70, 'Фитнес', 'От 8 шт', 'Размер: 11 см', 'Цена: 150р', 'http://anutacookie.ru/images/59ecb60519032000013f95bf_photo00083.jpg', 1),
(71, 'Единороги', 'От 8 шт', 'Размер: 8 см', 'Цена: 150р', 'http://anutacookie.ru/images/59fa08e378cc2d0001fe5713_photo00100.jpg', 1),
(72, 'Мопсы', 'От 8 шт', 'Размер: 10 см', 'Цена: 150р', 'http://anutacookie.ru/images/59fa08e30d99810001b92208_photo00102.jpg', 1),
(73, 'Набор 10 причин', 'Пряники с пожеланиями', 'Размер: 11 и 6 см', 'Цена: 1500р', 'http://anutacookie.ru/images/59ecb604f4f8560001ca3d17_photo00092.jpg', 1),
(74, 'Объемные розы 3D', '5 пряников', 'Размер: 9 см', 'Цена: 1800р', 'http://anutacookie.ru/images/59ec71d519032000013f767e_photo00071.jpg', 1),
(75, 'Торт Медовик', 'Декор на выбор', 'Вес 2 кг', 'Цена: от 2500р', 'http://anutacookie.ru/images/5ad9fed2f7f2741914ca2e6f_photo00132.jpg', 1),
(76, 'Сладкий букет', '5 шт, на палочке', 'Размер: 9 см', 'Цена: 900р', 'http://anutacookie.ru/images/58846de879448ad50b08c532_proto56.jpg', 1),
(77, 'Новогодние пряники', 'На выбор (минимум 4 шт)', 'Размер: 9-13,5 см', 'Цена: 125р за 1 шт', 'http://anutacookie.ru/images/583092094cc99c6e54603373_photo52.jpg', 1),
(78, 'Новогодняя открытка', '2шт с вашим пожеланием', 'Размер: 9,5 см', 'Цена: 800р', 'http://anutacookie.ru/images/582eccc2bcca26c246272a78_photo50.jpg', 1),
(79, 'Тоторо', 'От 8 шт', 'Размер: 7,5 см', 'Цена: 150р', 'http://anutacookie.ru/images/59ecb601e8bbc50001a50fc4_photo00096.jpg', 1),
(80, 'Набор Амур', '4 сердца в упаковке', 'Размер: 10,5 см', 'Цена: 1200р', 'http://anutacookie.ru/images/57b43a5e7fdf79235f78de01_photo11.JPG', 1),
(81, 'Набор Зайки', '4зайца + 4 сердца', 'Размер: 12 см и 7,5 см', 'Цена: 1200р', 'http://anutacookie.ru/images/59ecb618f4f8560001ca3d21_photo00101.jpg', 1),
(82, 'Вскрытие покажет', '4 шт в коробке', 'Размер: 14 см', 'Цена: 2000р', 'http://anutacookie.ru/images/59ecb60e19032000013f95c2_photo00109.jpg', 1),
(83, 'Хипстер', 'От 8 шт', 'Размер: 10 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43a5ed7c7463957d9e6e4_photo17.JPG', 1),
(84, 'Имбирный человечек', 'От 8 шт', 'Размер: 14 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43a5e7fdf79235f78ddfd_photo18.JPG', 1),
(85, 'Банановые острова', '4 шт в наборе', 'Размер: 5.5 см', 'Цена: 300р', 'http://anutacookie.ru/images/57b43a5e5d3c26651b06fbdc_photo20.JPG', 1),
(86, 'Набор StarWars', '1 Вейдер, 2 штурмовика,', '1 пряник снадписью', 'Цена: 500р', 'http://anutacookie.ru/images/57b43a5ed7c7463957d9e6e3_photo21.JPG', 1),
(87, 'Тоторо', 'От 8 шт', 'Размер: 11 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43a5e7fdf79235f78ddfc_photo22.JPG', 1),
(88, 'Веселый Роджер', 'От 8 шт', 'Размер: 9 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43a5ed7c7463957d9e6e2_photo25.JPG', 1),
(89, 'Корсет', 'От 8 шт', 'Размер: 11 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43a5e5ee8c85457ebba9c_photo26.JPG', 1),
(90, 'Набор Марикюр', '9 шт в коробке', 'Размер: 9 см', 'Цена: 1200р', 'http://anutacookie.ru/images/57b43a5e1e0bb7e85ec90423_photo27.JPG', 1),
(91, 'Мимимишки', 'От 8 шт', 'Размер: 11 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43a5e7fdf79235f78ddfb_photo28.JPG', 1),
(92, 'Милашка', 'От 8 шт', 'Размер: 11 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43a5f7fdf79235f78de05_photo4.JPG', 1),
(93, 'Набор Мерлин Монро', '2 шт в упаковке', 'Размер: 13.5 см', 'Цена: 900р', 'http://anutacookie.ru/images/57b43a5ec2d13ca21b81034d_photo29.JPG', 1),
(94, 'Набор Мудрые совы', '4 шт в коробке', 'Размер: 11 см', 'Цена: 500р', 'http://anutacookie.ru/images/57b43a5ed7c7463957d9e6e7_photo6.JPG', 1),
(95, 'Набор Совята', '8 шт в коробке', 'Размер: 6,5 см', 'Цена: 1200р', 'http://anutacookie.ru/images/57b43a5fc2d13ca21b81034f_photo9.JPG', 1),
(96, 'Набор Дерзкий кот', '4 шт в коробке', 'Размер: 12,5 см', 'Цена: 500р', 'http://anutacookie.ru/images/57b43a5ed7c7463957d9e6e1_photo32.jpeg', 1),
(97, 'Набор Сауз Парк', '5 мульт. героев', 'Размер: 9 см', 'Цена: 750р', 'http://anutacookie.ru/images/57b43a5e7fdf79235f78ddfa_photo31.jpeg', 1),
(98, 'Набор Космос', 'От 50 шт', 'Размер: 9,5 см', 'Цена: 150р', 'http://anutacookie.ru/images/57b43dea7fdf79235f78eddc_photo36a.jpeg', 1),
(99, 'Набор Белье', '2 шт (верх + низ)', 'Размер: 4,5 см', 'Цена: 200р', 'http://anutacookie.ru/images/57b43a5e1e0bb7e85ec90422_photo35.jpeg', 1),
(100, 'Набор Отпуск', '8 шт в коробке', 'Размер: 7 см', 'Цена: 1200р', 'http://anutacookie.ru/images/57f7d2dc37d7eda140208950_photo37.jpg', 1),
(101, 'Танчики', 'От 50 шт', 'Размер: 11х7 см', 'Цена: 150р/шт', 'http://anutacookie.ru/images/57f7d3e3b98a5e207582114f_photo38.jpg', 1),
(102, 'Пасхальный набор', 'Набор 3 пряника ( золото)', 'Размер коробки: 10х20 см', 'Цена: 480р', 'http://anutacookie.ru/images/5ca5b508daf05a25871f0a26_proto_00121.jpg', 1),
(103, 'Набор С 8 марта №1', '4 пряника в наборе', 'Размер коробки: 15x15 см', 'Цена: 450р', 'http://anutacookie.ru/images/5c67d79e3ca6bd866433ca1c_photo248.jpg', 1),
(104, 'Набор C 8 Марта №2', '9 пряников', 'Размер коробки: 20x20см', 'Цена: 750р', 'http://anutacookie.ru/images/5c6ff92c2330ed6fae174acb_photo_000100.jpg', 1),
(105, 'Пряники C 8 Марта №1', 'В ассортименте', 'Размер : 10,5х9 см', 'Цена: 150р', 'http://anutacookie.ru/images/5e29602592705953444322c6_photo_feb222_.jpg', 1),
(106, 'Набор C 8 Марта №3', 'Набор пряников 3 шт', 'Размер коробки: 20x10 см', 'Цена: 520р', 'http://anutacookie.ru/images/5c67d86d2e43da16773b2b1d_photo249.jpg', 1),
(107, 'Набор C 8 Марта №4', 'Набор пряников 6 шт', 'Размер коробки: 15x22 см', 'Цена: 600р', 'http://anutacookie.ru/images/5e296026ff92075e0c97f6ed_photo_feb22320.jpg', 1),
(108, 'Набор Птичка', 'Набор пряников 3 шт', 'Размер коробки: 15x15 см', 'Цена: 480р', 'http://anutacookie.ru/images/5e2960336cab06c62b16c6af_photo_feb22520.jpg', 1),
(109, 'Набор C 8 Марта №5', 'Пряник с шок. конфетами', 'Размер коробки: 11x18 см', 'Цена: 450р', 'http://anutacookie.ru/images/5e2974c80ab615250855e978_photo_feb216_.jpg', 1),
(110, 'Пряники C 8 Марта №2', 'В ассортименте', 'Размер коробки: 12x12 см', 'Цена: 250р', 'http://anutacookie.ru/images/5e29602164852b8515d9b251_photo_feb21520.jpg', 1),
(111, 'Набор C 8 Марта №6', 'Набор пряников 4 шт', 'Размер коробки: 11x18 см', 'Цена: 390р', 'http://anutacookie.ru/images/5e29601b0ab61554705508fb_photo_feb21020.jpg', 1),
(112, 'Букет тюльпанов', '5 пряников', 'Размер: 9 см', 'Цена: 1200р', 'http://anutacookie.ru/images/59ec71d541b4090001b58bd2_photo00075.jpg', 1),
(113, 'Набор C 8 Марта №7', 'В ассортименте', 'Размер коробки: 20x10 см', 'Цена: 520р', 'http://anutacookie.ru/images/5c67d8743ca6bd163333ca4e_photo247.jpg', 1),
(114, 'Набор LOVE', '4 Пряника (7 см)', 'Размер коробки: 15х15 см', 'Цена: 480р', 'http://anutacookie.ru/images/5c501ab3e6dca1bd7643d07f_photo239.jpg', 1),
(115, 'Пряники 8 Марта', 'В ассортименте', 'Размер : 10.5 см', 'Цена: 150р', 'http://anutacookie.ru/images/5c5d42ffcd394b15f0d1eb08_D09FD180D18FD0BDD0B8D0BAD0B820820D09CD0B0D180D182D0B0.jpg', 1),
(116, 'Круглые пряники 23', 'В ассортименте', 'Размер : 9 см', 'Цена: 130р', 'http://anutacookie.ru/images/5c59792c7cfe1493504f405a_C20D0B4D0BDD0B5D0BC20D0B7D0B0D189D0B8D182D0BDD0B8D0BAD0B020D0BED182D0B5D187D0B5D181D182D0B2D0B0.jpg', 1),
(117, 'Пряник открытка №1', 'В ассортименте', 'Размер коробки: 14x11 см', 'Цена: 340р', 'http://anutacookie.ru/images/5c4f4485e346b77143b37751_photo231.jpg', 1),
(118, 'Пряник круглый Танк', 'Можно сделать именной', 'Размер : 9 см', 'Цена: 130р', 'http://anutacookie.ru/images/5e29601a92705961d043228e_photo_feb2620.jpg', 1),
(119, 'Пряник открытка №2', 'В ассортименте', 'Размер коробки: 14x11 см', 'Цена: 340р', 'http://anutacookie.ru/images/5e296020ff92074fa697f6df_photo_feb21420.jpg', 1),
(120, 'Детский 23 февраля №1', 'В ассортименте', 'Размер : 12х8,5 см', 'Цена: 150р', 'http://anutacookie.ru/images/5e29601a64852b00e4d9b21d_photo_feb2720.jpg', 1),
(121, 'Набор 23 февраля №1', 'В наборе 3 пряника', 'Размер коробки: 15х22 см', 'Цена: 650р', 'http://anutacookie.ru/images/5e4d7a183450032b703b6bf5_photo_feb22_2.jpg', 1),
(122, 'Пряник 23 февраля', 'В ассортименте', 'Размер коробки: 14x11 см', 'Цена: 340р', 'http://anutacookie.ru/images/5e296e7864852b5d3ada5493_photo_feb29_.jpg', 1),
(123, 'Набор 23 февраля №2', 'В наборе 4 пряника', 'Размер коробки: 15х15 см', 'Цена: 480р', 'http://anutacookie.ru/images/5e29602e64852b5b9cd9b385_photo_feb23520.jpg', 1),
(124, 'Детский 23 февраля №2', 'В ассортименте', 'Размер : 10,5х9 см', 'Цена: 150р', 'http://anutacookie.ru/images/5e29af43591547f9ee013294_photo_feb237_.jpg', 1),
(125, 'Набор 23 февраля №3', 'В наборе 5 пряников', 'Размер коробки: 11х18 см', 'Цена: 390р', 'http://anutacookie.ru/images/5e2960290ab6158055550a26_photo_feb22820.jpg', 1),
(126, 'Для учителя 23 февраля', 'В ассортименте', 'Размер коробки: 20х20 см', 'Цена: 650р', 'http://anutacookie.ru/images/5e29601b74cbda863919bbb0_photo_feb2420.jpg', 1),
(127, 'Набор 23 февраля №4', 'В наборе 6 пряников', 'Размер коробки: 15х22 см', 'Цена: 600р', 'http://anutacookie.ru/images/5e2960270ab61508a9550914_photo_feb22420.jpg', 1),
(128, 'Набор 23 февраля №5', 'В наборе 5 пряников', 'Размер коробки: 11х18 см', 'Цена: 390р', 'http://anutacookie.ru/images/5e2960286cab0682a416c687_photo_feb22620.jpg', 1),
(129, 'Набор 23 февраля №6', '4 пряника в наборе', 'Размер коробки: 15x15 см', 'Цена: 480р', 'http://anutacookie.ru/images/5e29601b6cab0648e716c66e_photo_feb2820.jpg', 1),
(130, 'Набор С праздником 23', '9 пряников в наборе', 'Размер коробки: 21x21см', 'Цена: 750р', 'http://anutacookie.ru/images/5c4f44891a30a833ca39f9d2_photo235.jpg', 1),
(131, 'Набор Мужской набор 5', '5 Пряников', 'Размер коробки: 15x15 см', 'Цена: 450р', 'http://anutacookie.ru/images/5c4f4487dfbd6c349b2879a0_photo233.jpg', 1),
(132, 'Набор Мужской 20', '7 пряников', 'Размер коробки: 20х20 см', 'Цена: 700р', 'http://anutacookie.ru/images/5c4f447de346b704d6b3774d_photo226.jpg', 1),
(133, 'Набор 23 февраля №7', '5 Пряников', 'Размер коробки: 20x20 см', 'Цена:720р', 'http://anutacookie.ru/images/5c4f4487a29a8feccdf22f16_photo232.jpg', 1),
(134, 'Набор Мужской набор 7', '7 Пряников', 'Размер коробки: 21x21 см', 'Цена: 700р', 'http://anutacookie.ru/images/5c4f448ae346b7386fb3775a_photo236.jpg', 1),
(135, 'Набор Мужской набор', '4 Пряника', 'Размер коробки: 15x15 см', 'Цена: 480р', 'http://anutacookie.ru/images/5c4f447de346b710f9b3774c_photo225.jpg', 1),
(136, 'Пряники на 23 февраля', 'Поштучно от 10 шт', 'Размер пряника: 9-12 см', 'Цена: 150р', 'http://anutacookie.ru/images/5c4f4475a29a8f1c3ef22f09_photo224.jpg', 1),
(137, 'Большой набор 23 февр.', 'Набор из 9 пряников', 'Размер коробки: 26x26 см', 'Цена: 1900р', 'http://anutacookie.ru/images/5c67d79e2e43da8fa53b2abf_photo246.jpg', 1),
(138, 'Райские птички', 'ОТ 50 шт', 'Размер: 11х9,5 см', 'Цена: 150р/шт', 'http://anutacookie.ru/images/57f7d3e337d7eda140208aef_photo41.jpg', 1),
(139, 'Набор Мур Мяу', '18 пряников в наборе', 'Размер: 5х5 см', 'Цена: 1500р', 'http://anutacookie.ru/images/57fbd96512dc814745f88802_photo45.jpg', 1),
(140, 'НаборНовый год 2018', '4 пряника', 'Размер: 11см', 'Цена: 700р', 'http://anutacookie.ru/images/5a018c12158a1d0001100864_photo00127.jpg', 1),
(141, 'НаборНГ 2018', '4 пряника', 'Размер: 9-10 см', 'Цена: 750р', 'http://anutacookie.ru/images/5a11b52b808a3a000116c8eb_photo00129.jpg', 1),
(142, 'Новогодние пряники', 'от 4 шт/от 10 шт', 'Размер: 9-10 см', 'Цена: 150р/125р', 'http://anutacookie.ru/images/5a11b52bd85f4b0001a5a8a2_photo00130.jpg', 1),
(143, 'Грустный кот', 'От 8 шт', 'Размер: 6,5 см', 'Цена: 150р', 'http://anutacookie.ru/images/59ecb605f4f8560001ca3d18_photo00088.jpg', 1),
(144, 'Букет тюльпанов 5 шт.', '5 пряника на палочке', 'Размер: 9 см', 'Цена: 1200р', 'http://anutacookie.ru/images/58aefe09f27deb040eeffea1_photo64.jpg', 1),
(145, 'Набор Новогодний №8', '4 пряника в наборе', 'Размер коробки: 20х20 см', 'Цена: 850р', 'http://anutacookie.ru/images/5db80ce6411dd926b3f59631_photo_NG2.jpg', 1),
(146, 'Новогодний пряник №4', 'Мышка с ёлклой от 5 шт', 'Размер: 10 см', 'Цена: 220р', 'http://anutacookie.ru/images/5db80ce86c50c20f29a85dcc_photo_NG4.jpg', 1),
(147, 'Набор Новогодний №1', '2 пряника в наборе', 'Размер коробки: 11x18 см', 'Цена: 480р', 'http://anutacookie.ru/images/5db80ced24ac0731d666188d_photo_NG17.jpg', 1),
(148, 'Новогодний пряник №1', 'Дед мороз от 5 шт', 'Размер: 10 см', 'Цена: 220р', 'http://anutacookie.ru/images/5db80cea24ac07a5b5661881_photo_NG8.jpg', 1),
(149, 'Набор Елки с малиной', '3 пряника в наборе', 'Размер коробки: 10x20 см', 'Цена: 720р', 'http://anutacookie.ru/images/5db80ce82e950ffaff07d82b_photo_NG3.jpg', 1),
(150, 'Новогодний пряник №2', 'Мышонок от 5 шт', 'Размер: 10 см', 'Цена: 220р', 'http://anutacookie.ru/images/5db80ce82e950f50ac07d82c_photo_NG5.jpg', 1),
(151, 'Набор Новогодний №9', '4 пряника в коробочке', 'Размер коробки: 15x15 см', 'Цена: 900р', 'http://anutacookie.ru/images/5dc474cae4c86465449f8225_photo_NG24.jpg', 1),
(152, 'Новогодняя варежка', 'Штучно от 3 шт', 'Размер: 11,5 см', 'Цена: 240р', 'http://anutacookie.ru/images/5dc474cbd6111ec2006e54f1_photo_NG22.jpg', 1),
(153, 'Пряник Новогодний 2020', 'Большой пряник в коробке', 'Размер коробки: 10x20 см', 'Цена: 520р', 'http://anutacookie.ru/images/5dbd491bc2ce78956852a163_photo_NG21.jpg', 1),
(154, 'Набор Новогодний №11', '5 пряников в наборе', 'Размер коробки: 20x20 см', 'Цена: 950р', 'http://anutacookie.ru/images/5db80ceef44c6a22b5b1e0ef_photo_NG18.jpg', 1),
(155, 'Пряник Ёлка-сыр', 'Штучно от 5 шт', 'Размер: 11 см', 'Цена: 220р', 'http://anutacookie.ru/images/5dc474cb8de3ec73ead3812e_photo_NG25.jpg', 1),
(156, 'Набор Новогодний №10', '4 пряника в наборе', 'Размер коробки: 20x20 см', 'Цена: 650р', 'http://anutacookie.ru/images/5dd29e7bc5a7ed3e6f63ca15_photo_NG27.jpg', 1),
(157, 'Новогодний пряник №7', 'Штучно от 5 шт', 'Размер: 10 см', 'Цена: 180р', 'http://anutacookie.ru/images/5dd29e75edfe6a8d2175ff32_photo_NG26.jpg', 1),
(158, 'Любой пряник из наборов', 'Штучно от 5 шт', 'Размер: 10 см', 'Цена: 220р', 'http://anutacookie.ru/images/5db80cef6c50c20f8fa85dd1_photo_NG20.jpg', 1),
(159, 'Пряник Открытка', 'Именной от Деда Мороза', 'Размер коробки: 14x11 см', 'Цена: 410р', 'http://anutacookie.ru/images/5be58ae1520fa6070905d026_proho0089.jpg', 1),
(160, 'Новогодний пряник №3', 'Мышка с НГ от 5 шт', 'Размер: 10 см', 'Цена: 220р', 'http://anutacookie.ru/images/5db80ce9411dd953cef59635_photo_NG7.jpg', 1),
(161, 'Новогодний пряник №6', 'Снеговик от 5 шт', 'Размер: 10 см', 'Цена: 220р', 'http://anutacookie.ru/images/5db80ce8f44c6a2b31b1e0d5_photo_NG6.jpg', 1),
(162, 'Пряник Новогодний шар', 'Пряник в коробочке', 'Размер коробки: 12x12 см', 'Цена: 340р', 'http://anutacookie.ru/images/5db80fef411dd9312ff5a8e5_photo_NG14b.jpg', 1),
(163, 'Набор Санта', '4 пряника в наборе', 'Размер коробки: 14x14 см', 'Цена: 450р', 'http://anutacookie.ru/images/5be58ae5118c4be1601637ba_proho0087.jpg', 1),
(164, 'Пряник Мышонок 2020', 'Пряник в коробочке', 'Размер коробки: 12x12 см', 'Цена: 320р', 'http://anutacookie.ru/images/5db80cec2e950f621507d834_photo_NG15.jpg', 1),
(165, 'Пряник Мышка с НГ', 'Пряник в коробочке', 'Размер коробки: 12x12 см', 'Цена: 320р', 'http://anutacookie.ru/images/5db80ceef44c6ab2fcb1e0ee_photo_NG16.jpg', 1),
(166, 'Набор Новогодний №6', '2пряника в наборе', 'Размер коробки: 10x20 см', 'Цена: 500р', 'http://anutacookie.ru/images/5db80ceafce78640659c1bae_photo_NG9.jpg', 1),
(167, 'Набор Новогодний №2', '2 пряника в наборе', 'Размер коробки: 11x18 см', 'Цена: 490р', 'http://anutacookie.ru/images/5db80cedfce78645799c1bc1_photo_NG19.jpg', 1),
(168, 'Набор Новогодний №3', '2 пряника в наборе', 'Размер коробки: 11x18 см', 'Цена:490р', 'http://anutacookie.ru/images/5db80cedf44c6ada77b1e0ea_photo_NG13.jpg', 1),
(169, 'Набор Новогодний №4', '2 пряника в наборе', 'Размер коробки: 10x20 см', 'Цена: 490р', 'http://anutacookie.ru/images/5db80ceb2e950f8f7807d831_photo_NG11.jpg', 1),
(170, 'Набор Новогодний №7', '4 пряника в наборе', 'Размер коробки: 20х20 см', 'Цена: 850р', 'http://anutacookie.ru/images/5db80ce7411dd91a20f59633_photo_NG1.jpg', 1),
(171, 'Набор Новогодний №11', '4 пряника в наборе', 'Размер коробки: 20х20 см', 'Цена: 650р', 'http://anutacookie.ru/images/5dd29e7bc54c881e1a1b0599_photo_NG28.jpg', 1),
(172, 'Пряничный домик', 'С логотипом компании', 'Размер: 15 см', 'Цена: 1900р', 'http://anutacookie.ru/images/5be58ae1118c4b71001637b5_proho0091.jpg', 1),
(173, 'Новый товар', 'От 10 шт', 'Размер 12см', 'Цена 130р.', '/img/products/img1.jpg', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category-products`
--
ALTER TABLE `category-products`
  ADD PRIMARY KEY (`id_cp`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `category-products`
--
ALTER TABLE `category-products`
  MODIFY `id_cp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
