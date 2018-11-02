/*
Navicat MySQL Data Transfer

Source Server         : a
Source Server Version : 50154
Source Host           : localhost:3306
Source Database       : hms

Target Server Type    : MYSQL
Target Server Version : 50154
File Encoding         : 65001

Date: 2013-12-10 15:53:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `beds`
-- ----------------------------
DROP TABLE IF EXISTS `beds`;
CREATE TABLE `beds` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`,`RoomID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `beds_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room_master` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of beds
-- ----------------------------
INSERT INTO `beds` VALUES ('32', '1', '42');
INSERT INTO `beds` VALUES ('35', '1', '43');
INSERT INTO `beds` VALUES ('43', '1', '55');
INSERT INTO `beds` VALUES ('50', '1', '62');
INSERT INTO `beds` VALUES ('34', '2', '42');
INSERT INTO `beds` VALUES ('44', 'A', '58');
INSERT INTO `beds` VALUES ('53', 'a', '65');
INSERT INTO `beds` VALUES ('63', 'A', '78');
INSERT INTO `beds` VALUES ('54', 'aa', '65');
INSERT INTO `beds` VALUES ('61', 'ABC', '72');
INSERT INTO `beds` VALUES ('45', 'B', '58');
INSERT INTO `beds` VALUES ('64', 'B', '78');
INSERT INTO `beds` VALUES ('8', 'b1', '14');
INSERT INTO `beds` VALUES ('9', 'b2', '14');
INSERT INTO `beds` VALUES ('31', 'b3', '14');
INSERT INTO `beds` VALUES ('18', 'bed 1', '15');
INSERT INTO `beds` VALUES ('16', 'bed 1', '26');
INSERT INTO `beds` VALUES ('20', 'bed 1', '31');
INSERT INTO `beds` VALUES ('21', 'bed 1', '33');
INSERT INTO `beds` VALUES ('24', 'bed 1', '35');
INSERT INTO `beds` VALUES ('26', 'bed 1', '38');
INSERT INTO `beds` VALUES ('28', 'bed 1', '40');
INSERT INTO `beds` VALUES ('36', 'bed 1', '45');
INSERT INTO `beds` VALUES ('39', 'bed 1', '50');
INSERT INTO `beds` VALUES ('41', 'bed 1', '51');
INSERT INTO `beds` VALUES ('55', 'bed 1', '68');
INSERT INTO `beds` VALUES ('58', 'bed 1', '71');
INSERT INTO `beds` VALUES ('66', 'Bed 1', '80');
INSERT INTO `beds` VALUES ('68', 'Bed 1', '81');
INSERT INTO `beds` VALUES ('70', 'bed 1', '84');
INSERT INTO `beds` VALUES ('73', 'bed 1', '86');
INSERT INTO `beds` VALUES ('76', 'bed 1', '89');
INSERT INTO `beds` VALUES ('78', 'Bed 1', '92');
INSERT INTO `beds` VALUES ('80', 'bed 1', '94');
INSERT INTO `beds` VALUES ('84', 'Bed 1', '96');
INSERT INTO `beds` VALUES ('19', 'bed 2', '15');
INSERT INTO `beds` VALUES ('17', 'bed 2', '26');
INSERT INTO `beds` VALUES ('22', 'bed 2', '33');
INSERT INTO `beds` VALUES ('25', 'bed 2', '35');
INSERT INTO `beds` VALUES ('27', 'bed 2', '38');
INSERT INTO `beds` VALUES ('30', 'bed 2', '40');
INSERT INTO `beds` VALUES ('37', 'bed 2', '45');
INSERT INTO `beds` VALUES ('40', 'bed 2', '50');
INSERT INTO `beds` VALUES ('42', 'bed 2', '51');
INSERT INTO `beds` VALUES ('57', 'bed 2', '68');
INSERT INTO `beds` VALUES ('59', 'bed 2', '71');
INSERT INTO `beds` VALUES ('67', 'Bed 2', '80');
INSERT INTO `beds` VALUES ('69', 'Bed 2', '81');
INSERT INTO `beds` VALUES ('71', 'bed 2', '84');
INSERT INTO `beds` VALUES ('74', 'bed 2', '86');
INSERT INTO `beds` VALUES ('77', 'bed 2', '89');
INSERT INTO `beds` VALUES ('79', 'Bed 2', '92');
INSERT INTO `beds` VALUES ('83', 'Bed 2', '94');
INSERT INTO `beds` VALUES ('85', 'Bed 2', '96');
INSERT INTO `beds` VALUES ('38', 'bed 3', '45');
INSERT INTO `beds` VALUES ('72', 'bed 3', '84');
INSERT INTO `beds` VALUES ('75', 'bed 3', '86');
INSERT INTO `beds` VALUES ('1', 'Bed number 1', '2');
INSERT INTO `beds` VALUES ('10', 'bed number 1', '16');
INSERT INTO `beds` VALUES ('13', 'bed number 1', '18');
INSERT INTO `beds` VALUES ('4', 'Bed number 2', '2');
INSERT INTO `beds` VALUES ('11', 'bed number 2', '16');
INSERT INTO `beds` VALUES ('14', 'bed number 2', '18');
INSERT INTO `beds` VALUES ('6', 'Bed number 3', '2');
INSERT INTO `beds` VALUES ('12', 'bed number 3', '16');
INSERT INTO `beds` VALUES ('15', 'bed number 3', '18');
INSERT INTO `beds` VALUES ('7', 'Bed number 4', '2');
INSERT INTO `beds` VALUES ('51', 'bed one', '63');
INSERT INTO `beds` VALUES ('52', 'bed two', '63');
INSERT INTO `beds` VALUES ('46', 'C', '58');
INSERT INTO `beds` VALUES ('65', 'c', '79');
INSERT INTO `beds` VALUES ('47', 'X', '61');
INSERT INTO `beds` VALUES ('62', 'XYZ', '72');
INSERT INTO `beds` VALUES ('48', 'Y', '61');
INSERT INTO `beds` VALUES ('49', 'Z', '61');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StateID` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `state` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', 'Kondhwa');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'India');

-- ----------------------------
-- Table structure for `facility`
-- ----------------------------
DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `HostelID` (`HostelID`,`Name`),
  CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of facility
-- ----------------------------
INSERT INTO `facility` VALUES ('1', '26', 'Swimming pool', '24*7 hour open');
INSERT INTO `facility` VALUES ('2', '23', 'swimming pool', 'available');
INSERT INTO `facility` VALUES ('4', '23', 'theatre', '24X7');
INSERT INTO `facility` VALUES ('5', '26', 'Theater', 'With 3D');
INSERT INTO `facility` VALUES ('6', '34', 'swimming pool', '24x7');

-- ----------------------------
-- Table structure for `floor`
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `hostelID` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `hostelID` (`hostelID`,`Name`) USING BTREE,
  CONSTRAINT `floor_ibfk_1` FOREIGN KEY (`hostelID`) REFERENCES `hostel` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES ('57', '9', '1');
INSERT INTO `floor` VALUES ('58', '9', 'floor One');
INSERT INTO `floor` VALUES ('24', '23', '1st floor');
INSERT INTO `floor` VALUES ('26', '23', '2nd floor');
INSERT INTO `floor` VALUES ('27', '23', '3rd floor');
INSERT INTO `floor` VALUES ('23', '23', 'basement');
INSERT INTO `floor` VALUES ('19', '26', 'Fifth floor');
INSERT INTO `floor` VALUES ('15', '26', 'First floor');
INSERT INTO `floor` VALUES ('18', '26', 'Fourth floor');
INSERT INTO `floor` VALUES ('13', '26', 'ground floor');
INSERT INTO `floor` VALUES ('16', '26', 'Second floor');
INSERT INTO `floor` VALUES ('45', '26', 'sixth floor');
INSERT INTO `floor` VALUES ('17', '26', 'Third floor');
INSERT INTO `floor` VALUES ('20', '28', 'Basement');
INSERT INTO `floor` VALUES ('22', '28', 'first floor');
INSERT INTO `floor` VALUES ('21', '28', 'Ground floor');
INSERT INTO `floor` VALUES ('28', '30', 'floor 1');
INSERT INTO `floor` VALUES ('29', '30', 'floor 2');
INSERT INTO `floor` VALUES ('30', '31', 'floor 1');
INSERT INTO `floor` VALUES ('32', '31', 'floor 2');
INSERT INTO `floor` VALUES ('33', '31', 'floor 3');
INSERT INTO `floor` VALUES ('34', '31', 'Floor 4');
INSERT INTO `floor` VALUES ('35', '32', 'floor 1');
INSERT INTO `floor` VALUES ('37', '32', 'floor 2');
INSERT INTO `floor` VALUES ('38', '32', 'floor 3');
INSERT INTO `floor` VALUES ('39', '32', 'floor 4');
INSERT INTO `floor` VALUES ('40', '34', 'floor 1');
INSERT INTO `floor` VALUES ('41', '34', 'floor 2');
INSERT INTO `floor` VALUES ('42', '34', 'floor 3');
INSERT INTO `floor` VALUES ('43', '35', '1');
INSERT INTO `floor` VALUES ('46', '36', 'fl0or 1');
INSERT INTO `floor` VALUES ('47', '36', 'fl0or 2');
INSERT INTO `floor` VALUES ('48', '37', 'floor 1');
INSERT INTO `floor` VALUES ('49', '37', 'floor 2');
INSERT INTO `floor` VALUES ('50', '38', '1');
INSERT INTO `floor` VALUES ('52', '38', '2');
INSERT INTO `floor` VALUES ('53', '39', 'First floor');
INSERT INTO `floor` VALUES ('54', '39', 'Second Floor');
INSERT INTO `floor` VALUES ('56', '39', 'Third Floor');
INSERT INTO `floor` VALUES ('59', '44', 'first floor');
INSERT INTO `floor` VALUES ('60', '44', 'second floor');
INSERT INTO `floor` VALUES ('62', '46', 'floor 1');
INSERT INTO `floor` VALUES ('64', '46', 'floor 2');
INSERT INTO `floor` VALUES ('65', '46', 'floor 3');
INSERT INTO `floor` VALUES ('66', '47', 'first floor');
INSERT INTO `floor` VALUES ('70', '47', 'Five floor');
INSERT INTO `floor` VALUES ('69', '47', 'Four floor');
INSERT INTO `floor` VALUES ('67', '47', 'second floor');
INSERT INTO `floor` VALUES ('68', '47', 'Third floor');
INSERT INTO `floor` VALUES ('71', '49', 'first floor');
INSERT INTO `floor` VALUES ('73', '49', 'second floor');
INSERT INTO `floor` VALUES ('74', '51', 'Floor 1');
INSERT INTO `floor` VALUES ('75', '51', 'Floor 2');
INSERT INTO `floor` VALUES ('76', '53', 'Floor 1');
INSERT INTO `floor` VALUES ('78', '53', 'Floor 2');
INSERT INTO `floor` VALUES ('79', '53', 'Floor 3');
INSERT INTO `floor` VALUES ('80', '53', 'Floor 4');
INSERT INTO `floor` VALUES ('81', '56', 'Floor 1');
INSERT INTO `floor` VALUES ('83', '56', 'Floor 2');
INSERT INTO `floor` VALUES ('84', '56', 'Floor 3');
INSERT INTO `floor` VALUES ('85', '57', 'Floor 1');
INSERT INTO `floor` VALUES ('86', '57', 'Floor 2');
INSERT INTO `floor` VALUES ('87', '57', 'Floor 3');
INSERT INTO `floor` VALUES ('88', '59', 'Floor 1');
INSERT INTO `floor` VALUES ('89', '59', 'Floor 2');
INSERT INTO `floor` VALUES ('91', '59', 'Floor 3');
INSERT INTO `floor` VALUES ('92', '59', 'Floor 4');
INSERT INTO `floor` VALUES ('93', '62', 'Floor 1');
INSERT INTO `floor` VALUES ('94', '62', 'Floor 2');
INSERT INTO `floor` VALUES ('95', '62', 'Floor 3');

-- ----------------------------
-- Table structure for `homepage`
-- ----------------------------
DROP TABLE IF EXISTS `homepage`;
CREATE TABLE `homepage` (
  `RoleID` int(11) DEFAULT NULL,
  `PageName` varchar(100) DEFAULT NULL,
  UNIQUE KEY `RoleID` (`RoleID`),
  CONSTRAINT `homepage_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `userrole` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of homepage
-- ----------------------------
INSERT INTO `homepage` VALUES ('1', 'Dashboard.jsp?open=hostelOwner');
INSERT INTO `homepage` VALUES ('2', 'Admin.jsp');

-- ----------------------------
-- Table structure for `hostel`
-- ----------------------------
DROP TABLE IF EXISTS `hostel`;
CREATE TABLE `hostel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `HostelName` varchar(50) DEFAULT NULL,
  `UniqueName` varchar(100) DEFAULT NULL,
  `ThemeID` int(11) DEFAULT '1',
  `RatingID` int(11) DEFAULT '1',
  `TypeID` int(11) DEFAULT '1',
  `GenderType` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UniqueName` (`UniqueName`),
  KEY `UserId` (`UserId`),
  KEY `ThemeID` (`ThemeID`),
  KEY `RatingID` (`RatingID`),
  KEY `TypeID` (`TypeID`),
  KEY `GenderFK` (`GenderType`),
  CONSTRAINT `GenderFK` FOREIGN KEY (`GenderType`) REFERENCES `hostelgendertype` (`ID`),
  CONSTRAINT `hostel_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`ID`),
  CONSTRAINT `hostel_ibfk_2` FOREIGN KEY (`ThemeID`) REFERENCES `hosteltheme` (`ID`),
  CONSTRAINT `hostel_ibfk_3` FOREIGN KEY (`RatingID`) REFERENCES `rating` (`ID`),
  CONSTRAINT `hostel_ibfk_4` FOREIGN KEY (`TypeID`) REFERENCES `hosteltype` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hostel
-- ----------------------------
INSERT INTO `hostel` VALUES ('2', '10', 'sai hostel', 'sai', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('4', '2', 'SIBAR', 'sibar', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('7', '2', 'SIOM MCA', 'SIOM', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('8', '2', 'SIT', 'sit', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('9', '2', 'SIBACA', 'SIBACA', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('11', '2', 'SIBAR', 'r', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('15', '2', 'SIBAR', 'r1', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('18', '2', 'SIBAR', 'r13', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('21', '2', 'r5', 'r34', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('22', '2', 'r5', 'r343', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('23', '2', 'gautam boys hostel', 'gk', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('25', '2', 'vishal ', 'hkjhgkh', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('26', '2', 'sandeep hostel', 'sandeep', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('27', '10', 'My hostel', 'hostel', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('28', '2', 'Jayant hostel', 'Jayant', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('29', '2', 'Dhandekar hostel', 'dhandekar', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('30', '10', 'siom', 'siom123', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('31', '2', 'Vivek gals hostel', 'Vivek', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('32', '2', 'Vinit hostel', 'vinit', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('33', '17', 'vikash hostel', 'vk', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('34', '10', 'Muzahid hostel', 'muzaaaa', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('35', '19', 'ABC', 'a@12', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('36', '2', 'Abhishek hostel', 'abhi', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('37', '2', 'Praveen hostel', 'praveen', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('38', '2', 'Happy life', 'HL', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('39', '13', 'Steve jobs Hostel', 'Applehostel ', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('44', '2', 'vikash hostel', 'vk123', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('46', '2', 'Golden jubilee', 'golden', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('47', '23', 'Nuton hostel', 'nk', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('48', '23', 'SIBAR MCA', 'smca', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('49', '4', 'sibarHostel', 'sibar170', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('50', '4', 'sibarHostel1', 'sibar171', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('51', '2', 'Niraj hostel', 'NIRAJ', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('53', '2', 'AmanHostel', 'AMAN', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('56', '2', 'Abhi hostel', 'abhishek', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('57', '2', 'SS ', 'Anukaran', '1', '1', '1', '2');
INSERT INTO `hostel` VALUES ('59', '2', 'Dip Hostel', 'Dipesh', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('60', '4', 'Vishal hostel', 'vishal', '1', '1', '1', '1');
INSERT INTO `hostel` VALUES ('62', '2', 'Mitesh', 'Mitesh', '1', '1', '1', '2');

-- ----------------------------
-- Table structure for `hostelgendertype`
-- ----------------------------
DROP TABLE IF EXISTS `hostelgendertype`;
CREATE TABLE `hostelgendertype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hostelgendertype
-- ----------------------------
INSERT INTO `hostelgendertype` VALUES ('1', 'Boys hostel');
INSERT INTO `hostelgendertype` VALUES ('2', 'Girls hostel');

-- ----------------------------
-- Table structure for `hostelimage`
-- ----------------------------
DROP TABLE IF EXISTS `hostelimage`;
CREATE TABLE `hostelimage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) DEFAULT NULL,
  `ImagePath` varchar(200) DEFAULT NULL,
  `ImageName` varchar(100) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `HostelID` (`HostelID`),
  CONSTRAINT `hostelimage_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hostelimage
-- ----------------------------

-- ----------------------------
-- Table structure for `hostelpage`
-- ----------------------------
DROP TABLE IF EXISTS `hostelpage`;
CREATE TABLE `hostelpage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `HostelID` (`HostelID`),
  CONSTRAINT `hostelpage_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hostelpage
-- ----------------------------

-- ----------------------------
-- Table structure for `hosteltheme`
-- ----------------------------
DROP TABLE IF EXISTS `hosteltheme`;
CREATE TABLE `hosteltheme` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CSSPath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hosteltheme
-- ----------------------------
INSERT INTO `hosteltheme` VALUES ('1', 'Style/1.css');
INSERT INTO `hosteltheme` VALUES ('2', 'Style/2.css');
INSERT INTO `hosteltheme` VALUES ('3', 'Style/3.css');

-- ----------------------------
-- Table structure for `hosteltype`
-- ----------------------------
DROP TABLE IF EXISTS `hosteltype`;
CREATE TABLE `hosteltype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hosteltype
-- ----------------------------
INSERT INTO `hosteltype` VALUES ('1', 'AC');
INSERT INTO `hosteltype` VALUES ('2', 'Non AC');
INSERT INTO `hosteltype` VALUES ('3', 'AC / Non AC');

-- ----------------------------
-- Table structure for `hostel_contact`
-- ----------------------------
DROP TABLE IF EXISTS `hostel_contact`;
CREATE TABLE `hostel_contact` (
  `HostelID` int(11) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `SecPhone` varchar(10) DEFAULT NULL,
  `Mobile` varchar(10) DEFAULT NULL,
  `SecMobile` varchar(10) DEFAULT NULL,
  `Fax` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `Country` int(50) DEFAULT NULL,
  `State` int(50) DEFAULT NULL,
  `City` int(50) DEFAULT NULL,
  `NearLandmark` varchar(50) DEFAULT NULL,
  `Pin` varchar(10) DEFAULT NULL,
  `FullAddress` varchar(200) DEFAULT NULL,
  UNIQUE KEY `HostelID` (`HostelID`) USING BTREE,
  KEY `Country` (`Country`),
  KEY `State` (`State`),
  KEY `City` (`City`),
  CONSTRAINT `hostel_contact_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`),
  CONSTRAINT `hostel_contact_ibfk_2` FOREIGN KEY (`Country`) REFERENCES `country` (`ID`),
  CONSTRAINT `hostel_contact_ibfk_3` FOREIGN KEY (`State`) REFERENCES `state` (`ID`),
  CONSTRAINT `hostel_contact_ibfk_4` FOREIGN KEY (`City`) REFERENCES `city` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hostel_contact
-- ----------------------------
INSERT INTO `hostel_contact` VALUES ('26', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'Kondhwa', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('27', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'Hadapsar', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('28', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'satara road', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('29', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'lonawala', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('30', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'katraz', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('31', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'swargate', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('32', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'poolgate', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('33', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'warze', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('34', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'pune camp', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('35', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'mg road', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('36', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'SGS mall', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('38', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'pune stn', '411048', 'SIBAR');
INSERT INTO `hostel_contact` VALUES ('39', '9876543212', '9876543212', '9876543212', '9876543212', '9876543212', 'hms@mail.com', 'www.hms.com', '1', '1', '1', 'shivaji ngr', '411048', 'SIBAR');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` int(11) DEFAULT NULL,
  `Receiver` int(11) DEFAULT NULL,
  `Sub` varchar(100) DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  `MDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Sender` (`Sender`),
  KEY `Receiver` (`Receiver`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`Sender`) REFERENCES `users` (`ID`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`Receiver`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '2', '10', 'hey raj', 'Hello, this is rajni kant roy. i am from sibar. Hello, this is rajni kant roy. i am from sibar. Hello, this is rajni kant roy. i am from sibar. Hello, this is rajni kant roy. i am from sibar', '2013-10-25');
INSERT INTO `message` VALUES ('2', '10', '2', 'Hey roy', 'hi', '2013-10-25');
INSERT INTO `message` VALUES ('3', '2', '10', 'hi', 'hi', '2013-10-28');
INSERT INTO `message` VALUES ('5', '2', '11', 'Hey roy', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('6', '2', '13', 'Hello today is holiday', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('7', '2', '14', 'job opening', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('8', '2', '15', 'You are hired', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('9', '15', '2', 'You are hired', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('10', '15', '2', 'job opening', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('11', '14', '2', 'Hello today is holiday', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('12', '13', '2', 'Hello today is holiday', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('13', '11', '2', 'job opening', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('14', '10', '2', 'You are hired', 'Hey roy', '2013-10-28');
INSERT INTO `message` VALUES ('15', '2', '4', 'hey vikash', 'i m at sibar', '2013-10-29');
INSERT INTO `message` VALUES ('16', '2', '4', 'hi vk', 'hello how are you', '2013-10-29');
INSERT INTO `message` VALUES ('17', '23', '22', 'hey raj', 'how are you', '2013-10-29');
INSERT INTO `message` VALUES ('18', '2', '4', 'hello vikash', 'hey vikash how are you?\r\n\r\ni am waiting at college', '2013-11-06');
INSERT INTO `message` VALUES ('19', '2', '4', 'Hello', 'for Project social network\r\npichko.com\r\n\r\nfor student Social network\r\nmicerco.com\r\n\r\nmi- my\r\ncerco- circle\r\n\r\nspanish word\r\n\r\n\r\nfor hostel\r\nmerahostel.com\r\ngobasera.com\r\n\r\nvivo\r\n\r\n\r\nmeetpaji.com\r\ncercovivo(circle live)\r\n\r\nsmartbencher\r\n\r\n\r\n31-10-13', '2013-11-08');

-- ----------------------------
-- Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `HostelID` (`HostelID`),
  CONSTRAINT `page_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of page
-- ----------------------------

-- ----------------------------
-- Table structure for `pagecontent`
-- ----------------------------
DROP TABLE IF EXISTS `pagecontent`;
CREATE TABLE `pagecontent` (
  `PageID` int(11) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  KEY `PageID` (`PageID`),
  CONSTRAINT `pagecontent_ibfk_1` FOREIGN KEY (`PageID`) REFERENCES `page` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pagecontent
-- ----------------------------

-- ----------------------------
-- Table structure for `paymenttype`
-- ----------------------------
DROP TABLE IF EXISTS `paymenttype`;
CREATE TABLE `paymenttype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) DEFAULT NULL,
  `PaymentName` varchar(50) DEFAULT NULL,
  `Rent` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `HostelID` (`HostelID`,`PaymentName`) USING BTREE,
  CONSTRAINT `paymenttype_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of paymenttype
-- ----------------------------
INSERT INTO `paymenttype` VALUES ('1', '26', 'Room rent', '2000');
INSERT INTO `paymenttype` VALUES ('2', '26', 'Electricity', '200');
INSERT INTO `paymenttype` VALUES ('3', '26', 'Net connection', '200');
INSERT INTO `paymenttype` VALUES ('4', '26', 'Development fee', '50');
INSERT INTO `paymenttype` VALUES ('5', '26', 'Clining', '20');
INSERT INTO `paymenttype` VALUES ('6', '26', 'Maintainance', '100');
INSERT INTO `paymenttype` VALUES ('7', '26', 'Mesh', '1500');
INSERT INTO `paymenttype` VALUES ('8', '26', 'Other(fine, etc)', '12');
INSERT INTO `paymenttype` VALUES ('9', '26', 'Swimming pool', '120');
INSERT INTO `paymenttype` VALUES ('17', '26', 'gym', '230');
INSERT INTO `paymenttype` VALUES ('18', '34', 'Room rent', '3000');
INSERT INTO `paymenttype` VALUES ('19', '34', 'wifi', '230');
INSERT INTO `paymenttype` VALUES ('20', '34', 'swimming poool', '232');
INSERT INTO `paymenttype` VALUES ('21', '34', 'electricity', '200');
INSERT INTO `paymenttype` VALUES ('22', '34', 'water', '109');
INSERT INTO `paymenttype` VALUES ('24', '36', 'room rent', null);
INSERT INTO `paymenttype` VALUES ('26', '26', 'Swimming classes', '20');
INSERT INTO `paymenttype` VALUES ('27', '26', 'lappy', '80');
INSERT INTO `paymenttype` VALUES ('28', '37', 'room rent', '2000');
INSERT INTO `paymenttype` VALUES ('29', '37', 'room rent with ac', '2000');
INSERT INTO `paymenttype` VALUES ('30', '9', 'Room rent', '2000');
INSERT INTO `paymenttype` VALUES ('31', '9', 'Room rent with AC', '4000');
INSERT INTO `paymenttype` VALUES ('32', '9', 'Swimming pool', '1000');
INSERT INTO `paymenttype` VALUES ('33', '46', 'Room rent with AC', '3000');
INSERT INTO `paymenttype` VALUES ('34', '46', 'Room rent', '2000');
INSERT INTO `paymenttype` VALUES ('35', '46', 'Swimming pool', '300');
INSERT INTO `paymenttype` VALUES ('36', '47', 'swiming pool ', '300');
INSERT INTO `paymenttype` VALUES ('37', '47', 'mesh', '300');
INSERT INTO `paymenttype` VALUES ('38', '49', 'swiming pool', '200');
INSERT INTO `paymenttype` VALUES ('39', '49', 'mesh', '2000');
INSERT INTO `paymenttype` VALUES ('40', '49', 'fine', '200');
INSERT INTO `paymenttype` VALUES ('41', '51', 'AC Room rent', '1000');
INSERT INTO `paymenttype` VALUES ('42', '51', 'Non-AC Room rent', '500');
INSERT INTO `paymenttype` VALUES ('43', '53', 'Room rent AC', '3000');
INSERT INTO `paymenttype` VALUES ('44', '53', 'Room rent Non-AC', '1500');
INSERT INTO `paymenttype` VALUES ('45', '53', 'Sweeper', '100');
INSERT INTO `paymenttype` VALUES ('46', '56', 'Room rent (AC)', '3000');
INSERT INTO `paymenttype` VALUES ('47', '56', 'Room rent (Non-AC)', '1500');
INSERT INTO `paymenttype` VALUES ('48', '56', 'development', '100');
INSERT INTO `paymenttype` VALUES ('49', '56', 'Cleaning', '100');
INSERT INTO `paymenttype` VALUES ('50', '57', 'Room rent(AC)', '3000');
INSERT INTO `paymenttype` VALUES ('51', '57', 'Room rent(Non-AC)', '1500');
INSERT INTO `paymenttype` VALUES ('52', '57', 'Swimming pool', '100');
INSERT INTO `paymenttype` VALUES ('53', '57', 'pool', '50');
INSERT INTO `paymenttype` VALUES ('54', '59', 'Room rent', '5000');
INSERT INTO `paymenttype` VALUES ('55', '59', 'Swimming Pool', '100');
INSERT INTO `paymenttype` VALUES ('56', '62', 'Room rent AC', '3000');
INSERT INTO `paymenttype` VALUES ('57', '62', 'Room rent Non-AC', '2000');
INSERT INTO `paymenttype` VALUES ('58', '62', 'Swimming pool', '200');

-- ----------------------------
-- Table structure for `rating`
-- ----------------------------
DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rating
-- ----------------------------
INSERT INTO `rating` VALUES ('1', '1 Star');
INSERT INTO `rating` VALUES ('2', '2 Star');
INSERT INTO `rating` VALUES ('3', '3 Star');
INSERT INTO `rating` VALUES ('4', '4 Star');
INSERT INTO `rating` VALUES ('5', '5 Star');
INSERT INTO `rating` VALUES ('6', '7 Star');

-- ----------------------------
-- Table structure for `registration`
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `HostelID` int(11) DEFAULT NULL,
  `TenantID` int(11) DEFAULT NULL,
  `Rent` decimal(10,0) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL,
  UNIQUE KEY `HostelID` (`HostelID`,`TenantID`,`RegistrationDate`) USING BTREE,
  KEY `TenantID` (`TenantID`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`),
  CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`TenantID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES ('26', '2', '876', null);
INSERT INTO `registration` VALUES ('26', '2', '9876', '2013-10-22');
INSERT INTO `registration` VALUES ('9', '2', '200', '2013-10-29');
INSERT INTO `registration` VALUES ('46', '4', '600', '2013-10-29');
INSERT INTO `registration` VALUES ('47', '4', '100', '2013-10-29');

-- ----------------------------
-- Table structure for `roomrentperbed`
-- ----------------------------
DROP TABLE IF EXISTS `roomrentperbed`;
CREATE TABLE `roomrentperbed` (
  `HostelID` int(11) DEFAULT NULL,
  `RoomTypeID` int(11) DEFAULT NULL,
  `Rent` float DEFAULT NULL,
  KEY `RoomTypeID` (`RoomTypeID`),
  KEY `HostelID` (`HostelID`),
  CONSTRAINT `roomrentperbed_ibfk_1` FOREIGN KEY (`RoomTypeID`) REFERENCES `roomtype` (`ID`),
  CONSTRAINT `roomrentperbed_ibfk_2` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roomrentperbed
-- ----------------------------
INSERT INTO `roomrentperbed` VALUES ('2', '1', '2000');
INSERT INTO `roomrentperbed` VALUES ('2', '2', '1500');

-- ----------------------------
-- Table structure for `roomtype`
-- ----------------------------
DROP TABLE IF EXISTS `roomtype`;
CREATE TABLE `roomtype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roomtype
-- ----------------------------
INSERT INTO `roomtype` VALUES ('1', 'AC');
INSERT INTO `roomtype` VALUES ('2', 'Non AC');

-- ----------------------------
-- Table structure for `room_master`
-- ----------------------------
DROP TABLE IF EXISTS `room_master`;
CREATE TABLE `room_master` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoomName` varchar(100) DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_HOSTELID_ROOMNAME` (`RoomName`,`Floor`) USING BTREE,
  KEY `TypeID` (`TypeID`),
  KEY `Floor` (`Floor`),
  CONSTRAINT `room_master_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `roomtype` (`ID`),
  CONSTRAINT `room_master_ibfk_3` FOREIGN KEY (`Floor`) REFERENCES `floor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of room_master
-- ----------------------------
INSERT INTO `room_master` VALUES ('1', 'room 1', '1', '13');
INSERT INTO `room_master` VALUES ('2', 'room 1', '1', '15');
INSERT INTO `room_master` VALUES ('5', 'room 2', '1', '15');
INSERT INTO `room_master` VALUES ('6', 'room 2', '1', '13');
INSERT INTO `room_master` VALUES ('7', 'room 3', '1', '15');
INSERT INTO `room_master` VALUES ('8', 'room 4', '1', '15');
INSERT INTO `room_master` VALUES ('9', 'room 3', '2', '13');
INSERT INTO `room_master` VALUES ('11', 'room 5', '1', '15');
INSERT INTO `room_master` VALUES ('12', 'room 1', '1', '18');
INSERT INTO `room_master` VALUES ('13', 'room 2', '1', '18');
INSERT INTO `room_master` VALUES ('14', 'r1', '1', '19');
INSERT INTO `room_master` VALUES ('15', 'r2', '2', '19');
INSERT INTO `room_master` VALUES ('16', 'room 1', '2', '20');
INSERT INTO `room_master` VALUES ('17', 'room 2', '2', '20');
INSERT INTO `room_master` VALUES ('18', 'room 3', '2', '20');
INSERT INTO `room_master` VALUES ('19', 'room 1', '1', '21');
INSERT INTO `room_master` VALUES ('20', 'room 2', '1', '21');
INSERT INTO `room_master` VALUES ('22', 'room 3', '1', '21');
INSERT INTO `room_master` VALUES ('23', 'room 1', '1', '22');
INSERT INTO `room_master` VALUES ('24', 'room 2', '1', '22');
INSERT INTO `room_master` VALUES ('25', 'room 3', '2', '22');
INSERT INTO `room_master` VALUES ('26', 'room 1', '1', '27');
INSERT INTO `room_master` VALUES ('27', 'room 2', '1', '27');
INSERT INTO `room_master` VALUES ('28', 'room 3', '1', '27');
INSERT INTO `room_master` VALUES ('30', 'room 3', '1', '26');
INSERT INTO `room_master` VALUES ('31', 'room 1', '1', '28');
INSERT INTO `room_master` VALUES ('32', 'room 2', '1', '28');
INSERT INTO `room_master` VALUES ('33', 'room 1', '1', '30');
INSERT INTO `room_master` VALUES ('35', 'room 2', '1', '30');
INSERT INTO `room_master` VALUES ('36', 'room 1', '1', '33');
INSERT INTO `room_master` VALUES ('37', 'room 2', '1', '33');
INSERT INTO `room_master` VALUES ('38', 'room 1', '1', '35');
INSERT INTO `room_master` VALUES ('39', 'room 2', '1', '35');
INSERT INTO `room_master` VALUES ('40', 'room 1', '2', '40');
INSERT INTO `room_master` VALUES ('41', 'room 2', '2', '40');
INSERT INTO `room_master` VALUES ('42', 'abc', '1', '43');
INSERT INTO `room_master` VALUES ('43', 'Deepak', '1', '45');
INSERT INTO `room_master` VALUES ('44', 'rohit', '1', '15');
INSERT INTO `room_master` VALUES ('45', 'room 1', '2', '46');
INSERT INTO `room_master` VALUES ('46', 'room 2', '2', '46');
INSERT INTO `room_master` VALUES ('48', 'room 1', '2', '47');
INSERT INTO `room_master` VALUES ('49', 'room 2', '2', '47');
INSERT INTO `room_master` VALUES ('50', 'room 1', '1', '48');
INSERT INTO `room_master` VALUES ('51', 'room 2', '1', '48');
INSERT INTO `room_master` VALUES ('53', 'room 1', '1', '49');
INSERT INTO `room_master` VALUES ('54', 'room 2', '1', '49');
INSERT INTO `room_master` VALUES ('55', 'Delux', '1', '50');
INSERT INTO `room_master` VALUES ('57', 'Super Delux', '1', '52');
INSERT INTO `room_master` VALUES ('58', 'express', '1', '53');
INSERT INTO `room_master` VALUES ('59', 'metro', '1', '53');
INSERT INTO `room_master` VALUES ('60', 'Deluxe', '2', '53');
INSERT INTO `room_master` VALUES ('61', 'Deluxe', '2', '54');
INSERT INTO `room_master` VALUES ('62', '1', '1', '57');
INSERT INTO `room_master` VALUES ('63', 'room one', '1', '58');
INSERT INTO `room_master` VALUES ('64', 'room two', '1', '58');
INSERT INTO `room_master` VALUES ('65', 'room 1', '1', '59');
INSERT INTO `room_master` VALUES ('66', 'room 2', '1', '59');
INSERT INTO `room_master` VALUES ('68', 'Room 1', '1', '62');
INSERT INTO `room_master` VALUES ('70', 'Room 2', '1', '62');
INSERT INTO `room_master` VALUES ('71', 'room 1', '1', '65');
INSERT INTO `room_master` VALUES ('72', 'A', '1', '66');
INSERT INTO `room_master` VALUES ('73', 'B', '1', '66');
INSERT INTO `room_master` VALUES ('74', 'C', '1', '66');
INSERT INTO `room_master` VALUES ('75', 'Deluxe', '2', '70');
INSERT INTO `room_master` VALUES ('76', 'Super Deluxe', '1', '70');
INSERT INTO `room_master` VALUES ('77', 'deluxe', '1', '71');
INSERT INTO `room_master` VALUES ('78', 'super deluxe', '1', '71');
INSERT INTO `room_master` VALUES ('79', 'super deluxe1', '2', '73');
INSERT INTO `room_master` VALUES ('80', 'Room 1', '2', '74');
INSERT INTO `room_master` VALUES ('81', 'Room 2', '2', '74');
INSERT INTO `room_master` VALUES ('82', 'Room 1', '1', '75');
INSERT INTO `room_master` VALUES ('83', 'Room 2', '1', '75');
INSERT INTO `room_master` VALUES ('84', 'Room 1', '1', '76');
INSERT INTO `room_master` VALUES ('86', 'Room 2', '1', '76');
INSERT INTO `room_master` VALUES ('87', 'Room 1', '1', '78');
INSERT INTO `room_master` VALUES ('88', 'Room 2', '1', '78');
INSERT INTO `room_master` VALUES ('89', 'Room 1', '1', '81');
INSERT INTO `room_master` VALUES ('90', 'Room 2', '1', '81');
INSERT INTO `room_master` VALUES ('91', 'Room 3', '2', '81');
INSERT INTO `room_master` VALUES ('92', 'Room 1', '1', '85');
INSERT INTO `room_master` VALUES ('93', 'Room 2', '1', '85');
INSERT INTO `room_master` VALUES ('94', 'Room 1', '1', '88');
INSERT INTO `room_master` VALUES ('95', 'Room 2', '1', '88');
INSERT INTO `room_master` VALUES ('96', 'Room 1', '1', '93');
INSERT INTO `room_master` VALUES ('97', 'Room 2', '1', '93');
INSERT INTO `room_master` VALUES ('98', 'Room 1', '1', '94');

-- ----------------------------
-- Table structure for `securitycharges`
-- ----------------------------
DROP TABLE IF EXISTS `securitycharges`;
CREATE TABLE `securitycharges` (
  `hostelID` int(11) DEFAULT NULL,
  `tenantID` int(11) DEFAULT NULL,
  `Charge` decimal(10,0) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  UNIQUE KEY `hostelID` (`hostelID`,`tenantID`,`DATE`) USING BTREE,
  KEY `tenantID` (`tenantID`),
  CONSTRAINT `securitycharges_ibfk_1` FOREIGN KEY (`hostelID`) REFERENCES `hostel` (`ID`),
  CONSTRAINT `securitycharges_ibfk_2` FOREIGN KEY (`tenantID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of securitycharges
-- ----------------------------
INSERT INTO `securitycharges` VALUES ('26', '2', '12345', '2013-10-22');
INSERT INTO `securitycharges` VALUES ('46', '4', '6000', '2013-10-29');
INSERT INTO `securitycharges` VALUES ('47', '4', '200', '2013-10-29');

-- ----------------------------
-- Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryID` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CountryID` (`CountryID`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `country` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES ('1', '1', 'Pune');

-- ----------------------------
-- Table structure for `tenant`
-- ----------------------------
DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `TenantID` int(11) DEFAULT NULL,
  `BedID` int(11) DEFAULT NULL,
  `JOINDATE` date DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  UNIQUE KEY `TenantID` (`TenantID`,`BedID`,`JOINDATE`) USING BTREE,
  KEY `status` (`status`),
  KEY `BedID` (`BedID`),
  CONSTRAINT `tenant_ibfk_1` FOREIGN KEY (`TenantID`) REFERENCES `users` (`ID`),
  CONSTRAINT `tenant_ibfk_4` FOREIGN KEY (`status`) REFERENCES `tenantstatus` (`ID`),
  CONSTRAINT `tenant_ibfk_5` FOREIGN KEY (`BedID`) REFERENCES `beds` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tenant
-- ----------------------------
INSERT INTO `tenant` VALUES ('2', '14', '2013-10-14', '1');
INSERT INTO `tenant` VALUES ('17', '1', '2013-10-14', '1');
INSERT INTO `tenant` VALUES ('2', '4', '2013-10-14', '1');
INSERT INTO `tenant` VALUES ('2', '6', '2013-10-15', '2');
INSERT INTO `tenant` VALUES ('4', '7', '2013-10-15', '1');
INSERT INTO `tenant` VALUES ('10', '8', '2013-10-15', '1');
INSERT INTO `tenant` VALUES ('2', '20', '2013-10-15', '1');
INSERT INTO `tenant` VALUES ('2', '21', '2013-10-15', '2');
INSERT INTO `tenant` VALUES ('10', '21', '2013-10-15', '1');
INSERT INTO `tenant` VALUES ('10', '22', '2013-10-15', '1');
INSERT INTO `tenant` VALUES ('10', '26', '2013-10-18', '1');
INSERT INTO `tenant` VALUES ('2', '28', '2013-10-19', '1');
INSERT INTO `tenant` VALUES ('10', '30', '2013-10-19', '1');
INSERT INTO `tenant` VALUES ('10', '27', '2013-10-20', '1');
INSERT INTO `tenant` VALUES ('10', '36', '2013-10-22', '1');
INSERT INTO `tenant` VALUES ('2', '39', '2013-10-24', '1');
INSERT INTO `tenant` VALUES ('10', '40', '2013-10-24', '1');
INSERT INTO `tenant` VALUES ('2', '50', '2013-10-29', '1');
INSERT INTO `tenant` VALUES ('10', '51', '2013-10-29', '1');
INSERT INTO `tenant` VALUES ('10', '9', '2013-10-29', '1');
INSERT INTO `tenant` VALUES ('4', '55', '2013-10-29', '1');
INSERT INTO `tenant` VALUES ('4', '61', '2013-10-29', '1');
INSERT INTO `tenant` VALUES ('4', '66', '2013-11-02', '1');
INSERT INTO `tenant` VALUES ('4', '67', '2013-11-02', '1');
INSERT INTO `tenant` VALUES ('4', '70', '2013-11-06', '1');
INSERT INTO `tenant` VALUES ('4', '76', '2013-11-08', '1');
INSERT INTO `tenant` VALUES ('4', '78', '2013-11-10', '1');
INSERT INTO `tenant` VALUES ('4', '84', '2013-12-05', '1');

-- ----------------------------
-- Table structure for `tenantfacility`
-- ----------------------------
DROP TABLE IF EXISTS `tenantfacility`;
CREATE TABLE `tenantfacility` (
  `bedID` int(11) DEFAULT NULL,
  `tenantID` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  UNIQUE KEY `bedID` (`bedID`,`tenantID`,`FacilityID`,`Status`) USING BTREE,
  KEY `tenantID` (`tenantID`),
  KEY `FacilityID` (`FacilityID`),
  KEY `Status` (`Status`),
  CONSTRAINT `tenantfacility_ibfk_1` FOREIGN KEY (`bedID`) REFERENCES `beds` (`ID`),
  CONSTRAINT `tenantfacility_ibfk_2` FOREIGN KEY (`tenantID`) REFERENCES `tenant` (`TenantID`),
  CONSTRAINT `tenantfacility_ibfk_3` FOREIGN KEY (`FacilityID`) REFERENCES `paymenttype` (`ID`),
  CONSTRAINT `tenantfacility_ibfk_4` FOREIGN KEY (`Status`) REFERENCES `tenantstatus` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tenantfacility
-- ----------------------------
INSERT INTO `tenantfacility` VALUES ('4', '2', '1', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '2', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '3', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '4', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '5', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '6', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '7', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '8', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '9', '1');
INSERT INTO `tenantfacility` VALUES ('4', '2', '17', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '1', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '2', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '3', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '4', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '5', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '6', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '7', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '8', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '9', '1');
INSERT INTO `tenantfacility` VALUES ('8', '10', '17', '1');
INSERT INTO `tenantfacility` VALUES ('36', '10', '24', '1');
INSERT INTO `tenantfacility` VALUES ('39', '2', '29', '1');
INSERT INTO `tenantfacility` VALUES ('51', '10', '31', '1');
INSERT INTO `tenantfacility` VALUES ('51', '10', '32', '1');
INSERT INTO `tenantfacility` VALUES ('55', '4', '33', '1');
INSERT INTO `tenantfacility` VALUES ('55', '4', '35', '1');
INSERT INTO `tenantfacility` VALUES ('61', '4', '36', '1');
INSERT INTO `tenantfacility` VALUES ('61', '4', '37', '1');
INSERT INTO `tenantfacility` VALUES ('67', '4', '41', '1');
INSERT INTO `tenantfacility` VALUES ('70', '4', '43', '1');
INSERT INTO `tenantfacility` VALUES ('70', '4', '45', '1');
INSERT INTO `tenantfacility` VALUES ('76', '4', '46', '1');
INSERT INTO `tenantfacility` VALUES ('76', '4', '48', '1');
INSERT INTO `tenantfacility` VALUES ('76', '4', '49', '1');
INSERT INTO `tenantfacility` VALUES ('78', '4', '50', '1');
INSERT INTO `tenantfacility` VALUES ('78', '4', '52', '1');
INSERT INTO `tenantfacility` VALUES ('78', '4', '53', '1');

-- ----------------------------
-- Table structure for `tenantstatus`
-- ----------------------------
DROP TABLE IF EXISTS `tenantstatus`;
CREATE TABLE `tenantstatus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tenantstatus
-- ----------------------------
INSERT INTO `tenantstatus` VALUES ('1', 'Active');
INSERT INTO `tenantstatus` VALUES ('2', 'De-activate');

-- ----------------------------
-- Table structure for `transaction`
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HostelID` int(11) DEFAULT NULL,
  `TenantID` int(11) DEFAULT NULL,
  `TransactionDate` date DEFAULT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `Total` decimal(10,0) DEFAULT NULL,
  `Paid` decimal(10,0) DEFAULT NULL,
  `Discount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `HostelID` (`HostelID`) USING BTREE,
  KEY `TenantID` (`TenantID`) USING BTREE,
  CONSTRAINT `paymenttransaction_ibfk_1` FOREIGN KEY (`HostelID`) REFERENCES `hostel` (`ID`),
  CONSTRAINT `paymenttransaction_ibfk_2` FOREIGN KEY (`TenantID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES ('1', '26', '2', '2013-10-26', '2013-10-26', '2013-11-26', '1239', '1200', '39');
INSERT INTO `transaction` VALUES ('2', '26', '2', '2013-10-26', '2013-10-26', '2013-11-26', '1239', '123', '23');
INSERT INTO `transaction` VALUES ('3', '26', '2', '2013-10-26', '2012-11-12', '2013-11-12', '8864', '8766', '87');
INSERT INTO `transaction` VALUES ('4', '26', '2', '2013-10-26', '2013-12-23', '2013-12-23', '8864', '8000', '864');
INSERT INTO `transaction` VALUES ('5', '9', '10', '2013-10-29', '2013-10-08', '2013-10-26', '10000', '2000', '8000');
INSERT INTO `transaction` VALUES ('6', '46', '4', '2013-10-29', '2013-10-01', '2013-10-31', '3300', '3000', '200');
INSERT INTO `transaction` VALUES ('7', '46', '4', '2013-10-29', '2013-11-01', '2013-12-01', '3300', '3000', '300');
INSERT INTO `transaction` VALUES ('8', '47', '4', '2013-10-29', '2013-10-15', '2014-10-15', '600', '500', '100');
INSERT INTO `transaction` VALUES ('9', '47', '4', '2013-10-29', '2013-10-15', '2014-10-15', '600', '500', '100');
INSERT INTO `transaction` VALUES ('10', '51', '4', '2013-11-02', '2013-11-04', '2013-12-04', '1000', '500', '200');
INSERT INTO `transaction` VALUES ('11', '51', '4', '2013-11-02', '2013-12-05', '2014-01-05', '1000', '900', '100');
INSERT INTO `transaction` VALUES ('12', '56', '4', '2013-11-08', '2013-10-02', '2013-11-02', '3200', '3000', '200');
INSERT INTO `transaction` VALUES ('13', '56', '4', '2013-11-08', '2013-11-02', '2013-12-02', '3200', '3000', '100');
INSERT INTO `transaction` VALUES ('14', '57', '4', '2013-11-10', '2013-10-02', '2013-11-02', '3150', '3000', '150');

-- ----------------------------
-- Table structure for `userrole`
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('1', 'Users');
INSERT INTO `userrole` VALUES ('2', 'Admin');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Role` int(11) DEFAULT '1',
  `PASSWORD` varchar(100) DEFAULT NULL,
  `Question` varchar(150) DEFAULT NULL,
  `Answer` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserName` (`UserName`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Role` (`Role`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `userrole` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', 'raj', 'roy', 'raj', 'raj@gmail.com', '1', '12', '0', '12', '2012-12-09');
INSERT INTO `users` VALUES ('4', 'ram', 'roy', 'r', 'vikash@gmail.com', '2', '12', '0', '12', '2013-10-18');
INSERT INTO `users` VALUES ('7', 'rohan', 'roy', 'r1', 's12@s.com', '1', '12', '0', '12', '2013-10-12');
INSERT INTO `users` VALUES ('10', 'sohan', 'roy', 'r32', 'rajkant020@gmail.com', '1', '12', '0', 'die hard', '2013-10-25');
INSERT INTO `users` VALUES ('11', 'mahan', 'roy', 'r3212', 'rajkant0210@gmail.com', '1', '12', '1', 'die hard', '2013-10-29');
INSERT INTO `users` VALUES ('13', 'vikash', 'roy', 'r321232', 'vk@gmail.com', '1', '12', '1', 'die hard', '2013-10-29');
INSERT INTO `users` VALUES ('14', 'vipin', 'singh', 'vk', 'vk@vk.com', '1', 'vk@vk.com', '1', 'vk@vk.com', '2013-10-31');
INSERT INTO `users` VALUES ('15', 'vikash', 'singh', 'vk1', 'vk1@vk.com', '1', 'vk@vk.com', '1', 'vk@vk.com', '2013-10-31');
INSERT INTO `users` VALUES ('17', 'shiv', 'roy', 'r18765', 's1762@s.com', '1', '12', '0', '12', '2013-10-12');
INSERT INTO `users` VALUES ('18', 'raj', 'roy', 'gh@gh.com', 'gh@gh.com', '1', 'gh@gh.com', '1', 'die hard', '2013-09-21');
INSERT INTO `users` VALUES ('19', 'Amit', 'Kumar', 'amitmmca', 'amitmmca@gmail.com', '1', '123456', '4', 'xyz', '2012-10-15');
INSERT INTO `users` VALUES ('20', 'raj', 'roy', 'raju', 'roy@mail.com', '1', '12345', '0', 'die hard', '2013-10-29');
INSERT INTO `users` VALUES ('21', 'vikash', 'singh', 'vikash', 'vikash@mail.com', '1', 'vikash@mail.com', '0', 'die hard', '2013-09-10');
INSERT INTO `users` VALUES ('22', 'vishal', 'barnwal', 'vishal', 'vishal@mail.com', '1', 'vishal@mail.com', '1', 'die hard', '2013-10-13');
INSERT INTO `users` VALUES ('23', 'vikash', 'singh', 'vk12', 'vk122@gmail.com', '1', '123', '4', 'man of steal ', '2013-10-17');

-- ----------------------------
-- Table structure for `userscontact`
-- ----------------------------
DROP TABLE IF EXISTS `userscontact`;
CREATE TABLE `userscontact` (
  `UID` int(11) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL,
  `stateID` int(11) DEFAULT NULL,
  `cityID` int(11) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Pin` varchar(20) DEFAULT NULL,
  UNIQUE KEY `UID` (`UID`) USING BTREE,
  KEY `countryID` (`countryID`),
  KEY `stateID` (`stateID`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `userscontact_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `userscontact_ibfk_2` FOREIGN KEY (`countryID`) REFERENCES `country` (`ID`),
  CONSTRAINT `userscontact_ibfk_3` FOREIGN KEY (`stateID`) REFERENCES `state` (`ID`),
  CONSTRAINT `userscontact_ibfk_4` FOREIGN KEY (`cityID`) REFERENCES `city` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userscontact
-- ----------------------------
INSERT INTO `userscontact` VALUES ('2', '9876566', '9898787', '1', '1', '1', 'kondhwa (BK)', '411048');
INSERT INTO `userscontact` VALUES ('4', '9876566', '9876566', '1', '1', '1', 'Pune, MH', '411048');
