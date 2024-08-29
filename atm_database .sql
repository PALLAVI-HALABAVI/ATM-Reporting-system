-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `atm database`
--


--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Acc_no` int(20) NOT NULL,
  `Acc_type` varchar(10) DEFAULT NULL,
  `A_C_Id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Acc_no`, `Acc_type`, `A_C_Id`) VALUES
(1267343, 'Savings', 'CU123ER '),
(1721000, 'Current ', 'CU038ER '),
(3854398, ' Demat', 'CU503ER'),
(6280000, 'Current', 'CU023ER '),
(7529000, 'Demat', 'CU933ER'),
(8822000, 'Savings', 'CU838ER'),
(9200018, 'Savings', 'CU001ER');

-- --------------------------------------------------------

--
-- Table structure for table `atm_machine`
--

CREATE TABLE `atm_machine` (
  `ATM_Id` varchar(10) NOT NULL,
  `ATM_Name` varchar(10) DEFAULT NULL,
  `ATM_Add` varchar(10) DEFAULT NULL,
  `ATM_Bankname` varchar(10) DEFAULT NULL,
  `ATM_Branch` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `atm_machine`
--

INSERT INTO `atm_machine` (`ATM_Id`, `ATM_Name`, `ATM_Add`, `ATM_Bankname`, `ATM_Branch`) VALUES
('I028296', 'OBATM_324', 'JP_Nagar', 'ICICI Bank', 'Banglore'),
('I036842', 'ICATM_949', 'Puna', 'Indian Ban', 'Kalupur'),
('I095752', 'ICATM_061', 'Gujarat', 'ICICI Bank', 'LP Savani'),
('T208361', 'OTATM_805', 'Ring RD,MG', 'HDFC Bank', 'Majestic');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Bank_Id` varchar(10) NOT NULL,
  `IFSC_Code` varchar(15) DEFAULT NULL,
  `Bank_Add` varchar(10) DEFAULT NULL,
  `Bank_Name` varchar(10) DEFAULT NULL,
  `B_ATM_Id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`Bank_Id`, `IFSC_Code`, `Bank_Add`, `Bank_Name`, `B_ATM_Id`) VALUES
('HB04302', 'HBBK000328', 'Chennai', 'HDFC Bank', 'H088295'),
('IB03728', 'IBBK0000836', 'Kalupur', 'Indian Ban', 'I036842'),
('ICB00276', 'ICBK0000672', 'Gujarat', 'ICICI Bank', 'I095752'),
('ICB00277', 'ICBK0000259', 'Banglore', 'ICICI Bank', 'I028296');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Branch_Id` varchar(15) NOT NULL,
  `Branch_Name` varchar(15) DEFAULT NULL,
  `Branch_loc` varchar(15) DEFAULT NULL,
  `B_Bank_Id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Branch_Id`, `Branch_Name`, `Branch_loc`, `B_Bank_Id`) VALUES
('BR0092', 'Uttarali', '32th circle nr ', 'ICB00276'),
('BR5282', 'KG BRANCH', 'Udhana', 'HB04302'),
('BR8822', 'JP-Nagar', 'UA Branch', 'IB03728'),
('BT7529', 'JP-Nagar', 'JAYANAGAR', 'ICB00277');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `Card_No` int(16) NOT NULL,
  `Card_Bankname` varchar(10) DEFAULT NULL,
  `Card_CVV` int(3) DEFAULT NULL,
  `Card_ExpiryDate` date DEFAULT NULL,
  `Card_Balance` int(16) DEFAULT NULL,
  `Card_Type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`Card_No`, `Card_Bankname`, `Card_CVV`, `Card_ExpiryDate`, `Card_Balance`, `Card_Type`) VALUES
(3823, 'HDFC Bank', 751, '2024-07-09', 29950, 'Debit'),
(6682, 'ICICI Bank', 234, '2023-09-11', 50125, ' Debit'),
(8721, 'Indian Ban', 934, '2024-09-27', 11890, 'Credit'),
(8783, 'Axis Bank', 591, '2024-11-08', 9764, 'Credit');

-- --------------------------------------------------------

--
-- Table structure for table `currenta`
--

CREATE TABLE `currenta` (
  `Acc_no` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currenta`
--

INSERT INTO `currenta` (`Acc_no`) VALUES
(1721000),
(6280000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_Id` varchar(10) NOT NULL,
  `C_add` varchar(10) DEFAULT NULL,
  `F_name` varchar(20) DEFAULT NULL,
  `M_name` varchar(20) DEFAULT NULL,
  `L_name` varchar(20) DEFAULT NULL,
  `C_Card_No` int(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_Id`, `C_add`, `F_name`, `M_name`, `L_name`, `C_Card_No`) VALUES
('CU001ER', 'Dharwad', 'Arvind', 'Devdutt', 'Sinha', 6682),
('CU023ER', 'Dharwad', 'Priya', 'M', 'H', 9372),
('CU838ER', 'Hubbli', 'Gaurav', 'A', 'Patil', 8721),
('CU933ER', 'Banglore', 'Jhon', 'R', 'S', 3823);

-- --------------------------------------------------------

--
-- Table structure for table `customerphone`
--

CREATE TABLE `customerphone` (
  `P_C_Id` varchar(10) NOT NULL,
  `C_phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customerphone`
--

INSERT INTO `customerphone` (`P_C_Id`, `C_phone`) VALUES
('CU001ER', '9949996227'),
('CU023ER', '9182936825'),
('CU038ER', '9079484037'),
('CU503ER', '7288928276'),
('CU838ER', '9229737388'),
('CU933ER', '8140727253');

-- --------------------------------------------------------

--
-- Table structure for table `demat`
--

CREATE TABLE `demat` (
  `Acc_no` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demat`
--

INSERT INTO `demat` (`Acc_no`) VALUES
(3854398),
(7529000);

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `Card_No` int(10) NOT NULL,
  `Card_CVV` int(10) NOT NULL,
  `Card_Balance` int(10) NOT NULL,
  `Amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `Acc_no` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`Acc_no`) VALUES
(1267343),
(8822000),
(9200018);

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `Transaction_Id` varchar(10) DEFAULT NULL,
  `Card_No` int(16) DEFAULT NULL,
  `Amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp`
--

INSERT INTO `temp` (`Transaction_Id`, `Card_No`, `Amount`) VALUES
('59', 3823, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `Transaction_Id` varchar(10) NOT NULL,
  `Transaction_Name` varchar(10) DEFAULT NULL,
  `Transaction_status` varchar(10) DEFAULT NULL,
  `Transaction_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`Transaction_Id`, `Transaction_Name`, `Transaction_status`, `Transaction_type`) VALUES
('', 'deposited', 'COMPLETED', 'DEPOSIT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Acc_no`);

--
-- Indexes for table `atm_machine`
--
ALTER TABLE `atm_machine`
  ADD PRIMARY KEY (`ATM_Id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`Bank_Id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`Branch_Id`),
  ADD KEY `B_Bank_Id` (`B_Bank_Id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`Card_No`);

--
-- Indexes for table `currenta`
--
ALTER TABLE `currenta`
  ADD PRIMARY KEY (`Acc_no`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_Id`);

--
-- Indexes for table `customerphone`
--
ALTER TABLE `customerphone`
  ADD PRIMARY KEY (`P_C_Id`);

--
-- Indexes for table `demat`
--
ALTER TABLE `demat`
  ADD PRIMARY KEY (`Acc_no`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`Acc_no`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`Transaction_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`B_Bank_Id`) REFERENCES `bank` (`Bank_Id`);

--
-- Constraints for table `currenta`
--
ALTER TABLE `currenta`
  ADD CONSTRAINT `currenta_ibfk_1` FOREIGN KEY (`Acc_no`) REFERENCES `account` (`Acc_no`);

--
-- Constraints for table `demat`
--
ALTER TABLE `demat`
  ADD CONSTRAINT `demat_ibfk_1` FOREIGN KEY (`Acc_no`) REFERENCES `account` (`Acc_no`);

--
-- Constraints for table `savings`
--
ALTER TABLE `savings`
  ADD CONSTRAINT `savings_ibfk_1` FOREIGN KEY (`Acc_no`) REFERENCES `account` (`Acc_no`);
COMMIT;

