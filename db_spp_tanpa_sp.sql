-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2023 at 02:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spp`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `data_siswa_kelas`
-- (See below for the actual view)
--
CREATE TABLE `data_siswa_kelas` (
`nis` char(6)
,`nama` varchar(100)
,`nama_kelas` varchar(10)
,`nama_walikelas` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id_kelas` smallint(6) NOT NULL,
  `nama_kelas` varchar(10) DEFAULT NULL,
  `nip_walikelas` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id_kelas`, `nama_kelas`, `nip_walikelas`) VALUES
(1, 'XI RPL 1', '23001'),
(2, 'XI RPL 2', '23002'),
(3, 'XI RPL 3', '23003'),
(4, 'XI ULP 1', '23001'),
(5, 'XI ULP 2', '23001'),
(6, 'X TKJ 1', '23006');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nis` char(6) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(150) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `id_kelas` smallint(6) DEFAULT NULL,
  `id_spp` smallint(6) DEFAULT NULL,
  `nik` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nis`, `nama`, `tempat_lahir`, `tgl_lahir`, `id_kelas`, `id_spp`, `nik`) VALUES
('000001', 'ABDILLAH SINATRIA', 'Kuningan', '2006-02-19', 3, 2, ''),
('000002', 'AISAH NUR`AINI', 'Kuningan', '2005-01-01', 3, 2, ''),
('000003', 'AMELIA NUR MEILIANY', 'Kuningan', '2005-01-01', 1, 1, ''),
('000004', 'ANGGIE SRI HANDHINI', 'Kuningan', '2005-01-01', 1, 1, ''),
('000005', 'Dandi', 'Kuningan', '2006-12-31', 1, 1, NULL),
('000007', 'FAUZAN DWI MULYONO', 'Kuningan', '2005-01-01', 1, 1, ''),
('000009', 'HILDATUN SA`DIYAH', 'Kuningan', '2005-01-01', 1, 1, ''),
('000010', 'ILHAM SUDRAJAT', 'Kuningan', '2005-12-31', 1, 1, ''),
('000015', 'MEILDA SUPRIANI', 'Kuningan', '2005-01-01', 2, 1, ''),
('000017', 'MELDA EGIS TIANI', 'Kuningan', '2005-01-01', 2, 1, ''),
('000018', 'MELLY MELINDA', 'Kuningan', '2005-01-01', 2, 1, ''),
('000019', 'MUHAMAD NABIL FAIZ AMRULLAH', 'Kuningan', '2003-02-26', 2, 1, ''),
('000020', 'MUHAMAD SYAKHA PERMANA ANGGARA', 'Kuningan', '2005-01-01', 2, 1, ''),
('000021', 'NADIA APRIMAULIDIA', 'Kuningan', '2005-04-21', 2, 1, ''),
('000022', 'NISA SOFIYYAH', 'Kuningan', '2005-01-01', 2, 1, ''),
('000023', 'NOVI SRI AGUSTIANI', 'Kuningan', '2005-01-01', 2, 1, ''),
('000024', 'PUTU NUR FAUZI', 'Kuningan', '2006-01-17', 2, 1, ''),
('000025', 'RENI PUTRI HERATIADI', 'Kuningan', '2005-01-01', 3, 1, ''),
('000026', 'RHAKA KHAIRUL FADILAH', 'Kuningan', '2005-01-01', 3, 1, ''),
('000027', 'SIFA FAUZIAH', 'Kuningan', '2005-01-01', 3, 1, ''),
('000028', 'SILVI NURMALA SARI', 'Kuningan', '2005-01-01', 3, 1, ''),
('000029', 'SILVIA SRI LESTARI', 'Kuningan', '2005-01-01', 3, 1, ''),
('000031', 'Siti Salwa', 'Kuningan', '2007-12-31', 1, 1, NULL),
('000032', 'Oya Suryana', 'Kuningan', '2006-03-31', 2, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_spp`
--

CREATE TABLE `tbl_spp` (
  `id_spp` smallint(6) NOT NULL,
  `tahun_spp` year(4) DEFAULT NULL,
  `tarif_spp` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_spp`
--

INSERT INTO `tbl_spp` (`id_spp`, `tahun_spp`, `tarif_spp`) VALUES
(1, '2021', 400000),
(2, '2022', 350000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nis` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_bayar` datetime NOT NULL DEFAULT current_timestamp(),
  `periode_bln_bayar` char(3) NOT NULL,
  `periode_tahun_bayar` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `nis`, `tgl_bayar`, `periode_bln_bayar`, `periode_tahun_bayar`) VALUES
(1, '000001', '2023-02-01 00:00:00', 'jan', '2023'),
(2, '000001', '2023-02-01 00:00:00', 'feb', '2023'),
(3, '000001', '2023-02-01 00:00:00', 'mar', '2023'),
(4, '000002', '2023-02-02 00:00:00', 'jan', '2023');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_walikelas`
--

CREATE TABLE `tbl_walikelas` (
  `nip_walikelas` char(5) NOT NULL,
  `nama_walikelas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_walikelas`
--

INSERT INTO `tbl_walikelas` (`nip_walikelas`, `nama_walikelas`) VALUES
('23001', 'Nanung Nur Jannah'),
('23002', 'Yani Suryani'),
('23003', 'Sri Sayuningsih'),
('23004', 'Agus'),
('23005', 'Erwin'),
('23006', 'Rika'),
('23007', 'Laode'),
('23008', 'Iis Trisno Iskanda'),
('23009', 'Oya Suryana'),
('23010', 'Agus Wahyudin'),
('23011', 'Irwan Muliarso'),
('23012', 'Dedi Sunardih');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `nip_walikelas` (`nip_walikelas`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_spp` (`id_spp`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `tbl_walikelas`
--
ALTER TABLE `tbl_walikelas`
  ADD PRIMARY KEY (`nip_walikelas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `tbl_kelas_ibfk_1` FOREIGN KEY (`nip_walikelas`) REFERENCES `tbl_walikelas` (`nip_walikelas`);

--
-- Constraints for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `tbl_siswa_ibfk_1` FOREIGN KEY (`id_spp`) REFERENCES `tbl_spp` (`id_spp`),
  ADD CONSTRAINT `tbl_siswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `tbl_kelas` (`id_kelas`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `tbl_siswa` (`nis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
