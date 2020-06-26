-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2020 pada 18.33
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
-- Database: `db_testing`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `FirstName` varchar(10) DEFAULT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) NOT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `ReportsTo` int(11) DEFAULT NULL,
  `ProvinceName` varchar(75) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `goods`
--

CREATE TABLE `goods` (
  `id` int(6) NOT NULL,
  `merchant_id` int(6) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `cancellable` tinyint(1) NOT NULL DEFAULT 0,
  `check_avail` tinyint(1) NOT NULL DEFAULT 0,
  `currency` varchar(3) DEFAULT '0',
  `price_start` double NOT NULL,
  `price_end` double NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `CardID` varchar(12) DEFAULT NULL,
  `LastName` varchar(75) DEFAULT NULL,
  `FirstName` varchar(75) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `ReportsTo` int(11) DEFAULT NULL,
  `AdmisionFee` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_tb_pegawai`
--

CREATE TABLE `mst_tb_pegawai` (
  `id` int(11) NOT NULL,
  `id_sekolah` varchar(25) NOT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `Inisial` varchar(1) DEFAULT NULL,
  `NIP` varchar(30) DEFAULT NULL,
  `NIY` varchar(35) DEFAULT NULL,
  `NUPTK` varchar(35) DEFAULT NULL,
  `Nama` varchar(100) DEFAULT NULL,
  `Jenis_Kelamin` varchar(1) DEFAULT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `Telp` varchar(50) DEFAULT NULL,
  `HP` varchar(50) DEFAULT NULL,
  `imageType` varchar(25) DEFAULT NULL,
  `imageData` longblob DEFAULT NULL,
  `Tempat_Lahir` varchar(50) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `Pendidikan` varchar(50) DEFAULT NULL,
  `Status_Guru` varchar(15) DEFAULT NULL,
  `MKTime` varchar(25) DEFAULT NULL,
  `userid` varchar(25) NOT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `grup` varchar(25) DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  `skin` int(11) DEFAULT NULL,
  `menu` varchar(25) DEFAULT NULL,
  `Kost` int(11) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `Status_Mengajar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_dosen`
--

CREATE TABLE `m_dosen` (
  `id` int(11) NOT NULL,
  `Login` varchar(20) DEFAULT NULL,
  `KodeID` varchar(10) NOT NULL DEFAULT 'UMT',
  `IDFINGER` varchar(10) DEFAULT NULL,
  `NIDN` varchar(50) DEFAULT NULL,
  `HomebaseInduk` varchar(15) DEFAULT NULL,
  `NIPPNS` varchar(30) DEFAULT NULL,
  `NPWP` varchar(30) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Struktural` enum('Y','N') DEFAULT 'N',
  `Jenis_Kelamin` varchar(1) DEFAULT NULL,
  `TempatLahir` varchar(50) DEFAULT NULL,
  `TanggalLahir` date DEFAULT '0000-00-00',
  `LevelID` int(10) DEFAULT 12,
  `KTP` varchar(50) DEFAULT NULL,
  `Telephone` varchar(50) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `Handphone` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Alamat` mediumtext DEFAULT NULL,
  `Kota` varchar(50) DEFAULT NULL,
  `KodePos` varchar(50) DEFAULT NULL,
  `Propinsi` varchar(50) DEFAULT NULL,
  `Negara` varchar(50) DEFAULT NULL,
  `NA` enum('Y','N') DEFAULT 'N',
  `Homebase` varchar(50) DEFAULT NULL,
  `ProdiID` varchar(255) DEFAULT NULL,
  `Gelar` varchar(100) DEFAULT NULL,
  `JenjangID` varchar(5) DEFAULT NULL,
  `Keilmuan` varchar(255) DEFAULT NULL,
  `LulusanPT` varchar(255) DEFAULT NULL,
  `AgamaID` char(3) DEFAULT NULL,
  `KelaminID` char(3) DEFAULT NULL,
  `GolonganID` int(10) DEFAULT NULL,
  `fotoktp` varchar(255) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `KategoriID` varchar(10) DEFAULT NULL,
  `IkatanID` varchar(10) DEFAULT NULL,
  `JabatanID` varchar(10) DEFAULT NULL,
  `JabatanDiktiID` varchar(5) DEFAULT NULL,
  `InstitusiInduk` varchar(10) DEFAULT NULL,
  `StatusDosenID` varchar(5) DEFAULT NULL,
  `StatusKerjaID` varchar(5) DEFAULT NULL,
  `TglBekerja` datetime DEFAULT NULL,
  `NamaBank` varchar(50) DEFAULT NULL,
  `NamaAkun` varchar(50) DEFAULT NULL,
  `NomerAkun` varchar(50) DEFAULT NULL,
  `LoginBuat` varchar(50) DEFAULT NULL,
  `TanggalBuat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LoginEdit` varchar(50) DEFAULT NULL,
  `TanggalEdit` datetime DEFAULT NULL,
  `TransReg` int(3) UNSIGNED DEFAULT 0,
  `TransKhus` int(3) UNSIGNED DEFAULT 0,
  `SKSKhus` int(3) UNSIGNED DEFAULT 0,
  `SKSReg` int(3) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_haji`
--

CREATE TABLE `m_haji` (
  `HajID` int(11) NOT NULL,
  `namalengkap` varchar(125) DEFAULT NULL,
  `jeniskelamin` int(11) DEFAULT NULL,
  `noktp` varchar(125) DEFAULT NULL,
  `tempatlahir` varchar(125) DEFAULT NULL,
  `tgllahir` date DEFAULT NULL,
  `namaibukandung` varchar(125) DEFAULT NULL,
  `nopaspor` varchar(75) DEFAULT NULL,
  `berlakupaspor` date DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `alamatemail` varchar(75) DEFAULT NULL,
  `statusperkawinan` int(11) DEFAULT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `mktime` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_lembaga`
--

CREATE TABLE `m_lembaga` (
  `id` tinyint(4) NOT NULL,
  `XKodeSekolah` varchar(4) DEFAULT NULL,
  `Yayasan` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(50) DEFAULT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Ketua` varchar(50) NOT NULL,
  `Puket1` varchar(50) NOT NULL,
  `Puket2` varchar(50) NOT NULL,
  `Puket3` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Provinsi` varchar(100) DEFAULT NULL,
  `Kab_kota` varchar(100) DEFAULT NULL,
  `Kecamatan` varchar(100) DEFAULT NULL,
  `Kelurahan` varchar(100) DEFAULT NULL,
  `Kodepos` varchar(15) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 56320 kB' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_travel`
--

CREATE TABLE `m_travel` (
  `TravelID` int(11) NOT NULL,
  `TravelName` varchar(100) DEFAULT NULL,
  `CompanyName` varchar(100) DEFAULT NULL,
  `LicenseNumber` varchar(100) DEFAULT NULL,
  `LicenseNumberHaj` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ProvinceID` int(11) DEFAULT NULL,
  `CityID` int(11) DEFAULT NULL,
  `ContactPerson` varchar(100) DEFAULT NULL,
  `MobileNumber` varchar(15) DEFAULT NULL,
  `OfficeNumber` varchar(25) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `OfficeEmail` varchar(75) DEFAULT NULL,
  `Website` varchar(75) DEFAULT NULL,
  `TravelStatus` varchar(25) DEFAULT NULL,
  `Rating` varchar(5) NOT NULL DEFAULT '0',
  `UsrName` varchar(75) DEFAULT NULL,
  `Psword` varchar(100) DEFAULT NULL,
  `Logo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_trips`
--

CREATE TABLE `m_trips` (
  `TripID` int(11) NOT NULL,
  `TravelType` int(11) DEFAULT NULL,
  `TravelID` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DepartureDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Origin` varchar(3) DEFAULT NULL,
  `Destination` varchar(3) DEFAULT NULL,
  `Transit` varchar(3) DEFAULT NULL,
  `DetailTransit` varchar(125) DEFAULT NULL,
  `HotelName` varchar(75) DEFAULT NULL,
  `HotelRating` int(11) DEFAULT NULL,
  `DetailHotel` text DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `PromoCode` varchar(125) DEFAULT NULL,
  `PromoDescription` text DEFAULT NULL,
  `AirlinesID` int(11) DEFAULT NULL,
  `Goods` text DEFAULT NULL,
  `TermCondition` text DEFAULT NULL,
  `TripType` int(11) DEFAULT NULL,
  `Quota` int(11) DEFAULT NULL,
  `TripStatus` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT 1,
  `Lat` varchar(25) DEFAULT NULL,
  `Longitude` varchar(25) DEFAULT NULL,
  `DoubleType` int(11) DEFAULT NULL,
  `TripleType` int(11) DEFAULT NULL,
  `QuadType` int(11) DEFAULT NULL,
  `PromoStatus` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_trips`
--

INSERT INTO `m_trips` (`TripID`, `TravelType`, `TravelID`, `Description`, `DepartureDate`, `ReturnDate`, `Duration`, `Origin`, `Destination`, `Transit`, `DetailTransit`, `HotelName`, `HotelRating`, `DetailHotel`, `Currency`, `Price`, `PromoCode`, `PromoDescription`, `AirlinesID`, `Goods`, `TermCondition`, `TripType`, `Quota`, `TripStatus`, `StatusID`, `Lat`, `Longitude`, `DoubleType`, `TripleType`, `QuadType`, `PromoStatus`) VALUES
(12345, 0, 6789, 'batal ke bandung', '2020-06-27', '2020-06-30', 2, 'JKT', 'BDO', 'YK', 'jenguk ortu', 'Buah Batu', 5, 'DI kanan jalan', 'JKT', 5000000, '0000', 'tidak ada', 10101, 'mantap', 'baik baik', 2, 2, 1, 1, '300000', '400000', 12, 34, 56, 'oke'),
(12348, 0, 0, '', '2020-06-27', '2020-06-30', 0, 'JKT', 'BDO', '', '', '', 0, '', '', 0, '', '', 0, '', '', 0, 0, 0, 0, '', '', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `ProdiID` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `KodeID` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT 'UMT',
  `FakultasID` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Nama` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `kodevir` varchar(4) COLLATE latin1_general_ci DEFAULT NULL,
  `KodeExplode` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `NoRekening` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `Nama_en` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `SINGKATAN` varchar(7) COLLATE latin1_general_ci DEFAULT NULL,
  `JenjangID` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Gelar` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ProdiDiktiID` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `NamaSesi` varchar(50) COLLATE latin1_general_ci DEFAULT 'Semester',
  `Akreditasi` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `NoSKDikti` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TglSKDikti` date DEFAULT NULL,
  `NoSKBAN` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TglSKBAN` date DEFAULT NULL,
  `PajakHonorDosen` int(11) NOT NULL DEFAULT 10,
  `Pejabat` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Jabatan` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `FormatNIM` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `DapatPindahProdi` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `DefSKS` int(11) NOT NULL DEFAULT 0,
  `TotalSKS` int(11) NOT NULL DEFAULT 0,
  `DefKehadiran` int(11) NOT NULL DEFAULT 16,
  `BatasStudi` int(11) NOT NULL DEFAULT 0,
  `JumlahSesi` int(11) NOT NULL DEFAULT 0,
  `CekPrasyarat` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `LoginBuat` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TanggalBuat` date DEFAULT NULL,
  `LoginEdit` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `TanggalEdit` date DEFAULT NULL,
  `Keterangan` text COLLATE latin1_general_ci DEFAULT NULL,
  `StartNoProdi` bigint(20) NOT NULL DEFAULT 0,
  `NoProdi` bigint(20) NOT NULL DEFAULT 0,
  `Denda1` int(11) NOT NULL DEFAULT 0,
  `Denda2` int(11) NOT NULL DEFAULT 0,
  `NA` enum('Y','N') COLLATE latin1_general_ci DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Program Studi';

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `QuantityPerUnit` varchar(20) DEFAULT NULL,
  `UnitPrice` decimal(19,4) DEFAULT 0.0000,
  `UnitsInStock` int(11) DEFAULT 0,
  `UnitsOnOrder` int(11) DEFAULT 0,
  `ReorderLevel` int(11) DEFAULT 0,
  `Discontinued` tinyint(4) DEFAULT 0,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `input_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

CREATE TABLE `store` (
  `id` int(6) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `origin_host` varchar(255) NOT NULL,
  `public_key` varchar(1024) NOT NULL,
  `notif_url` varchar(255) NOT NULL,
  `success_url` varchar(255) NOT NULL,
  `failed_url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` varchar(50) NOT NULL,
  `invoice_pfx` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `HomePage` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `PostalCode` (`PostalCode`);

--
-- Indeks untuk tabel `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `PostalCode` (`PostalCode`);

--
-- Indeks untuk tabel `mst_tb_pegawai`
--
ALTER TABLE `mst_tb_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_dosen`
--
ALTER TABLE `m_dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_haji`
--
ALTER TABLE `m_haji`
  ADD PRIMARY KEY (`HajID`);

--
-- Indeks untuk tabel `m_lembaga`
--
ALTER TABLE `m_lembaga`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_travel`
--
ALTER TABLE `m_travel`
  ADD PRIMARY KEY (`TravelID`),
  ADD KEY `CityID` (`CityID`),
  ADD KEY `ProvinceID` (`ProvinceID`);

--
-- Indeks untuk tabel `m_trips`
--
ALTER TABLE `m_trips`
  ADD PRIMARY KEY (`TripID`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`ProdiID`),
  ADD UNIQUE KEY `ProdiID` (`ProdiID`),
  ADD KEY `KodeID` (`KodeID`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `ProductName` (`ProductName`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indeks untuk tabel `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`),
  ADD UNIQUE KEY `publisher_name` (`publisher_name`);

--
-- Indeks untuk tabel `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_idx1` (`code`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`),
  ADD KEY `CompanyName` (`CompanyName`),
  ADD KEY `PostalCode` (`PostalCode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `member`
--
ALTER TABLE `member`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mst_tb_pegawai`
--
ALTER TABLE `mst_tb_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT untuk tabel `m_dosen`
--
ALTER TABLE `m_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `m_haji`
--
ALTER TABLE `m_haji`
  MODIFY `HajID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `m_lembaga`
--
ALTER TABLE `m_lembaga`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `m_travel`
--
ALTER TABLE `m_travel`
  MODIFY `TravelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT untuk tabel `m_trips`
--
ALTER TABLE `m_trips`
  MODIFY `TripID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12349;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT untuk tabel `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `store`
--
ALTER TABLE `store`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
