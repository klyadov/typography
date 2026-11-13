-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 13 2026 г., 09:07
-- Версия сервера: 10.11.16-MariaDB
-- Версия PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `typography`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `name_customer` varchar(150) NOT NULL,
  `inn_customer` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`id_customer`, `name_customer`, `inn_customer`, `address`, `phone`) VALUES
(1, 'ООО \"Реклама-Плюс\"', '7701234567', 'город Москва, улица Ленина 1', '+7 495 111-22-33'),
(2, 'ПАО \"Сбербанк\"', '7707083893', 'город Москва, улица Вавилова 19', '+7 495 500-55-50');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `position` varchar(100) NOT NULL,
  `id_workshop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id_employee`, `full_name`, `position`, `id_workshop`) VALUES
(1, 'Макаров Вадим Игоревич', 'Начальник диспетчерского отдела', 1),
(2, 'Иванов Алексей Сергеевич', 'Старший печатник', 1),
(3, 'Сидорова Елена Михайловна', 'Менеджер продаж', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `equipment`
--

CREATE TABLE `equipment` (
  `id_equipment` int(11) NOT NULL,
  `title_equipment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `equipment`
--

INSERT INTO `equipment` (`id_equipment`, `title_equipment`) VALUES
(1, 'Офсетная печатная машина'),
(2, 'Цифровая печатная машина'),
(3, 'Резак гильотинный');

-- --------------------------------------------------------

--
-- Структура таблицы `material`
--

CREATE TABLE `material` (
  `id_material` int(11) NOT NULL,
  `title_material` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `material`
--

INSERT INTO `material` (`id_material`, `title_material`) VALUES
(1, 'Бумага мелованная матовая'),
(2, 'Бумага офсетная'),
(3, 'Картон упаковочный');

-- --------------------------------------------------------

--
-- Структура таблицы `order_detail`
--

CREATE TABLE `order_detail` (
  `id_detail` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_tech_card` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_detail`
--

INSERT INTO `order_detail` (`id_detail`, `id_order`, `id_tech_card`, `quantity`, `price`) VALUES
(1, 1001, 1, 5000, 250000.00),
(2, 1001, 2, 10000, 45000.00),
(3, 1002, 3, 2000, 180000.00),
(4, 1003, 1, 3000, 150000.00);

-- --------------------------------------------------------

--
-- Структура таблицы `print_order`
--

CREATE TABLE `print_order` (
  `id_order` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_deadline` datetime NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `print_order`
--

INSERT INTO `print_order` (`id_order`, `date_created`, `date_deadline`, `id_customer`, `id_employee`) VALUES
(1001, '2025-11-01 09:00:00', '2025-11-10 18:00:00', 1, 3),
(1002, '2025-11-02 10:30:00', '2025-11-05 18:00:00', 2, 3),
(1003, '2026-11-13 13:04:36', '2025-11-20 18:00:00', 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `production_task`
--

CREATE TABLE `production_task` (
  `id_task` int(11) NOT NULL,
  `id_detail` int(11) NOT NULL,
  `id_equipment` int(11) NOT NULL,
  `work_type` varchar(50) NOT NULL DEFAULT 'Печать'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `production_task`
--

INSERT INTO `production_task` (`id_task`, `id_detail`, `id_equipment`, `work_type`) VALUES
(1, 1, 1, 'Печать'),
(2, 1, 3, 'Постпресс'),
(3, 2, 2, 'Печать'),
(4, 3, 1, 'Печать'),
(5, 4, 1, 'Печать');

-- --------------------------------------------------------

--
-- Структура таблицы `tech_card`
--

CREATE TABLE `tech_card` (
  `id_tech_card` int(11) NOT NULL,
  `product_type` varchar(100) NOT NULL,
  `format_size` varchar(50) NOT NULL,
  `id_material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tech_card`
--

INSERT INTO `tech_card` (`id_tech_card`, `product_type`, `format_size`, `id_material`) VALUES
(1, 'Календарь настенный', 'А3', 1),
(2, 'Бланк фирменный', 'А4', 2),
(3, 'Упаковка самосборная', 'Индивидуальный', 3);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `vw_popular_orders_summary`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `vw_popular_orders_summary` (
`id_order` int(11)
,`name_customer` varchar(150)
,`product_type` varchar(100)
,`format_size` varchar(50)
,`quantity` int(11)
,`price` decimal(10,2)
,`date_deadline` datetime
);

-- --------------------------------------------------------

--
-- Структура таблицы `workshop`
--

CREATE TABLE `workshop` (
  `id_workshop` int(11) NOT NULL,
  `title_workshop` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `workshop`
--

INSERT INTO `workshop` (`id_workshop`, `title_workshop`) VALUES
(1, 'Цех офсетной печати'),
(2, 'Цех цифровой печати'),
(3, 'Участок постпресса');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`),
  ADD KEY `id_workshop` (`id_workshop`);

--
-- Индексы таблицы `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id_equipment`);

--
-- Индексы таблицы `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`);

--
-- Индексы таблицы `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_tech_card` (`id_tech_card`),
  ADD KEY `idx_order_detail_price` (`price`),
  ADD KEY `idx_order_detail_fk_order` (`id_order`);

--
-- Индексы таблицы `print_order`
--
ALTER TABLE `print_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Индексы таблицы `production_task`
--
ALTER TABLE `production_task`
  ADD PRIMARY KEY (`id_task`),
  ADD KEY `id_detail` (`id_detail`),
  ADD KEY `id_equipment` (`id_equipment`);

--
-- Индексы таблицы `tech_card`
--
ALTER TABLE `tech_card`
  ADD PRIMARY KEY (`id_tech_card`),
  ADD KEY `id_material` (`id_material`);

--
-- Индексы таблицы `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`id_workshop`);

-- --------------------------------------------------------

--
-- Структура для представления `vw_popular_orders_summary`
--
DROP TABLE IF EXISTS `vw_popular_orders_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_popular_orders_summary`  AS SELECT `po`.`id_order` AS `id_order`, `c`.`name_customer` AS `name_customer`, `tc`.`product_type` AS `product_type`, `tc`.`format_size` AS `format_size`, `od`.`quantity` AS `quantity`, `od`.`price` AS `price`, `po`.`date_deadline` AS `date_deadline` FROM (((`print_order` `po` join `customer` `c` on(`po`.`id_customer` = `c`.`id_customer`)) join `order_detail` `od` on(`po`.`id_order` = `od`.`id_order`)) join `tech_card` `tc` on(`od`.`id_tech_card` = `tc`.`id_tech_card`)) ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id_workshop`) REFERENCES `workshop` (`id_workshop`);

--
-- Ограничения внешнего ключа таблицы `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `print_order` (`id_order`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`id_tech_card`) REFERENCES `tech_card` (`id_tech_card`);

--
-- Ограничения внешнего ключа таблицы `print_order`
--
ALTER TABLE `print_order`
  ADD CONSTRAINT `print_order_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `print_order_ibfk_2` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_employee`);

--
-- Ограничения внешнего ключа таблицы `production_task`
--
ALTER TABLE `production_task`
  ADD CONSTRAINT `production_task_ibfk_1` FOREIGN KEY (`id_detail`) REFERENCES `order_detail` (`id_detail`),
  ADD CONSTRAINT `production_task_ibfk_2` FOREIGN KEY (`id_equipment`) REFERENCES `equipment` (`id_equipment`);

--
-- Ограничения внешнего ключа таблицы `tech_card`
--
ALTER TABLE `tech_card`
  ADD CONSTRAINT `tech_card_ibfk_1` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
