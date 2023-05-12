-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 87.98.236.134:3306
-- Czas generowania: 02 Sty 2021, 22:51
-- Wersja serwera: 10.1.37-MariaDB-0+deb9u1
-- Wersja PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db_60758`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_adminjail`
--

CREATE TABLE `crime_adminjail` (
  `seg` int(11) NOT NULL,
  `nick` text COLLATE utf8_polish_ci NOT NULL,
  `Serial` varchar(128) CHARACTER SET latin1 NOT NULL,
  `Termin` datetime NOT NULL,
  `Cela` int(11) NOT NULL COMMENT 'CELA',
  `Powod` varchar(4092) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_admins`
--

CREATE TABLE `crime_admins` (
  `osoba` int(11) NOT NULL,
  `serial` text NOT NULL,
  `date` text NOT NULL,
  `level` tinyint(1) NOT NULL,
  `visualrank` text,
  `actived` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `crime_admins`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_ban`
--

CREATE TABLE `crime_ban` (
  `osoba` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `serial` text NOT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `time` datetime NOT NULL,
  `type` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_equipment`
--

CREATE TABLE `crime_equipment` (
  `uid` int(11) NOT NULL,
  `przedmiot` text NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `crime_equipment`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_factions`
--

CREATE TABLE `crime_factions` (
  `code` varchar(125) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `nick` text NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '0',
  `minutes` int(11) NOT NULL DEFAULT '0',
  `odznaka` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `crime_factions`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_friends`
--

CREATE TABLE `crime_friends` (
  `ID` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `uidznajomego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_gangs`
--

CREATE TABLE `crime_gangs` (
  `id` int(11) NOT NULL,
  `code` varchar(31) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `saldo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_gangs_balance`
--

CREATE TABLE `crime_gangs_balance` (
  `id` int(11) NOT NULL,
  `kto` text NOT NULL,
  `ile` int(11) NOT NULL DEFAULT '0',
  `kiedy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `org` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_houses`
--

CREATE TABLE `crime_houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `descr` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `i` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'interior w ktorym jest wejscie i wyjscie z domu',
  `vwe` int(11) NOT NULL DEFAULT '0' COMMENT 'vw wejscia (prawie zawsze 0)',
  `vwi` int(11) DEFAULT NULL COMMENT 'VW wnetrza (nadawane automatycznie, tu mozna wymusic)',
  `drzwi` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'x,y,z miejsce w ktorym bedzie pickup wchodzenia',
  `punkt_wyjscia` varchar(64) CHARACTER SET latin1 NOT NULL COMMENT 'x,y,z,[rz] miejsce gdzie przeniesie po wyjsciu',
  `interiorid` int(10) UNSIGNED DEFAULT NULL COMMENT 'numer wnetrza z tablicy pbp_interiory',
  `ownerid` int(10) UNSIGNED DEFAULT NULL COMMENT 'numer wlasciciela z tablicy players',
  `zamkniety` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=zawsze otwarty',
  `koszt` int(5) UNSIGNED NOT NULL DEFAULT '100',
  `paidTo` date DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'uzywane do wykrywania zaktualizowanych przez panel domow',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `crime_houses`
--

INSERT INTO `crime_houses` (`id`, `descr`, `i`, `vwe`, `vwi`, `drzwi`, `punkt_wyjscia`, `interiorid`, `ownerid`, `zamkniety`, `koszt`, `paidTo`, `updated`, `active`) VALUES
(1, 'Kawalerka', 0, 0, NULL, '2529.58,-1493.61,24.03', '2529.58,-1493.61,24.03', 13, NULL, 0, 2000, NULL, '2020-10-31 23:08:17', 1),
(2, 'Kawalerka', 0, 0, NULL, '2508.72,-1493.73,24.00', '2508.72,-1493.73,24.00', 36, NULL, 1, 2000, NULL, '2020-10-25 12:25:49', 1),
(3, 'Kawalerka', 0, 0, NULL, '2418.16,-1631.44,19639.69', '2418.16,-1631.44,19639.69', 36, NULL, 0, 2000, NULL, '2020-11-14 23:04:27', 1),
(4, 'Mieszkanie', 0, 0, NULL, '1462.10,-1781.27,13.55', '1462.10,-1781.27,13.55', 5, 21, 0, 2000, '2021-01-07', '2021-01-02 16:25:20', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_house_interiors`
--

CREATE TABLE `crime_house_interiors` (
  `id` int(10) UNSIGNED NOT NULL,
  `interior` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `entrance` varchar(64) CHARACTER SET latin1 NOT NULL COMMENT 'x,y,z,a - miejsce gdzie pojawi sie gracz po wejsciu',
  `exit` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT 'x,y,z - miejsce gdzie bedzie marker wyjscia',
  `opis` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT 'opis do wyszukiwarki',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `dimension` int(10) UNSIGNED DEFAULT NULL,
  `koszt` mediumint(8) UNSIGNED NOT NULL DEFAULT '5000',
  `notes` text CHARACTER SET latin1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `crime_house_interiors`
--

INSERT INTO `crime_house_interiors` (`id`, `interior`, `entrance`, `exit`, `opis`, `active`, `dimension`, `koszt`, `notes`) VALUES
(1, 3, '1531.33,-8.66,1002.10,177.3', '1531.42,-6.72,1002.10', 'dom jednopokojowy', 1, NULL, 50000, NULL),
(2, 2, '1522.70,-47.97,1002.13, 270', '1520.70,-47.95,1002.13', 'dom jednopokojowy', 1, NULL, 50000, NULL),
(3, 3, '518.54,-9.21,1001.57,85.9', '521.14,-9.20,1001.57', 'dom jednopokojowy', 1, NULL, 50000, NULL),
(4, 1, '245.43,304.87,999.15,272.8', '243.72,305.01,999.15', '1 pokoik', 1, NULL, 50000, NULL),
(5, 2, '2466.83,-1698.29,1013.51,90.1', '2468.84,-1698.32,1013.51', 'dom jednorodzinny', 1, NULL, 50000, NULL),
(6, 1, '2526.14,-1679.47,1215.50,273.1', '2524.09,-1679.31,1215.50', 'dom jednorodzinny', 1, NULL, 50000, NULL),
(7, 3, '2495.97,-1694.24,1014.74,177.2', '2496.01,-1692.08,1014.74', 'dom pietrowy', 1, NULL, 50000, NULL),
(8, 2, '268.43,305.06,999.15,270.7', '266.50,304.99,999.15', 'dom jednopokojowy', 1, NULL, 50000, NULL),
(9, 2, '0.02,-3.18,999.43,86.0', '2.06,-3.12,999.43', 'przyczepa kampingowa', 1, NULL, 50000, NULL),
(10, 5, '2350.54,-1180.92,1027.98,87.5', '2352.94,-1180.93,1027.98', 'dom wielorodzinny', 1, NULL, 50000, NULL),
(11, 10, '420.56,2536.70,10.00,91.3', '422.57,2536.48,10.00', 'dom jednopokojowy', 0, NULL, 50000, NULL),
(12, 14, '256.33,-41.76,1002.02,269.2', '254.17,-41.53,1002.03', 'przebieralnia', 1, NULL, 50000, NULL),
(13, 5, '2233.81,-1113.07,1050.88,2.3', '2233.66,-1115.26,1050.88', 'dom jednopokojowy', 1, NULL, 50000, NULL),
(14, 9, '2317.88,-1024.79,1250.21,359.5', '2317.79,-1026.77,1250.22', 'dom wielorodzinny', 1, NULL, 50000, NULL),
(15, 10, '2261.58,-1136.09,1050.63,275.5', '2259.38,-1135.85,1050.64', 'dom jednorodzinny', 1, NULL, 50000, NULL),
(16, 3, '235.39,1188.52,1080.26,3.7', '235.30,1186.68,1080.26', 'dom pietrowy', 0, NULL, 50000, NULL),
(17, 2, '225.05,1240.00,1082.14,90.5', '226.79,1239.98,1082.14', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(18, 1, '223.18,1288.53,1082.14,359.4', '223.09,1287.08,1082.14', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(19, 5, '228.33,1114.16,1080.99,268.8', '226.30,1114.30,1080.99', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(20, 15, '295.10,1474.27,1080.26,358.6', '295.10,1472.26,1080.26', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(21, 12, '446.75,508.74,1201.42,0.5', '446.73,506.32,1201.42', 'dom jednopokojowy', 1, NULL, 50000, NULL),
(22, 5, '228.86,1114.38,1080.99,267.6', '226.29,1114.30,1080.99', 'dom pietrowy', 0, NULL, 50000, NULL),
(23, 4, '261.04,1285.87,1080.26,359.3', '261.01,1284.29,1080.26', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(24, 4, '300.77,312.78,999.15,272.9', '298.91,312.94,999.15', 'dom jednorodzinny', 1, NULL, 50000, NULL),
(25, 10, '24.16,1341.84,1084.38,0.9', '23.98,1340.16,1084.38', 'dom pietrowy', 0, NULL, 50000, NULL),
(26, 4, '221.61,1142.24,1082.61,359.4', '221.86,1140.20,1082.61', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(27, 12, '2324.43,-1147.31,1050.71,358.5', '2324.46,-1149.54,1050.71', 'dom pietrowy - luksus', 1, NULL, 50000, NULL),
(28, 4, '-262.52,1456.57,1084.37,86.2', '-260.49,1456.69,1084.37', 'dom pietrowy', 0, NULL, 50000, NULL),
(29, 5, '23.05,1405.43,1084.43,358.2', '22.83,1403.32,1084.44', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(30, 5, '140.44,1368.35,1083.86,358.4', '140.25,1365.92,1083.86', 'dom pietrowy - luksus', 1, NULL, 50000, NULL),
(31, 6, '234.17,1066.13,1084.21,358.1', '234.18,1063.72,1084.21', 'dom pietrowy - luksus', 1, NULL, 50000, NULL),
(32, 6, '-68.67,1353.26,1080.21,359.0', '-68.83,1351.21,1080.21', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(33, 15, '-285.27,1471.11,1084.38,83.6', '-283.44,1471.03,1084.38', 'dom pietrowy', 0, NULL, 50000, NULL),
(34, 2, '2189.43,1628.88,1043.39,89.0', '2191.18,1628.77,1043.39', 'dom luksus', 1, NULL, 50000, NULL),
(35, 8, '2807.57,-1172.89,1025.57,357.8', '2807.63,-1174.75,1025.57', 'dom pietrowy', 1, NULL, 50000, NULL),
(36, 1, '2216.50,-1076.20,1050.48,90.6', '2218.40,-1076.27,1050.48', 'dom jednopokojowy', 1, NULL, 50000, NULL),
(37, 2, '2237.53,-1079.64,1049.02,359.4', '2237.53,-1081.64,1049.02', 'dom luksus', 1, NULL, 50000, NULL),
(38, 8, '2365.33,-1133.73,1250.88,358.6', '2365.29,-1135.59,1250.88', 'dom luksus', 1, NULL, 50000, NULL),
(39, 8, '-42.50,1407.55,1084.43,2.8', '-42.57,1405.47,1084.43', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(40, 9, '83.30,1324.73,1083.86,358.4', '83.05,1322.28,1083.87', 'dom pietrowy - luksus', 1, NULL, 50000, NULL),
(41, 9, '260.72,1239.19,1084.26,1.1', '260.74,1237.23,1084.26', 'dom jednorodzinny', 0, NULL, 50000, NULL),
(42, 44, '1656.47,2181.13,1.94,266.5', '1653.73,2180.93,1.93', 'dom w kanalach 1', 0, NULL, 50000, NULL),
(43, 44, '2359.74,2426.02,-2.24,179.4', '2359.61,2428.71,-2.24', 'dom w kanalach 2', 1, NULL, 50000, NULL),
(44, 44, '2585.39,1483.38,-10.71,0.6', '2584.82,1480.64,-10.66', 'dom w kanalach 3', 1, NULL, 50000, NULL),
(45, 44, '1553.67,659.13,-10.07,240.6', '1550.07,660.76,-10.29', 'dom w kanalach 4', 1, NULL, 50000, NULL),
(46, 44, '2781.68,1463.74,-11.52,177.1', '2781.95,1465.58,-11.52', 'dom w kanalach 5', 0, NULL, 50000, NULL),
(47, 44, '2571.02,2105.30,-11.18,259.4', '2567.11,2106.19,-11.21', 'dom w kanalach 6', 0, NULL, 50000, NULL),
(48, 11, '2003.68,1012.46,138.22,2.7', '2003.68,1010.63,138.22', 'Pomieszczenie w kasynie', 1, NULL, 50000, NULL),
(49, 3, '387.93,173.93,1008.38,92.7', '390.77,173.76,1008.38', 'Bank', 1, NULL, 50000, NULL),
(50, 5, '1299.01,-794.97,1084.01,355.9', '1298.96,-797.01,1084.01', 'Apartament - baza gangow', 1, NULL, 50000, NULL),
(51, 18, '1726.87,-1640.47,20.22,177.9', '1727.02,-1637.84,20.22', 'wiezowiec', 1, NULL, 50000, NULL),
(52, 15, '2216.58,-1150.30,1025.80,272.6', '2214.38,-1150.48,1025.80', 'hotel', 1, NULL, 100000, NULL),
(53, 0, '2306.38,-15.24,26.75,0', NULL, NULL, 1, NULL, 50000, NULL),
(54, 3, '1494.56,1305.56,1093.29,354.2', '1494.41,1303.58,1093.29', 'sala konferencyjna', 1, NULL, 50000, NULL),
(55, 2, '2430.36,-2677.78,2035.17, 0', NULL, NULL, 1, NULL, 50000, NULL),
(56, 1, '2268.15,1647.45,1084.23,276.7', '2265.88,1647.47,1084.23', 'hote', 0, NULL, 50000, NULL),
(57, 10, '2016.35,1017.69,996.88,89.2', '2019.07,1017.85,996.88', 'kasyno', 0, NULL, 50000, NULL),
(58, 1, '2234.22,1712.32,1011.79,180.3', '2233.90,1714.68,1012.38', 'kasyno', 1, NULL, 50000, NULL),
(59, 12, '1133.24,-13.30,1000.68,357.4', '1133.16,-15.83,1000.68', 'kasyno', 1, NULL, 50000, NULL),
(60, 3, '973.20,-8.51,1001.15,90.1', '975.32,-8.66,1001.15', 'burdel', 1, NULL, 50000, NULL),
(61, 3, '965.66,-53.15,1001.12,91.8', '968.16,-53.17,1001.12', 'burdel', 1, NULL, 50000, NULL),
(62, 3, '831.44,7.66,1004.18,86.8', '834.67,7.41,1004.19', 'bank', 1, NULL, 50000, NULL),
(63, 3, '1212.09,-28.18,1000.95,179.2', '1212.16,-25.87,1000.95', 'burdel', 1, NULL, 50000, NULL),
(64, 2, '1205.08,-11.76,1000.92,357.8', '1204.74,-13.85,1000.92', 'burdel', 1, NULL, 50000, NULL),
(65, 3, '-2636.80,1404.81,906.46,354.9', '-2636.67,1402.47,906.46', 'burdel', 0, NULL, 50000, NULL),
(66, 5, '459.12,-109.20,999.51,356.2', '458.91,-111.35,999.51', 'restauracja', 1, NULL, 50000, NULL),
(67, 5, '372.49,-131.32,1001.49,359.3', '372.27,-133.52,1001.49', 'restauracja', 1, NULL, 50000, NULL),
(68, 17, '377.32,-191.32,1000.63,357.4', '377.13,-193.31,1000.63', 'restauracja', 1, NULL, 50000, NULL),
(69, 1, '453.55,-18.18,1001.13,92.4', '455.31,-19.52,1001.13', 'restauracja', 1, NULL, 50000, NULL),
(70, 10, '364.67,-73.49,1001.51,310.0', '362.86,-75.15,1001.51', 'restauracja', 1, NULL, 50000, NULL),
(71, 17, '493.50,-22.96,1000.68,357.5', '493.38,-24.87,1000.68', 'dyskoteka', 1, NULL, 50000, NULL),
(72, 1, '681.58,-449.30,-25.63,175.5', '681.54,-446.39,-25.61', 'bar', 1, NULL, 50000, NULL),
(73, 18, '-226.86,1400.90,27.77,268.8', '-229.29,1401.23,27.77', 'bar', 1, NULL, 50000, NULL),
(74, 4, '457.88,-88.21,999.55,88.4', '460.56,-88.65,999.55', 'restauracja', 1, NULL, 50000, NULL),
(75, 6, '441.94,-51.52,999.68,180.1', '441.94,-49.48,999.68', 'restauracja', 1, NULL, 50000, NULL),
(76, 6, '744.47,1441.93,1102.70,180.5', '744.43,1443.72,1102.70', 'restauracjo-burdel', 0, NULL, 50000, NULL),
(77, 9, '365.33,-9.69,1001.85,359.1', '364.80,-11.70,1001.85', 'restauracja', 1, NULL, 50000, NULL),
(78, 11, '502.06,-70.06,998.76,181.1', '501.92,-67.56,998.76', 'bar', 1, NULL, 50000, NULL),
(79, 3, '207.12,-136.74,1002.87,359.7', '207.00,-140.38,1003.51', 'sklep odziezowy', 1, NULL, 50000, NULL),
(80, 3, '-100.31,-22.77,1000.72,358.3', '-100.36,-25.04,1000.72', 'sexshop', 1, NULL, 50000, NULL),
(81, 17, '-25.87,-186.25,1003.55,356.5', '-25.95,-188.25,1003.55', 'sklep spozywczy', 1, NULL, 50000, NULL),
(82, 5, '225.20,-7.89,1002.21,89.6', '227.49,-8.17,1002.21', 'sklep odziezowy', 1, NULL, 50000, NULL),
(83, 10, '6.33,-29.25,1003.55,359.7', '6.04,-31.77,1003.55', 'sklep spozywczy', 1, NULL, 50000, NULL),
(84, 1, '203.81,-48.13,1001.80,356.9', '203.73,-50.67,1001.80', 'sklep odziezowy', 1, NULL, 50000, NULL),
(85, 18, '-30.82,-89.96,1003.55,1.5', '-30.98,-92.01,1003.55', 'sklep spozywczy', 1, NULL, 50000, NULL),
(86, 18, '161.67,-94.20,1001.80,0.6', '161.36,-97.11,1001.80', 'sklep odziezowy', 1, NULL, 50000, NULL),
(87, 14, '204.48,-167.00,1000.52,3.1', '204.34,-168.85,1000.52', 'sklep odziezowy', 1, NULL, 50000, NULL),
(88, 16, '-25.66,-139.31,1003.55,356.2', '-25.91,-141.56,1003.55', 'sklep spozywczy', 1, NULL, 50000, NULL),
(89, 15, '207.78,-109.51,1005.13,2.5', '207.65,-111.26,1005.13', 'sklep odziezowy', 1, NULL, 50000, NULL),
(90, 0, '663.06,-573.63,16.34,0', NULL, NULL, 1, NULL, 50000, NULL),
(91, 4, '-27.61,-29.24,1003.56,2.1', '-27.29,-31.76,1003.56', 'sklep spozywczy', 1, NULL, 50000, NULL),
(92, 6, '-2239.11,137.04,1035.41,269.8', '-2240.78,137.20,1035.41', 'sklep z zabawkami', 1, NULL, 50000, NULL),
(93, 6, '-27.58,-55.50,1003.55,2.6', '-27.33,-58.25,1003.55', 'sklep spozywczy', 1, NULL, 50000, NULL),
(94, 3, '418.86,-82.44,1001.80,358.8', '418.63,-84.37,1001.80', 'salon fryzjerski', 1, NULL, 50000, NULL),
(95, 3, '-204.31,-42.65,1002.27,3.3', '-204.39,-44.40,1002.27', 'salon fryzjerski', 1, NULL, 50000, NULL),
(96, 17, '-204.32,-7.19,1002.27,2.2', '-204.38,-9.08,1002.27', 'salon fryzjerski', 1, NULL, 50000, NULL),
(97, 2, '411.87,-21.08,1001.80,357.8', '411.56,-23.17,1001.80', 'salon fryzjerski', 1, NULL, 50000, NULL),
(98, 16, '-204.35,-25.46,1002.27,355.3', '-204.40,-27.35,1002.27', 'salon fryzjerski', 1, NULL, 50000, NULL),
(99, 12, '412.21,-52.35,1001.90,0.6', '411.96,-54.45,1001.90', 'salon fryzjerski', 1, NULL, 50000, NULL),
(100, 1, '-1401.63,104.33,1032.24,181.4', '-1401.71,107.32,1032.27', 'dd2', 1, NULL, 50000, NULL),
(101, 7, '-1406.16,-265.37,1043.66,347.6', '-1407.32,-269.54,1043.66', 'tor wyscigowy', 1, NULL, 50000, NULL),
(102, 10, '-1127.73,1057.78,1346.41,272.3', '-1131.51,1057.85,1346.42', 'plan filmowy', 0, NULL, 50000, NULL),
(103, 14, '-1464.55,1559.16,1052.53,357.5', '-1464.68,1555.93,1052.53', 'arena stunt', 0, NULL, 50000, NULL),
(104, 15, '-1431.27,938.66,1036.56,355.3', '-1432.08,935.07,1036.47', 'dd', 0, NULL, 50000, NULL),
(105, 4, '-1423.92,-663.82,1059.77,267.7', '-1428.17,-663.59,1060.16', 'tor wyscigowy', 1, NULL, 50000, NULL),
(106, 16, '-1395.57,1244.47,1039.87,180.6', '-1395.62,1249.50,1039.87', 'dd3', 0, NULL, 50000, NULL),
(107, 5, '772.27,-3.19,1000.73,359.6', '772.30,-5.52,1000.73', 'silownia', 1, NULL, 50000, NULL),
(108, 7, '773.94,-76.46,1000.65,357.7', '773.88,-78.85,1000.66', 'silownia', 1, NULL, 50000, NULL),
(109, 6, '774.15,-47.68,1000.59,358.0', '774.11,-50.48,1000.59', 'silownia', 1, NULL, 50000, NULL),
(110, 3, '612.49,-125.08,997.99,267.3', '609.35,-125.09,997.99', 'garaz', 1, NULL, 50000, NULL),
(111, 2, '612.79,-76.40,997.99,270.1', '609.27,-76.83,997.99', 'garaz', 1, NULL, 50000, NULL),
(112, 1, '606.62,-10.50,1000.91,273.2', '604.05,-9.96,1000.89', 'warsztat samochodowy', 1, NULL, 50000, NULL),
(113, 18, '1282.37,-65.66,1008.28,327.3', '1310.57,4.02,1002.49', 'hala', 1, NULL, 50000, 'zbugowany, czasami ma schody a czasami nie!'),
(114, 1, '1416.73,4.45,1000.92,90.9', '1420.37,4.17,1002.39', 'hala', 1, NULL, 50000, NULL),
(115, 1, '-2042.56,154.90,28.84,85.6', '-2039.86,155.13,28.84', 'warsztat samochodowy', 0, NULL, 50000, NULL),
(116, 2, '2550.44,-1293.33,1060.98,338.7', '2548.80,-1294.68,1060.98', 'fabryka kokainy', 1, NULL, 50000, NULL),
(117, 17, '-959.75,1954.45,9.00,179.3', '-959.58,1956.46,9.00', 'elektrownia-wnetrze tamy', 0, NULL, 50000, NULL),
(119, 1, '962.45,2160.24,1011.03,91.4', '964.93,2160.12,1011.03', 'magazyn', 0, NULL, 50000, NULL),
(120, 10, '1886.63,1017.70,31.88,269.8', '1883.70,1017.82,31.88', 'magazyn', 0, NULL, 50000, NULL),
(121, 3, '238.77,141.21,1003.02,0.7', '238.61,138.73,1003.02', 'komisariat policji', 1, NULL, 50000, NULL),
(122, 10, '246.51,110.51,1003.22,354.4', '246.43,107.30,1003.22', 'komisariat policji', 1, NULL, 50000, NULL),
(123, 5, '322.09,304.37,999.15,356.6', '322.15,302.36,999.15', 'komisariat policji', 1, NULL, 50000, NULL),
(124, 6, '247.09,65.55,1003.64,0.4', '246.82,62.33,1003.64', 'komisariat policji', 1, NULL, 50000, NULL),
(125, 7, '315.66,-141.32,999.60,358.2', '315.79,-143.66,999.60', 'sklep z bronia', 1, NULL, 50000, NULL),
(126, 1, '285.55,-39.38,1001.52,356.3', '285.34,-41.70,1001.52', 'sklep z bronia', 1, NULL, 50000, NULL),
(127, 4, '285.86,-84.08,1001.52,358.6', '285.82,-86.76,1001.52', 'sklep z bronia', 1, NULL, 50000, NULL),
(128, 6, '297.15,-110.11,1001.52,358.6', '296.85,-112.07,1001.52', 'sklep z bronia', 1, NULL, 50000, NULL),
(129, 6, '316.37,-168.00,999.59,355.4', '316.37,-170.29,999.59', 'sklep z bronia', 1, NULL, 50000, NULL),
(130, 3, '1041.48,10.16,1001.28,84.7', '1044.05,10.29,1001.28', 'pomieszczenie muzyczne', 1, NULL, 50000, NULL),
(131, 1, '-2158.75,640.91,1052.38,181.5', '-2158.65,643.14,1052.38', 'poczekalnia', 0, NULL, 50000, NULL),
(132, 1, '2.13,23.13,1199.59,88.2', '4.38,22.96,1199.60', 'samolot', 1, NULL, 50000, NULL),
(133, 6, '345.86,304.99,999.15,270.5', '343.72,305.01,999.15', 'pokoj tortur', 1, NULL, 50000, NULL),
(134, 9, '316.04,974.82,1961.26,0.8', '315.82,972.02,1961.87', 'andromeda', 1, NULL, 50000, NULL),
(135, 3, '291.37,310.16,999.15,88.2', '293.22,309.99,999.15', 'stodola', 1, NULL, 50000, NULL),
(136, 14, '-1864.94,55.73,1055.53,0', NULL, 'lotnisko', 1, NULL, 50000, NULL),
(137, 14, '-1833.25,-58.54,1058.96,358.9', '-1833.55,-64.22,1059.11', 'lotnisko2', 1, NULL, 50000, NULL),
(138, 1, '-788.71,493.48,1381.61,354.2', '-788.37,489.36,1381.59', 'libertycity', 1, NULL, 50000, NULL),
(139, 1, '1040.55,-1422.93,1438.42,2.3', '1040.51,-1424.34,1438.42', 'Klub Cafe', 1, 29, 50000, NULL),
(140, 1, '2412.14,-1771.95,1414.75,90.0', '2413.69,-1771.94,1415.53', 'Silownia GS', 1, 24, 50000, NULL),
(141, 2, '2107.44,-1805.95,2001.49, 0', '2107.28,-1808.49,2001.49', 'The Well Stacked Pizza', 1, 1, 50000, NULL),
(142, 2, '2332.01,-1270.79,2041.75, 0', '2332.01,-1273.54,2041.75', 'Komis samochodowy \'Angelo\'', 1, 2, 50000, NULL),
(143, 2, '2430.36,-2677.78,2035.17, 0', '2430.28,-2680.48,2035.17', 'Import pojazdow', 1, 3, 50000, NULL),
(145, 1, '1035.03,-941.83,1471.64,0', '1035.05,-944.26,1471.64', 'Osrodek Szkolenia Kierowcow nr II', 1, 32, 50000, NULL),
(146, 2, '2410.75,-1229.00,2000.92, 0', '2410.78,-1231.63,2000.92', 'Pig Pen', 1, 6, 50000, NULL),
(147, 2, '2389.10,-1915.24,2000.64, 0', '2389.10,-1917.35,2000.64', 'Hot-Food', 1, 5, 50000, NULL),
(148, 1, '2129.48,-1143.91,1439.67, 180', '2129.57,-1141.83,1439.66', 'Komis samochodowy \'Titanic\'', 1, 25, 50000, NULL),
(149, 1, '1024.45,-1302.95,1235.87, 0', '1024.50,-1305.05,1235.87', 'Osrodek Szkolenia Kierowcow nr I', 1, 27, 50000, NULL),
(150, 1, '712.66,-1388.09,1759.17, 90', '715.38,-1388.18,1759.17', 'Firma kurierska', 1, 48, 50000, NULL),
(151, 0, '684.28,-117.36,25.43, 0', '684.19,-118.78,25.43', 'Warsztat II', 1, 0, 50000, NULL),
(152, 2, '2284.29,-116.25,2026.53, 0', '2284.40,-117.85,2026.53', 'Warsztat III', 1, 7, 50000, NULL),
(153, 1, '1927.80,-1776.48,1419.86, 90', '1929.19,-1776.45,1419.86', 'Warsztat I', 1, 6, 50000, NULL),
(154, 1, '1122.14,-1808.53,1440.49, 270', '1120.30,-1808.62,1440.49', 'Baza taxi', 1, 13, 50000, NULL),
(155, 1, '2176.27,-1771.33,1422.51, 90', '2177.75,-1771.37,1422.51', 'Osrodek Ochrony Cywilnej', 1, 31, 50000, NULL),
(156, 2, '1211.13,238.64,2083.51, 270', '1209.02,238.68,2083.51', 'Warsztat IV', 1, 8, 50000, NULL),
(157, 2, '95.43,-150.48,2041.15, 0', '95.41,-152.42,2041.15', 'Warsztat V', 1, 9, 50000, NULL),
(158, 1, '2692.65,-1826.21,1436.49, 349.1', '2691.97,-1829.26,1436.48', 'Stadion', 1, 24, 87500, NULL),
(159, 2, '1713.41,-1766.16,2000.68, 0', '1713.37,-1768.68,2000.68', 'Silver Club', 1, 10, 22500, NULL),
(160, 2, '535.34,-1304.23,2035.17, 0', '535.24,-1306.48,2035.17', 'Komis samochodowy \'Smiling Central\'', 1, 11, 2500, NULL),
(161, 2, '373.30,-2057.70,2007.56, 90', '375.48,-2057.61,2007.56', 'Knajpa na molo', 1, 14, 10000, NULL),
(162, 2, '1347.29,-1764.70,2035.42, 270', '1345.97,-1764.63,2035.41', 'Spozywczy', 1, 13, 15000, NULL),
(163, 2, '1348.21,-1764.62,2035.48, 270', '1345.97,-1764.61,2035.48', 'Sklep na rogu', 1, 12, 15000, NULL),
(164, 2, '2246.43,-1721.23,2000.73, 0', '2246.44,-1723.18,2000.73', 'Silownia_1', 1, 15, 5000, NULL),
(165, 2, '2748.89,-1465.29,2031.85, 0', '2748.91,-1467.31,2031.85', 'Lodziarnia', 1, 16, 100000, NULL),
(167, 2, '2259.14,74.81,2181.54, 270', '2256.71,74.81,2181.54', 'Market \'Prima\'', 1, 19, 175000, NULL),
(168, 2, '2570.98,-1458.41,2053.65, 270', '2568.15,-1458.50,2053.65', 'Biblioteka \'u Greka\'', 1, 18, 125000, NULL),
(169, 2, '231.03,-179.11,2181.54, 270', '228.70,-179.19,2181.54', 'Market Super Sam', 1, 20, 175000, NULL),
(170, 2, '786.34,-1038.82,2000.73, 0', '786.42,-1041.18,2000.73', 'Silownia 2', 1, 21, 50000, NULL),
(171, 2, '1320.86,380.36,2200.66, 0', '1320.88,378.11,2200.66', 'Silownia 3', 1, 22, 50000, NULL),
(172, 2, '2441.03,111.14,2285.42, 90', '2443.84,111.08,2285.42', 'Komis samochodowy \'Sunset Beach\'', 1, 33, 100000, NULL),
(173, 2, '318.75,-44.73,2022.39, 45', '320.88,-46.39,2022.39', 'Komis samochodowy \'Nemo\'', 1, 34, 50000, NULL),
(174, 2, '686.19,-1871.31,2001.13, 180', '686.24,-1869.38,2002.27', 'Kawiarnia \"pod scena\"', 1, 35, 50000, NULL),
(175, 2, '2257.46,59.30,2123.04, 0', '2257.40,56.28,2123.03', 'Biuro detektywistyczne', 1, 36, 100000, NULL),
(176, 0, '1036.90,-1443.90,13.59,300.9', '1034.88,-1444.16,13.59', 'Biznes, 2 pokoje', 1, 3137, 50000, 'zasob pio-biznes1'),
(177, 0, '-2912.36,-2.21,1672.70,88.2', '-2910.87,-2.16,1672.70', 'Dom luksus 3 pokoje', 1, 3138, 250000, 'zasob pio-dom1'),
(178, 0, '-2640.01,861.46,1428.16,228.5', '-2641.24,862.65,1428.17', 'Dom luksus 3 pokoje', 1, 3139, 250000, 'zasob pio-dom2'),
(179, 2, '852.19,-1082.67,2252.20, 135', '854.03,-1079.88,2252.20', 'Dom pogrzebowy', 1, 37, 150000, NULL),
(180, 2, '887.52,2261.18,238.23,3.4', '887.37,2259.46,238.23', 'Biuro, 1-pok', 1, 3140, 70000, 'zasob pio-biura1'),
(181, 1, '916.63,2380.49,246.47,182.6', '916.60,2381.84,246.47', 'Biblioteka', 1, 3140, 70000, 'zasob pio-biura1'),
(182, 2, '-2064.38,551.40,1173.05,4.3', '-2063.91,549.80,1173.05', 'Biuro 3 pok', 1, 3140, 150000, 'zasob pio-biura1'),
(183, 1, '-132.30,1092.31,1345.79,275.3', '-132.42,1090.28,1345.79,177.8', 'Zduplikowany rc battleground', 1, 3136, 150000, 'zasob pio-rc'),
(184, 2, '-1034.96,826.93,2665.66,1.1', '-1034.88,824.98,2665.66,175.8', NULL, 1, 38, 150000, 'zasob wb-arena'),
(185, 2, '2260.65,118.81,2082.83, 90', '2263.54,118.92,2082.83', 'Przychodnia lekarska', 1, 39, 100000, NULL),
(186, 1, '1218.28,-1445.58,2108.48, 90', '1220.88,-1445.51,2107.47', 'Biuro Sluzb Specjalnych', 0, 40, 500000, NULL),
(187, 1, '282.06,-1799.89,1479.89, 90', '285.15,-1799.92,1479.88', 'Kosciol', 1, 11, 100000, NULL),
(188, 1, '1496.77,-1790.59,1133.0,90.0', '1500.83,-1790.74,111132.96', 'Urzad Miasta', 0, 1, 0, NULL),
(189, 1, '1551.12,-1678.41,1463.47, 180', '1551.10,-1675.45,1463.47', 'Komisariat Policji', 1, 5, 0, NULL),
(190, 1, '2026.06,-1397.82,1275.06, 270', '2023.32,-1397.86,1275.07', 'Szpital', 1, 8, 0, NULL),
(191, 1, '927.79,-1267.05,1440.93, 180', '927.79,-1264.08,1440.93', 'Straz pozarna', 1, 26, 0, NULL),
(192, 1, '803.58,-510.87,1206.88, 0', '803.62,-513.40,1206.88', 'Sluzby Miejskie', 1, 10, 0, NULL),
(193, 1, '444.92,-1127.06,1196.34, 180', '444.91,-1124.32,1196.34', 'San News', 1, 7, 0, NULL),
(194, 1, '1063.11,-367.97,1495.02, 315', '1061.15,-369.93,1495.02', 'Kopalnia', 1, 20, 0, NULL),
(195, 1, '1310.43,-1107.95,1441.53, 0', '1310.39,-1110.70,1441.53', 'Sad', 1, 21, 0, NULL),
(196, 2, '1364.04,240.26,2076.19, 0', '1364.03,237.77,2076.19', 'Kawiarnia \'Paszcza Wieloryba\'', 1, 41, 60000, NULL),
(197, 1, '934.13,2474.78,1054.41, 45', '936.24,2472.74,1054.41', 'Klub \'Fantasia\'', 1, 12, 100000, NULL),
(198, 1, '2364.83,-1507.26,1481.13, 90', '2367.04,-1507.22,1481.13', 'Rudera rozrywki', 1, 34, 50000, NULL),
(199, 1, '3049.23,-860.60,1488.63, 90', '3051.92,-860.75,1488.63', 'Punkt garazowy', 1, 43, 10000, NULL),
(200, 2, '1475.56,-2216.75,2192.88, 180', '1475.51,-2213.58,2192.88', 'Szkola lotnicza', 1, 45, 15000, NULL),
(201, 2, '-461.19,-39.68,2087.47, 90', '-458.57,-39.79,2087.47', 'Biuro tartaku', 1, 49, 5000, NULL),
(202, 1, 'Hala', '1530.15,12.64,1418.36', '1530.06,8.34,1418.36, 180', 1, 28, 0, NULL),
(203, 1, '1418.42,-130.31,1081.23, 0', '1418.52,-134.17,1081.23', 'Osrodek Szkoleniowy', 1, 28, 0, NULL),
(204, 2, '2094.15,-1208.34,1702.27, 315', '2092.62,-1210.15,1702.27', 'Salon tatuazu', 1, 50, 5000, NULL),
(205, 1, '2820.80,-1089.18,1593.71, 90', '2823.59,-1089.23,1593.71', 'Departament Turystyki', 1, 51, 0, NULL),
(206, 2, '501.13,-1489.10,2076.19, 0', '501.11,-1492.22,2076.19', 'Knajpa \'Isaura\'', 1, 53, 10000, NULL),
(207, 2, '1815.75,-1072.07,2181.54, 270', '1812.71,-1072.17,2181.54', 'Market \'Lubin\'', 1, 52, 10000, NULL),
(208, 2, '1570.43,-1200.38,1625.80, 270', '1566.59,-1200.52,1625.80', 'Hotel \'Burza\'', 1, 56, 10000, NULL),
(209, 2, '604.45,-1460.42,1625.80, 270', '600.59,-1460.55,1625.80', 'Hotel \'Carrington\'', 1, 57, 10000, NULL),
(210, 2, '1500.55,-1590.59,1625.80, 270', '1496.59,-1590.48,1625.80', 'Hotel \'Forrester\'', 1, 58, 10000, NULL),
(211, 2, '2280.54,69.51,1625.80, 270', '2276.59,69.52,1625.80', 'Hotel \'Martwa Cisza\'', 1, 59, 10000, NULL),
(212, 2, '2481.92,-1530.82,2098.76, 180', '2481.92,-1527.47,2098.76', 'Bar \'Purple-Pub\'', 1, 60, 10000, NULL),
(213, 2, '489.42,-1556.89,2101.80, 0', '489.35,-1560.63,2101.80', 'Odziezowy \'The Exclusive Clothing\'', 1, 61, 15000, NULL),
(214, 2, '1948.18,-2048.80,2027.77, 270', '1944.99,-2048.88,2027.77', 'Bar \'Corona Billard Pub\'', 1, 62, 20000, NULL),
(215, 2, '1574.35,-1887.45,2007.56, 90', '1577.41,-1887.57,2007.56', 'Restauracja \'Przy skarpie\'', 1, 63, 15000, NULL),
(216, 2, '466.77,-1135.96,2002.87, 0', '466.72,-1139.09,2003.51', 'Odziezowy \'Anastacia\'', 1, 66, 200, NULL),
(217, 2, '1734.05,-1670.20,2002.21, 90', '1737.42,-1670.16,2002.21', 'Odziezowy \'Mustang Jeans\'', 1, 67, 400, NULL),
(218, 2, '1647.02,-1661.23,2576.19, 0', '1647.06,-1664.23,2576.19', 'Knajpa \'diabelski mlyn\'', 1, 68, 200, NULL),
(219, 2, '973.40,-1752.04,2200.68, 0', '973.47,-1755.76,2200.68', 'Klub \'Eden\'', 1, 69, 200, NULL),
(220, 0, '-688.33,941.87,13.63', '-688.19,948.97,12.15', 'Hacjenta', 1, 0, 50000, 'Taj'),
(221, 10, '2268.27,-1210.48,1047.75', '2270.41,-1210.44,1047.56', 'dom luksus 5', 1, NULL, 50000, NULL),
(222, 0, '2929.90698,190.89502,2255.75342', '2930.11,200.07,2255.75', 'Klub Imprezowy', 1, 0, 50000, NULL),
(223, 0, '979.73, -2161.61, 13.11', '976.61, -2160.61, 13.11', 'testest', 1, 69, 50000, NULL),

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_informations`
--

CREATE TABLE `crime_informations` (
  `podatki` int(11) NOT NULL DEFAULT '0',
  `bitcoin` int(11) NOT NULL DEFAULT '0',
  `ethereum` int(11) NOT NULL DEFAULT '0',
  `monero` int(11) NOT NULL DEFAULT '0',
  `tenbit` varchar(1) COLLATE utf8_polish_ci NOT NULL DEFAULT 'n',
  `teneth` varchar(1) COLLATE utf8_polish_ci NOT NULL DEFAULT 'n',
  `tenmon` varchar(1) COLLATE utf8_polish_ci NOT NULL DEFAULT 'n',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_jobtop`
--

CREATE TABLE `crime_jobtop` (
  `uid` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `crime_jobtop`
--

INSERT INTO `crime_jobtop` (`uid`, `ilosc`) VALUES
(1, 13),
(2, 11),
(3, 2),
(9, 1),
(6, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_junkyard`
--

CREATE TABLE `crime_junkyard` (
  `id` int(11) NOT NULL,
  `kto` text NOT NULL,
  `auto` text NOT NULL,
  `kiedy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Struktura tabeli dla tabeli `crime_plantation`
--

CREATE TABLE `crime_plantation` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `nick` text NOT NULL,
  `ulepszenie` int(11) NOT NULL,
  `pracownik` int(11) NOT NULL,
  `zebrane` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `crime_plantation`
--

INSERT INTO `crime_plantation` (`id`, `uid`, `nick`, `ulepszenie`, `pracownik`, `zebrane`) VALUES
(1, 1, 'Vercetti', 1, 2, 55);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_punish`
--

CREATE TABLE `crime_punish` (
  `kolejnosc` int(11) NOT NULL,
  `serial` text NOT NULL,
  `reason` text CHARACTER SET utf8 NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `who_add` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ukarany` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `crime_punish`
--

INSERT INTO `crime_punish` (`kolejnosc`, `serial`, `reason`, `time`, `type`, `active`, `who_add`, `ukarany`) VALUES
(2, '7A070007535FDEB0AD27A94FF09C2812', 'test', '2020-10-25 01:39:08', 'mute', 1, '#993333Vercetti', '#33cc99Siwy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_punishments`
--

CREATE TABLE `crime_punishments` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `crime_punishments`
--

--
-- Struktura tabeli dla tabeli `crime_raports`
--

CREATE TABLE `crime_raports` (
  `uid` int(11) NOT NULL,
  `serial` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `kto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `komu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `powod` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Struktura tabeli dla tabeli `crime_topdonate`
--

CREATE TABLE `crime_topdonate` (
  `id` int(11) NOT NULL,
  `nick` text NOT NULL,
  `uid` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `crime_topdonate`
--

INSERT INTO `crime_topdonate` (`id`, `nick`, `uid`, `points`) VALUES
(1, 'Vercetti', 1, 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `crime_updates`
--

CREATE TABLE `crime_updates` (
  `ID` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kto` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `tresc` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Struktura tabeli dla tabeli `crime_users`
--

CREATE TABLE `crime_users` (
  `id` int(11) NOT NULL,
  `login` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `email` text NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `bank_money` int(25) NOT NULL DEFAULT '0',
  `skin` int(11) NOT NULL DEFAULT '0',
  `reputation` int(25) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `exp` int(11) NOT NULL DEFAULT '0',
  `pjA` int(11) NOT NULL DEFAULT '0',
  `pjB` int(11) NOT NULL DEFAULT '0',
  `pjC` int(11) NOT NULL DEFAULT '0',
  `pjL` int(11) NOT NULL DEFAULT '0',
  `teoriaA` int(1) NOT NULL DEFAULT '0',
  `teoriaB` int(1) NOT NULL DEFAULT '0',
  `teoriaC` int(1) NOT NULL DEFAULT '0',
  `teoriaL` int(1) NOT NULL DEFAULT '0',
  `worker` int(11) NOT NULL DEFAULT '0',
  `hours` int(12) NOT NULL,
  `mandate` int(10) NOT NULL DEFAULT '0',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `register_serial` varchar(120) DEFAULT NULL,
  `premiumdate` date NOT NULL DEFAULT '0000-00-00',
  `changedpw` tinyint(1) NOT NULL DEFAULT '0',
  `bitcoiny` int(11) NOT NULL DEFAULT '0',
  `ethereum` int(11) NOT NULL DEFAULT '0',
  `monero` int(11) NOT NULL DEFAULT '0',
  `odebral` int(11) NOT NULL DEFAULT '0',
  `kolor` int(11) NOT NULL DEFAULT '0',
  `x` text NOT NULL,
  `y` text NOT NULL,
  `z` text NOT NULL,
  `avatar` int(11) NOT NULL DEFAULT '0',
  `tec9` int(11) NOT NULL DEFAULT '0',
  `deagle` int(11) NOT NULL DEFAULT '0',
  `rifle` int(11) NOT NULL DEFAULT '0',
  `mp5` int(11) NOT NULL DEFAULT '0',
  `ak` int(11) NOT NULL DEFAULT '0',
  `pytanie` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `user_ip` text NOT NULL,
  `rapsy` int(11) NOT NULL DEFAULT '0',
  `avatarlink` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ppoints` int(11) NOT NULL DEFAULT '0',
  `ubrania` text NOT NULL,
  `zarobki` int(11) NOT NULL DEFAULT '0',
  `zgony` int(11) NOT NULL DEFAULT '0',
  `kille` int(11) NOT NULL DEFAULT '0',
  `nick` varchar(999) NOT NULL DEFAULT 'bialy',
  `strzelec` int(11) NOT NULL DEFAULT '255',
  `stylwalki` int(11) NOT NULL DEFAULT '4',
  `org` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `orgrank` int(11) NOT NULL,
  `orgwplaty` int(11) NOT NULL,
  `settingpmon` int(11) NOT NULL DEFAULT '1',
  `settinginfohud` int(11) NOT NULL DEFAULT '0',
  `settinghud` int(11) NOT NULL DEFAULT '1',
  `settingradar` int(11) NOT NULL DEFAULT '1',
  `settinglowpc` int(11) NOT NULL DEFAULT '0',
  `settingvoicechat` int(11) NOT NULL DEFAULT '1',
  `settingrender` int(11) NOT NULL DEFAULT '0',
  `settingkaro` int(11) NOT NULL DEFAULT '0',
  `settingwater` int(11) NOT NULL DEFAULT '0',
  `settingsky` int(11) NOT NULL DEFAULT '0',
  `settingdetal` int(11) NOT NULL DEFAULT '0',
  `settingblur` int(11) NOT NULL DEFAULT '0',
  `settingnewradar` int(11) NOT NULL DEFAULT '0',
  `settingsounds` int(11) NOT NULL DEFAULT '1',
  `settingnewhud` int(11) NOT NULL DEFAULT '0',
  `settingnewspeed` int(11) NOT NULL DEFAULT '0',
  `roleplay` int(11) NOT NULL DEFAULT '0',
  `bw` int(11) NOT NULL DEFAULT '0',
  `gornikkg` int(11) NOT NULL DEFAULT '0',
  `gornikpkt` int(11) NOT NULL DEFAULT '0',
  `gornikul1` int(11) NOT NULL DEFAULT '0',
  `gornikul2` int(11) NOT NULL DEFAULT '0',
  `gornikul3` int(11) NOT NULL DEFAULT '0',
  `gornikul4` int(11) NOT NULL DEFAULT '0',
  `magazynierpkt` int(11) NOT NULL DEFAULT '0',
  `magazynierul1` int(11) NOT NULL DEFAULT '0',
  `magazynierul2` int(11) NOT NULL DEFAULT '0',
  `sweeperykg` int(11) NOT NULL DEFAULT '0',
  `sweeperypkt` int(11) NOT NULL DEFAULT '0',
  `sweeperyul1` int(11) NOT NULL DEFAULT '0',
  `sweeperyul2` int(11) NOT NULL DEFAULT '0',
  `kosiarkipkt` int(11) NOT NULL DEFAULT '0',
  `kosiarkiul1` int(11) NOT NULL DEFAULT '0',
  `kosiarkiul2` int(11) NOT NULL DEFAULT '0',
  `elektrykpkt` int(11) NOT NULL DEFAULT '0',
  `elektrykul1` int(11) NOT NULL DEFAULT '0',
  `elektrykul2` int(11) NOT NULL DEFAULT '0',
  `elektrykul3` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Konta graczy';

--
-- Zrzut danych tabeli `crime_users`
--

--
-- Struktura tabeli dla tabeli `crime_vehicles`
--

CREATE TABLE `crime_vehicles` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT '411',
  `frozen` int(11) NOT NULL DEFAULT '0',
  `pos` varchar(82) NOT NULL DEFAULT '0, 0, 0, 0, 0, 0',
  `text` mediumtext CHARACTER SET utf32 COLLATE utf32_polish_ci NOT NULL,
  `health` int(11) NOT NULL DEFAULT '1000',
  `fuel` int(11) NOT NULL DEFAULT '100',
  `bak` int(11) NOT NULL DEFAULT '25',
  `mileage` int(11) NOT NULL DEFAULT '0',
  `driver` text NOT NULL,
  `color` varchar(50) NOT NULL DEFAULT '255, 255, 255',
  `headlights` varchar(41) NOT NULL DEFAULT '255, 255, 255',
  `paintjob` tinyint(1) NOT NULL DEFAULT '3',
  `cpj` int(11) NOT NULL DEFAULT '0',
  `tuning` text NOT NULL,
  `panelstates` text NOT NULL,
  `rent` varchar(255) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT '0',
  `rejestracja` varchar(8) NOT NULL,
  `ownedGroup` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ownedPlayer` int(11) NOT NULL DEFAULT '0',
  `parking` int(11) NOT NULL DEFAULT '0',
  `police` tinyint(1) NOT NULL DEFAULT '0',
  `neon` int(11) NOT NULL DEFAULT '0',
  `blokada` text NOT NULL,
  `registered` varchar(10) NOT NULL DEFAULT 'true',
  `zamaskowany` int(11) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `firstowner` varchar(100) NOT NULL DEFAULT 'ERROR',
  `tp_to_parking` varchar(99) DEFAULT NULL,
  `naped` int(11) NOT NULL DEFAULT '0',
  `drzwidogory` int(11) NOT NULL DEFAULT '0',
  `atrapa` int(11) DEFAULT '0',
  `silnik` float NOT NULL DEFAULT '1.21',
  `posalon` int(11) NOT NULL,
  `tarcze` int(11) NOT NULL DEFAULT '0',
  `zawieszenie` int(11) NOT NULL DEFAULT '0',
  `karbon` int(11) NOT NULL DEFAULT '0',
  `chiptuning` int(11) NOT NULL DEFAULT '0',
  `klakson` int(11) NOT NULL DEFAULT '1',
  `wariant` int(11) NOT NULL DEFAULT '255',
  `typsilnika` varchar(10) NOT NULL DEFAULT 'Benzyna',
  `cylindry` int(11) NOT NULL DEFAULT '4',
  `trakcja` int(11) NOT NULL DEFAULT '0',
  `lpg` int(11) NOT NULL DEFAULT '0',
  `lpgfuel` int(11) NOT NULL DEFAULT '0',
  `us1` int(11) NOT NULL DEFAULT '0',
  `us2` int(11) NOT NULL DEFAULT '0',
  `us3` int(11) NOT NULL DEFAULT '0',
  `1naserwerze` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Struktura tabeli dla tabeli `crime_vehicles_eq`
--

CREATE TABLE `crime_vehicles_eq` (
  `vid` int(11) NOT NULL,
  `przedmiot` text NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Struktura tabeli dla tabeli `logi_dragrace`
--

CREATE TABLE `logi_dragrace` (
  `ID` int(11) NOT NULL,
  `nick` text NOT NULL,
  `czas` text NOT NULL,
  `auto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logi_przelewy`
--

CREATE TABLE `logi_przelewy` (
  `ID` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `wysyla_uid` int(11) NOT NULL,
  `wysyla_serial` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `odbiera_uid` int(11) NOT NULL,
  `odbiera_serial` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `kwota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Struktura tabeli dla tabeli `logi_przelewy_pp`
--

CREATE TABLE `logi_przelewy_pp` (
  `ID` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `wysyla_uid` int(11) NOT NULL,
  `wysyla_serial` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `odbiera_uid` int(11) NOT NULL,
  `odbiera_serial` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `kwota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs_adminfull`
--

CREATE TABLE `logs_adminfull` (
  `ID` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Struktura tabeli dla tabeli `logs_atms`
--

CREATE TABLE `logs_atms` (
  `id` int(255) NOT NULL,
  `typ` text NOT NULL,
  `kwota` int(11) NOT NULL,
  `serial` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `odkogo` text NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Struktura tabeli dla tabeli `logs_cars`
--

CREATE TABLE `logs_cars` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Struktura tabeli dla tabeli `logs_ce`
--

CREATE TABLE `logs_ce` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs_chat`
--

CREATE TABLE `logs_chat` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Struktura tabeli dla tabeli `logs_lotterywin`
--

CREATE TABLE `logs_lotterywin` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wygrana` text NOT NULL,
  `akceptacja` text NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Struktura tabeli dla tabeli `logs_pay`
--

CREATE TABLE `logs_pay` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Struktura tabeli dla tabeli `logs_paypp`
--

CREATE TABLE `logs_paypp` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs_pm`
--

CREATE TABLE `logs_pm` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Struktura tabeli dla tabeli `logs_ppspent`
--

CREATE TABLE `logs_ppspent` (
  `active_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `wydatek` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `active_uid` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Struktura tabeli dla tabeli `logs_premiumshop`
--

CREATE TABLE `logs_premiumshop` (
  `code` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `active_uid` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Struktura tabeli dla tabeli `logs_serialchange`
--

CREATE TABLE `logs_serialchange` (
  `id` int(11) NOT NULL,
  `login` text NOT NULL,
  `haslo1` text NOT NULL,
  `haslo2` text NOT NULL,
  `email` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `serial` text NOT NULL,
  `ip` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs_v`
--

CREATE TABLE `logs_v` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Struktura tabeli dla tabeli `policeaj`
--

CREATE TABLE `policeaj` (
  `seg` int(11) NOT NULL,
  `nick` text COLLATE utf8_polish_ci NOT NULL,
  `Serial` varchar(128) CHARACTER SET latin1 NOT NULL,
  `Termin` datetime NOT NULL,
  `Cela` int(11) NOT NULL COMMENT 'CELA',
  `Powod` varchar(4092) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `saj`
--

CREATE TABLE `saj` (
  `seg` int(11) NOT NULL,
  `Serial` varchar(128) NOT NULL,
  `Termin` datetime NOT NULL,
  `Cela` int(11) NOT NULL COMMENT 'CELA',
  `Powod` varchar(4092) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_drifts`
--

CREATE TABLE `sr_drifts` (
  `id` int(11) NOT NULL,
  `nick` text NOT NULL,
  `uid` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_factions_ranks`
--

CREATE TABLE `sr_factions_ranks` (
  `id` int(11) NOT NULL,
  `code` text NOT NULL,
  `rankid` int(11) NOT NULL,
  `rankname` text NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `sr_factions_ranks`
--

INSERT INTO `sr_factions_ranks` (`id`, `code`, `rankid`, `rankname`, `money`) VALUES
(1, 'SAPD', 99, 'Chief of Police', 90000),
(2, 'SAPD', 98, 'Assistant Chief of Police', 85000),
(3, 'SAPD', 97, 'Deputy Chief', 80000),
(4, 'SAPD', 89, 'Commander', 67500),
(5, 'SAPD', 93, 'Capitan III', 70000),
(6, 'SAPD', 92, 'Capitan II', 68500),
(7, 'SAPD', 91, 'Capitan I', 68000),
(8, 'SAPD', 85, 'Lieutenant', 66000),
(9, 'SAPD', 70, 'Detective II', 55000),
(10, 'SAPD', 69, 'Detective I', 54000),
(11, 'SAPD', 65, 'Sergeant II ', 50000),
(12, 'SAPD', 60, 'Sergeant I', 49500),
(13, 'SAPD', 40, 'Police Officer III+I', 45000),
(14, 'SAPD', 38, 'Police Officer III', 43000),
(15, 'SAPD', 36, 'Police Officer II', 41000),
(16, 'SAPD', 30, 'Police Officer I', 35000),
(17, 'SAPD', 20, 'Cadet', 30000),
(18, 'SAPD', 1, 'Recruit', 25000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_factions_skins`
--

CREATE TABLE `sr_factions_skins` (
  `id` int(11) NOT NULL,
  `code` text NOT NULL,
  `rank` int(11) NOT NULL,
  `skin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_factions_vehicles`
--

CREATE TABLE `sr_factions_vehicles` (
  `ID` int(11) NOT NULL,
  `code` varchar(100) NOT NULL DEFAULT 'CHUJ',
  `color` varchar(100) NOT NULL DEFAULT '255,255,255,255,255,255',
  `rank` int(11) NOT NULL DEFAULT '1',
  `model` int(11) NOT NULL DEFAULT '527',
  `szyby` int(11) NOT NULL DEFAULT '0',
  `rejka` varchar(100) NOT NULL DEFAULT 'FRAKCJA',
  `maxvelo` float NOT NULL DEFAULT '160',
  `acceleration` float NOT NULL DEFAULT '8',
  `wheeldrive` varchar(100) NOT NULL DEFAULT 'rwd',
  `mass` int(11) NOT NULL DEFAULT '1200',
  `turnmass` int(11) NOT NULL DEFAULT '2000',
  `tractionmulti` float NOT NULL DEFAULT '0.7',
  `tractionloss` float NOT NULL DEFAULT '0.86',
  `brake` float NOT NULL DEFAULT '8',
  `brakebias` float NOT NULL DEFAULT '0.6',
  `dragmulti` float NOT NULL DEFAULT '2.2',
  `neon` int(11) NOT NULL DEFAULT '0',
  `tuning` varchar(100) NOT NULL,
  `variant` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `sr_factions_vehicles`
--

INSERT INTO `sr_factions_vehicles` (`ID`, `code`, `color`, `rank`, `model`, `szyby`, `rejka`, `maxvelo`, `acceleration`, `wheeldrive`, `mass`, `turnmass`, `tractionmulti`, `tractionloss`, `brake`, `brakebias`, `dragmulti`, `neon`, `tuning`, `variant`) VALUES
(4, 'SAPD', '0,255,0,0,0,0', 1, 597, 0, 'ASAPD01', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(5, 'SAPD', '0,255,0,0,0,0', 1, 597, 0, 'ASAPD02', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(6, 'SAPD', '0,255,0,0,0,0', 1, 597, 0, 'ASAPD03', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(7, 'SAPD', '0,255,0,0,0,0', 1, 597, 0, 'ASAPD03', 250, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(8, 'SAPD', '0,255,0,0,0,0', 1, 597, 0, 'ASAPD04', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(9, 'SAPD', '0,255,0,0,0,0', 1, 597, 0, 'ASAPD05', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(10, 'SAPD', '0,255,0,0,0,0', 1, 597, 0, 'ASAPD06', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(11, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD01', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(12, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD02', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(13, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD03', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(14, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD04', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(15, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD05', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(16, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD06', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(17, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD07', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(18, 'SAPD', '255,255,255,0,0,0', 1, 596, 0, 'SAPD08', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(19, 'SAPD', '255,0,0,0,0,0', 1, 596, 0, 'ZARZAD', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(20, 'SAPD', '30,0,255,0,0,0', 1, 596, 0, 'ZARZAD', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(21, 'SAPD', '255,255,255,255,255,255', 1, 596, 0, 'SVSTAFF', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(22, 'SAPD', '0,0,0,0,0,0', 1, 490, 0, 'SWAT1', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(23, 'SAPD', '0,0,0,0,0,0', 1, 490, 0, 'SWAT2', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(24, 'SAPD', '0,0,0,0,0,0', 1, 490, 0, 'SWAT3', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(25, 'SAPD', '0,0,0,255,255,255', 1, 427, 0, 'MUCKA1', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0),
(26, 'SAPD', '0,0,0,255,255,255', 1, 427, 0, 'MUCKA2', 500, 30, 'AWD', 2000, 5000, 1, 1, 25, 1, 1, 0, '1010', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_kartoteka_police`
--

CREATE TABLE `sr_kartoteka_police` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_loginoti`
--

CREATE TABLE `sr_loginoti` (
  `id` int(11) NOT NULL,
  `nick` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tresc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_logs`
--

CREATE TABLE `sr_logs` (
  `name` text CHARACTER SET latin1,
  `osoba` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_logs_login`
--

CREATE TABLE `sr_logs_login` (
  `name` text CHARACTER SET latin1,
  `serial` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_mute`
--

CREATE TABLE `sr_mute` (
  `UID` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Czas` datetime DEFAULT NULL,
  `Powod` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_nagrodybeta`
--

CREATE TABLE `sr_nagrodybeta` (
  `id` int(11) NOT NULL,
  `serial` text NOT NULL,
  `odebral` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_organizations`
--

CREATE TABLE `sr_organizations` (
  `code` varchar(31) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_organization_list`
--

CREATE TABLE `sr_organization_list` (
  `id` int(10) NOT NULL,
  `name` varchar(180) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `spawn` varchar(180) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0,0,0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_punish_logs`
--

CREATE TABLE `sr_punish_logs` (
  `serial` varchar(24) NOT NULL COMMENT 'serial na jaki kara zostala nadana',
  `type` varchar(15) NOT NULL COMMENT 'typ kary',
  `date` datetime NOT NULL COMMENT 'data do ktorej ta kara wystepowala',
  `date_punish` datetime NOT NULL COMMENT 'Data nadania kary',
  `uid_get_punish` int(10) NOT NULL COMMENT 'Uid ktore dostalo kare',
  `reason` varchar(41) CHARACTER SET utf8 NOT NULL COMMENT 'powod kary'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sr_vehicles_parking`
--

CREATE TABLE `sr_vehicles_parking` (
  `idparking` int(11) NOT NULL,
  `idpojazdu` int(20) NOT NULL,
  `funkcjonariusz` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `rejestracja` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `powod` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `cena` int(10) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyplaty_podatek`
--

CREATE TABLE `wyplaty_podatek` (
  `ID` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gracz` int(11) NOT NULL,
  `serial` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `praca` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `wyplata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `crime_adminjail`
--
ALTER TABLE `crime_adminjail`
  ADD PRIMARY KEY (`seg`);

--
-- Indeksy dla tabeli `crime_admins`
--
ALTER TABLE `crime_admins`
  ADD PRIMARY KEY (`osoba`);

--
-- Indeksy dla tabeli `crime_ban`
--
ALTER TABLE `crime_ban`
  ADD PRIMARY KEY (`osoba`);

--
-- Indeksy dla tabeli `crime_factions`
--
ALTER TABLE `crime_factions`
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `uid_2` (`uid`),
  ADD KEY `code` (`uid`,`actived`);

--
-- Indeksy dla tabeli `crime_friends`
--
ALTER TABLE `crime_friends`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `crime_gangs`
--
ALTER TABLE `crime_gangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`created`);

--
-- Indeksy dla tabeli `crime_gangs_balance`
--
ALTER TABLE `crime_gangs_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_houses`
--
ALTER TABLE `crime_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ownerid` (`ownerid`);

--
-- Indeksy dla tabeli `crime_house_interiors`
--
ALTER TABLE `crime_house_interiors`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_informations`
--
ALTER TABLE `crime_informations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_junkyard`
--
ALTER TABLE `crime_junkyard`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_plantation`
--
ALTER TABLE `crime_plantation`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_punish`
--
ALTER TABLE `crime_punish`
  ADD PRIMARY KEY (`kolejnosc`);

--
-- Indeksy dla tabeli `crime_punishments`
--
ALTER TABLE `crime_punishments`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_topdonate`
--
ALTER TABLE `crime_topdonate`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_updates`
--
ALTER TABLE `crime_updates`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `crime_users`
--
ALTER TABLE `crime_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `crime_vehicles`
--
ALTER TABLE `crime_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logi_dragrace`
--
ALTER TABLE `logi_dragrace`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `logi_przelewy`
--
ALTER TABLE `logi_przelewy`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `logi_przelewy_pp`
--
ALTER TABLE `logi_przelewy_pp`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `logs_adminfull`
--
ALTER TABLE `logs_adminfull`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `logs_atms`
--
ALTER TABLE `logs_atms`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_cars`
--
ALTER TABLE `logs_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_ce`
--
ALTER TABLE `logs_ce`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_chat`
--
ALTER TABLE `logs_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_f`
--
ALTER TABLE `logs_f`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_jobmoney`
--
ALTER TABLE `logs_jobmoney`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `logs_lotterywin`
--
ALTER TABLE `logs_lotterywin`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_pay`
--
ALTER TABLE `logs_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_paypp`
--
ALTER TABLE `logs_paypp`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_pm`
--
ALTER TABLE `logs_pm`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_ppspent`
--
ALTER TABLE `logs_ppspent`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_premiumshop`
--
ALTER TABLE `logs_premiumshop`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_serialchange`
--
ALTER TABLE `logs_serialchange`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_v`
--
ALTER TABLE `logs_v`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `policeaj`
--
ALTER TABLE `policeaj`
  ADD PRIMARY KEY (`seg`);

--
-- Indeksy dla tabeli `saj`
--
ALTER TABLE `saj`
  ADD PRIMARY KEY (`seg`);

--
-- Indeksy dla tabeli `sr_drifts`
--
ALTER TABLE `sr_drifts`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sr_factions_ranks`
--
ALTER TABLE `sr_factions_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sr_factions_skins`
--
ALTER TABLE `sr_factions_skins`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sr_factions_vehicles`
--
ALTER TABLE `sr_factions_vehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `sr_kartoteka_police`
--
ALTER TABLE `sr_kartoteka_police`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sr_loginoti`
--
ALTER TABLE `sr_loginoti`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sr_mute`
--
ALTER TABLE `sr_mute`
  ADD PRIMARY KEY (`UID`);

--
-- Indeksy dla tabeli `sr_nagrodybeta`
--
ALTER TABLE `sr_nagrodybeta`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sr_organizations`
--
ALTER TABLE `sr_organizations`
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `uid_2` (`uid`),
  ADD KEY `code` (`uid`,`actived`);

--
-- Indeksy dla tabeli `sr_organization_list`
--
ALTER TABLE `sr_organization_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sr_punish_logs`
--
ALTER TABLE `sr_punish_logs`
  ADD KEY `serial` (`serial`);

--
-- Indeksy dla tabeli `sr_vehicles_parking`
--
ALTER TABLE `sr_vehicles_parking`
  ADD PRIMARY KEY (`idparking`);

--
-- Indeksy dla tabeli `wyplaty_podatek`
--
ALTER TABLE `wyplaty_podatek`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `crime_adminjail`
--
ALTER TABLE `crime_adminjail`
  MODIFY `seg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `crime_admins`
--
ALTER TABLE `crime_admins`
  MODIFY `osoba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `crime_ban`
--
ALTER TABLE `crime_ban`
  MODIFY `osoba` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `crime_friends`
--
ALTER TABLE `crime_friends`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `crime_gangs`
--
ALTER TABLE `crime_gangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `crime_gangs_balance`
--
ALTER TABLE `crime_gangs_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `crime_houses`
--
ALTER TABLE `crime_houses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `crime_house_interiors`
--
ALTER TABLE `crime_house_interiors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2129;

--
-- AUTO_INCREMENT dla tabeli `crime_informations`
--
ALTER TABLE `crime_informations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `crime_junkyard`
--
ALTER TABLE `crime_junkyard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `crime_plantation`
--
ALTER TABLE `crime_plantation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `crime_punish`
--
ALTER TABLE `crime_punish`
  MODIFY `kolejnosc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `crime_punishments`
--
ALTER TABLE `crime_punishments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT dla tabeli `crime_topdonate`
--
ALTER TABLE `crime_topdonate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `crime_updates`
--
ALTER TABLE `crime_updates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `crime_users`
--
ALTER TABLE `crime_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT dla tabeli `crime_vehicles`
--
ALTER TABLE `crime_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `logi_dragrace`
--
ALTER TABLE `logi_dragrace`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `logi_przelewy`
--
ALTER TABLE `logi_przelewy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `logi_przelewy_pp`
--
ALTER TABLE `logi_przelewy_pp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `logs_adminfull`
--
ALTER TABLE `logs_adminfull`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4756;

--
-- AUTO_INCREMENT dla tabeli `logs_atms`
--
ALTER TABLE `logs_atms`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `logs_cars`
--
ALTER TABLE `logs_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `logs_ce`
--
ALTER TABLE `logs_ce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `logs_chat`
--
ALTER TABLE `logs_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT dla tabeli `logs_f`
--
ALTER TABLE `logs_f`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `logs_jobmoney`
--
ALTER TABLE `logs_jobmoney`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2362;

--
-- AUTO_INCREMENT dla tabeli `logs_lotterywin`
--
ALTER TABLE `logs_lotterywin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT dla tabeli `logs_pay`
--
ALTER TABLE `logs_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `logs_paypp`
--
ALTER TABLE `logs_paypp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `logs_pm`
--
ALTER TABLE `logs_pm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT dla tabeli `logs_ppspent`
--
ALTER TABLE `logs_ppspent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT dla tabeli `logs_premiumshop`
--
ALTER TABLE `logs_premiumshop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `logs_serialchange`
--
ALTER TABLE `logs_serialchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `logs_v`
--
ALTER TABLE `logs_v`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `policeaj`
--
ALTER TABLE `policeaj`
  MODIFY `seg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `saj`
--
ALTER TABLE `saj`
  MODIFY `seg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sr_drifts`
--
ALTER TABLE `sr_drifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sr_factions_ranks`
--
ALTER TABLE `sr_factions_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `sr_factions_skins`
--
ALTER TABLE `sr_factions_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sr_factions_vehicles`
--
ALTER TABLE `sr_factions_vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `sr_kartoteka_police`
--
ALTER TABLE `sr_kartoteka_police`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sr_loginoti`
--
ALTER TABLE `sr_loginoti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sr_nagrodybeta`
--
ALTER TABLE `sr_nagrodybeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sr_organization_list`
--
ALTER TABLE `sr_organization_list`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sr_vehicles_parking`
--
ALTER TABLE `sr_vehicles_parking`
  MODIFY `idparking` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wyplaty_podatek`
--
ALTER TABLE `wyplaty_podatek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
