-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2025 at 10:57 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vigenesia`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori_motivasi`
--

CREATE TABLE `kategori_motivasi` (
  `id` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `motivasi`
--

CREATE TABLE `motivasi` (
  `id` int(11) NOT NULL,
  `isi_motivasi` text NOT NULL,
  `iduser` int(11) NOT NULL,
  `tanggal_input` date NOT NULL,
  `tanggal_update` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `motivasi`
--

INSERT INTO `motivasi` (`id`, `isi_motivasi`, `iduser`, `tanggal_input`, `tanggal_update`) VALUES
(26, 'haloo ', 3, '2021-07-21', '0000-00-00'),
(27, 'halo semua', 3, '2021-07-23', '0000-00-00'),
(28, 'ea ea', 4, '2025-01-10', '2025-01-10'),
(29, 'Woii', 4, '2025-01-11', '0000-00-00'),
(30, 'Hallo semua', 6, '2025-01-12', '0000-00-00'),
(31, 'Cobain di postman', 4, '2025-01-12', '0000-00-00'),
(34, 'wkwkwkwkwk', 11, '2025-01-16', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `report_apk`
--

CREATE TABLE `report_apk` (
  `id` int(11) NOT NULL,
  `desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `profesi` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `nama`, `profesi`, `email`, `password`, `role_id`, `is_active`, `tanggal_input`, `modified`) VALUES
(1, 'sriyadi', 'dosen', 'sriyadi.sry@bsi.ac.id', '123', 2, 1, '2021-07-16', '2021-07-16'),
(2, 'affan', 'mahasiswa', 'affan@bsi.ac.id', '321', 2, 1, '2021-07-16', '2021-07-16'),
(3, 'Mahasiswa', 'Mahasiswa', 'koko@id.id', '202cb962ac59075b964b07152d234b70', 2, 1, '2021-07-21', '0000-00-00'),
(4, 'Adi Satria Sejati', 'Front-End Developer', 'adisatriasejati@bsi.ac.id', '25d55ad283aa400af464c76d713c07ad', 2, 1, '2025-01-09', '0000-00-00'),
(6, 'Annisa Rahma P', 'UI-UX Designer', 'AnnisaRahma@bsi.ac.id', '25d55ad283aa400af464c76d713c07ad', 2, 1, '2025-01-12', '0000-00-00'),
(9, 'Renal Saputra P.N', 'Web Developer', 'renalsaputra@bsi.ac.id', '25d55ad283aa400af464c76d713c07ad', 2, 1, '2025-01-12', '0000-00-00'),
(10, 'User Postman', 'Back-end Developer', 'postman123@bsi.ac.id', '25f9e794323b453885f5181f1b624d0b', 2, 1, '2025-01-16', '0000-00-00'),
(11, 'Web', 'Mahasiswa', 'web@bsi.ac.id', '25d55ad283aa400af464c76d713c07ad', 2, 1, '2025-01-16', '0000-00-00'),
(12, 'Mobile', 'Mobile Developer', 'mobile@bsi.ac.id', '25d55ad283aa400af464c76d713c07ad', 2, 1, '2025-01-16', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `motivasi`
--
ALTER TABLE `motivasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iduser` (`iduser`);

--
-- Indexes for table `report_apk`
--
ALTER TABLE `report_apk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `id` (`iduser`,`nama`,`email`,`password`,`role_id`,`is_active`,`tanggal_input`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `motivasi`
--
ALTER TABLE `motivasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `report_apk`
--
ALTER TABLE `report_apk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `motivasi`
--
ALTER TABLE `motivasi`
  ADD CONSTRAINT `motivasi_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
