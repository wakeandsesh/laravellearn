-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 28 2022 г., 19:02
-- Версия сервера: 5.7.33
-- Версия PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `viki-grill`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_mob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `description`, `image_mob`, `image_desc`, `_lft`, `_rgt`, `parent_id`, `created_at`, `updated_at`) VALUES
(5, 'Бургеры', 'burgery', '<p>Описание&nbsp;</p>', 'categories\\January2022\\keoeQd0fnWDl4JXR5DPC.png', 'categories\\January2022\\xsCsHy02frcZQJsGXZE3.png', 1, 2, NULL, '2022-01-21 11:58:00', '2022-01-26 14:11:17'),
(6, 'Хотдоги', 'hotdogi', '<p>Описание хот доги</p>', 'categories\\January2022\\h0cbMzZXw1ma7ctELyuo.png', 'categories\\January2022\\BTLCP7CrUACG9TzXxsgz.png', 3, 4, NULL, '2022-01-21 11:59:00', '2022-01-27 11:16:58'),
(7, 'Кофе / Чай', 'kofe-chaj', '<p>Описание</p>', 'categories\\January2022\\CkXPH3lSKK0sNO09kyp2.png', 'categories\\January2022\\qeqkcWcOmI3iL3MyQQ24.png', 5, 6, NULL, '2022-01-21 11:59:00', '2022-01-27 11:17:16'),
(8, 'Десерты', 'deserty', '<p>Описание</p>', 'categories\\January2022\\hAlSG9ew9KGoJm6aYnTo.png', 'categories\\January2022\\PMGsNte0zJEBYRbRmPLf.png', 7, 8, NULL, '2022-01-21 12:00:00', '2022-01-27 11:16:39'),
(9, 'Напитки', 'napitki', '<p>Описание</p>', 'categories\\January2022\\Ip0pziFBpMrlXcbSsDLT.png', NULL, 9, 10, NULL, '2022-01-26 14:15:00', '2022-01-27 11:16:09');

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(24, 4, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"},\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:categories,slug\"}}', 3),
(25, 4, 'description', 'rich_text_box', 'Описание', 0, 0, 1, 1, 1, 1, '{}', 4),
(26, 4, 'image_mob', 'image', 'Изображение (телефон)', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"80%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"cropped\",\"crop\":{\"width\":\"100\",\"height\":\"100\"}}]}', 5),
(27, 4, 'image_desc', 'image', 'Изображение (компьютер)', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"80%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"cropped\",\"crop\":{\"width\":\"710\",\"height\":\"420\"}}]}', 6),
(28, 4, '_lft', 'text', 'Lft', 1, 0, 0, 0, 0, 0, '{}', 7),
(29, 4, '_rgt', 'text', 'Rgt', 1, 0, 0, 0, 0, 0, '{}', 8),
(30, 4, 'parent_id', 'text', 'Parent Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(31, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(32, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(33, 5, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(34, 5, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(35, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"},\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:products,slug\"}}', 3),
(36, 5, 'description', 'rich_text_box', 'Описание', 0, 0, 1, 1, 1, 1, '{}', 4),
(37, 5, 'image', 'image', 'Изображение', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"80%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"cropped\",\"crop\":{\"width\":\"600\",\"height\":\"600\"}}]}', 5),
(38, 5, 'price', 'text', 'Цена, грн.', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 6),
(39, 5, 'category_id', 'text', 'Category Id', 1, 1, 1, 1, 1, 1, '{}', 7),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(42, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(43, 6, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(44, 6, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"},\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 3),
(45, 6, 'description', 'rich_text_box', 'Описание', 1, 1, 1, 1, 1, 1, '{}', 4),
(46, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(47, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(48, 7, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(49, 7, 'name', 'text', 'Ф.И.О.', 1, 1, 1, 0, 0, 0, '{}', 2),
(50, 7, 'phone', 'text', 'Номер телефона', 1, 1, 1, 0, 0, 0, '{}', 3),
(51, 7, 'payment_method', 'text', 'Payment Method', 1, 1, 1, 0, 0, 0, '{}', 4),
(52, 7, 'paid', 'text', 'Статус', 1, 1, 1, 0, 0, 0, '{}', 5),
(53, 7, 'body', 'text', 'Товары', 1, 0, 1, 0, 0, 0, '{}', 6),
(54, 7, 'total_price', 'number', 'Общая цена', 1, 1, 1, 0, 0, 0, '{}', 7),
(55, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 8),
(56, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(57, 4, 'category_belongsto_category_relationship', 'relationship', 'Родительская категория', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(58, 5, 'product_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-01-11 13:32:54', '2022-01-11 13:32:54'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-01-11 13:32:54', '2022-01-11 13:32:54'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-01-11 13:32:55', '2022-01-11 13:32:55'),
(4, 'categories', 'categories', 'Категория', 'Категории', 'voyager-categories', 'App\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-12 07:25:56', '2022-01-26 14:10:17'),
(5, 'products', 'products', 'Товар', 'Товары', 'voyager-pizza', 'App\\Models\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-12 07:31:29', '2022-01-12 07:49:08'),
(6, 'pages', 'pages', 'Страница', 'Страницы', 'voyager-window-list', 'App\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-01-12 07:33:46', '2022-01-12 07:33:46'),
(7, 'orders', 'orders', 'Заказ', 'Заказы', 'voyager-wallet', 'App\\Models\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-01-12 07:36:35', '2022-01-25 12:08:23');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-01-11 13:32:55', '2022-01-11 13:32:55');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Главная страница', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2022-01-11 13:32:56', '2022-01-11 13:34:33', 'voyager.dashboard', 'null'),
(2, 1, 'Медиа', '', '_self', 'voyager-images', '#000000', 5, 3, '2022-01-11 13:32:56', '2022-01-11 13:35:42', 'voyager.media.index', 'null'),
(3, 1, 'Пользователи', '', '_self', 'voyager-person', '#000000', 5, 1, '2022-01-11 13:32:56', '2022-01-11 13:35:38', 'voyager.users.index', 'null'),
(4, 1, 'Роли', '', '_self', 'voyager-lock', '#000000', 5, 2, '2022-01-11 13:32:56', '2022-01-11 13:35:40', 'voyager.roles.index', 'null'),
(5, 1, 'Инструменты', '', '_self', 'voyager-tools', '#000000', NULL, 6, '2022-01-11 13:32:56', '2022-01-12 07:39:49', NULL, ''),
(6, 1, 'Конструктор меню', '', '_self', 'voyager-list', '#000000', 5, 4, '2022-01-11 13:32:56', '2022-01-11 13:35:42', 'voyager.menus.index', 'null'),
(7, 1, 'База данных', '', '_self', 'voyager-data', '#000000', 5, 5, '2022-01-11 13:32:56', '2022-01-11 13:35:52', 'voyager.database.index', 'null'),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 6, '2022-01-11 13:32:56', '2022-01-11 13:35:42', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 7, '2022-01-11 13:32:56', '2022-01-11 13:35:43', 'voyager.bread.index', NULL),
(10, 1, 'Настройки', '', '_self', 'voyager-settings', '#000000', NULL, 7, '2022-01-11 13:32:56', '2022-01-12 07:39:49', 'voyager.settings.index', 'null'),
(11, 1, 'Категории', '', '_self', 'voyager-categories', NULL, NULL, 2, '2022-01-12 07:25:57', '2022-01-12 07:39:39', 'voyager.categories.index', NULL),
(12, 1, 'Товары', '', '_self', 'voyager-pizza', NULL, NULL, 3, '2022-01-12 07:31:30', '2022-01-12 07:39:42', 'voyager.products.index', NULL),
(13, 1, 'Страницы', '', '_self', 'voyager-window-list', NULL, NULL, 4, '2022-01-12 07:33:46', '2022-01-12 07:39:46', 'voyager.pages.index', NULL),
(14, 1, 'Заказы', '', '_self', 'voyager-wallet', NULL, NULL, 5, '2022-01-12 07:36:35', '2022-01-12 07:39:49', 'voyager.orders.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_01_11_154329_create_categories_table', 2),
(26, '2022_01_11_154422_create_products_table', 2),
(27, '2022_01_11_154538_create_orders_table', 2),
(28, '2022_01_11_154610_create_pages_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `payment_method`, `paid`, `body`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 'Vlad', '0637850407', 'Оплата наличными', 'Не оплачено', '{\"2\":{\"id\":2,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 1\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\AozrwprPITbvoRpaeW98.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 110, '2022-01-24 13:19:09', '2022-01-24 13:19:09'),
(2, 'Валик', '0637850407', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 55, '2022-01-24 13:23:52', '2022-01-24 13:23:52'),
(3, 'Валик', '0637850407', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 55, '2022-01-24 13:24:17', '2022-01-24 13:24:17'),
(5, 'Илюха', '0637850407', 'Оплата на карту', 'Оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"3\":{\"id\":3,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 2\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\GTB3agRnPmjVrrOjyl24.png\"},\"conditions\":[]}}', 165, '2022-01-24 13:33:57', '2022-01-24 13:33:57'),
(6, 'Влад Дунаев', '0637850407', 'Оплата на карту', 'Оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]},\"2\":{\"id\":2,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 1\",\"price\":55,\"quantity\":3,\"attributes\":{\"image\":\"products\\\\January2022\\\\AozrwprPITbvoRpaeW98.png\"},\"conditions\":[]},\"3\":{\"id\":3,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 2\",\"price\":55,\"quantity\":1,\"attributes\":{\"image\":\"products\\\\January2022\\\\GTB3agRnPmjVrrOjyl24.png\"},\"conditions\":[]}}', 275, '2022-01-24 14:04:11', '2022-01-24 14:04:11'),
(7, 'Илюха', '0637850407', 'Оплата на карту', 'Оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":5,\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 385, '2022-01-25 06:40:32', '2022-01-25 06:40:32'),
(8, 'Фотографии', '0637850407', 'Оплата наличными', 'Не оплачено', '{\"2\":{\"id\":2,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 1\",\"price\":55,\"quantity\":3,\"attributes\":{\"image\":\"products\\\\January2022\\\\AozrwprPITbvoRpaeW98.png\"},\"conditions\":[]},\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":6,\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]}}', 495, '2022-01-25 08:36:23', '2022-01-25 08:36:23'),
(9, 'Владислав', '+380669890094', 'Оплата наличными', 'Не оплачено', '[]', 0, '2022-01-26 07:09:12', '2022-01-26 07:09:12'),
(10, 'Владислав', '+380669890094', 'Оплата наличными', 'Не оплачено', '[]', 0, '2022-01-26 07:09:12', '2022-01-26 07:09:12'),
(11, 'Валик', '0637850407', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":4,\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 330, '2022-01-27 11:36:05', '2022-01-27 11:36:05'),
(12, 'vlad', '+38(066) 287-4606', 'Оплата на карту', 'Оплачено', '{\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 55, '2022-01-27 11:48:12', '2022-01-27 11:48:12'),
(13, 'Влад', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 110, '2022-01-27 12:55:36', '2022-01-27 12:55:36'),
(14, 'Влад', '+38(999) 999-9999', 'Оплата наличными', 'Не оплачено', '[]', 0, '2022-01-27 13:12:31', '2022-01-27 13:12:31'),
(15, 'Влад', '+38(999) 999-9999', 'Оплата наличными', 'Не оплачено', '{\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 110, '2022-01-27 13:12:31', '2022-01-27 13:12:31'),
(16, 'sdsdf', '+38(999) 999-9999', 'Оплата наличными', 'Не оплачено', '[]', 0, '2022-01-27 13:14:24', '2022-01-27 13:14:24'),
(17, 'Влад', '+38(066) 287-4606', 'Оплата на карту', 'Оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 55, '2022-01-27 13:54:47', '2022-01-27 13:54:47'),
(18, 'Влад', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 55, '2022-01-28 06:26:34', '2022-01-28 06:26:34'),
(19, 'dgf', '+38(456) 789-6544', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 110, '2022-01-28 07:10:19', '2022-01-28 07:10:19'),
(20, 'Влад', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:16:09', '2022-01-28 07:16:09'),
(21, 'fdgg', '+38(789) 898-9898', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:17:03', '2022-01-28 07:17:03'),
(22, 'fgdfgfdg', '+38(566) 756-7567', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:18:47', '2022-01-28 07:18:47'),
(23, 'ffdgf', '+38(435) 456-5546', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:19:44', '2022-01-28 07:19:44'),
(24, 'vlad', '+38(324) 523-4234', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:21:01', '2022-01-28 07:21:01'),
(25, '54353', '+38(435) 353-5345', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:21:54', '2022-01-28 07:21:54'),
(26, 'vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:22:42', '2022-01-28 07:22:42'),
(27, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:23:30', '2022-01-28 07:23:30'),
(28, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:27:57', '2022-01-28 07:27:57'),
(29, 'Vlad 1', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:30:46', '2022-01-28 07:30:46'),
(30, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:32:35', '2022-01-28 07:32:35'),
(31, 'Vlad 1', '+38(065) 656-4564', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:34:50', '2022-01-28 07:34:50'),
(32, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:36:47', '2022-01-28 07:36:47'),
(33, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:40:00', '2022-01-28 07:40:00'),
(34, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:40:47', '2022-01-28 07:40:47'),
(35, 'Vlad 1', '+38(034) 252-3453', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:41:09', '2022-01-28 07:41:09'),
(36, 'Vlad 1', '+38(354) 534-5435', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:41:38', '2022-01-28 07:41:38'),
(37, 'fdsfds', '+38(324) 234-3242', 'Оплата наличными', 'Не оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:42:45', '2022-01-28 07:42:45'),
(38, 'Vlad 2', '+38(543) 564-7567', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:47:34', '2022-01-28 07:47:34'),
(39, 'Vlad', '+38(665) 645-6456', 'Оплата наличными', 'Не оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:49:15', '2022-01-28 07:49:15'),
(40, 'Vlad', '+38(356) 776-8767', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:50:51', '2022-01-28 07:50:51'),
(41, 'dffdgh', '+38(457) 875-6865', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:55:08', '2022-01-28 07:55:08'),
(42, 'kml', '+38(878) 789-9798', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 55, '2022-01-28 07:57:43', '2022-01-28 07:57:43'),
(43, 'yjhgj', '+38(546) 546-4564', 'Оплата наличными', 'Не оплачено', '{\"3\":{\"id\":3,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 2\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\GTB3agRnPmjVrrOjyl24.png\"},\"conditions\":[]}}', 55, '2022-01-28 08:00:41', '2022-01-28 08:00:41'),
(44, 'Влад', '+38(066) 287-4606', 'Оплата на карту', 'Оплачено', '{\"3\":{\"id\":3,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 2\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\GTB3agRnPmjVrrOjyl24.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:02:16', '2022-01-28 08:02:16'),
(45, 'Влад', '+38(678) 767-5567', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:05:44', '2022-01-28 08:05:44'),
(46, 'Vlad', '+38(787) 678-6787', 'Оплата наличными', 'Не оплачено', '{\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:07:10', '2022-01-28 08:07:10'),
(47, 'sfddghg', '+38(767) 566-5755', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:25:20', '2022-01-28 08:25:20'),
(48, 'fdfsfdsf', '+38(453) 534-6436', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:26:22', '2022-01-28 08:26:22'),
(49, 'rytryr', '+38(644) 564-5664', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:27:00', '2022-01-28 08:27:00'),
(50, 'fgdgd', '+38(435) 354-3545', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:29:48', '2022-01-28 08:29:48'),
(51, 'fgdfg', '+38(345) 453-5453', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 110, '2022-01-28 08:31:57', '2022-01-28 08:31:57'),
(52, 'dsfdsf', '+38(546) 456-4565', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:32:33', '2022-01-28 08:32:33'),
(53, 'dsf', '+38(454) 545-4455', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:35:36', '2022-01-28 08:35:36'),
(54, 'sdfsdsdf', '+38(324) 353-4534', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:38:27', '2022-01-28 08:38:27'),
(55, 'dgfgfd', '+38(546) 456-4654', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:40:33', '2022-01-28 08:40:33'),
(56, 'gdgd', '+38(454) 354-3535', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:41:06', '2022-01-28 08:41:06'),
(57, 'dsf', '+38(345) 345-3453', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:42:09', '2022-01-28 08:42:09'),
(58, 'fggfh', '+38(354) 534-5435', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:43:01', '2022-01-28 08:43:01'),
(59, 'куццу', '+38(543) 534-5345', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:49:52', '2022-01-28 08:49:52'),
(60, 'dfg', '+38(454) 543-5345', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:51:34', '2022-01-28 08:51:34'),
(61, 'rete', '+38(465) 464-5645', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:51:59', '2022-01-28 08:51:59'),
(62, 'dgfdg', '+38(543) 534-5345', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:57:37', '2022-01-28 08:57:37'),
(63, 'dfdf', '+38(343) 434-5334', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:58:48', '2022-01-28 08:58:48'),
(64, 'edwf', '+38(324) 234-2342', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 08:59:50', '2022-01-28 08:59:50'),
(65, '234234', '+38(322) 432-4234', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]}}', 220, '2022-01-28 09:00:08', '2022-01-28 09:00:08'),
(66, '3424', '+38(345) 435-3453', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:04:26', '2022-01-28 09:04:26'),
(67, 'hrh', '+38(543) 453-4543', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:05:03', '2022-01-28 09:05:03'),
(68, 'gdg', '+38(324) 324-2343', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:20:28', '2022-01-28 09:20:28'),
(69, 'dgdf', '+38(345) 345-4353', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:22:43', '2022-01-28 09:22:43'),
(70, 'fgfdg', '+38(435) 354-5345', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:24:43', '2022-01-28 09:24:43'),
(71, 'dsfdfsdf', '+38(324) 234-2342', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:25:02', '2022-01-28 09:25:02'),
(72, 'fdfgfd', '+38(434) 533-5354', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:26:12', '2022-01-28 09:26:12'),
(73, 'fdsfsd', '+38(324) 434-3424', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:27:10', '2022-01-28 09:27:10'),
(74, 'fdgf', '+38(435) 435-4353', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:28:32', '2022-01-28 09:28:32'),
(75, 'dfgdd', '+38(324) 234-2343', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:28:52', '2022-01-28 09:28:52'),
(76, 'kjbkj', '+38(554) 645-6456', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:29:30', '2022-01-28 09:29:30'),
(77, 'dsfsd', '+38(324) 324-3243', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:30:57', '2022-01-28 09:30:57'),
(78, 'fdgdf', '+38(435) 353-4535', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:34:00', '2022-01-28 09:34:00'),
(79, 'df', '+38(434) 543-5345', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:44:56', '2022-01-28 09:44:56'),
(80, 'kook', '+38(987) 098-9890', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:48:50', '2022-01-28 09:48:50'),
(81, 'sdfs', '+38(324) 234-3243', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:49:29', '2022-01-28 09:49:29'),
(82, 'dsfs', '+38(324) 343-4324', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:50:20', '2022-01-28 09:50:20'),
(83, 'Влад', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]}}', 275, '2022-01-28 09:51:42', '2022-01-28 09:51:42'),
(84, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]},\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 165, '2022-01-28 09:55:36', '2022-01-28 09:55:36'),
(85, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]},\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]}}', 165, '2022-01-28 09:57:00', '2022-01-28 09:57:00'),
(86, 'Влад', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]}}', 220, '2022-01-28 10:02:34', '2022-01-28 10:02:34'),
(87, 'Vlad', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"2\":{\"id\":2,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 1\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\AozrwprPITbvoRpaeW98.png\"},\"conditions\":[]},\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 165, '2022-01-28 10:05:18', '2022-01-28 10:05:18'),
(88, 'Влад', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]},\"4\":{\"id\":4,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 3\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\ikqbOEFE28UZU1wMkbz8.png\"},\"conditions\":[]},\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]}}', 165, '2022-01-28 10:06:07', '2022-01-28 10:06:07'),
(89, 'Влад', '+38(066) 287-4606', 'Оплата наличными', 'Не оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]},\"2\":{\"id\":2,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 1\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\AozrwprPITbvoRpaeW98.png\"},\"conditions\":[]},\"5\":{\"id\":5,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 4\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\j3YGpJLFlJ66TVkC8Cao.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 220, '2022-01-28 10:09:31', '2022-01-28 10:09:31'),
(90, 'Владислав Дунаев', '+38(066) 287-4606', 'Оплата на карту', 'Оплачено', '{\"2\":{\"id\":2,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 1\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\AozrwprPITbvoRpaeW98.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]},\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]}}', 275, '2022-01-28 10:17:32', '2022-01-28 10:17:32'),
(91, 'Владислав', '+38(066) 287-4606', 'Оплата на карту', 'Оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]},\"2\":{\"id\":2,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 1\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\AozrwprPITbvoRpaeW98.png\"},\"conditions\":[]},\"3\":{\"id\":3,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 2\",\"price\":55,\"quantity\":\"1\",\"attributes\":{\"image\":\"products\\\\January2022\\\\GTB3agRnPmjVrrOjyl24.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 275, '2022-01-28 10:19:37', '2022-01-28 10:19:37'),
(92, 'Vlad', '+38(342) 345-4354', 'Оплата наличными', 'Не оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":1,\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":1,\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 110, '2022-01-28 11:04:23', '2022-01-28 11:04:23'),
(93, 'Vlad', '+38(342) 345-4354', 'Оплата на карту', 'Оплачено', '{\"1\":{\"id\":1,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u043d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"price\":55,\"quantity\":1,\"attributes\":{\"image\":\"products\\\\January2022\\\\H74tjqM2w3HnCBrTIYKn.png\"},\"conditions\":[]},\"7\":{\"id\":7,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 \\u0441 \\u044f\\u0439\\u0446\\u043e\\u043c\",\"price\":54.99,\"quantity\":1,\"attributes\":{\"image\":\"products\\\\January2022\\\\FbNKYcSrDoPeWqp11O6s.png\"},\"conditions\":[]}}', 110, '2022-01-28 11:04:23', '2022-01-28 11:04:23'),
(94, 'авыа', '+38(342) 343-2432', 'Оплата наличными', 'Не оплачено', '{\"6\":{\"id\":6,\"name\":\"\\u0411\\u0443\\u0440\\u0433\\u0435\\u0440 5\",\"price\":55,\"quantity\":2,\"attributes\":{\"image\":\"products\\\\January2022\\\\W6tVRogldQCa9ZHgYGjB.png\"},\"conditions\":[]}}', 110, '2022-01-28 13:39:14', '2022-01-28 13:39:14');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'О нас', 'o-nas', '<p><span style=\"color: #2c2f34; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Oxygen-Sans, Ubuntu, Cantarell, \'Helvetica Neue\', \'Open Sans\', Arial, sans-serif; font-size: 13px; background-color: #ffffff;\"><strong>&laquo;ХХХ &mdash; крупная IT компания, основанная в ХХХХ году</strong>. Директор компании смог превратить своё хобби в прибыльный и процветающий бизнес всего за два года. Не смотря на то, что компания на рынке недавно опыт сотрудников, которые работают в компании&mdash; от Х лет. Благодаря квалифицированным кадрам компания предоставляет высокий уровень сервиса и при этом клиентам не нужно переплачивать за громкое имя фирмы. </span></p>\r\n<p><span style=\"color: #2c2f34; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Oxygen-Sans, Ubuntu, Cantarell, \'Helvetica Neue\', \'Open Sans\', Arial, sans-serif; font-size: 13px; background-color: #ffffff;\">Руководитель компании тщательно контролирует работу каждого сотрудника и отдела, поэтому качественный и высококвалифицированный сервис клиентам гарантирован. Также сотрудники каждый год проходят курсы повышения квалификации и сертификацию. Фактически, схема работы схожа с работой охранного агентства &mdash; в котором спецотряд администраторов спешит на помощь как только случится беда. </span></p>\r\n<p><span style=\"color: #2c2f34; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Oxygen-Sans, Ubuntu, Cantarell, \'Helvetica Neue\', \'Open Sans\', Arial, sans-serif; font-size: 13px; background-color: #ffffff;\">На этапе запуска компанией было привлечено ХХХ инвестиций и уже за первый год компания вышла в прибыль. Качественный сервис &mdash; залог успеха компании. Конечно, были и трудности, особенно в первые месяцы работы, когда много ресурсов уходило на рекламу, но сейчас всё позади. Компания смогла заработать себе достойную репутацию. Отзывы наших клиентов на сайте и в соцсетях &mdash; реальное тому доказательство. </span></p>\r\n<p><span style=\"color: #2c2f34; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Oxygen-Sans, Ubuntu, Cantarell, \'Helvetica Neue\', \'Open Sans\', Arial, sans-serif; font-size: 13px; background-color: #ffffff;\">Ближайшая цель компании &mdash; открытие сети филиалов в 17 городах России, потому что это направление действительно востребовано и есть куда расти и развиваться. Позвоните по телефону <a title=\"phone\" href=\"tel:380662874609\">+380662874609 </a>и специалисты смогут ответить на все интересующие вас вопросы, как по услугам компании, так</span><span style=\"color: #2c2f34; font-family: -apple-system, BlinkMacSystemFont, \'Segoe UI\', Roboto, Oxygen, Oxygen-Sans, Ubuntu, Cantarell, \'Helvetica Neue\', \'Open Sans\', Arial, sans-serif; font-size: 13px;\"> и по взаимовыгодному сотрудничеству&raquo;.&nbsp;</span></p>\r\n<div><img src=\"http://localhost:3000/storage/pages/January2022/IMG-fdb8e2d40ebc3d3d1c3835dfb8808b83-V.png\" alt=\"\" width=\"375\" height=\"363\" /></div>', '2022-01-12 07:57:00', '2022-01-12 08:06:11');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-01-11 13:32:56', '2022-01-11 13:32:56'),
(2, 'browse_bread', NULL, '2022-01-11 13:32:56', '2022-01-11 13:32:56'),
(3, 'browse_database', NULL, '2022-01-11 13:32:56', '2022-01-11 13:32:56'),
(4, 'browse_media', NULL, '2022-01-11 13:32:56', '2022-01-11 13:32:56'),
(5, 'browse_compass', NULL, '2022-01-11 13:32:56', '2022-01-11 13:32:56'),
(6, 'browse_menus', 'menus', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(7, 'read_menus', 'menus', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(8, 'edit_menus', 'menus', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(9, 'add_menus', 'menus', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(10, 'delete_menus', 'menus', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(11, 'browse_roles', 'roles', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(12, 'read_roles', 'roles', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(13, 'edit_roles', 'roles', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(14, 'add_roles', 'roles', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(15, 'delete_roles', 'roles', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(16, 'browse_users', 'users', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(17, 'read_users', 'users', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(18, 'edit_users', 'users', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(19, 'add_users', 'users', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(20, 'delete_users', 'users', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(21, 'browse_settings', 'settings', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(22, 'read_settings', 'settings', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(23, 'edit_settings', 'settings', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(24, 'add_settings', 'settings', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(25, 'delete_settings', 'settings', '2022-01-11 13:32:57', '2022-01-11 13:32:57'),
(26, 'browse_categories', 'categories', '2022-01-12 07:25:56', '2022-01-12 07:25:56'),
(27, 'read_categories', 'categories', '2022-01-12 07:25:56', '2022-01-12 07:25:56'),
(28, 'edit_categories', 'categories', '2022-01-12 07:25:56', '2022-01-12 07:25:56'),
(29, 'add_categories', 'categories', '2022-01-12 07:25:56', '2022-01-12 07:25:56'),
(30, 'delete_categories', 'categories', '2022-01-12 07:25:56', '2022-01-12 07:25:56'),
(31, 'browse_products', 'products', '2022-01-12 07:31:30', '2022-01-12 07:31:30'),
(32, 'read_products', 'products', '2022-01-12 07:31:30', '2022-01-12 07:31:30'),
(33, 'edit_products', 'products', '2022-01-12 07:31:30', '2022-01-12 07:31:30'),
(34, 'add_products', 'products', '2022-01-12 07:31:30', '2022-01-12 07:31:30'),
(35, 'delete_products', 'products', '2022-01-12 07:31:30', '2022-01-12 07:31:30'),
(36, 'browse_pages', 'pages', '2022-01-12 07:33:46', '2022-01-12 07:33:46'),
(37, 'read_pages', 'pages', '2022-01-12 07:33:46', '2022-01-12 07:33:46'),
(38, 'edit_pages', 'pages', '2022-01-12 07:33:46', '2022-01-12 07:33:46'),
(39, 'add_pages', 'pages', '2022-01-12 07:33:46', '2022-01-12 07:33:46'),
(40, 'delete_pages', 'pages', '2022-01-12 07:33:46', '2022-01-12 07:33:46'),
(41, 'browse_orders', 'orders', '2022-01-12 07:36:35', '2022-01-12 07:36:35'),
(42, 'read_orders', 'orders', '2022-01-12 07:36:35', '2022-01-12 07:36:35'),
(43, 'edit_orders', 'orders', '2022-01-12 07:36:35', '2022-01-12 07:36:35'),
(44, 'add_orders', 'orders', '2022-01-12 07:36:35', '2022-01-12 07:36:35'),
(45, 'delete_orders', 'orders', '2022-01-12 07:36:35', '2022-01-12 07:36:35');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `image`, `price`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Бургер название', 'burger-nazvanie', '<p>Gigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt r&auml;h&auml;ren.&nbsp;</p>\r\n<p>Ist depoprese. Antesk. Hexag&ouml;k dosavis. Presamma heteroligen</p>', 'products\\January2022\\H74tjqM2w3HnCBrTIYKn.png', 55.00, 5, '2022-01-12 07:49:00', '2022-01-21 12:30:09'),
(2, 'Бургер 1', 'burger-1', '<p>Описание/состав: Gigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt r&auml;h&auml;ren.&nbsp;</p>\r\n<p>Ist depoprese. Antesk. Hexag&ouml;k dosavis. Presamma heteroligen</p>', 'products\\January2022\\AozrwprPITbvoRpaeW98.png', 55.00, 5, '2022-01-21 12:26:55', '2022-01-21 12:26:55'),
(3, 'Бургер 2', 'burger-2', '<p>Описание/состав: Gigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt r&auml;h&auml;ren.&nbsp;</p>\r\n<p>Ist depoprese. Antesk. Hexag&ouml;k dosavis. Presamma heteroligen</p>', 'products\\January2022\\GTB3agRnPmjVrrOjyl24.png', 55.00, 5, '2022-01-21 12:28:28', '2022-01-21 12:28:28'),
(4, 'Бургер 3', 'burger-3', '<p>Описание/состав: Gigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt r&auml;h&auml;ren.&nbsp;</p>\r\n<p>Ist depoprese. Antesk. Hexag&ouml;k dosavis. Presamma heteroligen</p>', 'products\\January2022\\ikqbOEFE28UZU1wMkbz8.png', 55.00, 5, '2022-01-21 12:28:52', '2022-01-21 12:28:52'),
(5, 'Бургер 4', 'burger-4', '<p>Описание/состав: Gigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt r&auml;h&auml;ren.&nbsp;</p>\r\n<p>Ist depoprese. Antesk. Hexag&ouml;k dosavis. Presamma heteroligen</p>', 'products\\January2022\\j3YGpJLFlJ66TVkC8Cao.png', 55.00, 5, '2022-01-21 12:29:27', '2022-01-21 12:29:27'),
(6, 'Бургер 5', 'burger-5', '<p>Описание/состав: Gigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt r&auml;h&auml;ren.&nbsp;</p>\r\n<p>Ist depoprese. Antesk. Hexag&ouml;k dosavis. Presamma heteroligen</p>', 'products\\January2022\\W6tVRogldQCa9ZHgYGjB.png', 55.00, 5, '2022-01-21 12:29:53', '2022-01-21 12:29:53'),
(7, 'Бургер с яйцом', 'burger-s-yajcom', '<p>ёGigon gogen. Nitost krotaska. Relig vilig. Spenar bion. Katt r&auml;h&auml;ren.&nbsp;</p>\r\n<p>Ist depoprese. Antesk. Hexag&ouml;k dosavis. Presamma heteroligen</p>', 'products\\January2022\\FbNKYcSrDoPeWqp11O6s.png', 54.99, 5, '2022-01-27 11:29:02', '2022-01-27 11:29:02');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-01-11 13:31:05', '2022-01-11 13:31:05'),
(2, 'user', 'Normal User', '2022-01-11 13:32:56', '2022-01-11 13:32:56');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\January2022\\MCpjJIuuNTUMVmeCjgBg.png', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Viki Grill', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Добро пожаловать в админ-панель сайта Viki-Grill.ua', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\January2022\\fgHajgNsDuV9Dy9ZfueF.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Viki Grill', 'admin@admin.com', 'users\\January2022\\tuIP0IT2hRDnuP4m1wUl.png', NULL, '$2y$10$BRg91T3fibqm4gWQkpEE5OmQV.Tc9xQOF49An.GjWLteW9NeXIdXG', 'sQ6YaWm6feSyk14fJRUt5VdMWuuyMXNXoTT4vjnznHcUN7GseaY8jOYY0yej', '{\"locale\":\"ru\"}', '2022-01-11 13:31:05', '2022-01-12 08:08:52');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
