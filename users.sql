-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2019 at 02:23 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registered people database`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `cnic` int(13) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ethereum account` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`cnic`, `username`, `password`, `vin`, `ethereum account`) VALUES
(541234, 'Nayab Usama', 'nayab123', 'KGH 341', '0x1b82178193F935E3fD9bf94da4DB682358Faa217'),
(761234, 'Sarah Haider', 'sarah123', 'IGH 891', '0x2D3Fa1b9B839B5079218e618e6Fb9d068CD64Bca'),
(3412556, 'Syed Ali', 'syed123', 'SDE 390', '0xbB823261470ec98Fc5cdb598D8896f2Be1B7c1B1'),
(3452167, 'Samar Shiraz', 'samar123', 'LMK 231', '0x57bffa06cEfD158EeaCa8a96c40F494EBfd4946A'),
(5412789, 'Amna Kazmi', 'amna123', 'JAW 521', '0x7Cd29029AF4Ee4Ae36Cc30f480308Ae2971E8184'),
(7654312, 'Daniya Gardezi', 'daniya123', 'FGJ 432', '0x2Cea08b9f443fD1ed42a27AF7A587108E440e71e'),
(7891234, 'Qandeel Raza', 'qandeel123', 'UID 781', '0xc83711Cc9540edC5883DA416f66F38b883E53EdE'),
(35641123, 'Mahdi Raza', 'mahdi123', 'LHM 563', '0xc83711Cc9540edC5883DA416f66F38b883E53EdE'),
(65412398, 'Haider Gardezi', 'haider123', 'KHI 675', '0x1eACcbeC7e0919FD3737fFB28D9007e606E44B0d'),
(374053295, 'Zahra Shiraz', 'zahra123', 'IDK 419', '0xBD3233ffF623BacC6e93Ef3bd3857d1258CE648f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`cnic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `cnic` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=374053296;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
