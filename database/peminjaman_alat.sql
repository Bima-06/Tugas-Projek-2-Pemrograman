-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2026 at 04:16 PM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman_alat`
--

-- --------------------------------------------------------

--
-- Table structure for table `alat`
--

CREATE TABLE `alat` (
  `kode_alat` varchar(20) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `kode_kategori` varchar(20) NOT NULL,
  `kondisi` varchar(30) NOT NULL DEFAULT 'Baik'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alat`
--

INSERT INTO `alat` (`kode_alat`, `nama_alat`, `kode_kategori`, `kondisi`) VALUES
('ALT01', 'Laptop Dell XPS 15', 'KAT01', 'Baik'),
('ALT02', 'Router MikroTik RB750', 'KAT02', 'Baik'),
('ALT03', 'Kamera DSLR Canon', 'KAT03', 'Baik'),
('ALT04', 'Proyektor Epson', 'KAT03', 'Baik'),
('ALT05', 'Laptop Lenovo ThinkPad X1', 'KAT01', 'Baik'),
('ALT06', 'PC Workstation Core i7', 'KAT01', 'Baik'),
('ALT07', 'Switch Cisco Catalyst 2960', 'KAT02', 'Baik'),
('ALT08', 'Access Point Ubiquiti UniFi', 'KAT02', 'Rusak Ringan'),
('ALT09', 'Tripod Manfrotto Compact', 'KAT03', 'Baik'),
('ALT10', 'Microphone Condenser Rode', 'KAT03', 'Rusak Berat');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `kode_transaksi` varchar(20) NOT NULL,
  `kode_alat` varchar(20) NOT NULL,
  `status_item` varchar(30) NOT NULL DEFAULT 'Dipinjam',
  `kondisi_kembali` varchar(30) DEFAULT NULL,
  `waktu_kembali` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `kode_transaksi`, `kode_alat`, `status_item`, `kondisi_kembali`, `waktu_kembali`) VALUES
(1, 'TRX0001', 'ALT01', 'Dipinjam', NULL, NULL),
(2, 'TRX0002', 'ALT02', 'Dikembalikan', 'Baik', '2026-11-05 10:15:00'),
(3, 'TRX0002', 'ALT05', 'Dipinjam', NULL, NULL),
(4, 'TRX0003', 'ALT03', 'Dikembalikan', 'Baik', '2026-11-07 14:20:00'),
(5, 'TRX0003', 'ALT08', 'Dikembalikan', 'Rusak Ringan', '2026-11-07 14:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kode_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kode_kategori`, `nama_kategori`) VALUES
('KAT01', 'Perangkat Komputasi'),
('KAT02', 'Perangkat Jaringan'),
('KAT03', 'Perangkat Multimedia');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `no_telp`) VALUES
('K3525023', 'Dennis Pratama Saputra', '081234567890'),
('K3525031', 'Ken Gayuh Nusa Islami', '089284639289'),
('K3525032', 'Mahardika Yumna Waratmaja', '085829367820'),
('K3525048', 'Allicya Nailah Fairuza', '082345678901'),
('K3525051', 'Arofa Karindra Bimantara', '083456789012');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_transaksi` varchar(20) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_rencana_kembali` date NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `nim`, `tanggal_pinjam`, `tanggal_rencana_kembali`, `status`) VALUES
('TRX0001', 'K3525051', '2026-11-01', '2026-11-08', 'Aktif'),
('TRX0002', 'K3525023', '2026-11-03', '2026-11-10', 'Sebagian dikembalikan'),
('TRX0003', 'K3525048', '2026-11-05', '2026-11-12', 'Selesai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`kode_alat`),
  ADD KEY `fk_alat_kategori` (`kode_kategori`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_detail_transaksi` (`kode_transaksi`),
  ADD KEY `fk_detail_alat` (`kode_alat`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `fk_transaksi_mahasiswa` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `fk_alat_kategori` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode_kategori`) ON UPDATE CASCADE;

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_detail_alat` FOREIGN KEY (`kode_alat`) REFERENCES `alat` (`kode_alat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detail_transaksi` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
