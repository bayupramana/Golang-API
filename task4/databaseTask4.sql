-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2020 pada 15.36
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskiv`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal`
--

CREATE TABLE `jurnal` (
  `id` int(6) NOT NULL,
  `date` datetime NOT NULL,
  `date_gmt` datetime NOT NULL,
  `website` text NOT NULL,
  `modified` datetime NOT NULL,
  `modified_gmt` datetime NOT NULL,
  `slug` text NOT NULL,
  `status` text NOT NULL,
  `type` text NOT NULL,
  `link` text NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurnal`
--

INSERT INTO `jurnal` (`id`, `date`, `date_gmt`, `website`, `modified`, `modified_gmt`, `slug`, `status`, `type`, `link`, `title`) VALUES
(157538, '2017-07-21 10:30:34', '2017-07-21 17:30:34', 'https://www.sitepoint.com/?p=157538', '0000-00-00 00:00:00', '2017-07-23 21:56:35', '2017-07-24T04:56:35', 'why-the-iot-threatens-your-wordpress-site-and-how-to-fix-it', 'publish', 'Why the IoT Threatens Your WordPress Site (and How to Fix It)', 'post'),
(157539, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `scientist`
--

CREATE TABLE `scientist` (
  `name` text NOT NULL,
  `age` int(3) NOT NULL,
  `secretIdentity` text NOT NULL,
  `task1` text NOT NULL,
  `task2` text NOT NULL,
  `task3` text NOT NULL,
  `status` int(3) NOT NULL,
  `source` text NOT NULL,
  `title` text NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `scientist`
--

INSERT INTO `scientist` (`name`, `age`, `secretIdentity`, `task1`, `task2`, `task3`, `status`, `source`, `title`, `detail`) VALUES
('Molecule Man', 29, 'Dan Jukes', 'Radiation resistance', 'Turning tiny', 'Radiation blast', 422, '/data/attributes/firstName', 'Invalid Attribute', 'First name must contain at least three characters.');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jurnal`
--
ALTER TABLE `jurnal`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157540;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
