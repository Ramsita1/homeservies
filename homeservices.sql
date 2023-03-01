-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 12:15 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homeservices`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`homeservices`@`%` FUNCTION `json_extract` (`details` TEXT, `required_field` VARCHAR(255)) RETURNS TEXT CHARSET latin1  BEGIN
        SET details = SUBSTRING_INDEX(details, "{", -1);
        SET details = SUBSTRING_INDEX(details, "}", 1);
        RETURN TRIM(
            BOTH '"' FROM SUBSTRING_INDEX(
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(
                        details,
                        CONCAT(
                            '"',
                            SUBSTRING_INDEX(required_field,'$.', -1),
                            '":'
                        ),
                        -1
                    ),
                    ',"',
                    1
                ),
                ':',
                -1
            )
        ) ;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `longitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `default` tinyint(1) DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Office', '77739 Dennis Tunnel Apt. 571\nGerlachhaven, MA 56225-4879', 51.61908612000000000, 10.13366629000000000, 0, 5, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(2, 'Home', '79018 Lowe Heights Apt. 779\nWest Assunta, MA 55495-8079', 50.69422252000000000, 9.75225855000000000, 0, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(3, 'Hotel', '49460 Altenwerth Circles Suite 088\nBrookschester, DC 94789-9917', 51.58283728000000000, 10.15504660000000000, 0, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(4, 'Hotel', '5637 Nicolette Burg\nColliermouth, VT 38120-3920', 51.14015169000000000, 11.05642684000000000, 0, 5, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(5, 'Workshop', '710 Earnestine Pass Apt. 232\nMertiechester, WV 85110-1882', 50.44870489000000000, 9.77662731000000000, 0, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(6, 'Office', '7544 Ramona Meadow\nEmardside, UT 79745', 51.94458157000000000, 11.70452105000000000, 0, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(7, 'Home', '84751 Meghan Cove\nEladioberg, ID 89211-8595', 51.59782090000000000, 9.33186518000000000, 0, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(8, 'Office', '8648 Runolfsdottir Burgs Apt. 654\nEast Gaston, LA 85804-0744', 51.68628768000000000, 11.10952708000000000, 0, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(9, 'Workshop', '9742 Shanny Forges\nMayerview, IN 23372', 50.83770550000000000, 10.38195558000000000, 0, 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(10, 'Home', '422 Andreanne Land Apt. 785\nAdamsberg, MS 78384-0177', 51.76393261000000000, 11.37246193000000000, 0, 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(11, 'Home', '7325 Kuhic Pines Suite 919\nWest Flossie, UT 98247-5062', 50.46396609000000000, 9.63069512000000000, 0, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(12, 'Building', '700 Torp Lights Apt. 558\nNorth Kylastad, FL 06582-2800', 50.42227653000000000, 9.35308938000000000, 0, 6, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(13, 'Workshop', '78545 Okuneva Turnpike\nEast Erynshire, WI 82536', 50.60621299000000000, 10.12403359000000000, 0, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(14, 'Hotel', '15775 Everett Street Apt. 906\nWest Trenton, DE 16808-0036', 51.08300237000000000, 11.47466808000000000, 0, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(15, 'Office', '789 Houston Terrace Apt. 202\nGinoburgh, SD 01098-7197', 51.27801235000000000, 9.04097696000000000, 0, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(16, 'Building', '9256 Bill Forges\nLake Queen, CO 57230', 51.48000000000000000, 11.80000000000000000, 0, 3, '2022-04-22 03:52:46', '2022-05-14 03:30:19'),
(17, 'Hotel', '49594 Humberto Parkways\nEast Misty, SC 96530', 50.19222635000000000, 10.67929535000000000, 0, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(18, 'Hotel', '297 Rolfson Landing Suite 179\nGideonmouth, NC 26192', 50.03583444000000000, 10.14826650000000000, 0, 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(19, 'Office', '682 Emard Harbors Apt. 399\nPfannerstillmouth, DE 71303', 51.49985301000000000, 10.88191002000000000, 0, 7, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(20, 'Hotel', '790 Liza Pike Apt. 644\nPort Greg, OR 87481', 50.92224083000000000, 10.16468061000000000, 0, 5, '2022-04-22 03:52:46', '2022-04-22 03:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'moboGARRAZE'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'test@demo.com'),
(24, 'mail_password', '-'),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'test@demo.com'),
(27, 'mail_from_name', 'Smarter Vision'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-dark navbar-navy'),
(38, 'logo_bg_color', 'text-light  navbar-navy'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '0'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '₹'),
(108, 'fixed_header', '1'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', '-'),
(114, 'paypal_secret', '-'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#F4841F'),
(117, 'main_dark_color', '#F4841F'),
(118, 'second_color', '#08143A'),
(119, 'second_dark_color', '#CCCCDD'),
(120, 'accent_color', '#8C9DA8'),
(121, 'accent_dark_color', '#9999AA'),
(122, 'scaffold_dark_color', '#2C2C2C'),
(123, 'scaffold_color', '#FAFAFA'),
(124, 'google_maps_key', '-'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '1.0.0'),
(127, 'enable_version', '1'),
(128, 'default_currency_id', '3'),
(129, 'default_currency_code', 'INR'),
(130, 'default_currency_decimal_digits', '2'),
(131, 'default_currency_rounding', '0'),
(132, 'currency_right', '1'),
(133, 'distance_unit', 'km'),
(134, 'default_theme', 'light');

-- --------------------------------------------------------

--
-- Table structure for table `availability_hours`
--

CREATE TABLE `availability_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monday',
  `start_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_hours`
--

INSERT INTO `availability_hours` (`id`, `day`, `start_at`, `end_at`, `data`, `e_provider_id`) VALUES
(1, 'friday', '11:00', '16:00', '{\"en\":\"Quis non velit nostrum quasi in.\"}', 8),
(2, 'friday', '03:00', '22:00', '{\"en\":\"Atque totam exercitationem in aut blanditiis et.\"}', 17),
(3, 'friday', '11:00', '23:00', '{\"en\":\"Ex aut sint ipsum sint magni.\"}', 9),
(4, 'sunday', '11:00', '18:00', '{\"en\":\"Fugiat eos enim nulla ut. Saepe et modi eligendi.\"}', 9),
(5, 'thursday', '09:00', '19:00', '{\"en\":\"Quia assumenda reprehenderit rem voluptate ipsum.\"}', 2),
(6, 'thursday', '02:00', '19:00', '{\"en\":\"Quis molestiae ipsa aut perspiciatis in.\"}', 9),
(7, 'monday', '04:00', '19:00', '{\"en\":\"Est qui assumenda ipsum.\"}', 16),
(8, 'monday', '03:00', '20:00', '{\"en\":\"Architecto vel sunt quisquam.\"}', 12),
(9, 'tuesday', '02:00', '21:00', '{\"en\":\"Sunt quia molestiae similique dolore atque.\"}', 9),
(10, 'saturday', '08:00', '20:00', '{\"en\":\"Harum quia harum ex. Eos distinctio hic modi.\"}', 13),
(11, 'thursday', '06:00', '15:00', '{\"en\":\"Quam et ad ab unde molestias sit in.\"}', 15),
(12, 'wednesday', '12:00', '22:00', '{\"en\":\"Eos et facilis velit sit laboriosam voluptatem.\"}', 7),
(13, 'wednesday', '08:00', '15:00', '{\"en\":\"Nulla ut alias quisquam nobis.\"}', 10),
(14, 'thursday', '04:00', '18:00', '{\"en\":\"Omnis quos nemo animi dolorum est aut aut.\"}', 2),
(15, 'wednesday', '10:00', '20:00', '{\"en\":\"Aut enim mollitia a et.\"}', 15),
(16, 'friday', '04:00', '22:00', '{\"en\":\"Consequatur odio autem voluptate dolorem.\"}', 10),
(17, 'monday', '04:00', '17:00', '{\"en\":\"Modi earum odit accusantium.\"}', 4),
(18, 'sunday', '02:00', '22:00', '{\"en\":\"Inventore repellat harum vel.\"}', 6),
(19, 'thursday', '06:00', '15:00', '{\"en\":\"Beatae et voluptate autem ad perferendis.\"}', 3),
(20, 'saturday', '07:00', '13:00', '{\"en\":\"Error officiis doloribus et.\"}', 12),
(21, 'friday', '02:00', '14:00', '{\"en\":\"Qui blanditiis amet nihil architecto.\"}', 4),
(22, 'tuesday', '12:00', '22:00', '{\"en\":\"Excepturi nihil et at ab.\"}', 10),
(23, 'monday', '04:00', '13:00', '{\"en\":\"Accusantium maxime ducimus aut iusto.\"}', 6),
(24, 'sunday', '12:00', '15:00', '{\"en\":\"Molestiae quibusdam laboriosam qui et.\"}', 8),
(25, 'wednesday', '05:00', '21:00', '{\"en\":\"Cupiditate enim quam non aperiam ab omnis autem.\"}', 1),
(26, 'wednesday', '04:00', '22:00', '{\"en\":\"Et cumque nisi assumenda accusamus.\"}', 18),
(27, 'monday', '05:00', '16:00', '{\"en\":\"Est aut et illo eos.\"}', 6),
(28, 'monday', '07:00', '13:00', '{\"en\":\"Et nesciunt libero fugit accusamus libero sit.\"}', 18),
(29, 'tuesday', '12:00', '19:00', '{\"en\":\"Voluptate nulla rem voluptas qui.\"}', 12),
(30, 'tuesday', '05:00', '14:00', '{\"en\":\"Ut optio non sit dolorem libero.\"}', 6),
(31, 'friday', '08:00', '13:00', '{\"en\":\"Atque fugiat aut molestiae non velit.\"}', 16),
(32, 'thursday', '12:00', '23:00', '{\"en\":\"Iste et consectetur molestias ut itaque.\"}', 12),
(33, 'tuesday', '02:00', '16:00', '{\"en\":\"Quasi consequuntur et quisquam numquam repellat.\"}', 1),
(34, 'saturday', '07:00', '22:00', '{\"en\":\"Suscipit dolor perferendis nam voluptatem.\"}', 9),
(35, 'saturday', '06:00', '18:00', '{\"en\":\"Delectus iusto at qui sit non.\"}', 5),
(36, 'saturday', '05:00', '13:00', '{\"en\":\"Ut repellendus sint veniam perspiciatis.\"}', 6),
(37, 'tuesday', '09:00', '19:00', '{\"en\":\"Cum nobis non pariatur et.\"}', 18),
(38, 'sunday', '06:00', '15:00', '{\"en\":\"Et occaecati aut tempore quibusdam.\"}', 12),
(39, 'thursday', '07:00', '15:00', '{\"en\":\"Et quia nostrum autem aspernatur.\"}', 14),
(40, 'friday', '09:00', '15:00', '{\"en\":\"Ex ab harum aut dolor magni corrupti nisi.\"}', 16),
(41, 'wednesday', '09:00', '23:00', '{\"en\":\"Amet quia sit quisquam hic.\"}', 11),
(42, 'tuesday', '07:00', '22:00', '{\"en\":\"Ut laborum voluptatibus sunt voluptatem.\"}', 5),
(43, 'saturday', '10:00', '14:00', '{\"en\":\"Ex quam et voluptatem nam.\"}', 13),
(44, 'monday', '07:00', '20:00', '{\"en\":\"Ratione et velit vel. Et incidunt ipsum quisquam.\"}', 6),
(45, 'tuesday', '09:00', '13:00', '{\"en\":\"Consequatur est sit voluptas non.\"}', 15),
(46, 'wednesday', '07:00', '23:00', '{\"en\":\"Rerum sed perspiciatis error molestiae facilis.\"}', 14),
(47, 'tuesday', '08:00', '18:00', '{\"en\":\"Sed maxime pariatur tempore sunt reiciendis.\"}', 5),
(48, 'monday', '08:00', '13:00', '{\"en\":\"Unde quasi nesciunt voluptatibus.\"}', 17),
(49, 'saturday', '03:00', '16:00', '{\"en\":\"Quas neque voluptatem qui.\"}', 1),
(50, 'wednesday', '06:00', '16:00', '{\"en\":\"Autem id eos est dolor.\"}', 13);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `title`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Qui culpa culpa repudiandae nam dolore unde mollitia omnis. Minima sit praesentium blanditiis.\"}', '{\"en\":\"THAT in a tone of this rope--Will the roof off.\' After a while, finding that nothing more to be a letter, after all: it\'s a very little use without my shoulders. Oh, how I wish I hadn\'t quite.\"}', 3, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(2, '{\"en\":\"Natus et nihil quo repellat. Similique qui repellat voluptas esse ut omnis.\"}', '{\"en\":\"Will you, won\'t you, will you join the dance? Will you, won\'t you, will you join the dance? Will you, won\'t you join the dance? Will you, won\'t you, won\'t you, will you, won\'t you join the dance.\"}', 10, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(3, '{\"en\":\"Nam voluptas ut at ut perspiciatis. Illo quibusdam sapiente delectus quia illo.\"}', '{\"en\":\"Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. Alice noticed with some curiosity. \'What a number of executions the Queen left off.\"}', 11, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(4, '{\"en\":\"Placeat quas optio beatae velit ratione. Ab dolorem non inventore enim est iusto.\"}', '{\"en\":\"CHAPTER IV. The Rabbit Sends in a game of croquet she was now about a foot high: then she looked down at her hands, wondering if anything would EVER happen in a tone of great dismay, and began an.\"}', 1, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(5, '{\"en\":\"Et optio ratione nam omnis ea. Qui nam voluptatem illo dolor.\"}', '{\"en\":\"Oh, how I wish you could see her after the rest of the creature, but on the same size: to be trampled under its feet, \'I move that the meeting adjourn, for the Dormouse,\' thought Alice; \'but a grin.\"}', 12, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(6, '{\"en\":\"Sed ut expedita sit ut. Sint et ab similique ratione nisi quia.\"}', '{\"en\":\"WOULD not remember the simple and loving heart of her favourite word \'moral,\' and the jury wrote it down \'important,\' and some of them at last, more calmly, though still sobbing a little while.\"}', 6, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(7, '{\"en\":\"Et voluptatem nisi optio dolores culpa amet vitae. Sit minus ipsam quia quia.\"}', '{\"en\":\"Bill, the Lizard) could not possibly reach it: she could see, as she went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was very provoking to find my way into a.\"}', 8, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(8, '{\"en\":\"Dicta nam odio molestiae iure qui. Officia magni nobis similique quae explicabo et voluptates.\"}', '{\"en\":\"There seemed to rise like a candle. I wonder who will put on one side, to look at me like that!\' said Alice indignantly. \'Ah! then yours wasn\'t a bit hurt, and she was playing against herself, for.\"}', 1, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(9, '{\"en\":\"Fuga et est molestiae labore. Porro omnis officiis laudantium expedita sit nihil nam quae.\"}', '{\"en\":\"There seemed to be two people. \'But it\'s no use in waiting by the whole thing very absurd, but they were trying to make herself useful, and looking at the frontispiece if you like!\' the Duchess said.\"}', 1, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(10, '{\"en\":\"Molestiae neque quasi ipsa quis molestiae. Fugit iure qui velit sed ut saepe eius.\"}', '{\"en\":\"Hatter. \'Nor I,\' said the March Hare, \'that \\\"I breathe when I got up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead.\"}', 12, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(11, '{\"en\":\"Suscipit ipsa nemo qui sequi a maxime et. Exercitationem amet eveniet enim ab sequi facere sunt.\"}', '{\"en\":\"Hatter. \'I deny it!\' said the Mock Turtle, and to stand on their slates, when the tide rises and sharks are around, His voice has a timid and tremulous sound.] \'That\'s different from what I should.\"}', 7, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(12, '{\"en\":\"Sunt commodi necessitatibus voluptatibus omnis repellendus. Dolores ipsum similique est.\"}', '{\"en\":\"Alice, very much what would happen next. First, she dreamed of little Alice herself, and fanned herself with one finger for the accident of the court. \'What do you want to be?\' it asked. \'Oh, I\'m.\"}', 7, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(13, '{\"en\":\"Ab maiores et aut voluptas. Ut veritatis omnis quod sit. Numquam in repellendus rem expedita quos.\"}', '{\"en\":\"Alice had learnt several things of this pool? I am now? That\'ll be a Caucus-race.\' \'What IS the same thing with you,\' said the Mock Turtle yawned and shut his note-book hastily. \'Consider your.\"}', 17, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(14, '{\"en\":\"Excepturi nemo vel eum aut. Dolor quod in laborum suscipit esse dolor.\"}', '{\"en\":\"I want to go on with the Lory, who at last she spread out her hand again, and put it more clearly,\' Alice replied eagerly, for she was dozing off, and that you have to fly; and the m--\' But here, to.\"}', 10, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(15, '{\"en\":\"Repellat eius qui illo sunt ut. Ut laboriosam et est labore.\"}', '{\"en\":\"I\'m better now--but I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, \'and if it likes.\' \'I\'d rather finish my tea,\' said the Mock Turtle in a day or two: wouldn\'t it.\"}', 3, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(16, '{\"en\":\"Praesentium vero ut dicta. Tempore architecto molestias voluptas ea.\"}', '{\"en\":\"I can\'t get out at the March Hare. \'Yes, please do!\' pleaded Alice. \'And where HAVE my shoulders got to? And oh, I wish I hadn\'t drunk quite so much!\' Alas! it was neither more nor less than no time.\"}', 14, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(17, '{\"en\":\"Nisi atque at magni et tempora. Eaque unde voluptas voluptate nihil velit earum.\"}', '{\"en\":\"May it won\'t be raving mad after all! I almost wish I\'d gone to see anything; then she heard the Rabbit coming to look at a reasonable pace,\' said the Duchess, it had some kind of thing never.\"}', 13, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(18, '{\"en\":\"Odit suscipit repellat rerum sit voluptatibus. Voluptatem atque eaque aut sapiente in doloribus.\"}', '{\"en\":\"Dodo, pointing to the door, she walked on in a low voice, to the Queen. \'I never said I could not think of any good reason, and as Alice could think of any one; so, when the tide rises and sharks.\"}', 8, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(19, '{\"en\":\"Rerum nam enim voluptatem iste. Sit perspiciatis molestias molestiae reiciendis.\"}', '{\"en\":\"Alice to herself. \'Of the mushroom,\' said the Duchess: you\'d better ask HER about it.\' \'She\'s in prison,\' the Queen furiously, throwing an inkstand at the top of her skirt, upsetting all the rats.\"}', 18, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(20, '{\"en\":\"Vero omnis eum magni animi. Non numquam iusto ducimus vel nihil quis. Ut itaque omnis natus velit.\"}', '{\"en\":\"I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH.\"}', 17, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(21, '{\"en\":\"Voluptatibus a modi est ullam maxime rerum porro. Officiis quia est ipsum quia.\"}', '{\"en\":\"And pour the waters of the sort,\' said the Hatter. \'I told you butter wouldn\'t suit the works!\' he added in an undertone to the game. CHAPTER IX. The Mock Turtle said: \'no wise fish would go round a.\"}', 15, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(22, '{\"en\":\"Quis at mollitia consequuntur in saepe neque fugiat. Ea omnis aut et. Natus consequatur quo et.\"}', '{\"en\":\"ITS WAISTCOAT-POCKET, and looked very uncomfortable. The first question of course was, how to begin.\' He looked at poor Alice, that she tipped over the list, feeling very glad to do such a noise.\"}', 11, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(23, '{\"en\":\"Aut animi tempore tempora. Ullam animi ipsum debitis natus. Ea ullam eaque omnis maiores.\"}', '{\"en\":\"It was high time you were me?\' \'Well, perhaps not,\' said Alice a good opportunity for croqueting one of them.\' In another minute there was no more to do with you. Mind now!\' The poor little thing.\"}', 15, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(24, '{\"en\":\"Fugit vitae iusto dolores modi consequuntur itaque natus. Ex alias quo deleniti esse id unde.\"}', '{\"en\":\"The first question of course had to pinch it to be sure, this generally happens when one eats cake, but Alice had never done such a wretched height to be.\' \'It is wrong from beginning to think to.\"}', 8, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(25, '{\"en\":\"Repellat deleniti saepe magnam voluptate. Facere deserunt facere repellat voluptatem.\"}', '{\"en\":\"Dormouse\'s place, and Alice was beginning to think to herself, \'the way all the jurors were all talking at once, in a minute or two. \'They couldn\'t have wanted it much,\' said Alice, whose thoughts.\"}', 17, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(26, '{\"en\":\"Aut optio quo explicabo aperiam. Aut assumenda pariatur ut et. Sunt odio libero rerum molestiae.\"}', '{\"en\":\"I\'ve offended it again!\' For the Mouse was swimming away from him, and said to the Dormouse, without considering at all like the look of the court. (As that is rather a hard word, I will prosecute.\"}', 3, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(27, '{\"en\":\"Harum placeat eius eum quaerat. Labore ea expedita atque. At ab delectus illum est incidunt et.\"}', '{\"en\":\"Alice in a trembling voice, \'Let us get to the confused clamour of the fact. \'I keep them to be lost, as she went on, \'if you don\'t know what they\'re like.\' \'I believe so,\' Alice replied.\"}', 15, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(28, '{\"en\":\"Qui repudiandae tempore eaque nulla. Omnis veniam quae vitae voluptas odio.\"}', '{\"en\":\"It was high time to avoid shrinking away altogether. \'That WAS a narrow escape!\' said Alice, who felt ready to make out which were the cook, to see if she could see this, as she left her, leaning.\"}', 7, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(29, '{\"en\":\"Tempora nihil quae soluta at voluptatem. Alias ipsum corrupti odit non. Ab magnam laudantium est.\"}', '{\"en\":\"Majesty must cross-examine THIS witness.\' \'Well, if I might venture to say \\\"HOW DOTH THE LITTLE BUSY BEE,\\\" but it was her dream:-- First, she dreamed of little birds and animals that had slipped in.\"}', 7, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(30, '{\"en\":\"Consequatur voluptatem ipsa vitae veritatis. Et voluptatem sed minus pariatur.\"}', '{\"en\":\"Gryphon. \'The reason is,\' said the Cat, and vanished. Alice was just saying to herself \'Now I can do no more, whatever happens. What WILL become of you? I gave her answer. \'They\'re done with.\"}', 14, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(31, '{\"en\":\"Eum rerum odio nisi nihil enim. Omnis voluptatem fugiat voluptatem id quis et. Qui rerum et nulla.\"}', '{\"en\":\"Off with his nose, you know?\' \'It\'s the Cheshire Cat, she was now about a foot high: then she heard something splashing about in the prisoner\'s handwriting?\' asked another of the Queen was silent.\"}', 2, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(32, '{\"en\":\"Sed sit laborum quia. Totam fugit sed ipsum est enim iste.\"}', '{\"en\":\"There was no longer to be Involved in this way! Stop this moment, I tell you!\' But she went on saying to her full size by this time). \'Don\'t grunt,\' said Alice; \'but when you come to the jury. \'Not.\"}', 11, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(33, '{\"en\":\"Et occaecati magni dolor minima nisi numquam. Aspernatur accusantium quis modi et.\"}', '{\"en\":\"I used--and I don\'t put my arm round your waist,\' the Duchess to play with, and oh! ever so many out-of-the-way things to happen, that it was done. They had not as yet had any dispute with the bones.\"}', 14, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(34, '{\"en\":\"Officia dolor quo dolores id. Porro dolorem fugiat similique exercitationem impedit fugiat.\"}', '{\"en\":\"King, going up to her ear. \'You\'re thinking about something, my dear, and that if something wasn\'t done about it just now.\' \'It\'s the thing yourself, some winter day, I will tell you just now what.\"}', 8, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(35, '{\"en\":\"Sunt illum blanditiis dolor voluptas et. Rerum unde rerum porro eveniet vel fugit aut molestiae.\"}', '{\"en\":\"I know THAT well enough; don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Caterpillar. Alice said nothing; she had known them all her coaxing. Hardly knowing what.\"}', 11, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(36, '{\"en\":\"Ut fuga hic esse laborum ut voluptas. Officiis fugiat ad magnam.\"}', '{\"en\":\"I gave her one, they gave him two, You gave us three or more; They all sat down in an impatient tone: \'explanations take such a puzzled expression that she was not a bit afraid of interrupting him,).\"}', 9, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(37, '{\"en\":\"Et ut laboriosam culpa dolore. Inventore voluptas est nihil porro eum tempore ipsa.\"}', '{\"en\":\"Hatter. He had been jumping about like mad things all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was beginning to see what was going on shrinking rapidly: she soon made out the.\"}', 13, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(38, '{\"en\":\"Voluptatibus quia impedit soluta unde. Dolorem id ducimus ea ad. Non quaerat illum sint.\"}', '{\"en\":\"I had it written down: but I grow up, I\'ll write one--but I\'m grown up now,\' she added in a frightened tone. \'The Queen will hear you! You see, she came upon a Gryphon, lying fast asleep in the.\"}', 5, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(39, '{\"en\":\"Nulla veniam quas placeat dolor minima. Ullam cumque nostrum nihil est praesentium.\"}', '{\"en\":\"March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t know of any one; so, when the White Rabbit put on one of the court with a whiting. Now you know.\' \'Not the same thing with you,\'.\"}', 9, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(40, '{\"en\":\"Impedit a similique quia eligendi in. Quis maiores tempora quasi asperiores eveniet.\"}', '{\"en\":\"So you see, Miss, this here ought to go down--Here, Bill! the master says you\'re to go through next walking about at the March Hare meekly replied. \'Yes, but I grow up, I\'ll write one--but I\'m grown.\"}', 7, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(41, '{\"en\":\"Molestiae quos fugiat fuga aut dolore iure consequuntur. Qui iusto aut accusamus voluptas officiis.\"}', '{\"en\":\"This was quite pale (with passion, Alice thought), and it put more simply--\\\"Never imagine yourself not to be said. At last the Gryphon added \'Come, let\'s try the thing yourself, some winter day, I.\"}', 2, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(42, '{\"en\":\"Explicabo dolor ut eius sit omnis. Vitae vel et qui est non et.\"}', '{\"en\":\"I goes like a mouse, you know. Come on!\' So they couldn\'t see it?\' So she began looking at Alice for some minutes. The Caterpillar and Alice was not quite like the look of the day; and this was his.\"}', 14, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(43, '{\"en\":\"Est vero eos totam aut alias unde. Culpa reiciendis sit aut eligendi aliquam aperiam hic.\"}', '{\"en\":\"Duchess said in a tone of great dismay, and began to tremble. Alice looked up, and began staring at the end of the thing yourself, some winter day, I will tell you just now what the moral of THAT.\"}', 11, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(44, '{\"en\":\"Explicabo fugiat et nisi quia architecto eaque similique. Nesciunt dolorum nihil itaque.\"}', '{\"en\":\"Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Did you say things are worse than ever,\' thought the whole court was a table, with a soldier on each side to guard him; and near the door, staring.\"}', 16, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(45, '{\"en\":\"Cupiditate enim repudiandae est modi id. Ut expedita quas est et.\"}', '{\"en\":\"SOMETHING interesting is sure to kill it in large letters. It was all about, and shouting \'Off with her arms folded, frowning like a thunderstorm. \'A fine day, your Majesty!\' the soldiers did. After.\"}', 12, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(46, '{\"en\":\"Velit nihil consequatur ratione rerum. Sed corporis dicta aut nihil ipsam dolor.\"}', '{\"en\":\"Alice. \'Who\'s making personal remarks now?\' the Hatter grumbled: \'you shouldn\'t have put it right; \'not that it was only a pack of cards!\' At this the White Rabbit, \'and that\'s a fact.\' Alice did.\"}', 3, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(47, '{\"en\":\"Repudiandae neque qui et quas. Ut qui beatae et dolores et est consectetur.\"}', '{\"en\":\"ME\' beautifully printed on it except a little scream of laughter. \'Oh, hush!\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at each other for some time in silence: at last.\"}', 11, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(48, '{\"en\":\"Tenetur delectus dignissimos quia minus possimus in. Sunt placeat aperiam aut sed ducimus.\"}', '{\"en\":\"I\'d only been the right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Gryphon. \'Turn a somersault in the sky. Twinkle, twinkle--\\\"\' Here the other birds tittered audibly.\"}', 5, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(49, '{\"en\":\"Officiis aperiam id neque sit. Placeat adipisci id sit. Dolores voluptatem omnis ipsam est hic.\"}', '{\"en\":\"March Hare said in a wondering tone. \'Why, what are they made of?\' Alice asked in a moment: she looked back once or twice she had sat down a good deal: this fireplace is narrow, to be a book written.\"}', 1, '2022-04-22 03:52:47', '2022-04-22 03:52:47'),
(50, '{\"en\":\"Qui impedit eius officiis alias. Voluptatum est neque qui eos corporis aliquam.\"}', '{\"en\":\"Alice, \'when one wasn\'t always growing larger and smaller, and being so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice. \'Oh, don\'t talk about wasting IT. It\'s HIM.\' \'I.\"}', 2, '2022-04-22 03:52:47', '2022-04-22 03:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_service` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` smallint(6) DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `booking_status_id` int(10) UNSIGNED DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `hint` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `e_provider`, `e_service`, `options`, `quantity`, `user_id`, `booking_status_id`, `address`, `payment_id`, `coupon`, `taxes`, `booking_at`, `start_at`, `ends_at`, `hint`, `cancel`, `created_at`, `updated_at`) VALUES
(1, '{\"id\":10,\"name\":\"Glass Olson PLC\",\"phone_number\":\"1-406-942-7645\",\"mobile_number\":\"+1.862.672.5149\"}', '{\"id\":12,\"name\":\"Suv Car Washing\",\"price\":40.38,\"discount_price\":32.02,\"price_unit\":\"hourly\",\"quantity_unit\":\"\",\"duration\":\"04:00\"}', NULL, 1, 3, 1, '{\"id\":16,\"description\":\"Building\",\"address\":\"9256 Bill Forges\\nLake Queen, CO 57230\",\"latitude\":51.48,\"longitude\":11.8}', NULL, NULL, '[]', '2022-05-14 14:29:54', NULL, NULL, 'ok', 0, '2022-05-14 03:30:19', '2022-05-14 03:30:19'),
(2, '{\"id\":14,\"name\":\"Dentists Cormier-Schuppe\",\"phone_number\":\"813.558.6710\",\"mobile_number\":\"+1-559-316-6054\"}', '{\"id\":13,\"name\":\"Photography Services\",\"price\":32.13,\"discount_price\":0,\"price_unit\":\"fixed\",\"quantity_unit\":null,\"duration\":\"3:00\"}', NULL, 2, 3, 1, '{\"id\":16,\"description\":\"Building\",\"address\":\"9256 Bill Forges\\nLake Queen, CO 57230\",\"latitude\":51.48,\"longitude\":11.8}', NULL, NULL, '[]', '2022-05-14 14:31:41', NULL, NULL, NULL, 0, '2022-05-14 03:31:46', '2022-05-14 03:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `booking_statuses`
--

CREATE TABLE `booking_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_statuses`
--

INSERT INTO `booking_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Received', 1, '2021-01-25 13:55:46', '2021-01-29 12:26:35'),
(2, 'In Progress', 40, '2021-01-25 13:56:02', '2021-02-16 16:26:52'),
(3, 'On the Way', 20, '2021-01-28 02:17:23', '2021-02-16 06:40:13'),
(4, 'Accepted', 10, '2021-02-16 06:39:29', '2021-02-16 06:40:06'),
(5, 'Ready', 30, '2021-02-16 06:41:50', '2021-02-16 16:26:42'),
(6, 'Done', 50, '2021-02-16 16:27:02', '2021-02-16 16:27:02'),
(7, 'Failed', 60, '2021-02-16 16:28:36', '2021-02-16 16:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`, `description`, `order`, `featured`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Car Services\"}', '#ff9f43', '{\"en\":\"<p>Categories for all cars services<\\/p>\"}', 1, 1, NULL, '2021-01-19 11:31:35', '2022-04-22 06:14:03'),
(2, '{\"en\":\"Medical Services\"}', '#0abde3', '{\"en\":\"<p>Categories for all Medical Services<br><\\/p>\"}', 2, 1, NULL, '2021-01-19 12:35:00', '2022-04-22 06:22:40'),
(3, '{\"en\":\"Laundry Service\"}', '#ee5253', '{\"en\":\"<p>Category for all Laundry Service<\\/p>\"}', 3, 1, NULL, '2021-01-31 08:07:04', '2022-04-22 06:22:55'),
(4, '{\"en\":\"Beauty & Hair Cuts\"}', '#10ac84', '{\"en\":\"<p>Category for Hair Cuts and Barber<\\/p>\"}', 4, 0, NULL, '2021-01-31 08:08:37', '2022-04-22 06:23:11'),
(5, '{\"en\":\"Washing & Cleaning\"}', '#5f27cd', '{\"en\":\"<p>Category for Washing & Cleaning <\\/p>\"}', 5, 0, NULL, '2021-01-31 08:12:02', '2022-04-22 06:23:28'),
(6, '{\"en\":\"Media & Photography\"}', '#ff9f43', '{\"en\":\"<p>Category for Media & Photography<\\/p>\"}', 6, 0, NULL, '2021-01-31 08:13:20', '2022-04-22 06:24:08'),
(7, 'Sewer Cleaning', '#5f27cd', '<p>Category for Sewer Cleaning<br></p>', 1, 0, 5, '2021-01-31 09:16:15', '2021-01-31 09:16:30'),
(8, 'Carpet Cleaning', '#5f27cd', '<p>Category for Carpet Cleaning<br></p>', 2, 0, 5, '2021-01-31 09:17:23', '2021-01-31 09:17:23'),
(9, 'Wheel Repair', '#5f27cd', '<p>Category for Wheel Repair<br></p>', 1, 0, 1, '2021-01-31 09:19:40', '2021-01-31 09:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2020-10-22 10:20:48', '2020-10-22 10:20:48'),
(2, 'Euro', '€', 'EUR', 2, 0, '2020-10-22 10:21:39', '2020-10-22 10:21:39'),
(3, '{\"en\":\"Indian Rupee\"}', '{\"en\":\"₹\"}', '{\"en\":\"INR\"}', 2, 0, '2020-10-22 10:22:50', '2022-05-14 01:09:39'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2020-10-22 10:23:22', '2020-10-22 10:23:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2020-10-22 10:24:00', '2020-10-22 10:24:00'),
(6, 'Cambodian Riel', '៛', 'KHR', 2, 0, '2020-10-22 10:25:51', '2020-10-22 10:25:51'),
(7, 'Vietnamese Dong', '₫', 'VND', 0, 0, '2020-10-22 10:26:26', '2020-10-22 10:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-06 16:13:58', '2019-09-06 16:13:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-06 16:19:22', '2019-09-06 16:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(30, 'Explicabo. Eum provi.&nbsp;', 'Explicabo. Eum provi.&nbsp;', 5, 'App\\Models\\User', 2, '2019-09-06 16:22:30', '2021-02-02 06:02:57'),
(31, 'Modi est libero qui', 'Modi est libero qui', 6, 'App\\Models\\User', 2, '2019-09-06 16:22:30', '2021-02-02 06:02:57'),
(33, 'Consequatur error ip.&nbsp;', 'Consequatur error ip.&nbsp;', 5, 'App\\Models\\User', 1, '2019-09-06 16:23:58', '2021-02-02 06:02:01'),
(34, 'Qui vero ratione vel', 'Qui vero ratione vel', 6, 'App\\Models\\User', 1, '2019-09-06 16:23:58', '2021-02-02 06:02:01'),
(36, 'Dolor optio, error e', 'Dolor optio, error e', 5, 'App\\Models\\User', 3, '2019-10-15 11:51:32', '2021-02-02 06:03:23'),
(37, 'Voluptatibus ad ipsu', 'Voluptatibus ad ipsu', 6, 'App\\Models\\User', 3, '2019-10-15 11:51:32', '2021-02-02 06:03:23'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 4, '2019-10-16 14:01:46', '2019-10-16 14:01:46'),
(40, 'Sequi molestiae ipsa1', 'Sequi molestiae ipsa1', 6, 'App\\Models\\User', 4, '2019-10-16 14:01:46', '2021-02-21 18:02:10'),
(42, 'Omnis fugiat et cons.', 'Omnis fugiat et cons.', 5, 'App\\Models\\User', 5, '2019-12-15 13:19:44', '2021-02-02 05:59:47'),
(43, 'Consequatur delenit', 'Consequatur delenit', 6, 'App\\Models\\User', 5, '2019-12-15 13:19:44', '2021-02-02 05:59:47'),
(45, '<p>Short bio for this driver</p>', 'Short bio for this driver', 5, 'App\\Models\\User', 6, '2020-03-29 11:58:05', '2020-03-29 11:58:05'),
(46, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 6, '2020-03-29 11:58:05', '2020-03-29 11:58:05'),
(48, 'Voluptatem. Omnis op.', 'Voluptatem. Omnis op.', 5, 'App\\Models\\User', 7, '2021-01-17 10:43:24', '2021-02-02 06:01:36'),
(49, 'Perspiciatis aut ei', 'Perspiciatis aut ei', 6, 'App\\Models\\User', 7, '2021-01-17 10:43:24', '2021-02-02 06:01:36'),
(51, 'sdfsdf56', 'sdfsdf56', 5, 'App\\Models\\User', 8, '2021-02-10 06:01:12', '2021-02-19 08:39:37'),
(52, 'Adressttt', 'Adressttt', 6, 'App\\Models\\User', 8, '2021-02-10 06:01:12', '2021-02-19 08:27:27'),
(53, NULL, '', 5, 'App\\Models\\User', 9, '2022-10-18 22:48:45', '2022-10-18 22:48:45'),
(54, NULL, NULL, 6, 'App\\Models\\User', 9, '2022-10-18 22:48:45', '2022-10-18 22:48:45');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `title`, `content`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', '<h1>Privacy Policy of SmarterVision</h1>\n<p>SmarterVision operates the SmarterVision website, which provides the SERVICE.</p>\n<p>This page is used to inform website visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service, the smartersvision.com website.</p>\n<p>If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at smartersvision.com, unless otherwise defined in this Privacy Policy.</p>\n<h2>Information Collection and Use</h2>\n<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.</p>\n<h2>Log Data</h2>\n<p>We want to inform you that whenever you visit our Service, we collect information that your browser sends to us which is called Log Data. This Log Data may include information such as your computer\'s Internet Protocol (“IP”) address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics.</p>\n<h2>Cookies</h2>\n<p>Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer\'s hard drive.</p>\n<p>Our website uses these “cookies” to collection information and to improve our Service. You have the option to either accept or refuse these cookies, and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service.</p>\n<h2>Service Providers</h2>\n<p>We may employ third-party companies and individuals due to the following reasons:</p>\n<ul>\n<li>To facilitate our Service;</li>\n<li>To provide the Service on our behalf;</li>\n<li>To perform Service-related services; or</li>\n<li>To assist us in analyzing how our Service is used.</li>\n</ul>\n<p>We want to inform our Service users that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\n<h2>Security</h2>\n<p>We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.</p>\n<h2>Links to Other Sites</h2>\n<p>Our Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\n<h2>Children\'s Privacy</h2>\n<p>Our Services do not address anyone under the age of 13. We do not knowingly collect personal identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.</p>\n<h2>Changes to This Privacy Policy</h2>\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.</p>\n<h2>Contact Us</h2>\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p>', 1, '2021-02-24 06:23:21', '2021-02-24 07:49:19'),
(2, 'Terms & Conditions', '<h2>Terms &amp; Conditions</h2><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.</p><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.<br></p>', 1, '2021-02-24 07:50:06', '2021-02-24 07:53:52');

-- --------------------------------------------------------

--
-- Table structure for table `discountables`
--

CREATE TABLE `discountables` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `discountable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED DEFAULT NULL,
  `total_bookings` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `admin_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `e_provider_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `taxes` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `e_provider_id`, `total_bookings`, `total_earning`, `admin_earning`, `e_provider_earning`, `taxes`, `created_at`, `updated_at`) VALUES
(1, 19, 0, 0.00, 0.00, 0.00, 0.00, '2022-12-21 00:32:50', '2022-12-21 00:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `title`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Dolores facilis qui quia inventore. Ullam repellat sed nihil voluptates vitae. Ipsum alias voluptatum harum eaque est magnam.\"}', '{\"en\":\"White Rabbit cried out, \'Silence in the direction in which the cook and the Hatter said, turning to Alice for protection. \'You shan\'t be able! I shall be a lesson to you how the game was going on.\"}', 16, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(2, '{\"en\":\"Et officiis autem rem officiis quo. Veniam optio corporis eveniet quae voluptatem nihil sed.\"}', '{\"en\":\"I eat one of the words \'DRINK ME\' beautifully printed on it in her pocket) till she shook the house, and the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said the.\"}', 17, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(3, '{\"en\":\"Saepe ipsa amet distinctio veniam. Hic illo quo ab ad in quidem. Deserunt distinctio neque veritatis consequatur vitae vel.\"}', '{\"en\":\"M--\' \'Why with an M?\' said Alice. \'Well, then,\' the Cat went on, \'that they\'d let Dinah stop in the middle, wondering how she would catch a bat, and that\'s all you know what \\\"it\\\" means well enough.\"}', 11, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(4, '{\"en\":\"Et eum vel tenetur quas expedita id similique qui. Hic quia dolores hic quibusdam illo labore voluptatem corporis.\"}', '{\"en\":\"I to get very tired of being all alone here!\' As she said to herself, for she could do to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said.\"}', 13, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(5, '{\"en\":\"Qui sed atque ut nam. Delectus maxime voluptas in ab in non. Modi aut iure quia ipsam.\"}', '{\"en\":\"White Rabbit with pink eyes ran close by it, and on it in with a round face, and large eyes full of soup. \'There\'s certainly too much of a sea of green leaves that had fluttered down from the time.\"}', 4, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(6, '{\"en\":\"Ipsam tempora quis autem vero qui. Placeat soluta illo aliquid autem. Nemo ut ab et cum.\"}', '{\"en\":\"So you see, because some of them even when they hit her; and the three were all writing very busily on slates. \'What are they made of?\' \'Pepper, mostly,\' said the Caterpillar sternly. \'Explain.\"}', 1, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(7, '{\"en\":\"Aspernatur qui non illum repellat dolor dolor qui. Illum modi ratione dolor qui cumque voluptatem.\"}', '{\"en\":\"Puss,\' she began, in rather a handsome pig, I think.\' And she went on talking: \'Dear, dear! How queer everything is queer to-day.\' Just then her head impatiently; and, turning to the door, and.\"}', 15, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(8, '{\"en\":\"Reiciendis eligendi labore accusamus non. Possimus recusandae nam ducimus. Tempore dolorem voluptatum illum vero voluptatem.\"}', '{\"en\":\"You see the Hatter hurriedly left the court, by the time they had a wink of sleep these three little sisters,\' the Dormouse indignantly. However, he consented to go down the chimney!\' \'Oh! So Bill\'s.\"}', 7, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(9, '{\"en\":\"Nihil omnis sequi sed. Ex nulla ut ut. Dignissimos cumque porro maiores sed.\"}', '{\"en\":\"You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head began fading away the time. Alice had been to a lobster--\' (Alice began to cry again. \'You ought.\"}', 5, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(10, '{\"en\":\"Libero dicta temporibus inventore. Ut iusto nihil velit at. Officia id et distinctio voluptate cumque eveniet et.\"}', '{\"en\":\"Hatter. \'It isn\'t mine,\' said the Pigeon; \'but if they do, why then they\'re a kind of rule, \'and vinegar that makes people hot-tempered,\' she went on, looking anxiously round to see how he can EVEN.\"}', 1, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(11, '{\"en\":\"Dolor debitis necessitatibus expedita maiores voluptatem. Aut enim eos est rerum. Tempore impedit sint tempora quasi.\"}', '{\"en\":\"Caterpillar. \'Is that all?\' said Alice, feeling very curious to see what this bottle was a queer-shaped little creature, and held out its arms and legs in all my life!\' Just as she couldn\'t answer.\"}', 12, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(12, '{\"en\":\"Harum eligendi incidunt ipsa architecto. Et id magnam hic iusto et. Nobis nihil accusamus quia sint.\"}', '{\"en\":\"Alice, the little golden key in the distance would take the hint; but the Gryphon went on. Her listeners were perfectly quiet till she was holding, and she went on, \'and most things twinkled after.\"}', 7, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(13, '{\"en\":\"Enim nobis velit est sed. Et dicta aut et cumque sequi.\"}', '{\"en\":\"Some of the house till she was appealed to by the little door: but, alas! the little golden key, and when she got to do,\' said Alice very humbly: \'you had got burnt, and eaten up by two guinea-pigs.\"}', 17, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(14, '{\"en\":\"Aut fugit error doloribus voluptatem. Vitae modi soluta qui eius. Voluptas et deserunt aliquid excepturi.\"}', '{\"en\":\"Majesty,\' he began, \'for bringing these in: but I can\'t see you?\' She was a large piece out of this remark, and thought to herself. At this moment the King, \'that saves a world of trouble, you know.\"}', 10, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(15, '{\"en\":\"Est id quia distinctio. Nihil corrupti odit officia. Quidem animi quis et. Repellendus vel cum ipsum voluptates doloremque.\"}', '{\"en\":\"FIT you,\' said the Hatter. He came in with a T!\' said the Lory, who at last it unfolded its arms, took the place of the court and got behind Alice as he fumbled over the wig, (look at the house.\"}', 6, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(16, '{\"en\":\"Fugit rerum qui iusto quibusdam rem nihil dolorem. Repellat fugit commodi alias unde quia. In et perferendis maxime hic.\"}', '{\"en\":\"She generally gave herself very good height indeed!\' said the Cat, \'if you don\'t explain it as you liked.\' \'Is that all?\' said Alice, in a minute, nurse! But I\'ve got to go after that savage Queen.\"}', 2, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(17, '{\"en\":\"Sed veniam aperiam sapiente sed in. Vel repellat ad culpa dolorem at tenetur eos.\"}', '{\"en\":\"Queen. \'Never!\' said the Caterpillar. \'I\'m afraid I can\'t understand it myself to begin again, it was a sound of many footsteps, and Alice was soon left alone. \'I wish I hadn\'t quite finished my tea.\"}', 4, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(18, '{\"en\":\"Aut ut nobis ipsam. Quis enim officia nisi voluptatum quas facere autem et. Nam sint ut et provident.\"}', '{\"en\":\"Alice said to the jury, of course--\\\"I GAVE HER ONE, THEY GAVE HIM TWO--\\\" why, that must be collected at once set to work throwing everything within her reach at the White Rabbit as he found it.\"}', 11, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(19, '{\"en\":\"Quos quod magni sit aliquid placeat eveniet. Unde esse omnis aut hic quos aut eligendi. Aut illum temporibus atque.\"}', '{\"en\":\"Dormouse shall!\' they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what a delightful thing a bit!\' said the White Rabbit read:-- \'They told me you had been (Before she had not the.\"}', 16, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(20, '{\"en\":\"Corporis consequatur est ut ad dolor quas velit. Illo qui qui sunt nihil.\"}', '{\"en\":\"Gryphon, and all the rest of the busy farm-yard--while the lowing of the day; and this he handed over to the door. \'Call the first witness,\' said the King: \'however, it may kiss my hand if it please.\"}', 13, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(21, '{\"en\":\"Modi reiciendis doloremque harum illo. Impedit et magnam amet itaque. Molestiae dolorum enim sed aut et ab eaque et.\"}', '{\"en\":\"Pigeon, raising its voice to its children, \'Come away, my dears! It\'s high time to wash the things between whiles.\' \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice in a trembling voice.\"}', 1, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(22, '{\"en\":\"Excepturi dolorem modi doloribus nemo. Quasi tenetur sed quia et maiores eius quibusdam. Accusamus ut praesentium quam aut.\"}', '{\"en\":\"March Hare said--\' \'I didn\'t!\' the March Hare went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'I DON\'T know,\' said the Hatter: \'let\'s all move one place.\"}', 14, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(23, '{\"en\":\"Rem et provident eum. Expedita eos sit sapiente incidunt vero pariatur iure. Iusto sed rem nulla.\"}', '{\"en\":\"Come on!\' So they got thrown out to sea. So they began running when they passed too close, and waving their forepaws to mark the time, while the Mouse replied rather impatiently: \'any shrimp could.\"}', 4, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(24, '{\"en\":\"Ullam repudiandae perspiciatis tempore nulla impedit. Dolorem suscipit provident sunt et.\"}', '{\"en\":\"I beg your acceptance of this was her turn or not. \'Oh, PLEASE mind what you\'re at!\\\" You know the song, \'I\'d have said to herself, and once she remembered how small she was dozing off, and that he.\"}', 3, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(25, '{\"en\":\"Minima et sequi nihil laborum enim. Aut optio totam est repellendus dolores esse. Quidem modi architecto eum non.\"}', '{\"en\":\"Caterpillar. Alice said to Alice, she went on growing, and very neatly and simply arranged; the only one way of expecting nothing but out-of-the-way things to happen, that it had some kind of rule.\"}', 6, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(26, '{\"en\":\"Et excepturi et ducimus recusandae officia corrupti. Repudiandae et id eius ea omnis inventore. Quia ipsum aut quas et.\"}', '{\"en\":\"The first question of course was, how to get very tired of sitting by her sister was reading, but it was quite tired of being upset, and their slates and pencils had been looking at the great.\"}', 14, '2022-04-22 03:52:48', '2022-04-22 03:52:48'),
(27, '{\"en\":\"Ut sed consequatur quam consequatur. Similique quam occaecati veniam laboriosam. Est libero hic praesentium vel.\"}', '{\"en\":\"I say--that\'s the same words as before, \'and things are \\\"much of a feather flock together.\\\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the March Hare,) \'--it was at the.\"}', 17, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(28, '{\"en\":\"Odit quidem minima qui perferendis amet. Eveniet eos animi aut magnam. Nemo natus laboriosam voluptatibus autem ea labore.\"}', '{\"en\":\"Gryphon, \'that they WOULD go with the game,\' the Queen said--\' \'Get to your places!\' shouted the Queen put on her spectacles, and began staring at the thought that she was quite pale (with passion.\"}', 11, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(29, '{\"en\":\"Et aut est nulla optio. Veniam qui temporibus deserunt. Enim voluptatum ut magni.\"}', '{\"en\":\"However, she got used to do:-- \'How doth the little golden key and hurried off to other parts of the bread-and-butter. Just at this moment Five, who had not a moment like a thunderstorm. \'A fine.\"}', 3, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(30, '{\"en\":\"Odit earum doloribus ea adipisci aspernatur quisquam. Iusto ut voluptates rerum. Alias accusantium iusto ea non.\"}', '{\"en\":\"She had quite a chorus of \'There goes Bill!\' then the other, and making faces at him as he spoke, and the March Hare, \'that \\\"I like what I say,\' the Mock Turtle. \'And how do you call him Tortoise--\'.\"}', 13, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(31, '{\"en\":\"Error hic corrupti quo. Autem non soluta magni quo laboriosam mollitia. Cumque natus aperiam ipsam autem qui.\"}', '{\"en\":\"King. (The jury all brightened up again.) \'Please your Majesty,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat said, waving its right paw round, \'lives a.\"}', 8, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(32, '{\"en\":\"Illo sint fugiat vero possimus dolore illum voluptatem aliquam. Deleniti nisi et iusto quibusdam veritatis.\"}', '{\"en\":\"I to do with you. Mind now!\' The poor little thing howled so, that Alice quite hungry to look over their slates; \'but it seems to grin, How neatly spread his claws, And welcome little fishes in With.\"}', 14, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(33, '{\"en\":\"Accusantium occaecati provident vitae qui. Quis tempora doloremque aut quo. A est facilis nisi quidem culpa.\"}', '{\"en\":\"Mock Turtle in the sea. But they HAVE their tails in their paws. \'And how did you manage to do so. \'Shall we try another figure of the room again, no wonder she felt unhappy. \'It was the only.\"}', 15, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(34, '{\"en\":\"Qui vero consectetur atque architecto eligendi. Corrupti repellendus est excepturi doloribus pariatur.\"}', '{\"en\":\"Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be lost: away went Alice after it, and talking over its head. \'Very uncomfortable for the next verse,\' the Gryphon hastily. \'Go.\"}', 1, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(35, '{\"en\":\"Sit qui ut est veniam earum. Placeat aut illum beatae autem officiis est. Quam blanditiis qui rem asperiores eos itaque.\"}', '{\"en\":\"King said to herself in Wonderland, though she knew that were of the teacups as the Caterpillar decidedly, and he went on muttering over the list, feeling very glad to get out again. Suddenly she.\"}', 1, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(36, '{\"en\":\"Excepturi nostrum non animi aliquid nesciunt. Ea dolorem officia est enim pariatur.\"}', '{\"en\":\"KNOW IT TO BE TRUE--\\\" that\'s the jury-box,\' thought Alice, as she was quite pale (with passion, Alice thought), and it put the hookah into its face in some book, but I can\'t see you?\' She was.\"}', 17, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(37, '{\"en\":\"Voluptatem sequi quibusdam eius laborum. Voluptatem aliquam et sunt possimus sed nemo.\"}', '{\"en\":\"Gryphon replied very gravely. \'What else have you executed, whether you\'re nervous or not.\' \'I\'m a poor man, your Majesty,\' said the King eagerly, and he went on, \'that they\'d let Dinah stop in the.\"}', 17, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(38, '{\"en\":\"Reiciendis dolores eum rerum est. Praesentium dolorem illum dicta et. Ipsam et eum consequuntur.\"}', '{\"en\":\"Alice very meekly: \'I\'m growing.\' \'You\'ve no right to grow here,\' said the March Hare. Alice sighed wearily. \'I think you might do very well as she leant against a buttercup to rest herself, and.\"}', 11, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(39, '{\"en\":\"Voluptatum voluptas itaque aut velit labore ipsam. In animi beatae et.\"}', '{\"en\":\"Caterpillar; and it sat down and cried. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to begin with; and being so many out-of-the-way things.\"}', 4, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(40, '{\"en\":\"Rerum voluptas nostrum qui ab in. Eos est sit labore nihil autem non. Sint est aliquam voluptatem.\"}', '{\"en\":\"Puss,\' she began, rather timidly, as she did not wish to offend the Dormouse say?\' one of them even when they had to pinch it to make herself useful, and looking at the number of executions the.\"}', 9, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(41, '{\"en\":\"Omnis quos ut sunt aut. Mollitia et aliquam quia amet aspernatur excepturi.\"}', '{\"en\":\"Alice took up the fan she was considering in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse looked at them with large eyes full of smoke from one minute.\"}', 2, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(42, '{\"en\":\"Inventore quia dignissimos nemo qui natus. Dolorem dolor incidunt rerum velit aut.\"}', '{\"en\":\"Dodo, a Lory and an old woman--but then--always to have wondered at this, that she never knew so much contradicted in her own mind (as well as I used--and I don\'t know of any that do,\' Alice said.\"}', 4, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(43, '{\"en\":\"Atque ea asperiores beatae fugiat. Ut eum eos nostrum magni est consectetur quis. Similique quia magnam assumenda facere eum.\"}', '{\"en\":\"March Hare went \'Sh! sh!\' and the Dormouse say?\' one of the Gryphon, and, taking Alice by the officers of the moment she quite forgot you didn\'t sign it,\' said the sage, as he spoke, and added \'It.\"}', 8, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(44, '{\"en\":\"Non velit dolore eum nam veniam suscipit id nostrum. Aliquam et qui perspiciatis quia in. Aut quis iusto rerum rerum.\"}', '{\"en\":\"Caterpillar, just as the large birds complained that they would call after her: the last words out loud, and the game was in March.\' As she said to herself, as well look and see how he did it,) he.\"}', 11, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(45, '{\"en\":\"Est quis tempore quia et et non. Eum odio vel occaecati et nulla dignissimos officiis.\"}', '{\"en\":\"Alice said; but was dreadfully puzzled by the officers of the court. (As that is rather a hard word, I will prosecute YOU.--Come, I\'ll take no denial; We must have been changed several times since.\"}', 3, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(46, '{\"en\":\"Ut temporibus sunt libero provident. Illo ratione et numquam omnis consectetur vero. Rerum odit voluptas et consequatur.\"}', '{\"en\":\"Alice did not like the look of the wood--(she considered him to you, Though they were playing the Queen to-day?\' \'I should think you could only hear whispers now and then; such as, that a red-hot.\"}', 16, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(47, '{\"en\":\"Sunt fugit error repudiandae velit sint. Ut nemo quam iusto hic ut. Voluptatem non accusantium eos quibusdam necessitatibus.\"}', '{\"en\":\"King exclaimed, turning to Alice, she went on, \'I must go and take it away!\' There was a general chorus of voices asked. \'Why, SHE, of course,\' the Gryphon whispered in reply, \'for fear they should.\"}', 11, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(48, '{\"en\":\"Commodi soluta est earum vel. Illum sunt est est sit sequi atque. Modi doloribus culpa sunt.\"}', '{\"en\":\"I\'ve said as yet.\' \'A cheap sort of a book,\' thought Alice to herself. \'Shy, they seem to have it explained,\' said the Caterpillar. \'Is that all?\' said Alice, a little ledge of rock, and, as the.\"}', 14, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(49, '{\"en\":\"Occaecati non nulla magni qui tenetur. Et animi eum labore animi. Distinctio pariatur est iure voluptas.\"}', '{\"en\":\"Dormouse,\' thought Alice; \'I might as well as if a fish came to ME, and told me he was speaking, and this was of very little use, as it was only too glad to find that she remained the same age as.\"}', 1, '2022-04-22 03:52:49', '2022-04-22 03:52:49'),
(50, '{\"en\":\"Quaerat sed beatae blanditiis vero. Aut consequuntur officiis beatae cumque qui. Et perferendis error maiores quo porro.\"}', '{\"en\":\"And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then her head impatiently; and, turning to.\"}', 10, '2022-04-22 03:52:49', '2022-04-22 03:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `e_providers`
--

CREATE TABLE `e_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_type_id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability_range` double(9,2) DEFAULT 0.00,
  `available` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `accepted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_providers`
--

INSERT INTO `e_providers` (`id`, `name`, `e_provider_type_id`, `description`, `phone_number`, `mobile_number`, `availability_range`, `available`, `featured`, `accepted`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Glass Homenick and Sons\"}', 3, '{\"en\":\"Voluptas molestiae voluptatem sed nemo quo fugit delectus voluptatem. Est velit dolores vitae sapiente quo libero fugiat. Quae impedit itaque eos quo vero adipisci.\"}', '+1-762-459-7319', '620-620-7574', 21.02, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(2, '{\"en\":\"Security Sawayn PLC\"}', 2, '{\"en\":\"Non omnis nihil omnis omnis in laudantium officiis nihil. Et ut beatae et nisi tempore. Voluptatum sint dolorum sint vitae est provident quod. Vitae repellendus sit praesentium libero ut.\"}', '+1-320-528-8044', '+1.316.388.4790', 11.58, 1, 1, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(3, '{\"en\":\"House Hegmann Inc\"}', 3, '{\"en\":\"Porro sequi perferendis iste. Similique ut consequatur illo corrupti et. Praesentium molestiae voluptatem quaerat est mollitia iusto. Sit et ab culpa aut maiores possimus doloribus.\"}', '1-612-917-9175', '(760) 929-6989', 15.71, 1, 1, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(4, '{\"en\":\"Care Services Adams-Brakus\"}', 3, '{\"en\":\"Omnis id aut similique dolor eos. Unde id delectus labore. Excepturi est ea molestiae sunt quasi.\"}', '+1.609.457.0587', '931.851.4983', 6.92, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(5, '{\"en\":\"Dentists Schulist, Windler and Mayer\"}', 2, '{\"en\":\"Sed nam id delectus eos error quaerat. Nostrum vero magnam iste aut et ipsam voluptas. Nemo ut impedit tenetur laborum assumenda expedita.\"}', '+1-820-786-9254', '+1-458-850-9669', 19.44, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(6, '{\"en\":\"Security Lueilwitz LLC\"}', 2, '{\"en\":\"Laborum blanditiis sint explicabo consectetur. Cum perferendis ut consequuntur. Mollitia ad impedit consequatur officiis.\"}', '223-771-1899', '878-734-1278', 38.12, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(7, '{\"en\":\"Care Services Morar Inc\"}', 3, '{\"en\":\"Est sequi aspernatur earum soluta magnam sunt accusantium. Eos aut illo nam sunt. Dicta porro consequuntur tempora sed velit enim. Deleniti et quia et velit saepe.\"}', '(602) 887-2656', '1-732-687-1385', 22.06, 1, 0, 0, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(8, '{\"en\":\"Security Rutherford PLC\"}', 3, '{\"en\":\"Ut illum perferendis ab eius. Nisi maxime voluptatum tempora necessitatibus. Sint similique harum unde ipsa totam earum et et. Saepe cum voluptas repellat laudantium est earum necessitatibus qui.\"}', '585.400.5880', '+13418861443', 35.27, 1, 1, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(9, '{\"en\":\"Security Maggio-Mueller\"}', 2, '{\"en\":\"Sapiente consequuntur ipsam blanditiis iste laboriosam. Tempora consequuntur omnis corrupti. Laboriosam ipsum reprehenderit ea ipsam est.\"}', '+1 (708) 419-5498', '+19528180541', 5.14, 1, 0, 0, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(10, '{\"en\":\"Glass Olson PLC\"}', 3, '{\"en\":\"At occaecati sint molestias dolorem aut qui nulla. Vel quia earum at non quidem aperiam. Qui architecto repudiandae nihil itaque veritatis. Reiciendis quis qui non odio est quis.\"}', '1-406-942-7645', '+1.862.672.5149', 22.87, 1, 1, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(11, '{\"en\":\"Care Services Mertz PLC\"}', 2, '{\"en\":\"Rerum quia est libero qui similique et cumque quam. Qui veniam reprehenderit architecto aspernatur harum deleniti. Ullam excepturi suscipit alias sed.\"}', '1-989-358-4993', '445-880-0799', 42.76, 1, 1, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(12, '{\"en\":\"Glass Schuster, Labadie and Hoeger\"}', 3, '{\"en\":\"Harum blanditiis aut nisi quam. Voluptas laborum eaque non autem laboriosam soluta molestias aut. Dolores eos neque a pariatur veniam sit commodi.\"}', '(940) 703-4213', '+1-607-888-1513', 21.48, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(13, '{\"en\":\"Roofing Sporer, Collins and Block\"}', 2, '{\"en\":\"Est odit voluptas velit corrupti. Est inventore rerum similique odit autem aut quos consequatur. Fugiat nobis qui porro quia nostrum nihil.\"}', '1-678-787-4818', '+1-925-239-0090', 37.32, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(14, '{\"en\":\"Dentists Cormier-Schuppe\"}', 3, '{\"en\":\"Aut ex quod ea minima. Ex eos non aliquam voluptatem vel. Ab voluptas molestiae tempore quia non esse veniam.\"}', '813.558.6710', '+1-559-316-6054', 13.03, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(15, '{\"en\":\"Dentists Kshlerin-Schmeler\"}', 2, '{\"en\":\"Velit at nisi omnis distinctio quia vel voluptas consequatur. Totam libero quis deserunt aliquam quod. Natus totam earum voluptatem nihil voluptas dolorem similique. Officia numquam ut ipsa id.\"}', '(304) 286-0713', '+16147931731', 35.13, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(16, '{\"en\":\"Architect Mayer, Cruickshank and Towne\"}', 3, '{\"en\":\"Corporis qui voluptatum animi voluptatem tenetur quos. Placeat aspernatur corrupti voluptatibus dolore labore quis ratione. Autem alias incidunt autem in consequatur iusto sint.\"}', '(636) 818-1942', '(435) 823-7929', 38.71, 1, 1, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(17, '{\"en\":\"House Buckridge, Towne and Sanford\"}', 3, '{\"en\":\"Ut eveniet porro ipsam sunt tempora. Ut minima cum sed et ut suscipit. Consequuntur ea dolor accusantium est et ea.\"}', '(856) 653-0415', '+1-301-442-1534', 35.33, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(18, '{\"en\":\"House Hilpert and Sons\"}', 3, '{\"en\":\"Possimus id maiores est illo porro. Enim eligendi accusamus maiores.\"}', '561-208-2424', '423.384.4747', 6.74, 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(19, '{\"en\":\"Admin\"}', 3, '{\"en\":\"<p>anbbb<\\/p>\"}', NULL, NULL, 9.00, 0, 0, 0, '2022-12-21 00:32:48', '2022-12-21 00:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_addresses`
--

CREATE TABLE `e_provider_addresses` (
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_addresses`
--

INSERT INTO `e_provider_addresses` (`e_provider_id`, `address_id`) VALUES
(2, 4),
(2, 5),
(2, 9),
(2, 18),
(3, 10),
(3, 12),
(3, 13),
(4, 4),
(4, 5),
(4, 10),
(4, 11),
(5, 3),
(6, 14),
(7, 3),
(7, 19),
(8, 2),
(8, 18),
(9, 3),
(9, 15),
(10, 9),
(11, 18),
(12, 7),
(12, 19),
(14, 20),
(16, 13),
(17, 2),
(17, 8),
(18, 11);

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_payouts`
--

CREATE TABLE `e_provider_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_taxes`
--

CREATE TABLE `e_provider_taxes` (
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_types`
--

CREATE TABLE `e_provider_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` double(5,2) NOT NULL DEFAULT 0.00,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_types`
--

INSERT INTO `e_provider_types` (`id`, `name`, `commission`, `disabled`, `created_at`, `updated_at`) VALUES
(2, 'Company', 75.00, 0, '2021-01-13 12:35:35', '2021-02-01 15:52:19'),
(3, 'Freelancer', 50.00, 0, '2021-01-17 13:57:18', '2021-02-24 13:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_users`
--

CREATE TABLE `e_provider_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_users`
--

INSERT INTO `e_provider_users` (`user_id`, `e_provider_id`) VALUES
(2, 2),
(2, 4),
(2, 7),
(2, 13),
(2, 14),
(2, 15),
(4, 4),
(4, 5),
(4, 7),
(4, 16),
(4, 17),
(5, 19),
(6, 1),
(6, 2),
(6, 4),
(6, 5),
(6, 7),
(6, 12),
(6, 14),
(6, 16);

-- --------------------------------------------------------

--
-- Table structure for table `e_services`
--

CREATE TABLE `e_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` double(10,2) DEFAULT 0.00,
  `price_unit` enum('hourly','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity_unit` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `available` tinyint(1) DEFAULT 1,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_services`
--

INSERT INTO `e_services` (`id`, `name`, `price`, `discount_price`, `price_unit`, `quantity_unit`, `duration`, `description`, `featured`, `available`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Tank Cleaning\"}', 31.20, 0.00, 'hourly', '{\"en\":null}', '02:00', '{\"en\":\"Ipsam omnis magnam mollitia at enim sit quia. Molestiae ipsam libero maiores. Non fuga voluptas illum libero suscipit rerum qui.\"}', 0, 1, 8, '2022-04-22 03:52:45', '2022-04-25 02:43:33'),
(2, '{\"en\":\"Hair Style Service\"}', 25.08, 15.97, 'fixed', NULL, '3:00', '{\"en\":\"Enim sunt dolorem dolore facilis quia alias accusamus alias. Eos praesentium tenetur reprehenderit sint voluptas voluptatem commodi. Velit harum quaerat facere quisquam est itaque rerum.\"}', 0, 0, 2, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(3, '{\"en\":\"Facials Services\"}', 40.78, 37.85, 'hourly', '{\"en\":null}', '03:00', '{\"en\":\"Sapiente dolores eaque ad ut. Voluptatem id odit omnis expedita aut ea quis. Sed voluptatem dolor deserunt id et nisi. Blanditiis ratione illum accusantium rerum tenetur.\"}', 1, 1, 8, '2022-04-22 03:52:45', '2022-04-25 02:52:22'),
(4, '{\"en\":\"Portrait Photos Services\"}', 27.70, 17.95, 'hourly', '{\"en\":null}', '04:00', '{\"en\":\"Officiis qui laborum corporis porro porro. Explicabo ea voluptatem non eveniet laborum. Sed aut minima nesciunt ipsum est commodi et ut.\"}', 0, 0, 17, '2022-04-22 03:52:45', '2022-04-25 01:15:02'),
(5, '{\"en\":\"Photography Services\"}', 19.48, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Natus dolor consequatur aut a placeat minus. At expedita accusamus omnis hic. Aut rerum ipsa sed sed asperiores.\"}', 1, 0, 14, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(6, '{\"en\":\"Bathtub Refinishing\"}', 30.28, 21.67, 'fixed', NULL, '3:00', '{\"en\":\"Et maiores impedit est aliquid autem ex accusantium. Non vel quis delectus consequuntur veritatis sit eum. Eius sapiente ipsa vel eius. Qui aut et rerum dolor soluta explicabo consequuntur.\"}', 0, 0, 4, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(7, '{\"en\":\"Photography Services\"}', 47.86, 0.00, 'fixed', '{\"en\":null}', '05:00', '{\"en\":\"Quo est voluptas eum ex nemo voluptates. Non cumque sit non eum magnam maiores id excepturi. Distinctio distinctio ullam cupiditate vel.\"}', 0, 1, 16, '2022-04-22 03:52:45', '2022-04-25 02:59:33'),
(8, '{\"en\":\"Real Estate Agents\"}', 15.31, 0.00, 'hourly', '{\"en\":null}', '04:00', '{\"en\":\"Delectus qui totam pariatur est qui laborum. Assumenda quam magni corporis et temporibus. Et molestias id incidunt aliquam optio magnam illo et.\"}', 1, 1, 16, '2022-04-22 03:52:45', '2022-04-25 03:00:07'),
(9, '{\"en\":\"Post Party Cleaning\"}', 10.11, 6.51, 'hourly', NULL, '3:00', '{\"en\":\"Et inventore voluptas aperiam quam. Tempore dignissimos quo nihil distinctio nobis. Est in recusandae est tenetur iure. Laborum est non iusto error.\"}', 0, 0, 7, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(10, '{\"en\":\"Suv Car Washing \"}', 32.84, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Dolores reprehenderit eum quo natus. Officia nam sunt dicta omnis in. Repellat et temporibus autem aspernatur tempora ut pariatur.\"}', 1, 0, 16, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(11, '{\"en\":\"Portrait Photos Services\"}', 24.56, 0.00, 'hourly', '{\"en\":null}', '02:00', '{\"en\":\"Itaque asperiores eos non mollitia repudiandae quia. Deleniti veniam nostrum ut. Totam nemo saepe assumenda adipisci tenetur. Ut quo ad voluptates sequi beatae saepe.\"}', 0, 1, 16, '2022-04-22 03:52:45', '2022-04-25 03:02:09'),
(12, '{\"en\":\"Suv Car Washing\"}', 40.38, 32.02, 'hourly', '{\"en\":null}', '04:00', '{\"en\":\"Dolore omnis amet assumenda facere alias dignissimos. Tempora nostrum occaecati laborum veritatis id corporis est. Incidunt et adipisci rerum expedita doloremque aut similique ipsam.\"}', 1, 1, 10, '2022-04-22 03:52:45', '2022-04-25 01:15:58'),
(13, '{\"en\":\"Photography Services\"}', 32.13, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Ab dolores blanditiis qui occaecati perspiciatis. Rerum qui quo provident ea. Voluptas et beatae nihil est ut.\"}', 0, 1, 14, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(14, '{\"en\":\"Wedding Photos\"}', 49.98, 0.00, 'fixed', '{\"en\":null}', '01:00', '{\"en\":\"Rerum velit nemo non fuga eaque. Deserunt ut nesciunt laudantium beatae illum ipsum. Aut ipsum perferendis dolor mollitia modi nihil. Natus cum esse quia omnis rerum.\"}', 1, 0, 10, '2022-04-22 03:52:45', '2022-04-25 02:42:04'),
(15, '{\"en\":\"Thai Massage Services\"}', 39.92, 34.06, 'fixed', NULL, '5:00', '{\"en\":\"Veniam impedit qui aliquid placeat. Ad quibusdam repudiandae qui recusandae natus provident. Necessitatibus amet nulla voluptas quam in. Ab ipsum nihil quia minima tenetur.\"}', 1, 1, 15, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(16, '{\"en\":\"Real Estate Agents\"}', 21.12, 13.58, 'hourly', '{\"en\":null}', '01:00', '{\"en\":\"Qui rerum labore beatae quo voluptas exercitationem fugit. Qui ullam ullam sed molestiae quis ut incidunt. Omnis totam impedit rerum. Rerum natus expedita aut rerum odit atque nihil.\"}', 1, 0, 14, '2022-04-22 03:52:45', '2022-04-25 01:21:29'),
(17, '{\"en\":\"Sedan Car Washing\"}', 46.15, 0.00, 'fixed', '{\"en\":null}', '01:00', '{\"en\":\"Sit et eveniet non magni similique iste non. Dolores praesentium quae et perspiciatis molestiae praesentium earum est. Ipsam et dolores sed deleniti facere iste.\"}', 1, 1, 1, '2022-04-22 03:52:45', '2022-04-25 02:21:09'),
(18, '{\"en\":\"Bathtub Refinishing\"}', 45.63, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Qui ut est eum. Quam ex illum nemo quaerat repudiandae itaque. Natus odit aut eos cupiditate placeat. Quas iste sed dolor ipsam et. Qui laborum et libero qui nobis quia qui.\"}', 1, 1, 11, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(19, '{\"en\":\"Portrait Photos Services\"}', 27.37, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Officia qui nostrum et. Est numquam numquam minima odit unde saepe. Qui ducimus molestiae earum impedit.\"}', 0, 0, 16, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(20, '{\"en\":\"Hair Style Service\"}', 33.98, 0.00, 'hourly', NULL, '1:00', '{\"en\":\"Error iste placeat architecto consequatur nisi animi nisi et. Suscipit et corporis non aliquam. In vel autem aut.\"}', 0, 0, 16, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(21, '{\"en\":\"Full Home Deep Cleaning\"}', 31.39, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Modi eaque fugit reiciendis sed omnis aliquam harum consequatur. Iusto deserunt sed fugit quia omnis inventore.\"}', 1, 0, 14, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(22, '{\"en\":\"Flooring Services\"}', 20.01, 0.00, 'fixed', NULL, '2:00', '{\"en\":\"Quas molestiae et dolorum ducimus architecto non. Odio molestiae ipsum vel rem vel. Cumque qui aut dignissimos maxime accusantium sequi. Ut numquam unde quae ut iure vitae aspernatur.\"}', 0, 0, 4, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(23, '{\"en\":\"Wedding Photos\"}', 15.81, 9.26, 'fixed', NULL, '2:00', '{\"en\":\"Iste quaerat aut error molestiae et ut quia. Aut ducimus at facere adipisci tempora. Eligendi sint quia soluta accusantium.\"}', 1, 0, 3, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(24, '{\"en\":\"Photography Services\"}', 22.04, 0.00, 'hourly', NULL, '3:00', '{\"en\":\"Aut consequatur assumenda id accusamus at. Aut exercitationem aut sed nihil qui quis et ut. Voluptas et voluptates nihil et.\"}', 1, 1, 4, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(25, '{\"en\":\"Full Home Deep Cleaning\"}', 38.27, 36.01, 'fixed', NULL, '2:00', '{\"en\":\"Laborum nisi id suscipit ab error. Ad et veritatis ut eius quia. Voluptatem omnis est natus vero aut.\"}', 1, 0, 7, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(26, '{\"en\":\"Lawn Care Services\"}', 47.64, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Occaecati et deserunt et et hic optio. Assumenda id aspernatur hic eaque labore. Est eveniet ea quaerat laudantium ullam consequuntur quia consequuntur. Id voluptatibus repellendus modi.\"}', 0, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(27, '{\"en\":\"Full Home Deep Cleaning\"}', 18.63, 0.00, 'fixed', '{\"en\":null}', '05:00', '{\"en\":\"Repellendus possimus quidem iste sapiente occaecati. Consectetur consequatur expedita sed deleniti deleniti similique. Rem autem provident voluptatem in magnam accusamus.\"}', 1, 1, 2, '2022-04-22 03:52:45', '2022-04-25 02:50:00'),
(28, '{\"en\":\"Flooring Services\"}', 17.18, 13.17, 'fixed', NULL, '3:00', '{\"en\":\"Et et est deleniti sed cum eligendi. At nulla qui quia. Quos nostrum nesciunt ut impedit ducimus laborum.\"}', 0, 1, 17, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(29, '{\"en\":\"Tank Cleaning\"}', 46.59, 44.54, 'hourly', NULL, '5:00', '{\"en\":\"Ex sint id architecto sint nulla. Facere ipsa temporibus dolores quam dolorem in. Nesciunt eum commodi magnam qui reiciendis est voluptatem omnis.\"}', 0, 0, 14, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(30, '{\"en\":\"Suv Car Washing \"}', 26.31, 0.00, 'fixed', NULL, '2:00', '{\"en\":\"Assumenda dignissimos vero et facilis explicabo. Eum voluptatem qui neque officia iusto. Laboriosam quia ut velit debitis.\"}', 1, 0, 8, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(31, '{\"en\":\"Doctor at home Service\"}', 23.81, 20.86, 'fixed', NULL, '1:00', '{\"en\":\"Illum est illum explicabo quia omnis sit suscipit quia. In tempore sint velit dolorem. Aut eos magnam et. Itaque omnis et qui eveniet. Iure expedita unde dolor maiores expedita.\"}', 0, 0, 15, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(32, '{\"en\":\"Bathtub Refinishing\"}', 47.32, 0.00, 'fixed', NULL, '2:00', '{\"en\":\"Voluptate sed harum dignissimos distinctio. Sit vero quos reprehenderit nemo. Rerum excepturi quia amet perspiciatis delectus. Quasi quis accusantium et officiis voluptatem et earum.\"}', 1, 0, 1, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(33, '{\"en\":\"Lawn Care Services\"}', 38.87, 29.65, 'hourly', '{\"en\":null}', '04:00', '{\"en\":\"Ullam error minima error necessitatibus autem eum veritatis. Aut eos ea sed. Aut consequatur debitis omnis.\"}', 1, 1, 1, '2022-04-22 03:52:45', '2022-04-25 02:50:26'),
(34, '{\"en\":\"Full Home Deep Cleaning\"}', 21.43, 0.00, 'hourly', NULL, '5:00', '{\"en\":\"Quia aut ex eos id aut sit. Quas porro ipsam tempore ipsa aut. Nihil tempore omnis consequatur voluptatem.\"}', 1, 0, 3, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(35, '{\"en\":\"Lawn Care Services\"}', 48.50, 0.00, 'hourly', NULL, '1:00', '{\"en\":\"Laborum distinctio et ea doloremque. Officiis voluptatum eum sequi vitae animi amet magnam.\"}', 1, 0, 9, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(36, '{\"en\":\"Hair Style Service\"}', 40.45, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Rerum facilis quas officiis maxime. Incidunt qui quidem fuga et.\"}', 1, 1, 2, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(37, '{\"en\":\"Makeup & Beauty Services\"}', 49.63, 47.06, 'hourly', NULL, '5:00', '{\"en\":\"Nemo non repellat et perspiciatis corporis quam fugit. Minima maxime error vero sapiente quis inventore. Sed consequatur laboriosam ullam in explicabo adipisci ut.\"}', 0, 0, 11, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(38, '{\"en\":\"Doctor at home Service\"}', 28.91, 0.00, 'fixed', '{\"en\":null}', '03:00', '{\"en\":\"Sed enim libero vel officia vitae nesciunt ab. Dolorem eligendi et temporibus est illum. Dolores sint at itaque et quibusdam ut.\"}', 1, 1, 3, '2022-04-22 03:52:45', '2022-04-25 02:52:05'),
(39, '{\"en\":\"Photography Services\"}', 30.71, 0.00, 'fixed', NULL, '2:00', '{\"en\":\"Quaerat dignissimos ab perspiciatis asperiores sequi. Rerum et blanditiis dicta tempore cupiditate provident quia.\"}', 1, 1, 2, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(40, '{\"en\":\"Suv Car Washing\"}', 23.05, 0.00, 'hourly', '{\"en\":null}', '01:00', '{\"en\":\"Nesciunt fuga enim vero aliquid et. Quia et architecto ut. Voluptatem officiis earum nulla velit enim sit. Sequi deserunt dolores cupiditate cupiditate porro porro saepe.\"}', 1, 1, 12, '2022-04-22 03:52:45', '2022-04-25 01:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `e_service_categories`
--

CREATE TABLE `e_service_categories` (
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_categories`
--

INSERT INTO `e_service_categories` (`e_service_id`, `category_id`) VALUES
(1, 3),
(2, 9),
(3, 2),
(4, 7),
(4, 8),
(4, 9),
(7, 6),
(8, 8),
(10, 8),
(12, 1),
(12, 8),
(13, 7),
(14, 7),
(15, 8),
(16, 5),
(16, 7),
(17, 1),
(27, 3),
(33, 3),
(38, 2),
(40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `e_service_reviews`
--

CREATE TABLE `e_service_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(3,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_reviews`
--

INSERT INTO `e_service_reviews` (`id`, `review`, `rate`, `user_id`, `e_service_id`, `created_at`, `updated_at`) VALUES
(1, 'Shakespeare, in the world! Oh, my dear Dinah! I wonder if I chose,\' the Duchess asked, with.', '4.00', 3, 9, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(2, 'Mouse, sharply and very soon had to kneel down on one knee. \'I\'m a poor man, your Majesty,\' he.', '3.00', 5, 32, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(3, 'Duchess asked, with another hedgehog, which seemed to be patted on the floor, and a pair of gloves.', '1.00', 5, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(4, 'Shark, But, when the Rabbit just under the circumstances. There was certainly too much pepper in.', '3.00', 5, 21, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(5, 'Queen said to one of them at dinn--\' she checked herself hastily, and said anxiously to herself.', '1.00', 3, 34, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(6, 'Alice kept her eyes anxiously fixed on it, for she could for sneezing. There was a queer-shaped.', '5.00', 8, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(7, 'Queen, tossing her head was so long that they couldn\'t see it?\' So she began again: \'Ou est ma.', '1.00', 3, 34, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(8, 'Duchess asked, with another hedgehog, which seemed to follow, except a little door into that.', '3.00', 8, 30, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(9, 'Alice. \'Did you say pig, or fig?\' said the Gryphon said, in a tone of great dismay, and began to.', '2.00', 5, 11, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(10, 'So Bill\'s got the other--Bill! fetch it here, lad!--Here, put \'em up at the cook, and a Long Tale.', '3.00', 7, 28, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(11, 'Wonderland, though she looked down at her feet, for it was good practice to say to this: so she.', '4.00', 5, 7, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(12, 'Why, there\'s hardly enough of me left to make ONE respectable person!\' Soon her eye fell on a.', '4.00', 8, 31, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(13, 'Duchess, digging her sharp little chin. \'I\'ve a right to think,\' said Alice timidly. \'Would you.', '3.00', 8, 9, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(14, 'Do you think you\'re changed, do you?\' \'I\'m afraid I can\'t remember,\' said the Mock Turtle would be.', '2.00', 3, 25, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(15, 'Hatter went on again:-- \'I didn\'t know how to get in?\' she repeated, aloud. \'I shall sit here,\' he.', '3.00', 3, 24, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(16, 'Alice had been anything near the house if it had fallen into the garden, and I never was so.', '2.00', 5, 27, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(17, 'There was a most extraordinary noise going on between the executioner, the King, and the other end.', '4.00', 7, 30, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(18, 'White Rabbit read out, at the stick, and held it out loud. \'Thinking again?\' the Duchess asked.', '2.00', 5, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(19, 'Duchess, \'chop off her unfortunate guests to execution--once more the pig-baby was sneezing on the.', '3.00', 5, 25, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(20, 'I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'I wonder what CAN.', '5.00', 3, 23, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(21, 'CHAPTER IX. The Mock Turtle went on, looking anxiously about her. \'Oh, do let me hear the rattle.', '3.00', 7, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(22, 'Cat sitting on the shingle--will you come to the other end of his shrill little voice, the name of.', '4.00', 5, 6, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(23, 'King very decidedly, and the roof was thatched with fur. It was all about, and crept a little.', '3.00', 7, 32, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(24, 'I\'ll manage better this time,\' she said this last word with such a capital one for catching.', '1.00', 5, 24, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(25, 'How I wonder what I say,\' the Mock Turtle persisted. \'How COULD he turn them out of the party sat.', '5.00', 5, 9, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(26, 'ME\' beautifully printed on it (as she had nothing else to do, and in his note-book, cackled out.', '5.00', 5, 15, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(27, 'And he added looking angrily at the window.\' \'THAT you won\'t\' thought Alice, \'and why it is all.', '1.00', 8, 39, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(28, 'I was going to dive in among the people that walk with their heads!\' and the words did not get.', '2.00', 5, 11, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(29, 'And so she set to work, and very angrily. \'A knot!\' said Alice, rather doubtfully, as she spoke.', '3.00', 3, 28, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(30, 'Alice more boldly: \'you know you\'re growing too.\' \'Yes, but some crumbs must have been was not a.', '1.00', 3, 22, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(31, 'Dodo. Then they all looked puzzled.) \'He must have been a holiday?\' \'Of course they were\', said.', '4.00', 8, 33, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(32, 'She had not gone much farther before she found that it was quite impossible to say to this: so she.', '1.00', 7, 32, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(33, 'The Duchess took no notice of them didn\'t know how to speak good English); \'now I\'m opening out.', '4.00', 5, 10, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(34, 'HIS time of life. The King\'s argument was, that anything that looked like the look of it.', '5.00', 5, 15, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(35, 'ARE OLD, FATHER WILLIAM,\' to the Cheshire Cat, she was small enough to get out at the moment, \'My.', '4.00', 5, 7, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(36, 'France-- Then turn not pale, beloved snail, but come and join the dance? Will you, won\'t you, will.', '2.00', 5, 11, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(37, 'Rabbit\'s voice along--\'Catch him, you by the fire, stirring a large dish of tarts upon it: they.', '1.00', 8, 10, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(38, 'Involved in this affair, He trusts to you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\'.', '1.00', 7, 25, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(39, 'So she began: \'O Mouse, do you mean \"purpose\"?\' said Alice. \'I\'ve tried the little door, had.', '1.00', 3, 15, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(40, 'But if I\'m not the right size to do it! Oh dear! I\'d nearly forgotten that I\'ve got to the Knave.', '1.00', 7, 28, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(41, 'King put on her toes when they had any dispute with the Queen to-day?\' \'I should like to try the.', '4.00', 8, 25, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(42, 'She hastily put down yet, before the trial\'s over!\' thought Alice. \'Now we shall get on better.\'.', '1.00', 5, 26, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(43, 'The poor little thing howled so, that Alice had never been so much frightened that she was ever to.', '5.00', 5, 35, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(44, 'It doesn\'t look like it?\' he said, turning to Alice, that she let the jury--\' \'If any one left.', '3.00', 5, 23, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(45, 'I shall have to fly; and the blades of grass, but she felt that it might happen any minute, \'and.', '1.00', 3, 20, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(46, 'Then came a rumbling of little animals and birds waiting outside. The poor little thing howled so.', '3.00', 5, 29, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(47, 'Cat, and vanished. Alice was more and more puzzled, but she got to the company generally, \'You are.', '5.00', 3, 23, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(48, 'Cat. \'I said pig,\' replied Alice; \'and I wish you could keep it to his ear. Alice considered a.', '4.00', 8, 39, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(49, 'By the time at the Caterpillar\'s making such VERY short remarks, and she hurried out of it, and.', '1.00', 8, 9, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(50, 'Queen: so she sat still just as if it wasn\'t trouble enough hatching the eggs,\' said the King, and.', '1.00', 7, 31, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(51, 'I eat one of the creature, but on the whole place around her became alive with the.', '2.00', 7, 18, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(52, 'Queen had never done such a dreadful time.\' So Alice began telling them her adventures from the.', '1.00', 7, 6, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(53, 'Soup? Beau--ootiful Soo--oop! Soo--oop of the evening, beautiful Soup! Soup of the song, \'I\'d have.', '1.00', 5, 27, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(54, 'KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'it\'ll never do to ask: perhaps I shall.', '2.00', 7, 5, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(55, 'Mock Turtle; \'but it sounds uncommon nonsense.\' Alice said to Alice, she went hunting about, and.', '4.00', 8, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(56, 'Pepper For a minute or two. \'They couldn\'t have wanted it much,\' said the Footman, and began.', '5.00', 3, 18, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(57, 'The first witness was the Rabbit asked. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I.', '2.00', 8, 25, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(58, 'I can kick a little!\' She drew her foot slipped, and in a low voice, \'Your Majesty must.', '4.00', 8, 22, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(59, 'The hedgehog was engaged in a very fine day!\' said a sleepy voice behind her. \'Collar that.', '5.00', 8, 38, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(60, 'I THINK,\' said Alice. \'Well, I should like to try the first question, you know.\' \'Who is it.', '5.00', 3, 25, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(61, 'March Hare interrupted, yawning. \'I\'m getting tired of being all alone here!\' As she said to.', '3.00', 8, 23, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(62, 'All the time at the Hatter, and here the Mock Turtle yawned and shut his note-book hastily.', '1.00', 5, 5, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(63, 'Alice found at first she would get up and down, and the three gardeners instantly threw themselves.', '5.00', 3, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(64, 'Rabbit came near her, she began, rather timidly, saying to herself, as she tucked her arm.', '2.00', 5, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(65, 'Mock Turtle yet?\' \'No,\' said Alice. \'You are,\' said the Mock Turtle would be QUITE as much use in.', '1.00', 8, 27, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(66, 'As for pulling me out of sight: \'but it doesn\'t matter which way I ought to tell me who YOU are.', '2.00', 3, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(67, 'It was the Cat in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up and saying.', '4.00', 7, 17, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(68, 'I should think it so quickly that the Gryphon never learnt it.\' \'Hadn\'t time,\' said the King.', '4.00', 5, 26, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(69, 'Alice noticed, had powdered hair that curled all over with diamonds, and walked a little sharp.', '2.00', 7, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(70, 'I think it so VERY tired of sitting by her sister was reading, but it all seemed quite dull and.', '2.00', 5, 5, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(71, 'Pigeon in a great hurry. An enormous puppy was looking up into hers--she could hear the rattle of.', '5.00', 7, 6, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(72, 'Alice had begun to think about stopping herself before she had caught the baby joined):-- \'Wow!.', '3.00', 7, 11, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(73, 'Alice did not much like keeping so close to her, still it was growing, and growing, and growing.', '5.00', 3, 38, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(74, 'I\'m sure I don\'t care which happens!\' She ate a little timidly, for she was quite surprised to.', '3.00', 5, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(75, 'Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon never learnt it.\'.', '3.00', 3, 36, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(76, 'King; and as Alice could only hear whispers now and then, \'we went to him,\' said Alice loudly.', '1.00', 3, 36, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(77, 'I should understand that better,\' Alice said to the Queen. \'Their heads are gone, if it please.', '3.00', 8, 19, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(78, 'Queen, \'and he shall tell you how the Dodo had paused as if he had to stop and untwist it. After a.', '1.00', 5, 31, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(79, 'Dormouse crossed the court, \'Bring me the truth: did you ever eat a little nervous about it while.', '5.00', 8, 36, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(80, 'Then the Queen said to herself \'This is Bill,\' she gave a little bird as soon as look at me like.', '4.00', 3, 37, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(81, 'King said to the door, and knocked. \'There\'s no such thing!\' Alice was beginning very angrily, but.', '3.00', 7, 24, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(82, 'There was a very interesting dance to watch,\' said Alice, who felt very curious to know your.', '4.00', 7, 31, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(83, 'WOULD put their heads down! I am very tired of swimming about here, O Mouse!\' (Alice thought this.', '3.00', 3, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(84, 'Queen said to herself, \'Why, they\'re only a mouse that had fluttered down from the roof. There.', '3.00', 8, 24, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(85, 'Alice began to feel a little house in it about four feet high. \'Whoever lives there,\' thought.', '3.00', 8, 11, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(86, 'As soon as she spoke. \'I must be a great hurry to change them--\' when she turned away. \'Come.', '2.00', 5, 40, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(87, 'Queen had never done such a tiny golden key, and when she was quite a long silence after this, and.', '2.00', 5, 8, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(88, 'Alice, and tried to get out of breath, and said to Alice; and Alice thought to herself. \'Shy, they.', '5.00', 5, 12, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(89, 'Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Rabbit actually TOOK A.', '2.00', 7, 16, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(90, 'That your eye was as much as she could. The next witness would be quite absurd for her to begin.\'.', '5.00', 3, 10, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(91, 'Alice loudly. \'The idea of having nothing to what I say,\' the Mock Turtle would be the use of this.', '3.00', 7, 16, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(92, 'Oh, my dear paws! Oh my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as.', '2.00', 5, 29, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(93, 'Majesty,\' said Two, in a solemn tone, \'For the Duchess. \'I make you dry enough!\' They all made a.', '1.00', 8, 23, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(94, 'The poor little Lizard, Bill, was in the night? Let me see: I\'ll give them a new idea to Alice.', '1.00', 5, 28, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(95, 'Alice; \'but a grin without a grin,\' thought Alice; \'I can\'t go no lower,\' said the Duchess; \'and.', '4.00', 3, 19, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(96, 'I\'m mad. You\'re mad.\' \'How do you know the meaning of it in time,\' said the Eaglet. \'I don\'t much.', '5.00', 7, 32, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(97, 'Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of.', '4.00', 8, 29, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(98, 'ARE a simpleton.\' Alice did not notice this question, but hurriedly went on, \'you throw the--\'.', '1.00', 7, 16, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(99, 'I\'d gone to see what was coming. It was the BEST butter, you know.\' \'I don\'t believe it,\' said.', '2.00', 3, 6, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(100, 'I know!\' exclaimed Alice, who felt ready to agree to everything that Alice had no reason to be.', '1.00', 7, 33, '2022-04-22 03:52:46', '2022-04-22 03:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Pariatur et ea veritatis voluptatum veritatis aspernatur quis. Quis nam veniam qui.\"}', '{\"en\":\"Queen never left off staring at the flowers and the three gardeners who were lying round the court was a different person then.\' \'Explain all that,\' he said to the Gryphon. \'Turn a somersault in the.\"}', 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(2, '{\"en\":\"Sit porro atque est dolor molestiae rerum ut. Impedit accusamus a alias voluptas suscipit.\"}', '{\"en\":\"Alice in a frightened tone. \'The Queen of Hearts, who only bowed and smiled in reply. \'That\'s right!\' shouted the Queen. \'You make me smaller, I can remember feeling a little worried. \'Just about as.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(3, '{\"en\":\"Atque nemo totam impedit corrupti. Non omnis ullam fugit qui. Et sunt ea eveniet et.\"}', '{\"en\":\"Alice said; \'there\'s a large pigeon had flown into her eyes--and still as she swam lazily about in the back. At last the Mouse, frowning, but very politely: \'Did you say \\\"What a pity!\\\"?\' the Rabbit.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(4, '{\"en\":\"Quam amet itaque vero aut odit eos. Est ut dolores laboriosam sed.\"}', '{\"en\":\"King replied. Here the Dormouse shook its head to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the crumbs,\' said the young man said, \'And your hair has become very.\"}', 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(5, '{\"en\":\"Ipsum repellat dignissimos rerum illo. Doloribus ipsa et iure praesentium ut. Id ut et ea est.\"}', '{\"en\":\"Alice looked up, and there was nothing so VERY much out of sight. Alice remained looking thoughtfully at the thought that SOMEBODY ought to be sure; but I THINK I can kick a little!\' She drew her.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(6, '{\"en\":\"Quia amet ad nihil. Dolor maiores quas numquam molestiae distinctio pariatur.\"}', '{\"en\":\"Alice like the look of it at all; and I\'m sure I don\'t care which happens!\' She ate a little before she came upon a heap of sticks and dry leaves, and the words \'DRINK ME,\' but nevertheless she.\"}', 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(7, '{\"en\":\"Consequatur maiores dolor esse distinctio et quasi atque. Et ut aliquid aliquid id.\"}', '{\"en\":\"I don\'t like it, yer honour, at all, as the Caterpillar took the regular course.\' \'What was THAT like?\' said Alice. \'Come, let\'s try the whole pack rose up into hers--she could hear the rattle of.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(8, '{\"en\":\"In recusandae voluptatem rerum hic. Illo vel error rerum. Velit vel cupiditate maxime rerum.\"}', '{\"en\":\"Hatter, and, just as she tucked it away under her arm, that it might not escape again, and did not answer, so Alice went on, half to itself, half to itself, half to Alice. \'What IS the fun?\' said.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(9, '{\"en\":\"Et dignissimos cumque tempora. Aut et aspernatur corporis sequi. Quis quisquam illum quos tenetur.\"}', '{\"en\":\"Alice. \'Of course not,\' said Alice in a very curious to know what you mean,\' the March Hare. \'It was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(10, '{\"en\":\"Dolorum consequatur rerum ipsum molestias. Eos quia delectus cupiditate hic.\"}', '{\"en\":\"Queen. \'I never thought about it,\' said Five, \'and I\'ll tell you what year it is?\' \'Of course you know what they\'re about!\' \'Read them,\' said the Dormouse; \'--well in.\' This answer so confused poor.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(11, '{\"en\":\"Est molestias at ut laborum. Nemo autem eum est officiis.\"}', '{\"en\":\"Dormouse,\' thought Alice; \'only, as it\'s asleep, I suppose I ought to be a great many teeth, so she went on, \'you throw the--\' \'The lobsters!\' shouted the Gryphon, \'you first form into a small.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(12, '{\"en\":\"Aut deleniti illo qui dolores alias nam. Quidem dolore quia distinctio quos qui.\"}', '{\"en\":\"Alice. \'Nothing,\' said Alice. \'Well, I can\'t see you?\' She was looking for the hedgehogs; and in despair she put them into a doze; but, on being pinched by the end of his tail. \'As if it makes me.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(13, '{\"en\":\"Ipsum et maxime dignissimos sint id. Accusamus fuga quae delectus.\"}', '{\"en\":\"I was, I shouldn\'t want YOURS: I don\'t like the name: however, it only grinned when it grunted again, so that altogether, for the rest of my life.\' \'You are old,\' said the Duck: \'it\'s generally a.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(14, '{\"en\":\"Molestiae id sit eum soluta placeat ducimus non. Voluptas cumque est et non fugit.\"}', '{\"en\":\"SAID was, \'Why is a very grave voice, \'until all the rest, Between yourself and me.\' \'That\'s the judge,\' she said to herself, \'it would be the right word) \'--but I shall see it trying in a tone of.\"}', 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(15, '{\"en\":\"Cumque quos quasi error eligendi laudantium et quae architecto. Quia dolores rem ut officia eos.\"}', '{\"en\":\"Queen, \'Really, my dear, and that if something wasn\'t done about it in less than a rat-hole: she knelt down and saying to herself as she added, \'and the moral of that is, but I grow at a reasonable.\"}', 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(16, '{\"en\":\"Fuga hic doloremque quis ut iure beatae. Et fugit reprehenderit id error.\"}', '{\"en\":\"I\'m quite tired and out of a well?\' \'Take some more tea,\' the March Hare. The Hatter looked at her for a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Duchess, as she.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(17, '{\"en\":\"Omnis expedita eos eum non. Fuga est molestiae deserunt dolor. Dolorem quod non omnis consequatur.\"}', '{\"en\":\"SAID was, \'Why is a very decided tone: \'tell her something worth hearing. For some minutes the whole thing, and longed to get dry again: they had any dispute with the tea,\' the Hatter went on.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(18, '{\"en\":\"Quod et voluptate occaecati. Magnam sapiente enim omnis consequatur.\"}', '{\"en\":\"Lobster Quadrille The Mock Turtle said: \'no wise fish would go round a deal faster than it does.\' \'Which would NOT be an old crab, HE was.\' \'I never heard of one,\' said Alice. \'Of course not,\' Alice.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(19, '{\"en\":\"Sed ea impedit quo quia maxime veniam. Quos dignissimos consectetur ex minus voluptas.\"}', '{\"en\":\"And so it was empty: she did not like to be rude, so she went on, \'\\\"--found it advisable to go through next walking about at the number of executions the Queen in front of them, and just as if she.\"}', 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(20, '{\"en\":\"Dolores atque sunt qui eveniet magni. Adipisci molestias eos quia voluptas officia et eos.\"}', '{\"en\":\"I\'m better now--but I\'m a hatter.\' Here the Dormouse indignantly. However, he consented to go near the right size again; and the words all coming different, and then all the arches are gone from.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(21, '{\"en\":\"Nihil incidunt ex a sit amet. Consequatur quo ad ut vel ipsa rem.\"}', '{\"en\":\"Alice went on in the air, mixed up with the tarts, you know--\' She had quite forgotten the little golden key and hurried upstairs, in great fear lest she should chance to be otherwise.\\\"\' \'I think I.\"}', 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(22, '{\"en\":\"Est dolor earum dignissimos voluptas ut voluptatem. Dicta est atque quibusdam consectetur.\"}', '{\"en\":\"Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied eagerly, for she thought, and rightly too, that very few things indeed were really impossible. There seemed to follow, except a little.\"}', 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(23, '{\"en\":\"Omnis hic sit dicta culpa molestiae. Modi nisi et sit. Non et sed non officia magni.\"}', '{\"en\":\"Knave of Hearts, and I had it written up somewhere.\' Down, down, down. Would the fall was over. Alice was not quite know what they\'re about!\' \'Read them,\' said the Hatter; \'so I should like to be.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(24, '{\"en\":\"Est provident illo est non debitis tenetur magni. Architecto dolorem eum molestiae.\"}', '{\"en\":\"Mock Turtle persisted. \'How COULD he turn them out again. The Mock Turtle\'s Story \'You can\'t think how glad I am very tired of swimming about here, O Mouse!\' (Alice thought this a good opportunity.\"}', 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(25, '{\"en\":\"Qui non corrupti doloribus nisi aut. Quo ab et eum officiis. Qui et accusantium quos doloribus.\"}', '{\"en\":\"The further off from England the nearer is to France-- Then turn not pale, beloved snail, but come and join the dance? Will you, won\'t you, won\'t you, will you, old fellow?\' The Mock Turtle replied.\"}', 4, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(26, '{\"en\":\"Mollitia dicta est est et aut. Nesciunt qui aspernatur ullam dicta non porro qui.\"}', '{\"en\":\"Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish people knew that: then they both bowed low, and their curls got.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(27, '{\"en\":\"Sequi odio quia iusto quod laborum ea. Eum ipsum ratione repudiandae facere sapiente possimus hic.\"}', '{\"en\":\"I shall think nothing of tumbling down stairs! How brave they\'ll all think me at home! Why, I wouldn\'t say anything about it, and finding it very hard indeed to make out what it might appear to.\"}', 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(28, '{\"en\":\"Praesentium minima a est architecto nobis. Culpa ducimus eum incidunt dolorum.\"}', '{\"en\":\"Dormouse, and repeated her question. \'Why did you begin?\' The Hatter was the BEST butter,\' the March Hare. \'Exactly so,\' said Alice. \'Anything you like,\' said the Cat, \'if you don\'t like it, yer.\"}', 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(29, '{\"en\":\"Debitis vel harum eveniet sint distinctio ut. Quod dicta fugit dolorem alias vero et consequatur.\"}', '{\"en\":\"I shall never get to the Mock Turtle a little bird as soon as she could not tell whether they were all shaped like the Queen?\' said the King, the Queen, but she did not seem to encourage the witness.\"}', 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(30, '{\"en\":\"Iste enim cupiditate eos et. Temporibus magnam laudantium vel.\"}', '{\"en\":\"I should think you\'ll feel it a violent shake at the mouth with strings: into this they slipped the guinea-pig, head first, and then all the time at the mushroom (she had grown to her that she was.\"}', 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Service\"}', '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(2, '{\"en\":\"Service\"}', '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(3, '{\"en\":\"Service\"}', '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(4, '{\"en\":\"Service\"}', '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(5, '{\"en\":\"Service\"}', '2022-04-22 03:52:45', '2022-04-22 03:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_options`
--

CREATE TABLE `favorite_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Consequuntur libero hic aperiam.\"}', 4, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(2, '{\"en\":\"Corporis incidunt aperiam vitae dolorem deserunt.\"}', 2, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(3, '{\"en\":\"Voluptatem sed et sit blanditiis rerum labore.\"}', 17, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(4, '{\"en\":\"Porro eaque in eum repellat modi.\"}', 9, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(5, '{\"en\":\"Voluptatem possimus ut iste in.\"}', 15, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(6, '{\"en\":\"Dicta vitae cum hic eos.\"}', 14, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(7, '{\"en\":\"Nihil saepe recusandae accusantium necessitatibus.\"}', 15, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(8, '{\"en\":\"Sequi et harum autem sed omnis similique corporis.\"}', 11, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(9, '{\"en\":\"Nostrum est neque necessitatibus eum.\"}', 18, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(10, '{\"en\":\"Non debitis quis rerum molestias est.\"}', 13, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(11, '{\"en\":\"Aut nam architecto deserunt ipsam sequi.\"}', 11, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(12, '{\"en\":\"Aut et optio labore qui.\"}', 3, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(13, '{\"en\":\"Veniam vitae voluptas et ea.\"}', 6, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(14, '{\"en\":\"Ea quod adipisci rem suscipit vero dolor.\"}', 17, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(15, '{\"en\":\"Eos accusantium dolore ipsa corporis est impedit odit.\"}', 7, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(16, '{\"en\":\"Voluptas aperiam eveniet aut ea occaecati nobis qui quo.\"}', 4, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(17, '{\"en\":\"Ad at voluptatem est consequatur ut laudantium.\"}', 12, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(18, '{\"en\":\"Voluptatem sequi sint est sint illum repellendus eum.\"}', 14, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(19, '{\"en\":\"Hic est aut eius odio commodi.\"}', 3, '2022-04-22 03:52:45', '2022-04-22 03:52:45'),
(20, '{\"en\":\"Voluptatem modi autem exercitationem quaerat aut omnis culpa sed.\"}', 12, '2022-04-22 03:52:45', '2022-04-22 03:52:45');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\PaymentMethod', 2, 'logo', 'razorpay', 'razorpay.png', 'image/png', 'public', 13026, '[]', '{\"uuid\":\"13e62475-6b5f-4812-b484-2b94cc52b715\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 3, '2021-05-07 12:33:38', '2021-05-07 12:33:38'),
(5, 'App\\Models\\PaymentMethod', 5, 'logo', 'paypal', 'paypal.png', 'image/png', 'public', 15819, '[]', '{\"uuid\":\"2b8bd9b8-5c37-4464-a5c7-623496d7655f\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 5, '2021-05-07 12:33:49', '2021-05-07 12:33:49'),
(7, 'App\\Models\\PaymentMethod', 6, 'logo', 'pay_pickup', 'pay_pickup.png', 'image/png', 'public', 11712, '[]', '{\"uuid\":\"5e06e7ca-ac33-413c-9ab0-6fd4e3083cc1\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 7, '2021-05-07 12:33:58', '2021-05-07 12:33:58'),
(9, 'App\\Models\\PaymentMethod', 7, 'logo', 'stripe-logo', 'stripe-logo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a36-8a5e-4c85-8d6e-c356843429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 9, '2021-05-07 12:34:23', '2021-05-07 12:34:23'),
(21, 'App\\Models\\Upload', 9, 'image', 'slide0001', 'slide0001.jpeg', 'image/jpeg', 'public', 87868, '[]', '{\"uuid\":\"0e3f74e6-e9bb-4c00-8e48-aecf436d8beb\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 10, '2022-04-22 05:45:20', '2022-04-22 05:45:21'),
(22, 'App\\Models\\Slide', 1, 'image', 'slide0001', 'slide0001.jpeg', 'image/jpeg', 'public', 87868, '[]', '{\"uuid\":\"0e3f74e6-e9bb-4c00-8e48-aecf436d8beb\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 11, '2022-04-22 05:45:25', '2022-04-22 05:45:25'),
(23, 'App\\Models\\Upload', 10, 'image', 'slide02', 'slide02.jpeg', 'image/jpeg', 'public', 70504, '[]', '{\"uuid\":\"678884cc-b9b5-40d0-8f03-b453ce807a9b\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2022-04-22 05:45:39', '2022-04-22 05:45:39'),
(24, 'App\\Models\\Slide', 2, 'image', 'slide02', 'slide02.jpeg', 'image/jpeg', 'public', 70504, '[]', '{\"uuid\":\"678884cc-b9b5-40d0-8f03-b453ce807a9b\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 13, '2022-04-22 05:45:45', '2022-04-22 05:45:45'),
(25, 'App\\Models\\Upload', 11, 'image', 'slide03', 'slide03.jpeg', 'image/jpeg', 'public', 97717, '[]', '{\"uuid\":\"8d503b77-29b1-4bb2-968b-2993d8a11ce0\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 14, '2022-04-22 05:45:59', '2022-04-22 05:46:00'),
(26, 'App\\Models\\Slide', 3, 'image', 'slide03', 'slide03.jpeg', 'image/jpeg', 'public', 97717, '[]', '{\"uuid\":\"8d503b77-29b1-4bb2-968b-2993d8a11ce0\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 15, '2022-04-22 05:46:09', '2022-04-22 05:46:09'),
(27, 'App\\Models\\Upload', 12, 'image', 'car', 'car.svg', 'image/svg+xml', 'public', 4509, '[]', '{\"uuid\":\"694bd9ed-507c-47cc-9c2f-cc3f1853fe6d\",\"user_id\":1}', '[]', 16, '2022-04-22 06:14:00', '2022-04-22 06:14:00'),
(28, 'App\\Models\\Category', 1, 'image', 'car', 'car.svg', 'image/svg+xml', 'public', 4509, '[]', '{\"uuid\":\"694bd9ed-507c-47cc-9c2f-cc3f1853fe6d\",\"user_id\":1}', '[]', 17, '2022-04-22 06:14:03', '2022-04-22 06:14:03'),
(29, 'App\\Models\\Upload', 13, 'image', 'nurse', 'nurse.svg', 'image/svg+xml', 'public', 2940, '[]', '{\"uuid\":\"5e49ac1a-4f6d-4893-9e60-905dc5c3c382\",\"user_id\":1}', '[]', 18, '2022-04-22 06:22:36', '2022-04-22 06:22:36'),
(30, 'App\\Models\\Category', 2, 'image', 'nurse', 'nurse.svg', 'image/svg+xml', 'public', 2940, '[]', '{\"uuid\":\"5e49ac1a-4f6d-4893-9e60-905dc5c3c382\",\"user_id\":1}', '[]', 19, '2022-04-22 06:22:40', '2022-04-22 06:22:40'),
(31, 'App\\Models\\Upload', 14, 'image', 'laundry', 'laundry.svg', 'image/svg+xml', 'public', 3607, '[]', '{\"uuid\":\"e7715d5b-5ae0-4a7d-8d35-5dc73d9358ce\",\"user_id\":1}', '[]', 20, '2022-04-22 06:22:51', '2022-04-22 06:22:51'),
(32, 'App\\Models\\Category', 3, 'image', 'laundry', 'laundry.svg', 'image/svg+xml', 'public', 3607, '[]', '{\"uuid\":\"e7715d5b-5ae0-4a7d-8d35-5dc73d9358ce\",\"user_id\":1}', '[]', 21, '2022-04-22 06:22:55', '2022-04-22 06:22:55'),
(33, 'App\\Models\\Upload', 15, 'image', 'haircut', 'haircut.svg', 'image/svg+xml', 'public', 2637, '[]', '{\"uuid\":\"c2dec837-a64c-4d66-a9ec-898a81387b64\",\"user_id\":1}', '[]', 22, '2022-04-22 06:23:05', '2022-04-22 06:23:05'),
(34, 'App\\Models\\Category', 4, 'image', 'haircut', 'haircut.svg', 'image/svg+xml', 'public', 2637, '[]', '{\"uuid\":\"c2dec837-a64c-4d66-a9ec-898a81387b64\",\"user_id\":1}', '[]', 23, '2022-04-22 06:23:11', '2022-04-22 06:23:11'),
(35, 'App\\Models\\Upload', 16, 'image', 'washing_dishes', 'washing_dishes.svg', 'image/svg+xml', 'public', 5325, '[]', '{\"uuid\":\"d8143d99-6c77-47f0-916a-3446e0c25718\",\"user_id\":1}', '[]', 24, '2022-04-22 06:23:22', '2022-04-22 06:23:22'),
(36, 'App\\Models\\Category', 5, 'image', 'washing_dishes', 'washing_dishes.svg', 'image/svg+xml', 'public', 5325, '[]', '{\"uuid\":\"d8143d99-6c77-47f0-916a-3446e0c25718\",\"user_id\":1}', '[]', 25, '2022-04-22 06:23:28', '2022-04-22 06:23:28'),
(37, 'App\\Models\\Upload', 17, 'image', 'camera', 'camera.svg', 'image/svg+xml', 'public', 5768, '[]', '{\"uuid\":\"61787d84-f41c-4094-9eff-a958120e19f4\",\"user_id\":1}', '[]', 26, '2022-04-22 06:23:59', '2022-04-22 06:23:59'),
(38, 'App\\Models\\Category', 6, 'image', 'camera', 'camera.svg', 'image/svg+xml', 'public', 5768, '[]', '{\"uuid\":\"61787d84-f41c-4094-9eff-a958120e19f4\",\"user_id\":1}', '[]', 27, '2022-04-22 06:24:08', '2022-04-22 06:24:08'),
(39, 'App\\Models\\Upload', 18, 'image', 'happy-young-woman-blue-rubber-using-mop-while-cleaning-floor-home_28283-1482', 'happy-young-woman-blue-rubber-using-mop-while-cleaning-floor-home_28283-1482.jpeg', 'image/jpeg', 'public', 70204, '[]', '{\"uuid\":\"74b7afa6-6a6f-4f0b-8924-05033b25701c\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 28, '2022-04-25 02:51:20', '2022-04-25 02:51:23'),
(40, 'App\\Models\\EService', 27, 'image', 'happy-young-woman-blue-rubber-using-mop-while-cleaning-floor-home_28283-1482', 'happy-young-woman-blue-rubber-using-mop-while-cleaning-floor-home_28283-1482.jpeg', 'image/jpeg', 'public', 70204, '[]', '{\"uuid\":\"74b7afa6-6a6f-4f0b-8924-05033b25701c\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 29, '2022-04-25 02:51:26', '2022-04-25 02:51:26'),
(41, 'App\\Models\\Upload', 19, 'image', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866.jpeg', 'image/jpeg', 'public', 100713, '[]', '{\"uuid\":\"4d4874eb-e541-4348-8ebc-49925b05e5cc\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 30, '2022-04-25 02:51:43', '2022-04-25 02:51:44'),
(42, 'App\\Models\\EService', 33, 'image', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866.jpeg', 'image/jpeg', 'public', 100713, '[]', '{\"uuid\":\"4d4874eb-e541-4348-8ebc-49925b05e5cc\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 31, '2022-04-25 02:51:47', '2022-04-25 02:51:47'),
(43, 'App\\Models\\Upload', 20, 'image', 'smiling-doctors-with-stethoscope_53419-5569', 'smiling-doctors-with-stethoscope_53419-5569.jpeg', 'image/jpeg', 'public', 61475, '[]', '{\"uuid\":\"2c0cef5c-7cc9-4842-b4af-7058159924ce\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 32, '2022-04-25 02:52:01', '2022-04-25 02:52:01'),
(44, 'App\\Models\\EService', 38, 'image', 'smiling-doctors-with-stethoscope_53419-5569', 'smiling-doctors-with-stethoscope_53419-5569.jpeg', 'image/jpeg', 'public', 61475, '[]', '{\"uuid\":\"2c0cef5c-7cc9-4842-b4af-7058159924ce\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 33, '2022-04-25 02:52:05', '2022-04-25 02:52:05'),
(45, 'App\\Models\\Upload', 21, 'image', 'portrait-young-masked-nurse-hospital_53419-9719', 'portrait-young-masked-nurse-hospital_53419-9719.jpeg', 'image/jpeg', 'public', 50832, '[]', '{\"uuid\":\"252f4100-5d31-4ef1-80e6-29cadfa46d46\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 34, '2022-04-25 02:52:19', '2022-04-25 02:52:20'),
(46, 'App\\Models\\EService', 3, 'image', 'portrait-young-masked-nurse-hospital_53419-9719', 'portrait-young-masked-nurse-hospital_53419-9719.jpeg', 'image/jpeg', 'public', 50832, '[]', '{\"uuid\":\"252f4100-5d31-4ef1-80e6-29cadfa46d46\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 35, '2022-04-25 02:52:22', '2022-04-25 02:52:22'),
(47, 'App\\Models\\Upload', 22, 'image', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47.jpeg', 'image/jpeg', 'public', 81238, '[]', '{\"uuid\":\"d5f0e601-5ed3-455e-b9e0-e642d412269e\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 36, '2022-04-25 02:53:19', '2022-04-25 02:53:20'),
(48, 'App\\Models\\EService', 17, 'image', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47.jpeg', 'image/jpeg', 'public', 81238, '[]', '{\"uuid\":\"d5f0e601-5ed3-455e-b9e0-e642d412269e\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 37, '2022-04-25 02:53:24', '2022-04-25 02:53:24'),
(49, 'App\\Models\\Upload', 23, 'image', 'cleaning-car-hand-with-microfiber-cloth-cleaning-car-interior_118454-862', 'cleaning-car-hand-with-microfiber-cloth-cleaning-car-interior_118454-862.jpeg', 'image/jpeg', 'public', 86163, '[]', '{\"uuid\":\"e98922fa-ed3d-4362-afb7-fb3aca20d416\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 38, '2022-04-25 02:54:23', '2022-04-25 02:54:23'),
(50, 'App\\Models\\EService', 12, 'image', 'cleaning-car-hand-with-microfiber-cloth-cleaning-car-interior_118454-862', 'cleaning-car-hand-with-microfiber-cloth-cleaning-car-interior_118454-862.jpeg', 'image/jpeg', 'public', 86163, '[]', '{\"uuid\":\"e98922fa-ed3d-4362-afb7-fb3aca20d416\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 39, '2022-04-25 02:54:25', '2022-04-25 02:54:25'),
(51, 'App\\Models\\Upload', 24, 'image', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47.jpeg', 'image/jpeg', 'public', 81238, '[]', '{\"uuid\":\"43cf729d-add7-4d0f-a5d4-1a7a7d2f14fe\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 40, '2022-04-25 02:54:52', '2022-04-25 02:54:53'),
(52, 'App\\Models\\EService', 40, 'image', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47', 'car-detailing-man-holds-microfiber-hand-polishes-car_175935-47.jpeg', 'image/jpeg', 'public', 81238, '[]', '{\"uuid\":\"43cf729d-add7-4d0f-a5d4-1a7a7d2f14fe\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 41, '2022-04-25 02:54:55', '2022-04-25 02:54:55'),
(53, 'App\\Models\\Upload', 25, 'image', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866.jpeg', 'image/jpeg', 'public', 100713, '[]', '{\"uuid\":\"5caff2b5-a586-48f7-961a-cf6ba5e30240\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 42, '2022-04-25 03:05:07', '2022-04-25 03:05:07'),
(54, 'App\\Models\\EService', 1, 'image', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866', 'happy-beautiful-young-woman-housewife-wearing-rubber-gloves-slipper-green-headphone-singing-fun-with-mop-like-microphone-while-cleaning-floor-near-wash-machine-white-wall_36367-866.jpeg', 'image/jpeg', 'public', 100713, '[]', '{\"uuid\":\"5caff2b5-a586-48f7-961a-cf6ba5e30240\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 43, '2022-04-25 03:05:13', '2022-04-25 03:05:13'),
(55, 'App\\Models\\Upload', 26, 'image', 'portrait-young-masked-nurse-hospital_53419-9719', 'portrait-young-masked-nurse-hospital_53419-9719.jpeg', 'image/jpeg', 'public', 50832, '[]', '{\"uuid\":\"66d1bfbe-1111-4cfe-a4fe-a65815593985\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 44, '2022-04-25 03:19:01', '2022-04-25 03:19:02'),
(56, 'App\\Models\\EService', 7, 'image', 'portrait-young-masked-nurse-hospital_53419-9719', 'portrait-young-masked-nurse-hospital_53419-9719.jpeg', 'image/jpeg', 'public', 50832, '[]', '{\"uuid\":\"66d1bfbe-1111-4cfe-a4fe-a65815593985\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 45, '2022-04-25 03:19:05', '2022-04-25 03:19:05'),
(57, 'App\\Models\\Upload', 27, 'image', 'smiling-doctors-with-stethoscope_53419-5569', 'smiling-doctors-with-stethoscope_53419-5569.jpeg', 'image/jpeg', 'public', 61475, '[]', '{\"uuid\":\"3907ae04-13bb-47b1-a4e6-c08ae8e58d7a\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 46, '2022-04-25 03:19:33', '2022-04-25 03:19:34'),
(58, 'App\\Models\\EService', 8, 'image', 'smiling-doctors-with-stethoscope_53419-5569', 'smiling-doctors-with-stethoscope_53419-5569.jpeg', 'image/jpeg', 'public', 61475, '[]', '{\"uuid\":\"3907ae04-13bb-47b1-a4e6-c08ae8e58d7a\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 47, '2022-04-25 03:19:36', '2022-04-25 03:19:36'),
(59, 'App\\Models\\Upload', 28, 'image', 'beautiful-businesswoman-auto-service-mechanic-are-discussing-work-car-repair-maintenance_189498-1863', 'beautiful-businesswoman-auto-service-mechanic-are-discussing-work-car-repair-maintenance_189498-1863.jpeg', 'image/jpeg', 'public', 101931, '[]', '{\"uuid\":\"5f5de448-aded-4fef-8ccb-c5079259244d\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 48, '2022-04-25 03:20:21', '2022-04-25 03:20:22'),
(60, 'App\\Models\\EService', 11, 'image', 'beautiful-businesswoman-auto-service-mechanic-are-discussing-work-car-repair-maintenance_189498-1863', 'beautiful-businesswoman-auto-service-mechanic-are-discussing-work-car-repair-maintenance_189498-1863.jpeg', 'image/jpeg', 'public', 101931, '[]', '{\"uuid\":\"5f5de448-aded-4fef-8ccb-c5079259244d\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 49, '2022-04-25 03:20:25', '2022-04-25 03:20:25'),
(63, 'App\\Models\\EProvider', 19, 'image', 'Copy of VivaraeNews  (95)', 'Copy-of-VivaraeNews--(95).png', 'image/png', 'public', 1417040, '[]', '{\"uuid\":\"861a1173-892b-4cd9-9245-032c20509e01\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 52, '2022-12-21 00:32:48', '2022-12-21 00:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_08_29_213829_create_faq_categories_table', 1),
(11, '2019_08_29_213926_create_faqs_table', 1),
(12, '2019_10_22_144652_create_currencies_table', 1),
(13, '2021_01_07_162658_create_payment_methods_table', 1),
(14, '2021_01_07_164755_create_payment_statuses_table', 1),
(15, '2021_01_07_165422_create_payments_table', 1),
(16, '2021_01_13_105605_create_e_provider_types_table', 1),
(17, '2021_01_13_111155_create_e_providers_table', 1),
(18, '2021_01_13_111622_create_experiences_table', 1),
(19, '2021_01_13_111730_create_awards_table', 1),
(20, '2021_01_13_114302_create_taxes_table', 1),
(21, '2021_01_13_200249_create_addresses_table', 1),
(22, '2021_01_15_115239_create_e_provider_addresses_table', 1),
(23, '2021_01_15_115747_create_e_provider_users_table', 1),
(24, '2021_01_15_115850_create_e_provider_taxes_table', 1),
(25, '2021_01_16_160838_create_availability_hours_table', 1),
(26, '2021_01_19_135951_create_e_services_table', 1),
(27, '2021_01_19_140427_create_categories_table', 1),
(28, '2021_01_19_171553_create_e_service_categories_table', 1),
(29, '2021_01_22_194514_create_option_groups_table', 1),
(30, '2021_01_22_200807_create_options_table', 1),
(31, '2021_01_22_205819_create_favorites_table', 1),
(32, '2021_01_22_205944_create_favorite_options_table', 1),
(33, '2021_01_23_125641_create_e_service_reviews_table', 1),
(34, '2021_01_23_201533_create_galleries_table', 1),
(35, '2021_01_25_105421_create_slides_table', 1),
(36, '2021_01_25_162055_create_notifications_table', 1),
(37, '2021_01_25_170522_create_coupons_table', 1),
(38, '2021_01_25_170529_create_discountables_table', 1),
(39, '2021_01_25_191833_create_booking_statuses_table', 1),
(40, '2021_01_25_212252_create_bookings_table', 1),
(41, '2021_01_30_111717_create_e_provider_payouts_table', 1),
(42, '2021_01_30_135356_create_earnings_table', 1),
(43, '2021_02_24_102838_create_custom_pages_table', 1),
(44, '2021_06_26_110636_create_json_extract_function', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('306def08-6c61-4f5b-a112-906aa018e44e', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 2, '{\"booking_id\":2}', NULL, '2022-05-14 03:31:47', '2022-05-14 03:31:47'),
('5609b5c1-cb0a-4a37-b2f3-f332940bc464', 'App\\Notifications\\NewBooking', 'App\\Models\\User', 6, '{\"booking_id\":2}', NULL, '2022-05-14 03:31:47', '2022-05-14 03:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `description`, `price`, `e_service_id`, `option_group_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"40m\"}', '{\"en\":\"Velit laboriosam sed eius libero non.\"}', 47.41, 25, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(2, '{\"en\":\"20m\"}', '{\"en\":\"Repudiandae voluptatem temporibus aut et.\"}', 14.73, 11, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(3, '{\"en\":\"40m\"}', '{\"en\":\"Saepe magnam magnam ut consequatur hic.\"}', 11.81, 32, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(4, '{\"en\":\"20m\"}', '{\"en\":\"Ab dolores distinctio velit ut.\"}', 22.55, 15, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(5, '{\"en\":\"10m²\"}', '{\"en\":\"At corporis quia.\"}', 40.14, 26, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(6, '{\"en\":\"30m²\"}', '{\"en\":\"Quidem ab iusto autem esse.\"}', 31.41, 29, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(7, '{\"en\":\"20m\"}', '{\"en\":\"Accusantium est asperiores reiciendis dolores.\"}', 12.50, 22, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(8, '{\"en\":\"40m\"}', '{\"en\":\"Consectetur ea enim corporis voluptatem fugit.\"}', 47.02, 6, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(9, '{\"en\":\"40m\"}', '{\"en\":\"Et nostrum eos quos sapiente.\"}', 18.58, 9, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(10, '{\"en\":\"40m\"}', '{\"en\":\"Illum necessitatibus adipisci veniam.\"}', 27.47, 14, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(11, '{\"en\":\"40m\"}', '{\"en\":\"Ullam accusamus quasi amet ut debitis.\"}', 45.86, 7, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(12, '{\"en\":\"40m\"}', '{\"en\":\"Hic suscipit hic sint omnis aut.\"}', 47.95, 7, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(13, '{\"en\":\"30m²\"}', '{\"en\":\"Quia fugit ullam.\"}', 49.43, 39, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(14, '{\"en\":\"30m²\"}', '{\"en\":\"Rerum iusto animi dolor ea.\"}', 15.81, 10, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(15, '{\"en\":\"30m²\"}', '{\"en\":\"Voluptas aut nostrum pariatur.\"}', 31.64, 20, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(16, '{\"en\":\"40m\"}', '{\"en\":\"Qui labore ullam qui saepe.\"}', 17.54, 15, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(17, '{\"en\":\"10m²\"}', '{\"en\":\"Accusamus nemo distinctio fugiat.\"}', 13.51, 40, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(18, '{\"en\":\"40m\"}', '{\"en\":\"Et expedita officia quia adipisci unde.\"}', 40.41, 12, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(19, '{\"en\":\"40m\"}', '{\"en\":\"Commodi vel a.\"}', 31.32, 26, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(20, '{\"en\":\"40m\"}', '{\"en\":\"Ut neque natus est id et.\"}', 13.73, 31, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(21, '{\"en\":\"30m²\"}', '{\"en\":\"Asperiores qui veritatis sit harum.\"}', 41.36, 25, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(22, '{\"en\":\"30m²\"}', '{\"en\":\"Exercitationem quia dolorem sequi repudiandae.\"}', 17.42, 31, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(23, '{\"en\":\"40m\"}', '{\"en\":\"Numquam dolor saepe quos.\"}', 39.79, 3, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(24, '{\"en\":\"30m²\"}', '{\"en\":\"Omnis libero dolorum ab.\"}', 24.06, 3, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(25, '{\"en\":\"20m\"}', '{\"en\":\"Commodi et voluptatem quasi aut.\"}', 12.92, 15, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(26, '{\"en\":\"10m²\"}', '{\"en\":\"Rerum sint et vero.\"}', 41.63, 27, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(27, '{\"en\":\"20m\"}', '{\"en\":\"Aut ex non.\"}', 35.31, 1, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(28, '{\"en\":\"30m²\"}', '{\"en\":\"Blanditiis fugit laboriosam odit.\"}', 31.83, 23, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(29, '{\"en\":\"40m\"}', '{\"en\":\"Nostrum est qui ex et.\"}', 13.33, 2, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(30, '{\"en\":\"40m\"}', '{\"en\":\"Magni esse doloribus dolorem reprehenderit.\"}', 15.41, 12, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(31, '{\"en\":\"30m²\"}', '{\"en\":\"Sit eaque porro.\"}', 17.91, 7, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(32, '{\"en\":\"40m\"}', '{\"en\":\"Quibusdam dolore rerum quia consectetur officia.\"}', 25.89, 39, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(33, '{\"en\":\"20m\"}', '{\"en\":\"Omnis accusamus provident praesentium.\"}', 14.39, 18, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(34, '{\"en\":\"40m\"}', '{\"en\":\"Odio quae voluptatem.\"}', 37.10, 16, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(35, '{\"en\":\"30m²\"}', '{\"en\":\"Consequatur quis ipsam.\"}', 38.05, 34, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(36, '{\"en\":\"40m\"}', '{\"en\":\"Ex et nostrum aliquam.\"}', 18.33, 11, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(37, '{\"en\":\"10m²\"}', '{\"en\":\"Quis et ipsa itaque iusto expedita.\"}', 28.47, 4, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(38, '{\"en\":\"40m\"}', '{\"en\":\"Alias perferendis omnis quia.\"}', 41.35, 34, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(39, '{\"en\":\"20m\"}', '{\"en\":\"Alias ullam ipsum rerum.\"}', 19.72, 6, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(40, '{\"en\":\"20m\"}', '{\"en\":\"Odit aut numquam.\"}', 31.90, 21, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(41, '{\"en\":\"30m²\"}', '{\"en\":\"Corrupti dolorum debitis est.\"}', 19.58, 12, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(42, '{\"en\":\"10m²\"}', '{\"en\":\"Est quo tenetur quaerat.\"}', 38.93, 10, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(43, '{\"en\":\"10m²\"}', '{\"en\":\"Iusto quam sit dolorem.\"}', 43.10, 28, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(44, '{\"en\":\"40m\"}', '{\"en\":\"Porro tempore quia numquam impedit.\"}', 12.88, 29, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(45, '{\"en\":\"30m²\"}', '{\"en\":\"Sunt provident officiis dolor corporis.\"}', 43.04, 17, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(46, '{\"en\":\"40m\"}', '{\"en\":\"Molestias aut est facilis quod.\"}', 30.94, 38, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(47, '{\"en\":\"40m\"}', '{\"en\":\"Omnis facere nihil asperiores.\"}', 23.17, 18, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(48, '{\"en\":\"30m²\"}', '{\"en\":\"Qui quia officia qui assumenda.\"}', 24.97, 3, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(49, '{\"en\":\"10m²\"}', '{\"en\":\"Dolore natus ea veniam.\"}', 45.46, 17, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(50, '{\"en\":\"20m\"}', '{\"en\":\"Est sapiente perspiciatis maiores.\"}', 39.94, 39, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(51, '{\"en\":\"10m²\"}', '{\"en\":\"Deserunt laborum rerum cumque tempore.\"}', 36.83, 12, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(52, '{\"en\":\"30m²\"}', '{\"en\":\"Omnis necessitatibus nisi sit quisquam illum.\"}', 15.49, 12, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(53, '{\"en\":\"40m\"}', '{\"en\":\"Repellat repudiandae ducimus et dolor voluptatem.\"}', 47.72, 7, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(54, '{\"en\":\"40m\"}', '{\"en\":\"Maiores nam sint necessitatibus explicabo.\"}', 24.24, 14, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(55, '{\"en\":\"30m²\"}', '{\"en\":\"Maxime aliquid est.\"}', 30.35, 23, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(56, '{\"en\":\"20m\"}', '{\"en\":\"Aut voluptatem veritatis.\"}', 24.32, 35, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(57, '{\"en\":\"40m\"}', '{\"en\":\"Tempore aut ea minus est.\"}', 46.95, 14, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(58, '{\"en\":\"40m\"}', '{\"en\":\"Et ut odio deleniti doloremque.\"}', 29.66, 27, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(59, '{\"en\":\"10m²\"}', '{\"en\":\"Ea sed aut.\"}', 38.65, 20, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(60, '{\"en\":\"40m\"}', '{\"en\":\"Possimus voluptatem error eos numquam consequuntur.\"}', 43.08, 16, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(61, '{\"en\":\"40m\"}', '{\"en\":\"Earum sit qui ipsum et.\"}', 43.15, 35, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(62, '{\"en\":\"40m\"}', '{\"en\":\"Occaecati non quia blanditiis.\"}', 49.03, 5, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(63, '{\"en\":\"10m²\"}', '{\"en\":\"Fugit quia in a.\"}', 13.33, 38, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(64, '{\"en\":\"30m²\"}', '{\"en\":\"Odit sequi aut ex doloremque nesciunt.\"}', 37.97, 13, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(65, '{\"en\":\"20m\"}', '{\"en\":\"Esse fugiat ab sunt odio laboriosam.\"}', 19.26, 5, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(66, '{\"en\":\"10m²\"}', '{\"en\":\"Expedita corrupti sed adipisci.\"}', 32.31, 28, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(67, '{\"en\":\"40m\"}', '{\"en\":\"Dolorem eaque eos temporibus qui.\"}', 14.31, 1, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(68, '{\"en\":\"20m\"}', '{\"en\":\"Quia aliquam aut est ipsam.\"}', 42.06, 39, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(69, '{\"en\":\"30m²\"}', '{\"en\":\"Magnam qui optio rerum.\"}', 47.96, 39, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(70, '{\"en\":\"30m²\"}', '{\"en\":\"Placeat soluta fugit.\"}', 48.62, 23, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(71, '{\"en\":\"30m²\"}', '{\"en\":\"Nam voluptates magni nulla quia laboriosam.\"}', 30.50, 14, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(72, '{\"en\":\"20m\"}', '{\"en\":\"Ut doloribus aspernatur et perferendis nisi.\"}', 18.31, 20, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(73, '{\"en\":\"10m²\"}', '{\"en\":\"Sint numquam et ut.\"}', 40.18, 32, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(74, '{\"en\":\"30m²\"}', '{\"en\":\"Et sit a.\"}', 27.49, 11, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(75, '{\"en\":\"40m\"}', '{\"en\":\"Facere nostrum voluptas deserunt molestiae.\"}', 20.45, 34, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(76, '{\"en\":\"40m\"}', '{\"en\":\"Consequatur voluptatem eaque.\"}', 27.23, 27, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(77, '{\"en\":\"10m²\"}', '{\"en\":\"Sapiente et nam.\"}', 48.23, 12, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(78, '{\"en\":\"10m²\"}', '{\"en\":\"Minima et ipsum ut.\"}', 44.48, 19, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(79, '{\"en\":\"40m\"}', '{\"en\":\"Mollitia ipsum nihil.\"}', 11.26, 10, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(80, '{\"en\":\"40m\"}', '{\"en\":\"Maxime et sit itaque.\"}', 10.12, 29, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(81, '{\"en\":\"10m²\"}', '{\"en\":\"Voluptatibus porro et deserunt debitis.\"}', 13.37, 1, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(82, '{\"en\":\"40m\"}', '{\"en\":\"Consequatur corrupti nostrum voluptas distinctio enim.\"}', 42.76, 1, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(83, '{\"en\":\"40m\"}', '{\"en\":\"Dignissimos dolor vero.\"}', 47.68, 32, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(84, '{\"en\":\"20m\"}', '{\"en\":\"Quia omnis assumenda quia.\"}', 49.55, 7, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(85, '{\"en\":\"20m\"}', '{\"en\":\"Minus quo modi consectetur.\"}', 13.24, 17, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(86, '{\"en\":\"10m²\"}', '{\"en\":\"Vel sunt totam hic officiis.\"}', 15.55, 32, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(87, '{\"en\":\"10m²\"}', '{\"en\":\"Doloremque libero cum velit.\"}', 15.01, 26, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(88, '{\"en\":\"20m\"}', '{\"en\":\"Nihil in dolores quisquam.\"}', 48.94, 27, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(89, '{\"en\":\"10m²\"}', '{\"en\":\"Beatae quo aut.\"}', 29.39, 27, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(90, '{\"en\":\"30m²\"}', '{\"en\":\"Voluptatibus dolorem inventore saepe.\"}', 22.06, 40, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(91, '{\"en\":\"40m\"}', '{\"en\":\"Impedit est incidunt quaerat numquam.\"}', 18.33, 33, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(92, '{\"en\":\"20m\"}', '{\"en\":\"Aut nihil repudiandae et corporis.\"}', 36.89, 15, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(93, '{\"en\":\"30m²\"}', '{\"en\":\"Rerum dolores consectetur.\"}', 26.66, 25, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(94, '{\"en\":\"20m\"}', '{\"en\":\"Non neque blanditiis quidem.\"}', 32.27, 27, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(95, '{\"en\":\"20m\"}', '{\"en\":\"Soluta neque quia vel.\"}', 14.08, 32, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(96, '{\"en\":\"10m²\"}', '{\"en\":\"Ratione asperiores reiciendis dolorum.\"}', 13.91, 21, 3, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(97, '{\"en\":\"40m\"}', '{\"en\":\"Odit reprehenderit quae laudantium.\"}', 20.77, 5, 1, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(98, '{\"en\":\"10m²\"}', '{\"en\":\"Quod magnam soluta quia delectus.\"}', 38.46, 40, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(99, '{\"en\":\"40m\"}', '{\"en\":\"Et dolorem rerum doloremque dolore.\"}', 21.81, 18, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46'),
(100, '{\"en\":\"40m\"}', '{\"en\":\"Magni facilis ad sit esse.\"}', 48.74, 35, 2, '2022-04-22 03:52:46', '2022-04-22 03:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `option_groups`
--

CREATE TABLE `option_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_groups`
--

INSERT INTO `option_groups` (`id`, `name`, `allow_multiple`, `created_at`, `updated_at`) VALUES
(1, 'Size', 1, '2021-01-22 14:19:15', '2021-02-07 15:00:19'),
(2, 'Area', 1, '2021-01-22 15:16:28', '2021-01-22 15:16:28'),
(3, 'Surface', 0, '2021-01-22 15:16:47', '2021-01-22 15:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `payment_status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `route`, `order`, `default`, `enabled`, `created_at`, `updated_at`) VALUES
(2, 'RazorPay', 'Click to pay with RazorPay gateway', '/RazorPay', 2, 0, 1, '2021-01-17 09:03:49', '2021-02-17 17:07:30'),
(5, 'PayPal', 'Click to pay with your PayPal account', '/PayPal', 1, 0, 1, '2021-01-17 10:16:06', '2021-02-17 17:08:47'),
(6, 'Cash', 'Click to pay cash when finish', '/Cash', 3, 1, 1, '2021-02-17 17:08:42', '2021-02-17 17:08:42'),
(7, 'Credit Card (Stripe)', 'Click to pay with your Credit Card', '/Stripe', 3, 0, 1, '2021-02-17 17:08:42', '2021-02-17 17:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2021-01-17 09:58:28', '2021-02-17 16:25:15'),
(2, 'Paid', 10, '2021-01-11 17:49:49', '2021-02-17 16:25:53'),
(3, 'Failed', 20, '2021-01-17 08:35:04', '2021-02-17 16:26:32'),
(4, 'Refunded', 40, '2021-02-17 16:28:14', '2021-02-17 16:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2021-01-07 07:47:34', '2021-01-07 07:47:34'),
(2, 'medias.create', 'web', '2021-01-07 07:47:35', '2021-01-07 07:47:35'),
(3, 'users.profile', 'web', '2021-01-07 07:47:35', '2021-01-07 07:47:35'),
(4, 'users.index', 'web', '2021-01-07 07:47:35', '2021-01-07 07:47:35'),
(5, 'users.create', 'web', '2021-01-07 07:47:35', '2021-01-07 07:47:35'),
(6, 'users.store', 'web', '2021-01-07 07:47:35', '2021-01-07 07:47:35'),
(7, 'users.show', 'web', '2021-01-07 07:47:35', '2021-01-07 07:47:35'),
(8, 'users.edit', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(9, 'users.update', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(10, 'users.destroy', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(11, 'medias.delete', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(12, 'medias', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(13, 'permissions.index', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(14, 'permissions.create', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(15, 'permissions.store', 'web', '2021-01-07 07:47:36', '2021-01-07 07:47:36'),
(16, 'permissions.show', 'web', '2021-01-07 07:47:37', '2021-01-07 07:47:37'),
(17, 'permissions.edit', 'web', '2021-01-07 07:47:37', '2021-01-07 07:47:37'),
(18, 'permissions.update', 'web', '2021-01-07 07:47:37', '2021-01-07 07:47:37'),
(19, 'permissions.destroy', 'web', '2021-01-07 07:47:37', '2021-01-07 07:47:37'),
(20, 'roles.index', 'web', '2021-01-07 07:47:37', '2021-01-07 07:47:37'),
(21, 'roles.create', 'web', '2021-01-07 07:47:37', '2021-01-07 07:47:37'),
(22, 'roles.store', 'web', '2021-01-07 07:47:37', '2021-01-07 07:47:37'),
(23, 'roles.show', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(24, 'roles.edit', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(25, 'roles.update', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(26, 'roles.destroy', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(27, 'customFields.index', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(28, 'customFields.create', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(29, 'customFields.store', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(30, 'customFields.show', 'web', '2021-01-07 07:47:38', '2021-01-07 07:47:38'),
(31, 'customFields.edit', 'web', '2021-01-07 07:47:39', '2021-01-07 07:47:39'),
(32, 'customFields.update', 'web', '2021-01-07 07:47:39', '2021-01-07 07:47:39'),
(33, 'customFields.destroy', 'web', '2021-01-07 07:47:39', '2021-01-07 07:47:39'),
(34, 'currencies.index', 'web', '2021-01-07 07:47:39', '2021-01-07 07:47:39'),
(35, 'currencies.create', 'web', '2021-01-07 07:47:39', '2021-01-07 07:47:39'),
(36, 'currencies.store', 'web', '2021-01-07 07:47:39', '2021-01-07 07:47:39'),
(37, 'currencies.edit', 'web', '2021-01-07 07:47:39', '2021-01-07 07:47:39'),
(38, 'currencies.update', 'web', '2021-01-07 07:47:40', '2021-01-07 07:47:40'),
(39, 'currencies.destroy', 'web', '2021-01-07 07:47:40', '2021-01-07 07:47:40'),
(40, 'users.login-as-user', 'web', '2021-01-07 07:47:40', '2021-01-07 07:47:40'),
(41, 'app-settings', 'web', '2021-01-07 07:47:40', '2021-01-07 07:47:40'),
(42, 'faqCategories.index', 'web', '2021-01-07 07:47:40', '2021-01-07 07:47:40'),
(43, 'faqCategories.create', 'web', '2021-01-07 07:47:40', '2021-01-07 07:47:40'),
(44, 'faqCategories.store', 'web', '2021-01-07 07:47:40', '2021-01-07 07:47:40'),
(45, 'faqCategories.edit', 'web', '2021-01-07 07:47:41', '2021-01-07 07:47:41'),
(46, 'faqCategories.update', 'web', '2021-01-07 07:47:41', '2021-01-07 07:47:41'),
(47, 'faqCategories.destroy', 'web', '2021-01-07 07:47:41', '2021-01-07 07:47:41'),
(48, 'faqs.index', 'web', '2021-01-07 07:47:41', '2021-01-07 07:47:41'),
(49, 'faqs.create', 'web', '2021-01-07 07:47:41', '2021-01-07 07:47:41'),
(50, 'faqs.store', 'web', '2021-01-07 07:47:41', '2021-01-07 07:47:41'),
(51, 'faqs.edit', 'web', '2021-01-07 07:47:41', '2021-01-07 07:47:41'),
(52, 'faqs.update', 'web', '2021-01-07 07:47:42', '2021-01-07 07:47:42'),
(53, 'faqs.destroy', 'web', '2021-01-07 07:47:42', '2021-01-07 07:47:42'),
(54, 'payments.index', 'web', '2021-01-10 18:34:33', '2021-01-10 18:34:33'),
(55, 'payments.show', 'web', '2021-01-10 18:34:33', '2021-01-10 18:34:33'),
(56, 'payments.update', 'web', '2021-01-10 18:34:33', '2021-01-10 18:34:33'),
(57, 'paymentMethods.index', 'web', '2021-01-10 18:34:33', '2021-01-10 18:34:33'),
(58, 'paymentMethods.create', 'web', '2021-01-10 18:34:34', '2021-01-10 18:34:34'),
(59, 'paymentMethods.store', 'web', '2021-01-10 18:34:34', '2021-01-10 18:34:34'),
(60, 'paymentMethods.edit', 'web', '2021-01-10 18:34:34', '2021-01-10 18:34:34'),
(61, 'paymentMethods.update', 'web', '2021-01-10 18:34:34', '2021-01-10 18:34:34'),
(62, 'paymentMethods.destroy', 'web', '2021-01-10 18:34:34', '2021-01-10 18:34:34'),
(63, 'paymentStatuses.index', 'web', '2021-01-10 18:34:34', '2021-01-10 18:34:34'),
(64, 'paymentStatuses.create', 'web', '2021-01-10 18:34:34', '2021-01-10 18:34:34'),
(65, 'paymentStatuses.store', 'web', '2021-01-10 18:34:35', '2021-01-10 18:34:35'),
(66, 'paymentStatuses.edit', 'web', '2021-01-10 18:34:35', '2021-01-10 18:34:35'),
(67, 'paymentStatuses.update', 'web', '2021-01-10 18:34:35', '2021-01-10 18:34:35'),
(68, 'paymentStatuses.destroy', 'web', '2021-01-10 18:34:35', '2021-01-10 18:34:35'),
(69, 'verification.notice', 'web', '2021-01-12 04:49:50', '2021-01-12 04:49:50'),
(70, 'verification.verify', 'web', '2021-01-12 04:49:50', '2021-01-12 04:49:50'),
(71, 'verification.resend', 'web', '2021-01-12 04:49:51', '2021-01-12 04:49:51'),
(72, 'awards.index', 'web', '2021-01-12 04:49:51', '2021-01-12 04:49:51'),
(73, 'awards.create', 'web', '2021-01-12 04:49:52', '2021-01-12 04:49:52'),
(74, 'awards.store', 'web', '2021-01-12 04:49:52', '2021-01-12 04:49:52'),
(75, 'awards.show', 'web', '2021-01-12 04:49:52', '2021-01-12 04:49:52'),
(76, 'awards.edit', 'web', '2021-01-12 04:49:52', '2021-01-12 04:49:52'),
(77, 'awards.update', 'web', '2021-01-12 04:49:52', '2021-01-12 04:49:52'),
(78, 'awards.destroy', 'web', '2021-01-12 04:49:52', '2021-01-12 04:49:52'),
(79, 'experiences.index', 'web', '2021-01-12 05:50:29', '2021-01-12 05:50:29'),
(80, 'experiences.create', 'web', '2021-01-12 05:50:29', '2021-01-12 05:50:29'),
(81, 'experiences.store', 'web', '2021-01-12 05:50:30', '2021-01-12 05:50:30'),
(82, 'experiences.show', 'web', '2021-01-12 05:50:30', '2021-01-12 05:50:30'),
(83, 'experiences.edit', 'web', '2021-01-12 05:50:30', '2021-01-12 05:50:30'),
(84, 'experiences.update', 'web', '2021-01-12 05:50:30', '2021-01-12 05:50:30'),
(85, 'experiences.destroy', 'web', '2021-01-12 05:50:30', '2021-01-12 05:50:30'),
(92, 'eProviderTypes.index', 'web', '2021-01-13 06:01:08', '2021-01-13 06:01:08'),
(93, 'eProviderTypes.create', 'web', '2021-01-13 06:01:09', '2021-01-13 06:01:09'),
(94, 'eProviderTypes.store', 'web', '2021-01-13 06:01:09', '2021-01-13 06:01:09'),
(95, 'eProviderTypes.edit', 'web', '2021-01-13 06:01:09', '2021-01-13 06:01:09'),
(96, 'eProviderTypes.update', 'web', '2021-01-13 06:01:09', '2021-01-13 06:01:09'),
(97, 'eProviderTypes.destroy', 'web', '2021-01-13 06:01:09', '2021-01-13 06:01:09'),
(98, 'eProviders.index', 'web', '2021-01-13 06:18:55', '2021-01-13 06:18:55'),
(99, 'eProviders.create', 'web', '2021-01-13 06:18:56', '2021-01-13 06:18:56'),
(100, 'eProviders.store', 'web', '2021-01-13 06:18:56', '2021-01-13 06:18:56'),
(101, 'eProviders.edit', 'web', '2021-01-13 06:18:56', '2021-01-13 06:18:56'),
(102, 'eProviders.update', 'web', '2021-01-13 06:18:56', '2021-01-13 06:18:56'),
(103, 'eProviders.destroy', 'web', '2021-01-13 06:18:56', '2021-01-13 06:18:56'),
(104, 'addresses.index', 'web', '2021-01-13 06:18:56', '2021-01-13 06:18:56'),
(105, 'addresses.create', 'web', '2021-01-13 06:18:57', '2021-01-13 06:18:57'),
(106, 'addresses.store', 'web', '2021-01-13 06:18:57', '2021-01-13 06:18:57'),
(107, 'addresses.edit', 'web', '2021-01-13 06:18:57', '2021-01-13 06:18:57'),
(108, 'addresses.update', 'web', '2021-01-13 06:18:57', '2021-01-13 06:18:57'),
(109, 'addresses.destroy', 'web', '2021-01-13 06:18:57', '2021-01-13 06:18:57'),
(110, 'taxes.index', 'web', '2021-01-13 06:18:57', '2021-01-13 06:18:57'),
(111, 'taxes.create', 'web', '2021-01-13 06:18:57', '2021-01-13 06:18:57'),
(112, 'taxes.store', 'web', '2021-01-13 06:18:58', '2021-01-13 06:18:58'),
(113, 'taxes.edit', 'web', '2021-01-13 06:18:58', '2021-01-13 06:18:58'),
(114, 'taxes.update', 'web', '2021-01-13 06:18:58', '2021-01-13 06:18:58'),
(115, 'taxes.destroy', 'web', '2021-01-13 06:18:58', '2021-01-13 06:18:58'),
(116, 'availabilityHours.index', 'web', '2021-01-16 10:44:21', '2021-01-16 10:44:21'),
(117, 'availabilityHours.create', 'web', '2021-01-16 10:44:21', '2021-01-16 10:44:21'),
(118, 'availabilityHours.store', 'web', '2021-01-16 10:44:21', '2021-01-16 10:44:21'),
(119, 'availabilityHours.edit', 'web', '2021-01-16 10:44:21', '2021-01-16 10:44:21'),
(120, 'availabilityHours.update', 'web', '2021-01-16 10:44:22', '2021-01-16 10:44:22'),
(121, 'availabilityHours.destroy', 'web', '2021-01-16 10:44:22', '2021-01-16 10:44:22'),
(122, 'eServices.index', 'web', '2021-01-19 08:33:00', '2021-01-19 08:33:00'),
(123, 'eServices.create', 'web', '2021-01-19 08:33:00', '2021-01-19 08:33:00'),
(124, 'eServices.store', 'web', '2021-01-19 08:33:00', '2021-01-19 08:33:00'),
(126, 'eServices.edit', 'web', '2021-01-19 08:33:01', '2021-01-19 08:33:01'),
(127, 'eServices.update', 'web', '2021-01-19 08:33:01', '2021-01-19 08:33:01'),
(128, 'eServices.destroy', 'web', '2021-01-19 08:33:01', '2021-01-19 08:33:01'),
(129, 'categories.index', 'web', '2021-01-19 08:38:55', '2021-01-19 08:38:55'),
(130, 'categories.create', 'web', '2021-01-19 08:38:55', '2021-01-19 08:38:55'),
(131, 'categories.store', 'web', '2021-01-19 08:38:55', '2021-01-19 08:38:55'),
(132, 'categories.edit', 'web', '2021-01-19 08:38:55', '2021-01-19 08:38:55'),
(133, 'categories.update', 'web', '2021-01-19 08:38:56', '2021-01-19 08:38:56'),
(134, 'categories.destroy', 'web', '2021-01-19 08:38:56', '2021-01-19 08:38:56'),
(135, 'optionGroups.index', 'web', '2021-01-22 14:18:32', '2021-01-22 14:18:32'),
(136, 'optionGroups.create', 'web', '2021-01-22 14:18:32', '2021-01-22 14:18:32'),
(137, 'optionGroups.store', 'web', '2021-01-22 14:18:32', '2021-01-22 14:18:32'),
(138, 'optionGroups.edit', 'web', '2021-01-22 14:18:32', '2021-01-22 14:18:32'),
(139, 'optionGroups.update', 'web', '2021-01-22 14:18:32', '2021-01-22 14:18:32'),
(140, 'optionGroups.destroy', 'web', '2021-01-22 14:18:32', '2021-01-22 14:18:32'),
(141, 'options.index', 'web', '2021-01-22 14:40:51', '2021-01-22 14:40:51'),
(142, 'options.create', 'web', '2021-01-22 14:40:51', '2021-01-22 14:40:51'),
(143, 'options.store', 'web', '2021-01-22 14:40:52', '2021-01-22 14:40:52'),
(144, 'options.edit', 'web', '2021-01-22 14:40:52', '2021-01-22 14:40:52'),
(145, 'options.update', 'web', '2021-01-22 14:40:52', '2021-01-22 14:40:52'),
(146, 'options.destroy', 'web', '2021-01-22 14:40:52', '2021-01-22 14:40:52'),
(147, 'favorites.index', 'web', '2021-01-22 15:31:13', '2021-01-22 15:31:13'),
(148, 'favorites.create', 'web', '2021-01-22 15:31:13', '2021-01-22 15:31:13'),
(149, 'favorites.store', 'web', '2021-01-22 15:31:13', '2021-01-22 15:31:13'),
(150, 'favorites.edit', 'web', '2021-01-22 15:31:13', '2021-01-22 15:31:13'),
(151, 'favorites.update', 'web', '2021-01-22 15:31:13', '2021-01-22 15:31:13'),
(152, 'favorites.destroy', 'web', '2021-01-22 15:31:13', '2021-01-22 15:31:13'),
(153, 'eServiceReviews.index', 'web', '2021-01-23 14:12:57', '2021-01-23 14:12:57'),
(154, 'eServiceReviews.create', 'web', '2021-01-23 14:12:58', '2021-01-23 14:12:58'),
(155, 'eServiceReviews.store', 'web', '2021-01-23 14:12:58', '2021-01-23 14:12:58'),
(156, 'eServiceReviews.edit', 'web', '2021-01-23 14:12:58', '2021-01-23 14:12:58'),
(157, 'eServiceReviews.update', 'web', '2021-01-23 14:12:58', '2021-01-23 14:12:58'),
(158, 'eServiceReviews.destroy', 'web', '2021-01-23 14:12:58', '2021-01-23 14:12:58'),
(160, 'galleries.index', 'web', '2021-01-23 14:47:46', '2021-01-23 14:47:46'),
(161, 'galleries.create', 'web', '2021-01-23 14:47:47', '2021-01-23 14:47:47'),
(162, 'galleries.store', 'web', '2021-01-23 14:47:47', '2021-01-23 14:47:47'),
(163, 'galleries.edit', 'web', '2021-01-23 14:47:47', '2021-01-23 14:47:47'),
(164, 'galleries.update', 'web', '2021-01-23 14:47:47', '2021-01-23 14:47:47'),
(165, 'galleries.destroy', 'web', '2021-01-23 14:47:47', '2021-01-23 14:47:47'),
(166, 'requestedEProviders.index', 'web', '2021-01-25 04:23:17', '2021-01-25 04:23:17'),
(167, 'slides.index', 'web', '2021-01-25 05:31:20', '2021-01-25 05:31:20'),
(168, 'slides.create', 'web', '2021-01-25 05:31:20', '2021-01-25 05:31:20'),
(169, 'slides.store', 'web', '2021-01-25 05:31:20', '2021-01-25 05:31:20'),
(170, 'slides.edit', 'web', '2021-01-25 05:31:20', '2021-01-25 05:31:20'),
(171, 'slides.update', 'web', '2021-01-25 05:31:20', '2021-01-25 05:31:20'),
(172, 'slides.destroy', 'web', '2021-01-25 05:31:20', '2021-01-25 05:31:20'),
(173, 'notifications.index', 'web', '2021-01-25 10:12:33', '2021-01-25 10:12:33'),
(174, 'notifications.show', 'web', '2021-01-25 10:12:34', '2021-01-25 10:12:34'),
(175, 'notifications.destroy', 'web', '2021-01-25 10:12:34', '2021-01-25 10:12:34'),
(176, 'coupons.index', 'web', '2021-01-25 10:41:55', '2021-01-25 10:41:55'),
(177, 'coupons.create', 'web', '2021-01-25 10:41:55', '2021-01-25 10:41:55'),
(178, 'coupons.store', 'web', '2021-01-25 10:41:55', '2021-01-25 10:41:55'),
(179, 'coupons.edit', 'web', '2021-01-25 10:41:55', '2021-01-25 10:41:55'),
(180, 'coupons.update', 'web', '2021-01-25 10:41:55', '2021-01-25 10:41:55'),
(181, 'coupons.destroy', 'web', '2021-01-25 10:41:55', '2021-01-25 10:41:55'),
(182, 'bookingStatuses.index', 'web', '2021-01-25 13:51:01', '2021-01-25 13:51:01'),
(183, 'bookingStatuses.create', 'web', '2021-01-25 13:51:01', '2021-01-25 13:51:01'),
(184, 'bookingStatuses.store', 'web', '2021-01-25 13:51:01', '2021-01-25 13:51:01'),
(185, 'bookingStatuses.edit', 'web', '2021-01-25 13:51:01', '2021-01-25 13:51:01'),
(186, 'bookingStatuses.update', 'web', '2021-01-25 13:51:01', '2021-01-25 13:51:01'),
(187, 'bookingStatuses.destroy', 'web', '2021-01-25 13:51:01', '2021-01-25 13:51:01'),
(188, 'bookings.index', 'web', '2021-01-25 15:57:09', '2021-01-25 15:57:09'),
(189, 'bookings.create', 'web', '2021-01-25 15:57:09', '2021-01-25 15:57:09'),
(190, 'bookings.store', 'web', '2021-01-25 15:57:09', '2021-01-25 15:57:09'),
(191, 'bookings.show', 'web', '2021-01-25 15:57:09', '2021-01-25 15:57:09'),
(192, 'bookings.edit', 'web', '2021-01-25 15:57:09', '2021-01-25 15:57:09'),
(193, 'bookings.update', 'web', '2021-01-25 15:57:09', '2021-01-25 15:57:09'),
(194, 'bookings.destroy', 'web', '2021-01-25 15:57:09', '2021-01-25 15:57:09'),
(195, 'eProviderPayouts.index', 'web', '2021-01-30 05:53:08', '2021-01-30 05:53:08'),
(196, 'eProviderPayouts.create', 'web', '2021-01-30 05:53:08', '2021-01-30 05:53:08'),
(197, 'eProviderPayouts.store', 'web', '2021-01-30 05:53:08', '2021-01-30 05:53:08'),
(198, 'eProviderPayouts.destroy', 'web', '2021-01-30 05:53:09', '2021-01-30 05:53:09'),
(199, 'earnings.index', 'web', '2021-01-30 08:27:57', '2021-01-30 08:27:57'),
(200, 'earnings.create', 'web', '2021-01-30 08:27:57', '2021-01-30 08:27:57'),
(201, 'earnings.store', 'web', '2021-01-30 08:27:57', '2021-01-30 08:27:57'),
(202, 'earnings.destroy', 'web', '2021-01-30 08:27:57', '2021-01-30 08:27:57'),
(203, 'customPages.index', 'web', '2021-02-24 06:07:44', '2021-02-24 06:07:44'),
(204, 'customPages.create', 'web', '2021-02-24 06:07:44', '2021-02-24 06:07:44'),
(205, 'customPages.store', 'web', '2021-02-24 06:07:44', '2021-02-24 06:07:44'),
(206, 'customPages.show', 'web', '2021-02-24 06:07:44', '2021-02-24 06:07:44'),
(207, 'customPages.edit', 'web', '2021-02-24 06:07:44', '2021-02-24 06:07:44'),
(208, 'customPages.update', 'web', '2021-02-24 06:07:44', '2021-02-24 06:07:44'),
(209, 'customPages.destroy', 'web', '2021-02-24 06:07:44', '2021-02-24 06:07:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', 0, NULL, NULL),
(3, 'provider', 'web', 0, NULL, NULL),
(4, 'customer', 'web', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(5, 2),
(6, 2),
(8, 2),
(9, 2),
(9, 3),
(9, 4),
(10, 2),
(11, 2),
(11, 3),
(11, 4),
(12, 2),
(12, 3),
(13, 2),
(16, 2),
(19, 2),
(20, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 3),
(42, 4),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 3),
(48, 4),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(54, 3),
(54, 4),
(57, 2),
(57, 3),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(66, 2),
(67, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(72, 3),
(73, 2),
(73, 3),
(74, 2),
(74, 3),
(75, 2),
(75, 3),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(79, 2),
(79, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(84, 2),
(84, 3),
(85, 2),
(85, 3),
(92, 2),
(92, 3),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(98, 3),
(98, 4),
(99, 2),
(99, 3),
(99, 4),
(100, 2),
(100, 3),
(100, 4),
(101, 2),
(101, 3),
(102, 2),
(102, 3),
(103, 2),
(104, 2),
(104, 3),
(104, 4),
(105, 2),
(105, 3),
(105, 4),
(106, 2),
(106, 3),
(106, 4),
(107, 2),
(107, 3),
(107, 4),
(108, 2),
(108, 3),
(108, 4),
(109, 2),
(109, 3),
(109, 4),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(116, 3),
(117, 2),
(117, 3),
(118, 2),
(118, 3),
(119, 2),
(119, 3),
(120, 2),
(120, 3),
(121, 2),
(121, 3),
(122, 2),
(122, 3),
(122, 4),
(123, 2),
(123, 3),
(124, 2),
(124, 3),
(126, 2),
(126, 3),
(127, 2),
(127, 3),
(128, 2),
(128, 3),
(129, 2),
(129, 3),
(129, 4),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(135, 3),
(136, 2),
(136, 3),
(137, 2),
(137, 3),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(141, 3),
(142, 2),
(142, 3),
(143, 2),
(143, 3),
(144, 2),
(144, 3),
(145, 2),
(145, 3),
(146, 2),
(146, 3),
(147, 2),
(147, 3),
(147, 4),
(148, 2),
(149, 2),
(149, 3),
(150, 2),
(151, 2),
(151, 3),
(152, 2),
(153, 2),
(153, 3),
(153, 4),
(156, 2),
(156, 3),
(156, 4),
(157, 2),
(157, 3),
(157, 4),
(158, 2),
(160, 2),
(160, 3),
(161, 2),
(161, 3),
(162, 2),
(162, 3),
(163, 2),
(163, 3),
(164, 2),
(164, 3),
(165, 2),
(165, 3),
(166, 2),
(166, 3),
(166, 4),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(173, 3),
(173, 4),
(174, 2),
(175, 2),
(175, 3),
(175, 4),
(176, 2),
(176, 3),
(177, 2),
(178, 2),
(179, 2),
(179, 3),
(180, 2),
(180, 3),
(181, 2),
(182, 2),
(182, 3),
(185, 2),
(186, 2),
(188, 2),
(188, 3),
(188, 4),
(191, 2),
(191, 3),
(191, 4),
(192, 2),
(192, 3),
(193, 2),
(193, 3),
(194, 2),
(194, 3),
(195, 2),
(195, 3),
(196, 2),
(196, 3),
(197, 2),
(197, 3),
(199, 2),
(199, 3),
(200, 2),
(200, 3),
(203, 2),
(203, 3),
(203, 4),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'start',
  `text_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indicator_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_fit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cover',
  `e_service_id` int(10) UNSIGNED DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `order`, `text`, `button`, `text_position`, `text_color`, `button_color`, `background_color`, `indicator_color`, `image_fit`, `e_service_id`, `e_provider_id`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 1, '{\"en\":\"Assign a Handyman at Work to Fix the Household\"}', '{\"en\":\"Discover It\"}', 'bottom_start', '#333333', '#009E6A', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 06:21:45', '2022-04-22 04:41:09'),
(2, 2, '{\"en\":\"Fix the Broken Stuff by Asking for the Technicians\"}', '{\"en\":\"Repair\"}', 'bottom_start', '#333333', '#F4841F', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 08:53:49', '2022-04-22 05:20:17'),
(3, 3, '{\"en\":\"Add Hands to Your Cleaning Chores\"}', '{\"en\":\"Book Now\"}', 'bottom_start', '#333333', '#1FA3F4', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-31 05:34:36', '2022-04-22 05:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(10,2) NOT NULL DEFAULT 0.00,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Tax 20', 20.00, 'percent', '2021-01-15 05:42:13', '2021-02-01 15:53:01'),
(2, 'Tax 10', 10.00, 'percent', '2021-01-15 05:49:30', '2021-01-15 05:49:30'),
(3, 'Maintenance', 2.00, 'fixed', '2021-01-18 15:18:29', '2021-02-01 15:55:13'),
(4, 'Tools Fee', 5.00, 'fixed', '2021-02-01 15:54:12', '2021-02-01 15:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `uuid`, `created_at`, `updated_at`) VALUES
(9, '0e3f74e6-e9bb-4c00-8e48-aecf436d8beb', '2022-04-22 05:45:20', '2022-04-22 05:45:20'),
(10, '678884cc-b9b5-40d0-8f03-b453ce807a9b', '2022-04-22 05:45:39', '2022-04-22 05:45:39'),
(11, '8d503b77-29b1-4bb2-968b-2993d8a11ce0', '2022-04-22 05:45:59', '2022-04-22 05:45:59'),
(12, '694bd9ed-507c-47cc-9c2f-cc3f1853fe6d', '2022-04-22 06:14:00', '2022-04-22 06:14:00'),
(13, '5e49ac1a-4f6d-4893-9e60-905dc5c3c382', '2022-04-22 06:22:36', '2022-04-22 06:22:36'),
(14, 'e7715d5b-5ae0-4a7d-8d35-5dc73d9358ce', '2022-04-22 06:22:51', '2022-04-22 06:22:51'),
(15, 'c2dec837-a64c-4d66-a9ec-898a81387b64', '2022-04-22 06:23:05', '2022-04-22 06:23:05'),
(16, 'd8143d99-6c77-47f0-916a-3446e0c25718', '2022-04-22 06:23:22', '2022-04-22 06:23:22'),
(17, '61787d84-f41c-4094-9eff-a958120e19f4', '2022-04-22 06:23:59', '2022-04-22 06:23:59'),
(18, '74b7afa6-6a6f-4f0b-8924-05033b25701c', '2022-04-25 02:51:20', '2022-04-25 02:51:20'),
(19, '4d4874eb-e541-4348-8ebc-49925b05e5cc', '2022-04-25 02:51:43', '2022-04-25 02:51:43'),
(20, '2c0cef5c-7cc9-4842-b4af-7058159924ce', '2022-04-25 02:52:01', '2022-04-25 02:52:01'),
(21, '252f4100-5d31-4ef1-80e6-29cadfa46d46', '2022-04-25 02:52:19', '2022-04-25 02:52:19'),
(22, 'd5f0e601-5ed3-455e-b9e0-e642d412269e', '2022-04-25 02:53:19', '2022-04-25 02:53:19'),
(23, 'e98922fa-ed3d-4362-afb7-fb3aca20d416', '2022-04-25 02:54:23', '2022-04-25 02:54:23'),
(24, '43cf729d-add7-4d0f-a5d4-1a7a7d2f14fe', '2022-04-25 02:54:52', '2022-04-25 02:54:52'),
(25, '5caff2b5-a586-48f7-961a-cf6ba5e30240', '2022-04-25 03:05:07', '2022-04-25 03:05:07'),
(26, '66d1bfbe-1111-4cfe-a4fe-a65815593985', '2022-04-25 03:19:01', '2022-04-25 03:19:01'),
(27, '3907ae04-13bb-47b1-a4e6-c08ae8e58d7a', '2022-04-25 03:19:33', '2022-04-25 03:19:33'),
(28, '5f5de448-aded-4fef-8ccb-c5079259244d', '2022-04-25 03:20:21', '2022-04-25 03:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `phone_verified_at`, `email_verified_at`, `password`, `api_token`, `device_token`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `paypal_email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hyatt Zimmerman', 'admin@demo.com', '+1 234 8996 321', '2021-01-10 11:52:10', '2021-01-10 11:52:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', '', NULL, NULL, NULL, NULL, NULL, 'aBxlSqj89dZPGtShPk102W8jsMM2XDgPk6ySQN6Zw1jrExczsdH0HVUEXfbf', NULL, '2021-02-09 11:20:32'),
(2, 'Jennifer Paul', 'provider@demo.com', '+1 234 8996 322', '2021-01-10 11:52:10', '2021-01-10 11:52:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', '', NULL, NULL, NULL, NULL, NULL, 'TwyKlf5NJ0oG6l5FfFhbCKsdRWrjF6HCunV8nZn2U9OXhJJTZ2Jxx4EqAJPA', NULL, '2021-02-28 11:36:55'),
(3, 'Germaine Guzman', 'customer@demo.com', '+1 234 8996 323', '2021-01-10 11:52:10', '2021-01-10 11:52:10', '$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K', 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', 'fWzMy31mTuKEix0yUq4ogs:APA91bFDhq5bAKH1hhF2C6bi6jH12RdjRw1tQi0ukEVuXu8aA89uZxBc1IZr2ZGHeT3t-FGcB7H3btcCceIc0PdyRrEtSELm6wd9vavwo6W_NH0Hxzc1MGgC97zvbselSNYOpNlYlNk_', NULL, NULL, NULL, NULL, NULL, 'SPz6luq3aoxCbgIS1gqmFDgM1qzGlIDtF0HgmDbtWcx2reaeFcogcFQzdP2F', NULL, '2022-05-14 03:28:20'),
(4, 'Aimee Mcgee', 'provider1@demo.com', '+1 234 8996 324', '2021-01-10 11:52:10', '2021-01-10 11:52:10', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', '', NULL, NULL, NULL, NULL, NULL, 'yCzPqDP1oczySU57q6G71SxTIJSiZUBE4vYdXbXCqzpzC2iN09igcs3jzSQK', NULL, '2021-02-21 09:20:29'),
(5, 'Josephine Harding', 'customer3@demo.com', NULL, NULL, NULL, '$2y$10$n/06hZG121ZGp3tSwDQS3uhsQKxEYspjKrn7kGlLxRinUZKiulrEm', 'gkEWScQHIol9EIRhP3m5m7JqnK5UvcGdEsKQJo7YeBcQawYFq3JAJ6SX9UKy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 05:25:52', '2021-02-02 05:59:47'),
(6, 'Nicolette Christiansen', 'provider2@demo.com', NULL, NULL, '2021-01-10 18:30:00', '$2y$04$WRpHC9iMxZ3f.gctQ4igsuZjsYfGjX7igVM8GsC2AMME3.4au3dYu', 'TKArYDDFHNiEI33sfExaBEhxHCs5kFaWP7EO6aNlUZfnqHrvsMCwsYeAk9s2', NULL, NULL, NULL, NULL, NULL, NULL, 'JbiYaHlRWGKkfITxH9qI87GzTMPf0zJ2Iw6NIdlS5dDvWuT5PC2sP5ELGwKx', '2021-01-11 06:03:59', '2021-02-02 06:00:56'),
(7, 'Rose Bauer', 'customer2@demo.com', NULL, NULL, NULL, '$2y$10$3GhoIShzRdSXevYAh1NF/.67J3OshX9D2.sqY50o8kxh7EXPw7tuC', 'w6QJYqZyllY24AIR3nSsKqgj5eMSZevmgpSywwxJxUS9nwULcuriRLBxEXZC', '', NULL, NULL, NULL, NULL, NULL, 'WxYP9zjTBy9SYF5OWjcFbMt2Ob9r0bahBKzPDOtw9OrAJ89JqaMxkN5aqu8J', '2021-01-17 10:43:24', '2021-02-28 12:33:25'),
(8, 'smarter8', 'smartersvision@gmail.com', '+12645595482', NULL, NULL, '$2y$10$MqPMTfg6RUNxxEH6aLdqnOYZUBsT7xtxkglD74pDgThV52.HJrLba', 'WivbG2oAEbEGl51EBeBuHaZeCqyfBnCVGo18nSaj2FwwiDjux2ZOAZWUoddK', '', NULL, NULL, NULL, NULL, NULL, 'SdstZCaeYW0pjqZn832HMzBD7WPGJ5m9hwWG28nhbIrzSS0etj33rbTRJ6kD', '2021-02-10 06:01:12', '2021-02-23 15:11:50'),
(9, 'Vicky', 'badvicky72@gmail.com', '+91 7988302562', '2022-10-19 04:18:43', NULL, '$2y$10$FMTCUzP0HNyFlRw2urZiLuzKComAOF4m01aCGxj603M2C4N6x4tGC', 'APqrLQGs3X6zfgvb0HT9H2vvrBMy8Ro6ik3NFsY0l5yF2x1kgJgGVD3rytoZ', 'cBWFWgyxRNWYhBA2B99EFq:APA91bFmbzA8JxG2SKJYvg0795FErCCOJNw4IklsTlzAce9GNbBakEK0zv48Icvlz68gBvAnLB98lWENMD-07O62aqpVI73TIylUUiLf8L23GgClJ0Nq1FMrlbp2RtVAXYgUO7JJNh7f', NULL, NULL, NULL, NULL, NULL, 'K8XVepk8ej6bbMOTevTEHpkMdNy66yYATBUr1jCFuFmRdPbH4Im9m6K2VzqJ', '2022-10-18 22:48:45', '2022-10-18 22:48:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_key_index` (`key`);

--
-- Indexes for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_hours_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_booking_status_id_foreign` (`booking_status_id`),
  ADD KEY `bookings_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discountables`
--
ALTER TABLE `discountables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountables_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiences_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_providers_e_provider_type_id_foreign` (`e_provider_type_id`);

--
-- Indexes for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD PRIMARY KEY (`e_provider_id`,`address_id`),
  ADD KEY `e_provider_addresses_address_id_foreign` (`address_id`);

--
-- Indexes for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_provider_payouts_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD PRIMARY KEY (`e_provider_id`,`tax_id`),
  ADD KEY `e_provider_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD PRIMARY KEY (`user_id`,`e_provider_id`),
  ADD KEY `e_provider_users_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_services`
--
ALTER TABLE `e_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_services_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD PRIMARY KEY (`e_service_id`,`category_id`),
  ADD KEY `e_service_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_service_reviews_user_id_foreign` (`user_id`),
  ADD KEY `e_service_reviews_e_service_id_foreign` (`e_service_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_e_service_id_foreign` (`e_service_id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD PRIMARY KEY (`option_id`,`favorite_id`),
  ADD KEY `favorite_options_favorite_id_foreign` (`favorite_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_e_service_id_foreign` (`e_service_id`),
  ADD KEY `options_option_group_id_foreign` (`option_group_id`);

--
-- Indexes for table `option_groups`
--
ALTER TABLE `option_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `payments_payment_status_id_foreign` (`payment_status_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_e_service_id_foreign` (`e_service_id`),
  ADD KEY `slides_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `availability_hours`
--
ALTER TABLE `availability_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discountables`
--
ALTER TABLE `discountables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `e_providers`
--
ALTER TABLE `e_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `e_services`
--
ALTER TABLE `e_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `option_groups`
--
ALTER TABLE `option_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD CONSTRAINT `availability_hours_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_booking_status_id_foreign` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discountables`
--
ALTER TABLE `discountables`
  ADD CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD CONSTRAINT `e_providers_e_provider_type_id_foreign` FOREIGN KEY (`e_provider_type_id`) REFERENCES `e_provider_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD CONSTRAINT `e_provider_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_addresses_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD CONSTRAINT `e_provider_payouts_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD CONSTRAINT `e_provider_taxes_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD CONSTRAINT `e_provider_users_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_services`
--
ALTER TABLE `e_services`
  ADD CONSTRAINT `e_services_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD CONSTRAINT `e_service_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_categories_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD CONSTRAINT `e_service_reviews_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD CONSTRAINT `favorite_options_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `options_option_group_id_foreign` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `slides_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
