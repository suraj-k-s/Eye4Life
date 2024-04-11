-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 07:00 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_eye`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(1000) NOT NULL,
  `admin_email` text NOT NULL,
  `admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'Doyal Eldho', 'doyaleldho18@gmail.com', 'Doyal3648');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bloodtype`
--

CREATE TABLE `tbl_bloodtype` (
  `bloodtype_id` int(10) NOT NULL,
  `blood_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bloodtype`
--

INSERT INTO `tbl_bloodtype` (`bloodtype_id`, `blood_type`) VALUES
(5, 'B+'),
(8, 'A'),
(9, 'A+'),
(10, 'B-');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_case`
--

CREATE TABLE `tbl_case` (
  `case_id` int(11) NOT NULL,
  `nominee_id` int(100) NOT NULL,
  `case_hospitalname` varchar(100) NOT NULL,
  `case_hospitaladdress` varchar(1000) NOT NULL,
  `case_hospitalcontact` varchar(1000) NOT NULL,
  `case_deathcertificate` varchar(1000) NOT NULL,
  `case_status` int(11) NOT NULL DEFAULT 0,
  `case_regdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_case`
--

INSERT INTO `tbl_case` (`case_id`, `nominee_id`, `case_hospitalname`, `case_hospitaladdress`, `case_hospitalcontact`, `case_deathcertificate`, `case_status`, `case_regdate`) VALUES
(1, 1, 'Rajagiri', 'Aluva', '2565678', 'Hproof_1128.jpg', 1, '2024-02-23'),
(2, 8, 'MOSC', 'Puthencruz ', '2878765', 'Hproof_2083.jpg', 1, '2024-02-27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(10) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(1, 'Left Eye'),
(2, 'Right Eye'),
(4, 'Both Eyes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checkupappointment`
--

CREATE TABLE `tbl_checkupappointment` (
  `appointment_id` int(11) NOT NULL,
  `donor_id` int(100) NOT NULL,
  `appointment_todate` date NOT NULL,
  `appointment_bookeddate` date NOT NULL,
  `hospital_id` int(100) NOT NULL,
  `appointment_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_checkupappointment`
--

INSERT INTO `tbl_checkupappointment` (`appointment_id`, `donor_id`, `appointment_todate`, `appointment_bookeddate`, `hospital_id`, `appointment_status`) VALUES
(1, 1, '2024-02-16', '2024-02-12', 1, 1),
(2, 5, '2024-02-28', '2024-03-01', 1, 0),
(7, 1, '2024-03-01', '2024-03-21', 1, 2),
(8, 4, '2024-03-01', '2024-03-26', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(100) NOT NULL,
  `complaint_subject` text NOT NULL,
  `complaint_content` text NOT NULL,
  `complaint_reply` text NOT NULL DEFAULT 'Not yet Replied',
  `user_id` int(100) NOT NULL DEFAULT 0,
  `hosp_id` int(100) NOT NULL DEFAULT 0,
  `complaint_status` int(11) DEFAULT 0,
  `notification_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint_subject`, `complaint_content`, `complaint_reply`, `user_id`, `hosp_id`, `complaint_status`, `notification_status`) VALUES
(1, 'abc', 'abcdfg\r\n', 'Not yet Replied', 1, 0, NULL, 1),
(2, 'hello', 'no problem', 'Not yet Replied', 0, 1, NULL, 1),
(3, 'efg', 'efghdjd', 'Not yet Replied', 0, 1, NULL, 1),
(4, 'hii', 'hello\r\n', ' ok set', 1, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`contact_id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'dddff', 'sss@ygcvg', 'gcvygv', 'jhvhg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(10) NOT NULL,
  `district_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(1, 'Ekm'),
(2, 'Kollam'),
(4, 'Alappuzha'),
(5, 'Thiruvananthapuram');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_donation`
--

CREATE TABLE `tbl_donation` (
  `donation_id` int(11) NOT NULL,
  `donation_date` date NOT NULL,
  `donation_name` varchar(1000) NOT NULL,
  `donation_contact` varchar(100) NOT NULL,
  `donation_amount` int(100) NOT NULL,
  `donation_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_donation`
--

INSERT INTO `tbl_donation` (`donation_id`, `donation_date`, `donation_name`, `donation_contact`, `donation_amount`, `donation_email`) VALUES
(1, '2024-04-11', 'Suraj k S', '876543299', 10000, 'surajks28101999@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_donor`
--

CREATE TABLE `tbl_donor` (
  `donor_id` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `bloodtype_id` int(100) NOT NULL,
  `donor_gender` varchar(100) NOT NULL,
  `donor_dob` text NOT NULL,
  `donor_age` int(100) NOT NULL,
  `donor_registrationdate` text NOT NULL,
  `donor_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_donor`
--

INSERT INTO `tbl_donor` (`donor_id`, `user_id`, `bloodtype_id`, `donor_gender`, `donor_dob`, `donor_age`, `donor_registrationdate`, `donor_status`) VALUES
(1, 1, 9, 'Male', '18-01-2003', 20, '2024-01-26', 3),
(4, 3, 5, 'Male', '07-07-2003', 20, '2024-02-27', 1),
(5, 5, 10, 'Male', '15-06-1997', 27, '2024-02-28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_content` varchar(1000) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hospital`
--

CREATE TABLE `tbl_hospital` (
  `hosp_id` int(11) NOT NULL,
  `hosp_name` varchar(100) NOT NULL,
  `hosp_email` text NOT NULL,
  `hosp_contact` text NOT NULL,
  `hosp_address` text NOT NULL,
  `hosp_logo` text NOT NULL,
  `hosp_proof` text NOT NULL,
  `hosp_password` text NOT NULL,
  `hosp_status` int(100) DEFAULT 0,
  `place_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_hospital`
--

INSERT INTO `tbl_hospital` (`hosp_id`, `hosp_name`, `hosp_email`, `hosp_contact`, `hosp_address`, `hosp_logo`, `hosp_proof`, `hosp_password`, `hosp_status`, `place_id`) VALUES
(1, 'Future Care', 'doyal@gmail.com', '9188096252', 'PO junction,Muvattupuzha', 'Hphoto_1291.jpg', 'Hproof_1262.jpg', 'doyal@123', 1, 6),
(2, 'Rajgiri', 'rajgiri@gmail.com', '9188096252', 'Aluva Junction', 'Hphoto_2094.jpg', 'Hproof_1128.jpg', 'rajgiri@123', 1, 7),
(3, 'Sanjoe', 'sanjoe@gmail.com', '9188097653', 'Perumbavoor', 'Hphoto_1921.jpg', 'Hproof_1833.avif', 'sanjoe@123', 0, 6),
(4, 'Vathiyayath', 'vathiyayath@gmail.com', '9624563218', 'Perumbavoor', 'Hphoto_2027.jpg', 'Hproof_1428.jpg', 'vathiyayath@123', 0, 6),
(5, 'Panjayath Hospital', 'panj@gmail.com', '8564321678', 'Junction road,\r\nKollam\r\n', 'Hphoto_1165.jpg', 'Hproof_1522.jpg', 'panj@123', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_match`
--

CREATE TABLE `tbl_match` (
  `match_id` int(11) NOT NULL,
  `donor_id` int(100) NOT NULL,
  `recipient_id` int(100) NOT NULL,
  `hosp_id` int(100) NOT NULL,
  `match_date` date NOT NULL,
  `match_time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_match`
--

INSERT INTO `tbl_match` (`match_id`, `donor_id`, `recipient_id`, `hosp_id`, `match_date`, `match_time`) VALUES
(14, 1, 4, 2, '2024-03-08', '14:54:19'),
(15, 1, 4, 2, '2024-03-08', '14:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nominee`
--

CREATE TABLE `tbl_nominee` (
  `nominee_id` int(11) NOT NULL,
  `nominee_name` varchar(100) NOT NULL,
  `nominee_contact` varchar(100) NOT NULL,
  `nominee_email` varchar(1000) NOT NULL,
  `nominee_relationship` varchar(100) NOT NULL,
  `nominee_address` varchar(100) NOT NULL,
  `nominee_photo` text NOT NULL,
  `donor_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_nominee`
--

INSERT INTO `tbl_nominee` (`nominee_id`, `nominee_name`, `nominee_contact`, `nominee_email`, `nominee_relationship`, `nominee_address`, `nominee_photo`, `donor_id`) VALUES
(1, 'Eldho Paul', '9188096252', 'eldho@gmail.com', 'Friend', 'Vadakkan(H)vengola', 'Hproof_1179.jpg', 1),
(4, 'Alwin', '9876543456', 'doyaleldho18@gmail.com', 'friend', 'Varapetty,kothamangalam', 'Hproof_1259.jpg', 1),
(7, 'Akhil Babu', '9876754324', 'akhilbabu@gmail.com', 'Friend', 'Meenpara P.O Choondi', 'Hproof_1648.jpg', 4),
(8, 'Dennis Skaria', '9654532123', 'dennisskaria@gmail.com', 'Cousin Brother', 'Puthencruz P.O,Abc road', 'Hproof_2106.png', 4),
(17, 'Doyal Eldho', '8977654345', 'doyaleldho18@gmail.com', 'Doyal@123', 'Vadakkan(H)', 'Hproof_2026.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(10) NOT NULL,
  `place_name` varchar(100) NOT NULL,
  `district_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(2, 'Muvattupuzha', 1),
(6, 'Perumbavoor', 1),
(7, 'Amrithapuri', 2),
(8, 'Aluva', 1),
(9, 'Piravom', 1),
(10, 'Adichanalloor', 2),
(11, 'Elampalloor', 2),
(12, 'Kallada', 2),
(13, 'Kaloor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recipient`
--

CREATE TABLE `tbl_recipient` (
  `recipient_id` int(11) NOT NULL,
  `recipient_gender` varchar(100) NOT NULL,
  `recipient_dob` text NOT NULL,
  `recipient_age` int(100) NOT NULL,
  `bloodtype_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `recipient_regdate` text NOT NULL,
  `recipient_medicalhistory` text NOT NULL,
  `recipient_treatmenthsptl` varchar(1000) NOT NULL,
  `recipient_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_recipient`
--

INSERT INTO `tbl_recipient` (`recipient_id`, `recipient_gender`, `recipient_dob`, `recipient_age`, `bloodtype_id`, `user_id`, `recipient_regdate`, `recipient_medicalhistory`, `recipient_treatmenthsptl`, `recipient_status`) VALUES
(4, 'Male', '12-12-2002', 21, 9, 5, '2024-02-24', 'Hproof_1681.jpg', 'MOSC Kolenchery', 1),
(5, 'Male', '03-09-2003', 21, 5, 4, '2024-02-27', 'Hproof_1077.jpg', 'Rajagiri,Aluva', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_result`
--

CREATE TABLE `tbl_result` (
  `result_id` int(11) NOT NULL,
  `report` text NOT NULL,
  `docter_name` varchar(100) NOT NULL,
  `donor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_result`
--

INSERT INTO `tbl_result` (`result_id`, `report`, `docter_name`, `donor_id`) VALUES
(2, 'Hphoto_1545.jpg', 'Dr Paul Kurian', 1),
(3, 'Hphoto_1019.jpg', 'Dr David James', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(100) NOT NULL,
  `user_name` varchar(1000) NOT NULL,
  `user_address` text NOT NULL,
  `user_contact` text NOT NULL,
  `user_email` text NOT NULL,
  `user_photo` text NOT NULL,
  `user_place` text NOT NULL,
  `user_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_address`, `user_contact`, `user_email`, `user_photo`, `user_place`, `user_password`) VALUES
(1, 'Doyal Eldho', 'Near Canal road,Vengola Perumbavoor', '9788656743', 'doyaleldho18@gmail.com', 'Hphoto_2058.jpg', '6', 'Doyal@18'),
(3, 'Aiden Reji', 'Near Temple road Chootanikara', '8765432345', 'aidenreji@gmail.com', 'Hphoto_1163.jpg', '6', 'Aiden@123'),
(4, 'Vinu', 'Pathanamthitta', '9788656746', 'vinu@gmail.com', 'Hphoto_2051.jpg', '7', 'Vinu@123'),
(5, 'Sarath KB', 'Near Thottumukalpedia,Muvattupuzha', '9788656785', 'anjanasarathproton@gmail.com', 'Hphoto_1990.png', '9', 'Sarath@123'),
(6, 'Suraj', 'Near Vellorkunneam,Muvattupuzha', '9876543212', 'suraj@gmail.com', 'Hphoto_1655.jpg', '2', 'Suraj@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_bloodtype`
--
ALTER TABLE `tbl_bloodtype`
  ADD PRIMARY KEY (`bloodtype_id`);

--
-- Indexes for table `tbl_case`
--
ALTER TABLE `tbl_case`
  ADD PRIMARY KEY (`case_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_checkupappointment`
--
ALTER TABLE `tbl_checkupappointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_donation`
--
ALTER TABLE `tbl_donation`
  ADD PRIMARY KEY (`donation_id`);

--
-- Indexes for table `tbl_donor`
--
ALTER TABLE `tbl_donor`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_hospital`
--
ALTER TABLE `tbl_hospital`
  ADD PRIMARY KEY (`hosp_id`);

--
-- Indexes for table `tbl_match`
--
ALTER TABLE `tbl_match`
  ADD PRIMARY KEY (`match_id`);

--
-- Indexes for table `tbl_nominee`
--
ALTER TABLE `tbl_nominee`
  ADD PRIMARY KEY (`nominee_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_recipient`
--
ALTER TABLE `tbl_recipient`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `tbl_result`
--
ALTER TABLE `tbl_result`
  ADD PRIMARY KEY (`result_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_bloodtype`
--
ALTER TABLE `tbl_bloodtype`
  MODIFY `bloodtype_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_case`
--
ALTER TABLE `tbl_case`
  MODIFY `case_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_checkupappointment`
--
ALTER TABLE `tbl_checkupappointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_donation`
--
ALTER TABLE `tbl_donation`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_donor`
--
ALTER TABLE `tbl_donor`
  MODIFY `donor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_hospital`
--
ALTER TABLE `tbl_hospital`
  MODIFY `hosp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_match`
--
ALTER TABLE `tbl_match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_nominee`
--
ALTER TABLE `tbl_nominee`
  MODIFY `nominee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_recipient`
--
ALTER TABLE `tbl_recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_result`
--
ALTER TABLE `tbl_result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
