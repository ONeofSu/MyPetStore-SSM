DROP DATABASE IF EXISTS `mypetstore-user`;
CREATE DATABASE `mypetstore-user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `mypetstore-user`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
                            `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `firstname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `lastname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `addr2` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('ACID', 'acid@yourdomain.com', 'ABC', 'XYX', 'OK', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('CSUstudent', '8209230701@csu.edu.cn', 'ABCD', 'XYXY', 'OK', '902 San Antonio Road', 'MS UCUP02-210', 'Palo Alto', 'CA', '94303', 'USA', '777-777-7777');
INSERT INTO `account` VALUES ('forgetfulMan', 'secret@qq.com', 'ABC', 'XYX', 'OK', '902 San Antonio Road', 'MS UCUP02-208', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('j2ee', 'yourname@yourdomain.com', 'ABCD', 'XYXY', 'OK', '902 San Antonio Road', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', '555-555-5555');
INSERT INTO `account` VALUES ('XiheLiu', '123456@qq.com', 'Xihe', 'Liu', 'OK', '902 San Antonio Road', 'MS UCUP02-209', 'Palo Alto', 'CA', '94303', 'USA', '666-666-6666');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                          `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
                         `itemid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `quantity` int NULL DEFAULT NULL,
                         PRIMARY KEY (`itemid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('EST-20', 'j2ee', 1);

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
                            `userid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `langpref` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `favcategory` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `mylistopt` int NULL DEFAULT NULL,
                            `banneropt` int NULL DEFAULT NULL,
                            PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('ACID', 'english', 'CATS', 1, 1);
INSERT INTO `profile` VALUES ('j2ee', 'english', 'CATS', 1, 1);

-- ----------------------------
-- Table structure for resetpassword
-- ----------------------------
DROP TABLE IF EXISTS `resetpassword`;
CREATE TABLE `resetpassword`  (
                                  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                  `status` int NULL DEFAULT NULL,
                                  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resetpassword
-- ----------------------------
INSERT INTO `resetpassword` VALUES ('j2ee', 0);
INSERT INTO `resetpassword` VALUES ('XiheLiu', 0);

-- ----------------------------
-- Table structure for signon
-- ----------------------------
DROP TABLE IF EXISTS `signon`;
CREATE TABLE `signon`  (
                           `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                           `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                           PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of signon
-- ----------------------------
INSERT INTO `signon` VALUES ('ACID', 'ACID');
INSERT INTO `signon` VALUES ('CSUstudent', '789');
INSERT INTO `signon` VALUES ('forgetfulMan', '123');
INSERT INTO `signon` VALUES ('j2ee', 'j2ee');
INSERT INTO `signon` VALUES ('XiheLiu', '456');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
                             `suppid` int NOT NULL,
                             `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                             `addr1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `addr2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `city` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `state` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `zip` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             `phone` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                             PRIMARY KEY (`suppid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, 'XYZ Pets', 'AC', '600 Avon Way', '', 'Los Angeles', 'CA', '94024', '212-947-0797');
INSERT INTO `supplier` VALUES (2, 'ABC Pets', 'AC', '700 Abalone Way', '', 'San Francisco ', 'CA', '94024', '415-947-0797');

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress`  (
                                `userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `addrid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `addr1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `addr2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES ('ACID', '1', 'ABC', 'XYX', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'OK');
INSERT INTO `useraddress` VALUES ('j2ee', '1', 'ABC', 'XYX', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'OK');
INSERT INTO `useraddress` VALUES ('j2ee', '2', 'ABCD', 'XYXY', '902 San Antonio Road', 'MS UCUP02-207', 'Palo Alto', 'CA', '94303', 'USA', 'OK');
INSERT INTO `useraddress` VALUES ('j2ee', '3', 'ABC', 'XYX', '901 San Antonio Road', 'MS UCUP02-206', 'Palo Alto', 'CA', '94303', 'USA', 'OK');

-- ----------------------------
-- Table structure for bannerdata
-- ----------------------------
DROP TABLE IF EXISTS `bannerdata`;
CREATE TABLE `bannerdata`  (
                               `favcategory` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `bannername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY (`favcategory`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bannerdata
-- ----------------------------
INSERT INTO `bannerdata` VALUES ('BIRDS', '<image src=\"../images/banner_birds.gif\">');
INSERT INTO `bannerdata` VALUES ('CATS', '<image src=\"../images/banner_cats.gif\">');
INSERT INTO `bannerdata` VALUES ('DOGS', '<image src=\"../images/banner_dogs.gif\">');
INSERT INTO `bannerdata` VALUES ('FISH', '<image src=\"../images/banner_fish.gif\">');
INSERT INTO `bannerdata` VALUES ('REPTILES', '<image src=\"../images/banner_reptiles.gif\">');

-- ----------------------------
-- Table structure for journal
-- ----------------------------
DROP TABLE IF EXISTS `journal`;
CREATE TABLE `journal`  (
                            `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of journal
-- ----------------------------
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '06-11-2024 08:20:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 08:20:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '06-11-2024 08:20:19', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:42', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '06-11-2024 08:20:44', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:46', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-02\">FI-SW-02</a>.', '06-11-2024 08:20:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '06-11-2024 08:20:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '06-11-2024 08:20:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '06-11-2024 08:20:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-CW-01\">K9-CW-01</a>.', '06-11-2024 08:20:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-RT-02\">K9-RT-02</a>.', '06-11-2024 08:20:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-RT-01\">K9-RT-01</a>.', '06-11-2024 08:20:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:20:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-PO-02\">K9-PO-02</a>.', '06-11-2024 08:21:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '06-11-2024 08:21:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-DL-01\">K9-DL-01</a>.', '06-11-2024 08:21:02', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:21:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-9\">EST-9</a> to the <a href=\"cartForm\">cart</a>.', '06-11-2024 08:21:08', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:21:27', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:25:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-9\">EST-9</a>.', '06-11-2024 08:26:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"productForm?productId=EST-9\">EST-9<\\a> from the <a href=\"cartForm\">cart</a>.', '06-11-2024 08:26:11', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=EST-9\">EST-9</a>.', '06-11-2024 08:26:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '06-11-2024 15:35:51', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 15:35:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '06-11-2024 15:35:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '06-11-2024 15:35:58', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1014\">1014</a>.', '06-11-2024 15:36:07', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 15:36:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '06-11-2024 15:36:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '06-11-2024 15:36:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '06-11-2024 15:36:34', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1015\">1015</a>.', '06-11-2024 15:36:48', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:37:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:37:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '06-11-2024 15:37:25', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '06-11-2024 15:37:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '06-11-2024 15:37:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:37:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '06-11-2024 15:38:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '06-11-2024 15:38:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '19-12-2024 16:12:37', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '19-12-2024 17:28:49', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '20-12-2024 15:47:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '20-12-2024 15:47:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '20-12-2024 15:47:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '20-12-2024 15:47:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '20-12-2024 15:47:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '20-12-2024 15:48:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 15:08:43', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '22-12-2024 15:08:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 15:09:22', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 15:33:27', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null logged out.', '22-12-2024 15:33:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 17:43:03', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '22-12-2024 17:43:18', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '22-12-2024 17:43:24', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '22-12-2024 17:43:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '22-12-2024 17:43:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '22-12-2024 17:43:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 20:07:44', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '22-12-2024 20:08:17', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '22-12-2024 20:08:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 20:59:52', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:01:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:04:50', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:07:04', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '22-12-2024 21:08:18', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:10:06', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:18:19', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:24:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '22-12-2024 21:24:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:25:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:30:33', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '22-12-2024 21:30:43', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:31:48', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '22-12-2024 21:33:21', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '22-12-2024 21:34:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 12:30:30', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 12:50:59', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '23-12-2024 12:51:07', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 13:01:22', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 13:19:49', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 16:57:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '23-12-2024 16:57:45', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '23-12-2024 16:58:17', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 16:59:43', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:02:30', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:06:20', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '23-12-2024 17:13:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '23-12-2024 17:13:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '23-12-2024 17:13:40', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '23-12-2024 17:13:41', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:26:17', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:28:18', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:31:19', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '23-12-2024 17:34:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '23-12-2024 17:34:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-4\">EST-4</a>.', '23-12-2024 17:34:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:42:15', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:46:52', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:49:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 17:52:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:01:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:09:03', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:12:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:13:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:22:47', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:26:16', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '23-12-2024 21:27:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:28:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:32:21', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:34:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 21:39:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:04:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:05:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:06:36', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:11:46', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:18:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:19:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:20:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:21:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:23:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:29:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:41:47', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:47:02', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:54:41', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:56:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 22:58:27', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 23:00:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '23-12-2024 23:07:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:19:39', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:24:50', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:26:53', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:28:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:32:05', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:38:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:46:29', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:52:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-12-2024 01:55:05', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:55:56', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 01:57:56', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 02:02:17', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 02:03:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-12-2024 02:04:23', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 02:05:26', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:05:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1016\">1016</a>.', '24-12-2024 02:07:26', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:11:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1017\">1017</a>.', '24-12-2024 02:14:10', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 02:19:27', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:19:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 02:19:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:19:31', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1018\">1018</a>.', '24-12-2024 02:19:54', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:22:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 02:22:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:22:50', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 02:22:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:22:53', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-02\">FI-SW-02</a>.', '24-12-2024 02:23:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-3\">EST-3</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 02:23:02', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1019\">1019</a>.', '24-12-2024 02:23:04', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 02:26:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:06:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 10:11:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 10:12:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 10:12:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 10:12:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:12:37', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 10:12:46', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-SN-01\">RP-SN-01</a>.', '24-12-2024 10:12:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-12\">EST-12</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:12:50', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-SN-01\">RP-SN-01</a>.', '24-12-2024 10:12:50', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-11\">EST-11</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:12:51', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1020\">1020</a>.', '24-12-2024 10:17:04', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:27:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 10:27:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:28:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:31:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:32:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 10:34:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:36:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:37:43', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:40:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:41:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:44:24', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 10:44:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:37', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 10:44:38', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:38', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 10:44:39', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:40', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 10:44:41', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-21\">EST-21</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 10:44:43', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:49:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:50:20', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:53:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:54:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:57:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 10:59:35', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:01:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1021\">1021</a>.', '24-12-2024 11:03:33', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:06:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:06:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:17', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:06:18', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:19', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 11:06:20', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:21', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 11:06:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-02\">FI-SW-02</a>.', '24-12-2024 11:06:27', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-3\">EST-3</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:28', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 11:06:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-2\">EST-2</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:06:30', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1022\">1022</a>.', '24-12-2024 11:07:08', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:09:02', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:09:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:09:25', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1023\">1023</a>.', '24-12-2024 11:09:31', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:12:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:12:17', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-5\">EST-5</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:12:19', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1024\">1024</a>.', '24-12-2024 11:12:22', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 11:18:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:20:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 11:20:27', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:20:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:20:33', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 11:20:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-21\">EST-21</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:20:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1025\">1025</a>.', '24-12-2024 11:20:55', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:27:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 11:27:38', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 11:27:39', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1026\">1026</a>.', '24-12-2024 11:27:43', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 11:27:50', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:33:13', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 11:34:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 11:34:08', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '24-12-2024 11:34:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 11:36:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:04:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 14:04:45', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 14:04:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-19\">EST-19</a>.', '24-12-2024 14:04:49', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:47:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 14:47:40', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 14:47:41', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:51:51', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 14:54:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 14:55:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:14:35', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:16:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:17:01', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 15:17:42', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 15:18:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 15:18:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 15:31:02', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 16:33:11', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 16:56:57', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 16:56:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 16:57:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 16:57:02', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1027\">1027</a>.', '24-12-2024 16:57:17', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:00:28', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:00:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:00:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:00:32', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1028\">1028</a>.', '24-12-2024 17:00:37', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:05:58', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:06:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:06:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:06:05', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1029\">1029</a>.', '24-12-2024 17:06:11', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:07:29', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:07:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:07:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:07:33', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1030\">1030</a>.', '24-12-2024 17:07:39', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:08:07', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:08:09', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:08:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:08:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1031\">1031</a>.', '24-12-2024 17:08:16', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:08:51', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:08:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:08:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:08:56', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1032\">1032</a>.', '24-12-2024 17:08:59', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:10:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:10:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 17:10:13', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:10:14', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1033\">1033</a>.', '24-12-2024 17:10:18', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:12:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 17:12:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 17:12:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:12:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1034\">1034</a>.', '24-12-2024 17:12:39', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:13:10', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 17:13:14', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 17:13:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:13:17', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1035\">1035</a>.', '24-12-2024 17:13:26', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:14:08', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 17:14:10', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 17:14:11', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 17:14:12', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1036\">1036</a>.', '24-12-2024 17:14:18', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 17:15:37', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 19:17:52', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 19:41:22', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 19:41:24', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 19:41:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-21\">EST-21</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 19:41:28', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:13:44', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:40:14', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 20:40:16', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 20:40:18', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 20:40:19', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1037\">1037</a>.', '24-12-2024 20:40:33', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:41:36', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:43:41', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 20:44:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 20:44:56', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '24-12-2024 20:44:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-15\">EST-15</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 20:44:58', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1038\">1038</a>.', '24-12-2024 20:45:11', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 22:21:34', '#4472C4');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 22:21:36', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '24-12-2024 22:21:37', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:21:38', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 22:21:41', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=K9-PO-02\">K9-PO-02</a>.', '24-12-2024 22:21:43', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null added product <a href=\"itemForm?itemId=EST-8\">EST-8</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:21:44', '#FFC000');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:21:50', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:21:51', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:21:52', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 22:22:33', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:22:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:22:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:22:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 22:22:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:22:54', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:22:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:23:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:23:01', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 22:24:04', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '24-12-2024 22:24:05', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-6\">EST-6</a>.', '24-12-2024 22:24:06', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-6\">EST-6</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:08', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 22:24:19', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 22:24:19', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:20', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:24:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:24:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:23', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 22:24:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-SW-01\">FI-SW-01</a>.', '24-12-2024 22:24:31', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-2\">EST-2</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:32', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:24:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '24-12-2024 22:24:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:24:57', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '24-12-2024 22:25:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:25:45', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 22:25:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '24-12-2024 22:26:21', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '24-12-2024 22:26:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:23', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '24-12-2024 22:26:25', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-DL-01\">K9-DL-01</a>.', '24-12-2024 22:26:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-9\">EST-9</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:27', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '24-12-2024 22:26:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '24-12-2024 22:26:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:30', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 22:26:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '24-12-2024 22:26:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-15\">EST-15</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:34', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '24-12-2024 22:26:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-CB-01\">AV-CB-01</a>.', '24-12-2024 22:26:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-18\">EST-18</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:36', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 22:26:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 22:26:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-16\">EST-16</a> to the <a href=\"cartForm\">cart</a>.', '24-12-2024 22:26:59', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '24-12-2024 22:27:02', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '24-12-2024 22:27:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:14:29', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '25-12-2024 08:14:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:49:06', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1039\">1039</a>.', '25-12-2024 08:49:43', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:51:31', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '25-12-2024 08:51:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-15\">EST-15</a> to the <a href=\"cartForm\">cart</a>.', '25-12-2024 08:51:38', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '25-12-2024 08:53:17', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1040\">1040</a>.', '25-12-2024 08:53:48', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '10-01-2025 14:41:19', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '10-01-2025 14:44:36', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '10-01-2025 14:44:37', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 14:44:38', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added a new order <a href=\"viewOrder?orderId=1041\">1041</a>.', '10-01-2025 14:48:39', '#ED7D31');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '10-01-2025 15:04:23', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '10-01-2025 15:11:40', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '10-01-2025 15:18:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DSH-01\">FL-DSH-01</a>.', '10-01-2025 15:18:30', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-14\">EST-14</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:31', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '10-01-2025 15:18:41', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:18:42', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:44', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-01-2025 15:18:46', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '10-01-2025 15:18:47', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:47', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '10-01-2025 15:18:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:18:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:18:53', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:19:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:19:01', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '10-01-2025 15:19:45', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '10-01-2025 15:19:56', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '10-01-2025 15:20:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '10-01-2025 15:20:02', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-4\">EST-4</a>.', '10-01-2025 15:20:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:20:04', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '10-01-2025 15:20:22', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=AV-SB-02\">AV-SB-02</a>.', '10-01-2025 15:20:23', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-19\">EST-19</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:20:24', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '10-01-2025 15:20:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '10-01-2025 15:20:29', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-13\">EST-13</a> to the <a href=\"cartForm\">cart</a>.', '10-01-2025 15:20:29', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-19\">EST-19</a>.', '10-01-2025 15:51:25', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 13:52:07', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 13:52:26', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '11-01-2025 13:52:44', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '11-01-2025 13:53:03', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 13:53:13', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=BIRDS\">BIRDS</a>.', '11-01-2025 13:53:24', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 13:53:33', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=DOGS\">DOGS</a>.', '11-01-2025 13:53:34', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=K9-BD-01\">K9-BD-01</a>.', '11-01-2025 13:53:35', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-6\">EST-6</a>.', '11-01-2025 13:53:48', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 13:53:50', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '11-01-2025 13:53:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-4\">EST-4</a>.', '11-01-2025 13:53:52', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=REPTILES\">REPTILES</a>.', '11-01-2025 13:53:53', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=RP-LI-02\">RP-LI-02</a>.', '11-01-2025 13:53:54', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-13\">EST-13</a>.', '11-01-2025 13:53:55', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 13:53:57', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '11-01-2025 13:53:58', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '11-01-2025 13:53:59', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 13:54:00', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '11-01-2025 13:54:01', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '11-01-2025 13:54:12', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:25:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-4\">EST-4</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:26:15', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-13\">EST-13</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:05', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-14\">EST-14</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:06', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee deleted product <a href=\"itemForm?itemId=EST-19\">EST-19</a> from the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:06', '#BF9000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '11-01-2025 14:33:08', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-01\">FI-FW-01</a>.', '11-01-2025 14:33:32', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-4\">EST-4</a> to the <a href=\"cartForm\">cart</a>.', '11-01-2025 14:33:34', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:54:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:55:32', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:56:18', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 14:57:36', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 15:00:34', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 15:01:35', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FI-FW-02\">FI-FW-02</a>.', '11-01-2025 15:31:28', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee added product <a href=\"itemForm?itemId=EST-20\">EST-20</a> to the <a href=\"cartForm\">cart</a>.', '11-01-2025 15:31:29', '#FFC000');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged in.', '11-01-2025 16:12:42', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product category: <a href=\"categoryForm?categoryId=CATS\">CATS</a>.', '11-01-2025 16:30:21', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the product: <a href=\"productForm?productId=FL-DLH-02\">FL-DLH-02</a>.', '11-01-2025 16:37:51', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee browsed the item: <a href=\"itemForm?itemId=EST-16\">EST-16</a>.', '11-01-2025 16:42:23', '#70AD47');
INSERT INTO `journal` VALUES (NULL, 'User null browsed the product category: <a href=\"categoryForm?categoryId=FISH\">FISH</a>.', '07-03-2025 19:38:39', '#70AD47');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '07-03-2025 19:39:59', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '07-03-2025 19:52:25', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '08-03-2025 14:24:45', '#4472C4');
INSERT INTO `journal` VALUES ('j2ee', 'User j2ee logged out.', '08-03-2025 21:01:22', '#4472C4');

-- ----------------------------
-- Table structure for productjournal
-- ----------------------------
DROP TABLE IF EXISTS `productjournal`;
CREATE TABLE `productjournal`  (
                                   `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `productId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productjournal
-- ----------------------------

-- ----------------------------
-- Table structure for viewproduct
-- ----------------------------
DROP TABLE IF EXISTS `viewproduct`;
CREATE TABLE `viewproduct`  (
                                `productId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `viewCount` int NULL DEFAULT NULL,
                                PRIMARY KEY (`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of viewproduct
-- ----------------------------
INSERT INTO `viewproduct` VALUES ('AV-CB-01', 0);
INSERT INTO `viewproduct` VALUES ('AV-SB-02', 0);
INSERT INTO `viewproduct` VALUES ('FI-FW-01', 2);
INSERT INTO `viewproduct` VALUES ('FI-FW-02', 3);
INSERT INTO `viewproduct` VALUES ('FI-SW-01', 1);
INSERT INTO `viewproduct` VALUES ('FI-SW-02', 0);
INSERT INTO `viewproduct` VALUES ('FL-DLH-02', 0);
INSERT INTO `viewproduct` VALUES ('FL-DSH-01', 0);
INSERT INTO `viewproduct` VALUES ('K9-BD-01', 0);
INSERT INTO `viewproduct` VALUES ('K9-CW-01', 0);
INSERT INTO `viewproduct` VALUES ('K9-DL-01', 0);
INSERT INTO `viewproduct` VALUES ('K9-PO-02', 0);
INSERT INTO `viewproduct` VALUES ('K9-RT-01', 0);
INSERT INTO `viewproduct` VALUES ('K9-RT-02', 0);
INSERT INTO `viewproduct` VALUES ('RP-LI-02', 0);
INSERT INTO `viewproduct` VALUES ('RP-SN-01', 0);

SET FOREIGN_KEY_CHECKS = 1;