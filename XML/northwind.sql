-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2020 pada 15.06
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
-- Database: `northwind`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `CustomerID` varchar(5) NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`CustomerID`, `CompanyName`, `ContactName`, `ContactTitle`, `Address`, `City`, `Region`, `PostalCode`, `Country`, `Phone`, `Fax`) VALUES
('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '(503) 555-7555', '', '2732 Baker Blvd', '97403', 'Eugene', 'USA', 'OR'),
('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', '(503) 555-6874', '(503) 555-2376', 'City Center Pla', '97827', 'Elgin', 'USA', 'OR'),
('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '(509) 555-7969', '(509) 555-6221', '12 Orchestra Te', '99362', 'Walla Walla', 'USA', 'WA'),
('LETSS', 'Let\'s Stop N Shop', 'Jaime Yorres', 'Owner', '(415) 555-5938', '', '87 Polk St. Sui', '94117', 'San Francisco', 'USA', 'CA');

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

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`EmployeeID`, `LastName`, `FirstName`, `Title`, `TitleOfCourtesy`, `BirthDate`, `HireDate`, `Address`, `City`, `Region`, `PostalCode`, `Country`, `HomePhone`, `Extension`, `Photo`, `Notes`, `ReportsTo`, `ProvinceName`) VALUES
(1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1971-01-31', '1992-05-01', '507 - 20th Ave. E.\r\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', 'EmpID1.bmp', 'Education includes a BA in psychology from Colorado State University.  She also completed \"The Art of the Cold Call.\"  Nancy is a member of Toastmasters International.', 2, NULL),
(3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', 'EmpID3.bmp', 'Janet has a BS degree in chemistry from Boston College).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate and was promoted to sales representative.', 2, NULL),
(4, 'Peacock', 'Margaretss', 'Sales Representative', 'Mrs.', '1970-01-29', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', 'EmpID4.bmp', 'Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.', 2, NULL),
(5, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1977-01-21', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', 'EmpID5.bmp', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree.  Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager.  Mr. Buchanan has completed the courses \"Successful Telemarketing\" and \"International Sales Management.\"  He is fluent in French.', 2, NULL),
(7, 'King', 'Robert', 'Sales Representative', 'Mr.', '1970-01-07', '1994-01-02', 'Edgeham Hollow\r\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', 'EmpID7.bmp', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company.  After completing a course entitled \"Selling in Europe,\" he was transferred to the London office.', 5, NULL),
(8, 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1970-01-01', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', 'EmpID8.bmp', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, NULL),
(9, 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1970-01-01', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', 'EmpID9.bmp', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, NULL),
(10, 'tettt', 'tet', NULL, NULL, '1970-01-01', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'testdf', 'testdf', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Pramana', 'Bayu', NULL, NULL, NULL, NULL, '6649 N Blue Gum St', 'New Orleans', 'LA', '70116', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Pramana', 'Bayu', NULL, NULL, NULL, NULL, '6649 N Blue Gum St', 'New Orleans', 'LA', '70116', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Pramana', 'Bayu', NULL, NULL, NULL, NULL, '6649 N Blue Gum St', 'New Orleans', 'LA', '70116', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Firdaus', 'Bayu', NULL, NULL, NULL, NULL, '6649 N Blue Gum St', 'New Orleans', 'LA', '70116', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` varchar(5) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `RequiredDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipVia` int(11) DEFAULT NULL,
  `Freight` decimal(19,4) DEFAULT 0.0000,
  `ShipName` varchar(40) DEFAULT NULL,
  `ShipAddress` varchar(60) DEFAULT NULL,
  `ShipCity` varchar(15) DEFAULT NULL,
  `ShipRegion` varchar(15) DEFAULT NULL,
  `ShipPostalCode` varchar(10) DEFAULT NULL,
  `ShipCountry` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `RequiredDate`, `ShippedDate`, `ShipVia`, `Freight`, `ShipName`, `ShipAddress`, `ShipCity`, `ShipRegion`, `ShipPostalCode`, `ShipCountry`) VALUES
(1, 'GREAL', 6, '1997-05-06', '1997-05-20', '1997-05-09', 2, '3.3500', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(2, 'GREAL', 8, '1997-07-04', '1997-08-01', '1997-07-14', 2, '4.4200', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(3, 'GREAL', 1, '1997-07-31', '1997-08-28', '1997-08-05', 2, '116.5300', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(4, 'GREAL', 4, '1997-07-31', '1997-08-28', '1997-08-04', 2, '18.5300', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(5, 'GREAL', 6, '1997-09-04', '1997-10-02', '1997-09-10', 1, '57.1500', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(6, 'GREAL', 3, '1997-09-25', '1997-10-23', '1997-09-30', 3, '76.1300', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(7, 'GREAL', 4, '1998-01-06', '1998-02-03', '1998-02-04', 2, '719.7800', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(8, 'GREAL', 3, '1998-03-09', '1998-04-06', '1998-03-18', 2, '33.6800', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(9, 'GREAL', 3, '1998-04-07', '1998-05-05', '1998-04-15', 2, '25.1900', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(10, 'GREAL', 4, '1998-04-22', '1998-05-20', '0000-00-00', 3, '18.8400', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(11, 'GREAL', 4, '1998-04-30', '1998-06-11', '0000-00-00', 3, '14.0100', 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA'),
(12, 'HUNGC', 3, '1996-12-06', '1997-01-03', '1996-12-09', 2, '20.1200', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(13, 'HUNGC', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, '30.3400', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(14, 'HUNGC', 3, '1997-01-15', '1997-02-12', '1997-01-24', 1, '0.2000', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(15, 'HUNGC', 4, '1997-07-16', '1997-08-13', '1997-07-21', 1, '45.1300', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(16, 'HUNGC', 8, '1997-09-08', '1997-10-06', '1997-10-15', 1, '111.2900', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA'),
(17, 'LAZYK', 1, '1997-03-21', '1997-04-18', '1997-04-10', 3, '7.4800', 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA'),
(18, 'LAZYK', 8, '1997-05-22', '1997-06-19', '1997-06-26', 2, '11.9200', 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA'),
(19, 'LETSS', 1, '1997-06-25', '1997-07-23', '1997-07-04', 2, '13.7300', 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA'),
(20, 'LETSS', 8, '1997-10-27', '1997-11-24', '1997-11-05', 2, '51.4400', 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA'),
(21, 'LETSS', 6, '1997-11-10', '1997-12-08', '1997-11-21', 2, '45.9700', 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA'),
(22, 'LETSS', 4, '1998-02-12', '1998-03-12', '1998-02-13', 2, '90.9700', 'Let\'s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `City` (`City`),
  ADD KEY `CompanyName` (`CompanyName`),
  ADD KEY `PostalCode` (`PostalCode`),
  ADD KEY `Region` (`Region`);

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `PostalCode` (`PostalCode`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `OrderDate` (`OrderDate`),
  ADD KEY `ShippedDate` (`ShippedDate`),
  ADD KEY `ShipPostalCode` (`ShipPostalCode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
