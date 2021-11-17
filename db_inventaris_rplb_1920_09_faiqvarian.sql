-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 12:03 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventaris_rplb_1920_09_faiqvarian`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addbarang` (IN `nama` VARCHAR(255), IN `spesifikasi` TEXT, IN `lokasi` CHAR(4), IN `kondisi` VARCHAR(20), IN `jumlah` INT(11), IN `sumber_dana` CHAR(4))  BEGIN
DECLARE id_barang CHAR(8) DEFAULT 'BRG00001';
ROLLBACK;
START TRANSACTION;
SET id_barang = id_barang();
INSERT INTO barang VALUES(id_barang, nama, spesifikasi, lokasi, kondisi, jumlah, sumber_dana);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addlokasi` (IN `nama` VARCHAR(255), IN `penanggung_jawab` VARCHAR(255), IN `keterangan` TEXT)  BEGIN
DECLARE id_lokasi CHAR(4) DEFAULT 'R001';
ROLLBACK;
START TRANSACTION;
SET id_lokasi = id_lokasi();
INSERT INTO lokasi VALUES(id_lokasi, nama, penanggung_jawab, keterangan);
COMMIT;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `id_barang` () RETURNS CHAR(8) CHARSET utf8mb4 BEGIN
    DECLARE
        id_awal CHAR(8) DEFAULT 'BRG10001' ; DECLARE id_num CHAR(5) DEFAULT '00000' ; DECLARE id_hasil CHAR(8) DEFAULT 'BRG00000' ;
    SELECT
        MAX(id_barang)
    INTO id_awal
FROM
    barang ;
SET
    id_num = SUBSTR(id_awal, 4, 5) ;
SET
    id_num = id_num + 1 ;
SET
    id_hasil = CONCAT("BRG", id_num) ; RETURN id_hasil ;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `id_lokasi` () RETURNS CHAR(4) CHARSET utf8mb4 BEGIN
DECLARE id_awal CHAR(4) DEFAULT 'R001';
DECLARE id_num CHAR(3) DEFAULT '000';
DECLARE id_hasil CHAR(4) DEFAULT 'R000';
SELECT MAX(id_lokasi) INTO id_awal FROM lokasi;
SET id_num = SUBSTR(id_awal, 2, 3);
SET id_num = LPAD(id_num + 1, 3, 0);
SET id_hasil = CONCAT("R", id_num);
RETURN id_hasil;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(8) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `spesifikasi` text NOT NULL,
  `lokasi` char(4) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `sumber_dana` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `spesifikasi`, `lokasi`, `kondisi`, `jumlah_barang`, `sumber_dana`) VALUES
('BRG10001', 'Kursi Siswa', 'Chitose', 'R001', 'Baik', 36, 'S002'),
('BRG10002', 'Kursi Siswa', 'Kursi Lipat', 'R002', 'Rusak', 36, 'S002'),
('BRG10003', 'Kursi Siswa', 'Chitose', 'R003', 'Baik', 36, 'S002'),
('BRG10004', 'Kursi Siswa', 'Chitose', 'R004', 'Baik', 36, 'S002'),
('BRG20001', 'PC Rakitan', 'Intel celeron 2MB', 'R001', 'Baik', 24, 'S001'),
('BRG20002', 'PC Build in', 'Intel quad core 2MB', 'R001', 'Rusak', 6, 'S002'),
('BRG20003', 'Laptop', 'Lenovo E550 core i7', 'R002', 'Baik', 23, 'S003'),
('BRG20004', 'Laptop', 'Acer intel Core i3', 'R002', 'Baik', 30, 'S002'),
('BRG20005', 'PC Build in', 'Dell optiplex core i7', 'R003', 'Baik', 36, 'S003'),
('BRG20006', 'PC Rakitan', 'Intel core i5', 'R004', 'Baik', 36, 'S002'),
('BRG20007', 'PC Build in', 'HP core i7 gen10', 'R005', 'Baik', 10, 'S005'),
('BRG20008', 'Tab', 'Samsung SM-T295', 'R001', 'Baik', 36, 'S005'),
('BRG20009', 'Tab', 'Samsung SM-T295', 'R002', 'Baik', 36, 'S005'),
('BRG20010', 'Tab', 'Samsung SM-T295', 'R003', 'Baik', 36, 'S005'),
('BRG20011', 'Tab', 'Samsung SM-T295', 'R004', 'Baik', 36, 'S005'),
('BRG20012', 'Tab', 'Samsung SM-T295', 'R005', 'Baik', 36, 'S005'),
('BRG20013', 'USB Lan Converter', 'TP-Link UE300', 'R001', 'Baik', 36, 'S004'),
('BRG20014', 'Mikrotik', 'RB750', 'R003', 'Baik', 36, 'S004'),
('BRG20015', 'Camera DSLR', 'Canon D60', 'R005', 'Baik', 16, 'S003'),
('BRG20016', 'Lighting Set', 'Troning Lighting Set', 'R005', 'Baik', 2, 'S004'),
('BRG20017', 'Tripod', 'Takara', 'R005', 'Baik', 10, 'S004'),
('BRG20018', 'Infocus', 'IN114v', 'R001', 'baik', 24, 'S003'),
('BRG20019', 'Camera 2', 'DSLR', 'R001', 'baik', 10, 'S002'),
('BRG20020', 'Hp', 'ram 6gb', 'R007', 'baik', 35, 'S003'),
('BRG20021', 'hp', '6gb', 'R001', 'baik', 10, 'S001'),
('BRG20022', 'Camera 2', 'DSLR', 'R005', 'baik', 5, 'S003'),
('BRG20023', 'Camera 2', 'DSLR', 'R005', 'baik', 10, 'S003'),
('BRG20024', 'Camera 2', 'DSLR', 'R005', 'baik', 10, 'S003'),
('BRG20025', 'Camera 2', 'DSLR', 'R005', 'baik', 10, 'S003'),
('BRG20026', 'hp asus', 'bagus', 'R004', 'baik', 10, 'S001'),
('BRG20027', 'odd data', 'odd data', 'R007', 'odd data', 88, 'S005'),
('BRG20028', 'coba lagi', 'semangat', 'R004', 'in syaa Allah engga', 10, 'S003'),
('BRG20029', 'coba lagi', 'semangat', 'R004', 'in syaa Allah engga', 10, 'S003');

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang` char(8) NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jml_keluar` int(11) NOT NULL,
  `supplier` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang`, `tgl_keluar`, `jml_keluar`, `supplier`) VALUES
('BRG10001', '2019-07-16', 16, 'SPR001'),
('BRG10002', '2019-07-16', 10, 'SPR002'),
('BRG10003', '2019-07-16', 5, 'SPR001'),
('BRG10004', '2019-07-16', 10, 'SPR001'),
('BRG20001', '2019-07-16', 19, 'SPR004'),
('BRG20002', '2019-07-16', 6, 'SPR003');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang` char(8) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jml_masuk` int(11) NOT NULL,
  `supplier` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang`, `tgl_masuk`, `jml_masuk`, `supplier`) VALUES
('BRG10001', '2013-09-03', 36, 'SPR001'),
('BRG10002', '2013-10-21', 36, 'SPR002'),
('BRG10003', '2013-09-05', 36, 'SPR001'),
('BRG10004', '2013-09-05', 36, 'SPR001'),
('BRG20001', '2011-05-07', 24, 'SPR004'),
('BRG20002', '2013-10-21', 6, 'SPR003'),
('BRG20003', '2014-08-06', 23, 'SPR003'),
('BRG20004', '2013-10-25', 30, 'SPR003'),
('BRG20005', '2014-08-06', 36, 'SPR003'),
('BRG20006', '2013-12-04', 36, 'SPR004'),
('BRG20007', '2020-01-10', 10, 'SPR003'),
('BRG20008', '2020-01-10', 36, 'SPR003'),
('BRG20009', '2020-01-10', 36, 'SPR003'),
('BRG20010', '2020-01-10', 36, 'SPR003'),
('BRG20011', '2020-01-10', 36, 'SPR003'),
('BRG20012', '2020-01-10', 36, 'SPR003'),
('BRG20013', '2018-07-21', 36, 'SPR004'),
('BRG20014', '2018-07-21', 36, 'SPR004'),
('BRG20015', '2014-08-06', 16, 'SPR005'),
('BRG20016', '2018-07-21', 2, 'SPR005'),
('BRG20017', '2018-07-21', 10, 'SPR005');

-- --------------------------------------------------------

--
-- Table structure for table `level_user`
--

CREATE TABLE `level_user` (
  `id_level` char(3) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_user`
--

INSERT INTO `level_user` (`id_level`, `nama`, `keterangan`) VALUES
('U01', 'Administrator', ' '),
('U02', 'Manajemen', ' '),
('U03', 'Peminjam', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` char(4) NOT NULL,
  `nama_lokasi` varchar(225) NOT NULL,
  `penanggung_jawab` varchar(225) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_lokasi`, `penanggung_jawab`, `keterangan`) VALUES
('R001', 'Lab RPL 1', 'Satria Ade Putra', 'Lantai 3 Gedung D'),
('R002', 'Lab RPL 2', 'Satria Ade Putra', 'Lantai 3 Gedung D'),
('R003', 'Lab TKJ 1', 'Supriyadi', 'Lantai 2 Gedung D'),
('R004', 'Lab TKJ 2', 'Supriyadi', 'Lantai 2 Gedung D'),
('R005', 'Lab Multimedia', 'Bayu Setiawan', 'Gedung Multimedia'),
('R006', 'LAB AK', 'Sulistiyati', 'Lantai 1'),
('R007', 'LAB BB', 'Maryanah', 'Lantai 2');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam_barang`
--

CREATE TABLE `pinjam_barang` (
  `id_pinjam` char(11) NOT NULL,
  `peminjam` char(8) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `barang_pinjam` char(8) NOT NULL,
  `jml_pinjam` int(11) NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `kondisi` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pinjam_barang`
--

INSERT INTO `pinjam_barang` (`id_pinjam`, `peminjam`, `tgl_pinjam`, `barang_pinjam`, `jml_pinjam`, `tgl_kembali`, `kondisi`) VALUES
('1', 'USR00004', '2021-10-15', 'BRG20013', 2, NULL, ''),
('2', 'USR20001', '2018-05-15', 'BRG20008', 1, '2018-06-15', 'Baik'),
('3', 'USR20002', '2018-05-15', 'BRG20003', 1, '2018-06-15', 'Baik'),
('4', 'USR00002', '2019-07-15', 'BRG20013', 1, NULL, ''),
('5', 'USR00001', '2019-08-24', 'BRG20004', 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id_barang` char(8) NOT NULL,
  `jml_masuk` int(11) NOT NULL,
  `jml_keluar` int(11) NOT NULL,
  `total_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id_barang`, `jml_masuk`, `jml_keluar`, `total_barang`) VALUES
('BRG10001', 36, 16, 20),
('BRG10002', 36, 10, 16),
('BRG10003', 36, 5, 31),
('BRG10004', 36, 10, 26),
('BRG20001', 24, 19, 5),
('BRG20002', 6, 6, 0),
('BRG20003', 23, 0, 23),
('BRG20004', 30, 1, 29),
('BRG20005', 36, 0, 36),
('BRG20006', 36, 0, 36),
('BRG20007', 10, 0, 10),
('BRG20008', 36, 0, 36),
('BRG20009', 36, 0, 36),
('BRG20010', 36, 0, 36),
('BRG20011', 36, 0, 36),
('BRG20012', 36, 0, 36),
('BRG20013', 36, 3, 33),
('BRG20014', 36, 0, 36),
('BRG20015', 16, 0, 16),
('BRG20016', 2, 0, 2),
('BRG20017', 10, 0, 10),
('BRG20019', 10, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `sumber_dana`
--

CREATE TABLE `sumber_dana` (
  `id_sumber` char(4) NOT NULL,
  `nama_sumber` varchar(225) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sumber_dana`
--

INSERT INTO `sumber_dana` (`id_sumber`, `nama_sumber`, `keterangan`) VALUES
('S001', 'Komite 07/09', 'Bantuan Komite 2007/2009'),
('S002', 'Komite 13', 'Bantuan Komite 2013'),
('S003', 'Sed T-vet', 'Bantuan Kerja Sama Indonesia Jerman'),
('S004', 'BOSDA 2018', 'Bantuan Operasional Sekolah Daerah Jawa\r\nBarat'),
('S005', 'BOPD 2020', 'Bantuan Provinsi Jawa Barat 2020');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` char(8) NOT NULL,
  `nama_supplier` varchar(225) NOT NULL,
  `alamat_supplier` text NOT NULL,
  `telp_supplier` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telp_supplier`) VALUES
('SPR001', 'INFORMA', 'Mal Metropolitan, Jl.Kh Noer Ali No 1', '0812-9604-\r\n60'),
('SPR002', 'MitraKantor.com', 'Jl. I Gusti Ngurah Rai No 20 Jakarta\r\nTimur', '(021) 22862086'),
('SPR003', 'bhinneka.com', 'Jl. Gn. Sahari No.73-74, RT.9/RW.7, Gunung\r\nSahari Selatan, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta', '(021) 29292828'),
('SPR004', 'World Computer', 'Harco Mangga Dua Plaza, Jalan Arteri Jl.\r\nMangga Dua Raya No.17, RW.11, Mangga Dua Sel., Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah\r\nKhusus Ibukota Jakarta 10730', '(021) 6125266'),
('SPR005', 'Aneka Foto Metro Atom', 'Metro Atom Plaza Jalan Samanhudi\r\nBlok AKS No. 19, RT.20/RW.3, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus\r\nIbukota Jakarta 10710', '(021) 3455544');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` char(8) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
('USR00001', 'Nana Sukmana', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'U01'),
('USR00002', 'Deden Deendi', 'toolman=RPL', 'a8f8053ebb7a49d533c914e5d84dea3d', 'U02'),
('USR00003', 'Ilham Kamil', 'toolman=MM', 'ddef483a39db6cc6de6b4893c0df8095', 'U02'),
('USR00004', 'Abdul Rahman', 'toolman=TKJ', 'da7664c055ebb21dec3f31c471fa4978', 'U02'),
('USR20001', 'Dhika', 'Dhka', '622ca54e98ff2519542ab781902924ce', 'U03'),
('USR20002', 'Qadafi', 'Qadafi', '010ccab3e2b920173241ce6f70a83860', 'U03'),
('USR20003', 'Pandu', 'Pandu', '3dba8c643b1dd5da4196b0cc72275df1', 'U03'),
('USR20004', 'Yudha', 'yuda', 'ac9053a8bd7632586c3eb663a6cf15e4', 'U03');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barang`
-- (See below for the actual view)
--
CREATE TABLE `view_barang` (
`nama_barang` varchar(225)
,`nama_lokasi` varchar(225)
,`jumlah_barang` int(11)
,`nama_sumber` varchar(225)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_pinjam`
-- (See below for the actual view)
--
CREATE TABLE `view_pinjam` (
`nama` varchar(225)
,`nama_barang` varchar(225)
,`jml_pinjam` int(11)
,`tgl_pinjam` date
,`tgl_kembali` date
,`kondisi` varchar(225)
);

-- --------------------------------------------------------

--
-- Structure for view `view_barang`
--
DROP TABLE IF EXISTS `view_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barang`  AS SELECT `barang`.`nama_barang` AS `nama_barang`, `lokasi`.`nama_lokasi` AS `nama_lokasi`, `barang`.`jumlah_barang` AS `jumlah_barang`, `sumber_dana`.`nama_sumber` AS `nama_sumber` FROM ((`barang` join `lokasi` on(`barang`.`lokasi` = `lokasi`.`id_lokasi`)) join `sumber_dana` on(`barang`.`sumber_dana` = `sumber_dana`.`id_sumber`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_pinjam`
--
DROP TABLE IF EXISTS `view_pinjam`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pinjam`  AS SELECT `user`.`nama` AS `nama`, `barang`.`nama_barang` AS `nama_barang`, `pinjam_barang`.`jml_pinjam` AS `jml_pinjam`, `pinjam_barang`.`tgl_pinjam` AS `tgl_pinjam`, `pinjam_barang`.`tgl_kembali` AS `tgl_kembali`, `pinjam_barang`.`kondisi` AS `kondisi` FROM ((`pinjam_barang` join `user` on(`pinjam_barang`.`peminjam` = `user`.`id_user`)) join `barang` on(`pinjam_barang`.`barang_pinjam` = `barang`.`id_barang`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `barang_ibfk_1` (`lokasi`),
  ADD KEY `barang_ibfk_2` (`sumber_dana`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `supplier` (`supplier`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `supplier` (`supplier`);

--
-- Indexes for table `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `pinjam_barang`
--
ALTER TABLE `pinjam_barang`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `barang_pinjam` (`barang_pinjam`),
  ADD KEY `peminjam` (`peminjam`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `sumber_dana`
--
ALTER TABLE `sumber_dana`
  ADD PRIMARY KEY (`id_sumber`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `level` (`level`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`sumber_dana`) REFERENCES `sumber_dana` (`id_sumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `pinjam_barang`
--
ALTER TABLE `pinjam_barang`
  ADD CONSTRAINT `pinjam_barang_ibfk_1` FOREIGN KEY (`barang_pinjam`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `pinjam_barang_ibfk_2` FOREIGN KEY (`peminjam`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `level_user` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
