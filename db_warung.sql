-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 04, 2025 at 10:53 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_warung`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftarmenu`
--

CREATE TABLE `daftarmenu` (
  `id_menu` int NOT NULL,
  `namaMenu` varchar(100) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `ketersediaan` enum('tersedia','habis') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `daftarmenu`
--

INSERT INTO `daftarmenu` (`id_menu`, `namaMenu`, `harga`, `ketersediaan`) VALUES
(1, 'nasi campur komplit', '25000.00', 'tersedia'),
(2, 'nasi be guling', '25000.00', 'tersedia'),
(3, 'sate lilit', '15000.00', 'tersedia'),
(4, 'nasi ayam betutu', '25000.00', 'tersedia'),
(5, 'nasi kuning', '15000.00', 'tersedia'),
(6, 'nasi jinggo', '10000.00', 'tersedia'),
(7, 'Es Teh', '10000.00', 'tersedia'),
(8, 'Teh Hangat', '10000.00', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `detailpesanan`
--

CREATE TABLE `detailpesanan` (
  `id_item` int NOT NULL,
  `id_pesan` int NOT NULL,
  `id_menu` int NOT NULL,
  `jumlah` int NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detailpesanan`
--

INSERT INTO `detailpesanan` (`id_item`, `id_pesan`, `id_menu`, `jumlah`, `subtotal`) VALUES
(1, 1, 2, 2, '50000'),
(2, 1, 3, 1, '15000'),
(3, 1, 1, 1, '25000'),
(4, 2, 1, 1, '25000'),
(5, 2, 7, 1, '10000'),
(6, 3, 2, 1, '25000'),
(7, 3, 3, 1, '15000'),
(8, 3, 8, 1, '10000'),
(9, 4, 2, 1, '25000'),
(10, 4, 7, 11, '110000');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesan` int NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `total_harga` decimal(10,0) NOT NULL,
  `status` enum('diproses','selesai','dibatalkan') NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_pesan`, `nama_pelanggan`, `total_harga`, `status`, `created_at`) VALUES
(1, 'Sri', '90000', 'selesai', '2025-06-30 23:42:05'),
(2, 'Gaura', '35000', 'diproses', '2025-07-01 00:39:04'),
(3, 'Adit', '50000', 'diproses', '2025-07-01 00:43:24'),
(4, 'Radha', '135000', 'selesai', '2025-07-02 12:26:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftarmenu`
--
ALTER TABLE `daftarmenu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `detailpesanan`
--
ALTER TABLE `detailpesanan`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_pesan` (`id_pesan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftarmenu`
--
ALTER TABLE `daftarmenu`
  MODIFY `id_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `detailpesanan`
--
ALTER TABLE `detailpesanan`
  MODIFY `id_item` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailpesanan`
--
ALTER TABLE `detailpesanan`
  ADD CONSTRAINT `detailpesanan_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `daftarmenu` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `detailpesanan_ibfk_2` FOREIGN KEY (`id_pesan`) REFERENCES `pesanan` (`id_pesan`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
