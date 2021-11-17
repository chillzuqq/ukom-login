-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Nov 2021 pada 10.06
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ukom`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahbarang` (IN `nama` VARCHAR(225), IN `spek` TEXT, IN `lokasi` CHAR(4), IN `kondisi` VARCHAR(20), IN `jumlah` INT, IN `sumber` CHAR(4))  BEGIN
DECLARE getkode CHAR(8) DEFAULT 'BRG00001';
DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING ROLLBACK;
START TRANSACTION;
SET getkode = getnewid();
INSERT INTO barang VALUES(getkode, nama, spek, lokasi, kondisi, jumlah, sumber);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahlokasi` (`nama` VARCHAR(255), `penanggung_jawab` VARCHAR(225), `ket` TEXT)  BEGIN
DECLARE getkodelokasi CHAR(4) DEFAULT 'R001';
DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING ROLLBACK;
START TRANSACTION;
SET getkodelokasi = getnewlokasi();
INSERT INTO lokasi VALUES(getkodelokasi, nama, penanggung_jawab, ket);
COMMIT;
END$$

--
-- Fungsi
--
CREATE DEFINER=`root`@`localhost` FUNCTION `getnewid` () RETURNS CHAR(8) CHARSET utf8mb4 BEGIN
DECLARE kodeterakhir CHAR(8) DEFAULT 'BRG10001';
DECLARE kodeangka CHAR(5) DEFAULT '00000';
DECLARE kodebaru CHAR(8) DEFAULT 'BRG00000';
SELECT MAX(id_barang) INTO kodeterakhir FROM barang;
SET kodeangka = SUBSTR(kodeterakhir, 4, 5);
SET kodeangka = kodeangka + 1;
SET kodebaru = CONCAT("BRG",kodeangka);
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `getnewlokasi` () RETURNS CHAR(4) CHARSET utf8mb4 BEGIN
DECLARE kode_terakhir CHAR(4) DEFAULT 'R001';
DECLARE kode_angka CHAR(3) DEFAULT '000';
DECLARE kode_baru CHAR(4) DEFAULT 'R000';
SELECT MAX(id_lokasi) INTO kode_terakhir FROM lokasi;
SET kode_angka = SUBSTR(kode_terakhir, 2, 3);
SET kode_angka = LPAD(kode_angka + 1, 3, 0);
SET kode_baru = CONCAT("R", kode_angka);
RETURN kode_baru;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(8) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `spesifikasi` text NOT NULL,
  `lokasi` char(4) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `sumber_dana` char(4) DEFAULT NULL,
  `gambar` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `spesifikasi`, `lokasi`, `kondisi`, `jumlah_barang`, `sumber_dana`, `gambar`) VALUES
('BRG10001', 'Kursi Siswa', 'Chitose', 'R001', 'Baik', 36, 'S002', 'kursi_siswa.png'),
('BRG10002', 'Kursi Siswa', 'Kursi Lipat', 'R002', 'Rusak', 36, 'S002', 'kursi_siswa.png'),
('BRG10003', 'Kursi Siswa', 'Chitose', 'R003', 'Baik', 36, 'S002', 'kursi_siswa.png'),
('BRG10004', 'Kursi Siswa', 'Chitose', 'R004', 'Baik', 36, 'S002', 'kursi_siswa.png'),
('BRG20001', 'PC Rakitan', 'Intel celeron 2MB', 'R001', 'Baik', 24, 'S001', 'pc.png'),
('BRG20002', 'PC Build in', 'Intel quad core 2MB', 'R001', 'Rusak', 6, 'S002', 'pc.png'),
('BRG20003', 'Laptop', 'Lenovo E550 core i7', 'R002', 'Baik', 23, 'S003', '1637027268_406e7df0511160040d3a.jpeg'),
('BRG20004', 'Laptop', 'Acer intel Core i3', 'R002', 'Baik', 30, 'S002', 'laptop_acer.jpg'),
('BRG20005', 'PC Build in', 'Dell optiplex core i7', 'R003', 'Baik', 36, 'S003', 'pc.png'),
('BRG20006', 'PC Rakitan', 'Intel core i5', 'R004', 'Baik', 36, 'S002', 'pc.png'),
('BRG20007', 'PC Build in', 'HP core i7 gen10', 'R005', 'Baik', 10, 'S005', 'pc.png'),
('BRG20008', 'Tab', 'Samsung SM-T295', 'R001', 'Baik', 36, 'S005', 'tab.jpeg'),
('BRG20009', 'Tab', 'Samsung SM-T295', 'R002', 'Baik', 36, 'S005', 'tab.jpeg'),
('BRG20010', 'Tab', 'Samsung SM-T295', 'R003', 'Baik', 36, 'S005', 'tab.jpeg'),
('BRG20011', 'Tab', 'Samsung SM-T295', 'R004', 'Baik', 36, 'S005', 'tab.jpeg'),
('BRG20012', 'Tab', 'Samsung SM-T295', 'R005', 'Baik', 36, 'S005', 'tab.jpeg'),
('BRG20013', 'USB Lan Converter', 'TP-Link UE300', 'R001', 'Baik', 36, 'S004', 'usb.jpg'),
('BRG20014', 'Mikrotik', 'RB750', 'R003', 'Baik', 36, 'S004', 'mikrotik.jpg'),
('BRG20015', 'Camera DSLR', 'Canon D60', 'R005', 'Baik', 16, 'S003', 'camera.jpeg'),
('BRG20016', 'Lighting Set', 'Troning Lighting Set', 'R005', 'Baik', 2, 'S004', 'lighting.jpeg'),
('BRG20017', 'Tripod', 'Takara', 'R005', 'Baik', 10, 'S004', 'tripod.jpg'),
('BRG20018', 'Infocus', 'IN114v', 'R001', 'baik', 24, 'S003', 'infocus.jpg'),
('BRG20019', 'Camera 2', 'DSLR', 'R001', 'baik', 10, 'S002', '1637034531_b2c5b0182568b4acc383.jpeg');

--
-- Trigger `barang`
--
DELIMITER $$
CREATE TRIGGER `trigger_insert_barang_stok_marselli_xiirpla` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
DECLARE jml_keluar INT DEFAULT 0;
DECLARE total_barang INT DEFAULT 0;
SET total_barang = NEW.jumlah_barang - jml_keluar;
INSERT INTO stok VALUES(NEW.id_barang, NEW.jumlah_barang, jml_keluar, total_barang);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_log_delete_barang_marselli_xiirpla` BEFORE DELETE ON `barang` FOR EACH ROW BEGIN
INSERT INTO barang_log VALUES(0, 'Delete Data', OLD.nama_barang, OLD.spesifikasi, OLD.lokasi, OLD.kondisi, OLD.jumlah_barang, OLD.sumber_dana, NOW());
DELETE FROM stok WHERE id_barang = OLD.id_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_log_insert_barang_marselli_xiirpla` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
INSERT INTO barang_log(id_log, nama_event, nama_barang, spesifikasi, lokasi, kondisi, jumlah_barang, sumber_dana, waktu_event)
VALUES(id_log, 'tambah', NEW.nama_barang, NEW.spesifikasi, NEW.lokasi, NEW.kondisi, NEW.jumlah_barang, NEW.sumber_dana, now());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_log_update_barang_marselli_xiirpla` BEFORE UPDATE ON `barang` FOR EACH ROW BEGIN
INSERT INTO barang_log VALUES(0, 'Edit Data', NEW.nama_barang, NEW.spesifikasi, NEW.lokasi, NEW.kondisi, NEW.jumlah_barang, NEW.sumber_dana, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang` char(8) NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jml_keluar` int(11) NOT NULL,
  `supplier` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_keluar`
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
-- Struktur dari tabel `barang_log`
--

CREATE TABLE `barang_log` (
  `id_log` int(11) NOT NULL,
  `nama_event` varchar(10) DEFAULT NULL,
  `nama_barang` varchar(225) DEFAULT NULL,
  `spesifikasi` text DEFAULT NULL,
  `lokasi` char(4) DEFAULT NULL,
  `kondisi` varchar(20) DEFAULT NULL,
  `jumlah_barang` int(11) DEFAULT NULL,
  `sumber_dana` char(4) DEFAULT NULL,
  `waktu_event` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_log`
--

INSERT INTO `barang_log` (`id_log`, `nama_event`, `nama_barang`, `spesifikasi`, `lokasi`, `kondisi`, `jumlah_barang`, `sumber_dana`, `waktu_event`) VALUES
(1, 'Edit Data', 'PC Build in', 'Dell optiplex core i7', 'R003', 'Baik', 36, 'S003', '2021-11-16 10:19:37'),
(2, 'Edit Data', 'PC Rakitan', 'Intel core i5', 'R004', 'Baik', 36, 'S002', '2021-11-16 10:19:45'),
(3, 'Edit Data', 'PC Build in', 'HP core i7 gen10', 'R005', 'Baik', 10, 'S005', '2021-11-16 10:21:00'),
(4, 'Edit Data', 'Tab', 'Samsung SM-T295', 'R001', 'Baik', 36, 'S005', '2021-11-16 10:21:17'),
(5, 'Delete Dat', 'Meja Siswa', 'kayu jati', 'R003', 'baik', 36, 'S002', '2021-11-16 10:47:51'),
(6, 'tambah', 'Camera 2', 'DSLR', 'R001', 'baik', 10, 'S002', '2021-11-16 10:48:51'),
(7, 'tambah', 'Camera 3', 'DSLR', 'R001', 'baik', 10, 'S002', '2021-11-16 11:45:56'),
(8, 'Edit Data', 'Camera 3', 'DSLR', 'R001', 'baik', 10, 'S002', '2021-11-16 11:46:40'),
(9, 'Delete Dat', 'Camera 3', 'DSLR', 'R001', 'baik', 10, 'S002', '2021-11-16 11:46:48'),
(10, 'Edit Data', 'Tab', 'Samsung SM-T295', 'R002', 'Baik', 36, 'S005', '2021-11-16 15:50:37'),
(11, 'Edit Data', 'Tab', 'Samsung SM-T295', 'R003', 'Baik', 36, 'S005', '2021-11-16 15:50:48'),
(12, 'Edit Data', 'Tab', 'Samsung SM-T295', 'R004', 'Baik', 36, 'S005', '2021-11-16 15:51:00'),
(13, 'Edit Data', 'Tab', 'Samsung SM-T295', 'R005', 'Baik', 36, 'S005', '2021-11-16 15:51:11'),
(14, 'Edit Data', 'USB Lan Converter', 'TP-Link UE300', 'R001', 'Baik', 36, 'S004', '2021-11-16 15:52:21'),
(15, 'Edit Data', 'Mikrotik', 'RB750', 'R003', 'Baik', 36, 'S004', '2021-11-16 15:54:52'),
(16, 'Edit Data', 'Camera DSLR', 'Canon D60', 'R005', 'Baik', 16, 'S003', '2021-11-16 15:55:50'),
(17, 'Edit Data', 'Lighting Set', 'Troning Lighting Set', 'R005', 'Baik', 2, 'S004', '2021-11-16 15:57:08'),
(18, 'Edit Data', 'Tripod', 'Takara', 'R005', 'Baik', 10, 'S004', '2021-11-16 16:00:05'),
(19, 'Edit Data', 'Infocus', 'IN114v', 'R001', 'baik', 24, 'S003', '2021-11-16 16:04:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang` char(8) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jml_masuk` int(11) NOT NULL,
  `supplier` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_masuk`
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
-- Struktur dari tabel `level_user`
--

CREATE TABLE `level_user` (
  `id_level` char(3) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `level_user`
--

INSERT INTO `level_user` (`id_level`, `nama`, `keterangan`) VALUES
('U01', 'Administrator', ' '),
('U02', 'Manajemen', ' '),
('U03', 'Peminjam', ' ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` char(4) NOT NULL,
  `nama_lokasi` varchar(225) NOT NULL,
  `penanggung_jawab` varchar(225) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lokasi`
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
-- Struktur dari tabel `pinjam_barang`
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
-- Dumping data untuk tabel `pinjam_barang`
--

INSERT INTO `pinjam_barang` (`id_pinjam`, `peminjam`, `tgl_pinjam`, `barang_pinjam`, `jml_pinjam`, `tgl_kembali`, `kondisi`) VALUES
('1', 'USR00004', '2021-10-15', 'BRG20013', 2, '0000-00-00', ''),
('2', 'USR20001', '2018-05-15', 'BRG20008', 1, '2018-06-15', 'Baik'),
('3', 'USR20002', '2018-05-15', 'BRG20003', 1, '2018-06-15', 'Baik'),
('4', 'USR00002', '2019-07-15', 'BRG20013', 1, '0000-00-00', ''),
('5', 'USR00001', '2019-08-24', 'BRG20004', 1, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `id_barang` char(8) NOT NULL,
  `jml_masuk` int(11) NOT NULL,
  `jml_keluar` int(11) NOT NULL,
  `total_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stok`
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
-- Struktur dari tabel `sumber_dana`
--

CREATE TABLE `sumber_dana` (
  `id_sumber` char(4) NOT NULL,
  `nama_sumber` varchar(225) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sumber_dana`
--

INSERT INTO `sumber_dana` (`id_sumber`, `nama_sumber`, `keterangan`) VALUES
('S001', 'Komite 07/09', 'Bantuan Komite 2007/2009'),
('S002', 'Komite 13', 'Bantuan Komite 2013'),
('S003', 'Sed T-vet', 'Bantuan Kerja Sama Indonesia Jerman'),
('S004', 'BOSDA 2018', 'Bantuan Operasional Sekolah Daerah Jawa\r\nBarat'),
('S005', 'BOPD 2020', 'Bantuan Provinsi Jawa Barat 2020');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` char(8) NOT NULL,
  `nama_supplier` varchar(225) NOT NULL,
  `alamat_supplier` text NOT NULL,
  `telp_supplier` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telp_supplier`) VALUES
('SPR001', 'INFORMA', 'Mal Metropolitan, Jl.Kh Noer Ali No 1', '0812-9604-\r\n60'),
('SPR002', 'MitraKantor.com', 'Jl. I Gusti Ngurah Rai No 20 Jakarta\r\nTimur', '(021) 22862086'),
('SPR003', 'bhinneka.com', 'Jl. Gn. Sahari No.73-74, RT.9/RW.7, Gunung\r\nSahari Selatan, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta', '(021) 29292828'),
('SPR004', 'World Computer', 'Harco Mangga Dua Plaza, Jalan Arteri Jl.\r\nMangga Dua Raya No.17, RW.11, Mangga Dua Sel., Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah\r\nKhusus Ibukota Jakarta 10730', '(021) 6125266'),
('SPR005', 'Aneka Foto Metro Atom', 'Metro Atom Plaza Jalan Samanhudi\r\nBlok AKS No. 19, RT.20/RW.3, Ps. Baru, Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus\r\nIbukota Jakarta 10710', '(021) 3455544');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` char(8) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `level` char(20) NOT NULL,
  `password` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `level`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'adminwares@gmail.com', 'admin', '$2y$10$o2aKPQ1OolDbblRTfgAqduHVKY39JpUtaDVQQ4ZMJ.uhSQvz0Gk5q', '2021-11-10 00:57:39', '2021-11-11 13:12:06'),
(2, 'Deden Deendi', 'toolman=RPL@gmail.com', 'supplier', '$2y$10$lA2JVSmWMX8UqVi/L5u1xeSb.h49wPrjTzYOkS2tKoL9J1vb.3FS2', '2021-11-10 00:57:39', '2021-11-11 13:12:06');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `barang_log`
--
ALTER TABLE `barang_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indeks untuk tabel `pinjam_barang`
--
ALTER TABLE `pinjam_barang`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indeks untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `sumber_dana`
--
ALTER TABLE `sumber_dana`
  ADD PRIMARY KEY (`id_sumber`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang_log`
--
ALTER TABLE `barang_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
