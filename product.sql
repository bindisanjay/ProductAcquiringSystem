/*
MySQL Data Transfer
Source Host: localhost
Source Database: product
Target Host: localhost
Target Database: product
Date: 2/28/2023 5:37:42 AM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `Couponid` varchar(255) default NULL,
  `cname` varchar(255) default NULL,
  `cnumber` int(11) default NULL,
  `amount` int(11) default NULL,
  `exdate` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `category` varchar(255) default NULL,
  `descri` varchar(255) default NULL,
  `Pcompany` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `discount` varchar(255) default NULL,
  `photo` varchar(255) default NULL,
  `edate` date default NULL,
  `addby` varchar(255) default NULL,
  `modifydate` date default NULL,
  `icount` int(11) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for itemrequest
-- ----------------------------
DROP TABLE IF EXISTS `itemrequest`;
CREATE TABLE `itemrequest` (
  `id` varchar(255) NOT NULL default '',
  `iname` varchar(255) NOT NULL default '',
  `price` varchar(255) default NULL,
  `desc` varchar(255) default NULL,
  `icount` varchar(255) default NULL,
  `seller` varchar(255) default NULL,
  `Status` varchar(255) default NULL,
  PRIMARY KEY  (`id`,`iname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `uid` varchar(11) NOT NULL default '0',
  `username` varchar(255) NOT NULL default '',
  `emailid` varchar(255) NOT NULL default '',
  `phone` varchar(255) NOT NULL default '',
  `gender` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `sq` varchar(255) default NULL,
  `sa` varchar(255) default NULL,
  `Role` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`uid`,`username`,`emailid`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `fdid` varchar(255) default NULL,
  `selller` varchar(255) default NULL,
  `Buyer` varchar(255) default NULL,
  `meaages` varchar(255) default NULL,
  `msdate` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `odid` varchar(255) NOT NULL default '',
  `pid` varchar(255) default '',
  `sid` varchar(255) default NULL,
  `rid` varchar(255) default NULL,
  `sellername` varchar(255) default NULL,
  `buyername` varchar(255) default NULL,
  `totalprice` varchar(255) default NULL,
  `cardnumber` varchar(255) default NULL,
  `expdate` varchar(255) default NULL,
  `cvv` varchar(255) default NULL,
  `modifydate` date default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`odid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sellerres
-- ----------------------------
DROP TABLE IF EXISTS `sellerres`;
CREATE TABLE `sellerres` (
  `sid` varchar(255) default NULL,
  `reqid` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `seller` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `statuss` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for shipping
-- ----------------------------
DROP TABLE IF EXISTS `shipping`;
CREATE TABLE `shipping` (
  `pid` varchar(255) NOT NULL default '',
  `sid` varchar(255) default '',
  `rid` varchar(255) default NULL,
  `sellername` varchar(255) default NULL,
  `buyername` varchar(255) default NULL,
  `totalprice` varchar(255) default NULL,
  `saddress` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` varchar(11) NOT NULL default '0',
  `username` varchar(255) NOT NULL default '',
  `emailid` varchar(255) NOT NULL default '',
  `phone` varchar(255) NOT NULL default '',
  `gender` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `sq` varchar(255) default NULL,
  `sa` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`uid`,`username`,`emailid`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for wertyuio
-- ----------------------------
DROP TABLE IF EXISTS `wertyuio`;
CREATE TABLE `wertyuio` (
  `rid` varchar(255) default NULL,
  `rdate` date default NULL,
  `rshift` varchar(255) default NULL,
  `rdescr` varchar(255) default NULL,
  `eid` varchar(255) default NULL,
  `rstatus` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `category` VALUES ('CA002', 'Mobiles');
INSERT INTO `category` VALUES ('CA003', 'laptops');
INSERT INTO `category` VALUES ('CA004', 'kkkk');
INSERT INTO `category` VALUES ('CA005', 'product');
INSERT INTO `category` VALUES ('CA01', 'Fooood');
INSERT INTO `coupons` VALUES ('OR001', 'sudharshan', '989898989', '12000', '2022-11-19');
INSERT INTO `coupons` VALUES ('OR002', 'exvs', '2234232', '234', '2022-11-30');
INSERT INTO `coupons` VALUES ('OR003', 'abcd', '2234232', '234', '2022-11-30');
INSERT INTO `coupons` VALUES ('OR004', 'abcd', '2234232', '234', '2022-11-30');
INSERT INTO `item` VALUES ('CI0006', 'apple', 'Mobiles', ' apple', 'apple', '125132', '1', 'fpath/single_service_02.jpg', '2023-03-11', 'sudhatestmail@gmail.com', '2023-02-28', '678');
INSERT INTO `item` VALUES ('CI0005', 'IQ Con', 'Mobiles', ' IQ Con', 'IQ Con', '23900', '1', 'fpath/single_service_01.jpg', '2023-03-08', 'sudhatestmail@gmail.com', '2023-02-28', '7869');
INSERT INTO `item` VALUES ('CI0001', 'nokia 1100', 'Mobiles', 'nokia 1100 ', 'nokia', '2450', '5', 'fpath/test.jpg', '2023-02-09', 'polo@gmail.com', '2023-02-06', '150');
INSERT INTO `item` VALUES ('CI0002', 'nokia 1101', 'Mobiles', 'nokia 1101', 'nokia', '24522', '5', 'fpath/test.jpg', '2023-02-23', 'polo@gmail.com', '2023-02-06', '510');
INSERT INTO `item` VALUES ('CI0005', 'nokia1122', 'Mobiles', ' nokia1122', 'nokia', '10000', '20', 'fpath/logo.jpg', '2023-02-25', 'sudhatestmail@gmail.com', '2023-02-21', '20');
INSERT INTO `item` VALUES ('CI0004', 'product1', 'product', 'product ', 'product', '1203', '1', 'fpath/team_01.jpg', '2024-10-24', 'sudhatestmail@gmail.com', '2023-02-27', '2000');
INSERT INTO `itemrequest` VALUES ('RP001', 'nokia 1100', '2450', ' ss', '9', 'sudhatestmail@gmail.com', 'Accepted');
INSERT INTO `itemrequest` VALUES ('RP002', 'nokia 1101', '24522', ' ws', '34', 'sudhatestmail@gmail.com', 'Request');
INSERT INTO `itemrequest` VALUES ('RP003', 'product1', '1203', ' ss', '65', 'sudhatestmail@gmail.com', 'Accepted');
INSERT INTO `itemrequest` VALUES ('RP004', 'product1', '1203', ' jhgfdhzx xc kvj  xc', '400', 'sudhatestmail@gmail.com', 'Accepted');
INSERT INTO `itemrequest` VALUES ('RP005', 'product1', '1203', ' sdgdb  rdfhb gfvn', '120', 'sudhatestmail@gmail.com', 'Accepted');
INSERT INTO `itemrequest` VALUES ('RP006', 'IQ Con', '23900', ' IQ Con', '600', 'sudhatestmail@gmail.com', 'Accepted');
INSERT INTO `itemrequest` VALUES ('RP007', 'IQ Con', '23900', ' plpl', '9150', 'sudhatestmail@gmail.com', 'Accepted');
INSERT INTO `manager` VALUES ('1', 'polo', 'polo@gmail.com', '7671974718', 'Male', 'polo', 'sq', 'sa', 'Buyer', 'Active');
INSERT INTO `manager` VALUES ('2', 'sudharshan', 'sudhatestmail@gmail.com', '7671974718', 'Male', 'sudhatestmail', 'What was your favorite school teacher?s name?', 'shan', 'Buyer', 'Active');
INSERT INTO `manager` VALUES ('3', 'sudha', 'sudha.kota23@gmail.com', '9876543219', 'Male', 'sudha', 'What is your pet name?', 'sudha', 'Seller', 'Active');
INSERT INTO `manager` VALUES ('4', 'abhishek', 'drabhishek.cvr@gmail.com', '9876543218', 'Male', 'abhishek', 'What was your favorite school teacher?s name?', 'abhishek', 'Seller', 'Active');
INSERT INTO `manager` VALUES ('5', 'sanjay', 'bindisanjay@gmail.com', '9876543217', 'Male', 'sanjay', 'What was your favorite school teacher?s name?', 'sanjay', 'Buyer', 'Active');
INSERT INTO `messages` VALUES ('MP001', 'sudhatestmail@gmail.com', 'sudha.kota23@gmail.com', ' hello', '2023-02-06');
INSERT INTO `messages` VALUES ('MP002', 'sudhatestmail@gmail.com', 'sudha.kota23@gmail.com', ' Hello\r\n', '2023-02-06');
INSERT INTO `messages` VALUES ('MP003', 'sudhatestmail@gmail.com', 'sudha.kota23@gmail.com', ' How r u', '2023-02-06');
INSERT INTO `messages` VALUES ('MP004', 'drabhishek.cvr@gmail.com', 'bindisanjay@gmail.com', 'Haiiiiiii ', '2023-02-07');
INSERT INTO `messages` VALUES ('MP005', 'drabhishek.cvr@gmail.com', 'bindisanjay@gmail.com', ' hello', '2023-02-07');
INSERT INTO `messages` VALUES ('MP006', 'drabhishek.cvr@gmail.com', 'sudhatestmail@gmail.com', ' 121521', '2023-02-28');
INSERT INTO `orderdetails` VALUES ('OR001', 'SPA001', 'BPR01', 'RP001', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '4050000', '998877665544', '10/29', '123', '2023-02-28', 'Success');
INSERT INTO `orderdetails` VALUES ('OR002', 'SPA001', 'BPR01', 'RP001', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '4000000', '345678909876', '10/29', '123', '2023-02-28', 'Success');
INSERT INTO `orderdetails` VALUES ('OR003', 'SPA005', 'BPR07', 'RP006', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '4050000', '998877665544', '12/2029', '365', '2023-02-28', 'Success');
INSERT INTO `orderdetails` VALUES ('OR004', 'SPA006', 'BPR010', 'RP007', 'drabhishek.cvr@gmail.com', 'sudhatestmail@gmail.com', '15303235', '98765432198', '12/30', '458', '2023-02-28', 'Success');
INSERT INTO `sellerres` VALUES ('BPR01', 'RP001', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '9', 'Accepteds');
INSERT INTO `sellerres` VALUES ('BPR02', 'RP003', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '98', 'Accepteds');
INSERT INTO `sellerres` VALUES ('BPR03', 'RP004', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '490', 'Accepteds');
INSERT INTO `sellerres` VALUES ('BPR04', 'RP004', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '63', 'waiting');
INSERT INTO `sellerres` VALUES ('BPR05', 'RP004', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '100', 'waiting');
INSERT INTO `sellerres` VALUES ('BPR06', 'RP005', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '150', 'Accepteds');
INSERT INTO `sellerres` VALUES ('BPR07', 'RP006', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '650', 'Accepteds');
INSERT INTO `sellerres` VALUES ('BPR08', 'RP006', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '9600', 'waiting');
INSERT INTO `sellerres` VALUES ('BPR09', 'RP007', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '8000', 'Accepteds');
INSERT INTO `sellerres` VALUES ('BPR010', 'RP007', 'drabhishek.cvr@gmail.com', 'sudhatestmail@gmail.com', '10000', 'Accepteds');
INSERT INTO `shipping` VALUES ('SPA001', 'BPR01', 'RP001', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '9', 'sdsdb dbdng ', 'Delivered');
INSERT INTO `shipping` VALUES ('SPA002', 'BPR03', 'RP004', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '490', '452155jhsbkjc mz', 'Rejected');
INSERT INTO `shipping` VALUES ('SPA003', 'BPR02', 'RP003', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '98', 'plolp', 'Conformed');
INSERT INTO `shipping` VALUES ('SPA004', 'BPR06', 'RP005', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '150', 'dshdfcnv fgcvn fgcvn vb', 'OnTheWay');
INSERT INTO `shipping` VALUES ('SPA005', 'BPR07', 'RP006', 'sudha.kota23@gmail.com', 'sudhatestmail@gmail.com', '650', 'ryuhhibk  ihb ', 'Delivered');
INSERT INTO `shipping` VALUES ('SPA006', 'BPR010', 'RP007', 'drabhishek.cvr@gmail.com', 'sudhatestmail@gmail.com', '10000', 'ploplo', 'Delivered');
INSERT INTO `users` VALUES ('2', 'polo', 'polo@gmail.com', '9876543219', 'Male', 'polo', 'What is your pet name?', 'polo', 'Buyer', 'Pending');
INSERT INTO `users` VALUES ('4', 'polopolo', 'polopolo@gmail.com', '9876543213', 'Male', 'polopolo', 'What was your favorite school teacher?s name?', 'shan', 'Seller', 'Pending');
INSERT INTO `wertyuio` VALUES ('RL001', '2022-11-24', 'G', ' ss', 'EM001', 'Approve');
INSERT INTO `wertyuio` VALUES ('RM002', '2022-11-16', 'G', ' sdfghj', 'EM001', 'Approve');
INSERT INTO `wertyuio` VALUES ('RM003', '2022-11-23', 'C', ' ddd', 'EM001', 'Approve');
INSERT INTO `wertyuio` VALUES ('RM004', '2022-11-25', 'B', ' ss', 'EM001', 'Reject');
INSERT INTO `wertyuio` VALUES ('RM005', '2022-11-30', 'C', ' ', 'EM001', 'Reject');
INSERT INTO `wertyuio` VALUES ('RM006', '2022-11-24', 'B', 'ddd', 'EM001', 'Reject');
