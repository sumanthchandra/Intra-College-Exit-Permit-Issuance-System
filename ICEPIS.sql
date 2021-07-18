create schema movie;

use movie;

CREATE TABLE `student` (
  `rollno` varchar(10) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `branch` varchar(5) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `valid` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`rollno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `coordinator` (
  `email` varchar(25) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `branch` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `security` (
  `pnumber` int(10) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pass` (
  `gid` int(16) NOT NULL AUTO_INCREMENT,
  `rollno` varchar(10) DEFAULT NULL,
  `pnumber` varchar(10) DEFAULT NULL,
  `reason` varchar(20) DEFAULT NULL,
  `d` date DEFAULT NULL,
  `stat` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



