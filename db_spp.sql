-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 14, 2023 at 05:55 AM
-- Server version: 5.7.42-0ubuntu0.18.04.1
-- PHP Version: 7.2.34-38+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spp`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ambil_kelas` ()  BEGIN
SELECT * FROM tbl_kelas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ambil_tarif` ()  BEGIN
	SELECT * from tbl_spp;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ambil_walikelas` ()  BEGIN
SELECT * from tbl_walikelas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cari_nama` (IN `namanya` VARCHAR(100))  BEGIN
 	   SELECT * FROM tbl_siswa WHERE nama LIKE '%namanya%';   
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cari_siswa` (IN `noInduk` CHAR(6))  BEGIN 
SELECT  tbl_siswa.nis,tbl_siswa.nama,tbl_siswa.tempat_lahir,
tbl_siswa.tgl_lahir,tbl_siswa.id_kelas,tbl_siswa.id_spp,
		tbl_kelas.nama_kelas,        
		tbl_walikelas.nama_walikelas,
        tbl_spp.tarif_spp
FROM 	tbl_siswa
LEFT JOIN 	tbl_kelas ON tbl_kelas.id_kelas=tbl_siswa.id_kelas
LEFT JOIN 	tbl_spp on tbl_spp.id_spp=tbl_siswa.id_spp
LEFT JOIN	tbl_walikelas ON tbl_walikelas.nip_walikelas=tbl_kelas.nip_walikelas
 WHERE tbl_siswa.nis = noInduk;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_hapus_siswa` (IN `noInduk` CHAR(6))  BEGIN
	
		SET @pesan = 'data siswa berhasil di hapus';
		DELETE FROM tbl_siswa WHERE nis = noInduk;
		SELECT @pesan AS pesan;
	
	
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_siswa` (IN `nisNya` CHAR(6), IN `namaNya` VARCHAR(100), IN `tempatNya` VARCHAR(100), IN `tanggalNya` DATE, IN `kelasNya` SMALLINT, IN `tarifNya` SMALLINT)  BEGIN
INSERT INTO tbl_siswa (nis,nama,tempat_lahir,tgl_lahir,id_kelas,id_spp)VALUES (nisNya,namaNya,tempatNya,tanggalNya,kelasNya,tarifNya);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_wk` (IN `nipnya` CHAR(5), `namanya` VARCHAR(100))  BEGIN
			SET @pesan ='Data walikelas berhasil disimpan';
			INSERT INTO tbl_walikelas VALUES (nipnya,namanya);
			SELECT @pesan as Pesan;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_siswa` (IN `nisNya` CHAR(6), IN `namaNya` VARCHAR(100), IN `tempatNya` VARCHAR(100), IN `tglNya` DATE, IN `kelasNya` SMALLINT, IN `tarifNya` SMALLINT)  BEGIN
	UPDATE tbl_siswa SET nama=namaNya, tempat_lahir=tempatNya,tgl_lahir=tglNya,id_kelas=kelasNya,id_spp=tarifNya
    WHERE nis=nisNya;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_walikelas` (IN `nip` CHAR(5), `nama` VARCHAR(100))  BEGIN
INSERT INTO tbl_walikelas VALUES(nip,nama);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_siswa` ()  BEGIN
SELECT  tbl_siswa.nis,tbl_siswa.nama,tbl_siswa.tempat_lahir,
tbl_siswa.tgl_lahir,tbl_siswa.id_kelas,tbl_siswa.id_spp,
		tbl_kelas.nama_kelas,        
		tbl_walikelas.nama_walikelas,
        tbl_spp.tarif_spp
FROM 	tbl_siswa
LEFT JOIN 	tbl_kelas ON tbl_kelas.id_kelas=tbl_siswa.id_kelas
LEFT JOIN 	tbl_spp on tbl_spp.id_spp=tbl_siswa.id_spp
LEFT JOIN	tbl_walikelas ON tbl_walikelas.nip_walikelas=tbl_kelas.nip_walikelas
ORDER BY tbl_siswa.nis;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ubah_walikelas` (IN `nipNya` CHAR(5), IN `namaNya` VARCHAR(100))  BEGIN
	UPDATE tbl_walikelas SET nama_walikelas=namaNya WHERE nip_walikelas=nipNya;
END$$

DELIMITER ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nis`, `nama`, `tempat_lahir`, `tgl_lahir`, `id_kelas`, `id_spp`, `nik`) VALUES
('000001', 'ABDILLAH SINATRIA', 'Kuningan', '2006-02-19', 3, 2, ''),
('000002', 'AISAH NUR`AINI', 'Kuningan', '2005-01-01', 3, 2, ''),
('000003', 'AMELIA NUR MEILIANY', 'Kuningan', '2005-01-01', 1, 1, ''),
('000004', 'ANGGIE SRI HANDHINI', 'Kuningan', '2005-01-01', 1, 1, ''),
('000007', 'FAUZAN DWI MULYONO', 'Kuningan', '2005-01-01', 1, 1, ''),
('000008', 'HAFID MUROFI', 'Kuningan', '2005-01-01', 1, 1, ''),
('000009', 'HILDATUN SA`DIYAH', 'Kuningan', '2005-01-01', 1, 1, ''),
('000010', 'ILHAM SUDRAJAT', 'Kuningan', '2005-12-31', 1, 1, ''),
('000011', 'IRNA KURNIASIH', 'Kuningan', '2005-01-01', 1, 1, ''),
('000012', 'LARAS AYU LISTIANI', 'Kuningan', '2005-01-01', 1, 1, ''),
('000013', 'LELIS NURLAELI', 'Kuningan', '2005-01-01', 2, 1, ''),
('000014', 'MAULIDA FATHIYA ZAEN', 'Kuningan', '2005-01-01', 2, 1, ''),
('000015', 'MEILDA SUPRIANI', 'Kuningan', '2005-01-01', 2, 1, ''),
('000016', 'MELA DWI CAHYANI', 'Kuningan', '2005-01-01', 2, 1, ''),
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
('000030', 'SINDI APRILIA PUTRI', 'Kuningan', '2005-01-01', 3, 1, ''),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_spp`
--

INSERT INTO `tbl_spp` (`id_spp`, `tahun_spp`, `tarif_spp`) VALUES
(1, 2021, 400000),
(2, 2022, 350000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nis` char(6) CHARACTER SET utf8mb4 NOT NULL,
  `tgl_bayar` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `periode_bln_bayar` char(3) NOT NULL,
  `periode_tahun_bayar` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `nis`, `tgl_bayar`, `periode_bln_bayar`, `periode_tahun_bayar`) VALUES
(1, '000001', '2023-02-01 00:00:00', 'jan', 2023),
(2, '000001', '2023-02-01 00:00:00', 'feb', 2023),
(3, '000001', '2023-02-01 00:00:00', 'mar', 2023),
(4, '000002', '2023-02-02 00:00:00', 'jan', 2023);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_walikelas`
--

CREATE TABLE `tbl_walikelas` (
  `nip_walikelas` char(5) NOT NULL,
  `nama_walikelas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('23010', 'Dedi Sunardih'),
('23011', 'Irwan Muliarso');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_siswa`
-- (See below for the actual view)
--
CREATE TABLE `v_siswa` (
`nis` char(6)
,`nama` varchar(100)
,`tahun_lahir` int(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_siswa_2`
-- (See below for the actual view)
--
CREATE TABLE `v_siswa_2` (
`nis` char(6)
,`nama` varchar(100)
,`nama_kelas` varchar(10)
,`nama_walikelas` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `data_siswa_kelas`
--
DROP TABLE IF EXISTS `data_siswa_kelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_siswa_kelas`  AS  select `tbl_siswa`.`nis` AS `nis`,`tbl_siswa`.`nama` AS `nama`,`tbl_kelas`.`nama_kelas` AS `nama_kelas`,`tbl_walikelas`.`nama_walikelas` AS `nama_walikelas` from ((`tbl_siswa` join `tbl_kelas` on((`tbl_kelas`.`id_kelas` = `tbl_siswa`.`id_kelas`))) join `tbl_walikelas` on((`tbl_walikelas`.`nip_walikelas` = `tbl_kelas`.`nip_walikelas`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_siswa`
--
DROP TABLE IF EXISTS `v_siswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_siswa`  AS  select `tbl_siswa`.`nis` AS `nis`,`tbl_siswa`.`nama` AS `nama`,year(`tbl_siswa`.`tgl_lahir`) AS `tahun_lahir` from `tbl_siswa` ;

-- --------------------------------------------------------

--
-- Structure for view `v_siswa_2`
--
DROP TABLE IF EXISTS `v_siswa_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_siswa_2`  AS  select `tbl_siswa`.`nis` AS `nis`,`tbl_siswa`.`nama` AS `nama`,`tbl_kelas`.`nama_kelas` AS `nama_kelas`,`tbl_walikelas`.`nama_walikelas` AS `nama_walikelas` from ((`tbl_siswa` join `tbl_kelas` on((`tbl_kelas`.`id_kelas` = `tbl_siswa`.`id_kelas`))) join `tbl_walikelas` on((`tbl_walikelas`.`nip_walikelas` = `tbl_kelas`.`nip_walikelas`))) ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
