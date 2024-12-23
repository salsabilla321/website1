/*
 Navicat Premium Data Transfer

 Source Server         : bakery store
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost
 Source Schema         : bakery_store

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 13/12/2024 18:55:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 2, 1);
INSERT INTO `cart` VALUES (2, 5, 1);
INSERT INTO `cart` VALUES (3, 4, 1);

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (0, '');
INSERT INTO `kategori` VALUES (1, 'brownis');



-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori_id` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ketersediaan_stok` enum('habis','tersedia') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'tersedia',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nama`(`nama` ASC) USING BTREE,
  INDEX `kategori_produk`(`kategori_id` ASC) USING BTREE,
  CONSTRAINT `kategori_produk` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 1, 'brownis lumer choco cips', 20000, 'Brownis lumer choco chip adalah kue brownis dengan tambahan cokelat chip yang meleleh saat di makan', 'tersedia');
INSERT INTO `produk` VALUES (2, 1, 'brownis lumer keju', 15000, 'keju4.jpg', 'Brownies lumer keju adalah kue brownies dengan tambahan keju yang meleleh dan memberikan rasa gurih..', 'tersedia');
INSERT INTO `produk` VALUES (3, 2, 'brownis lumer oreo', 15000, 'oreo3.jpg', 'Brownis lumer Oreo adalah kue brownis dengan taburan atau isian Oreo yang meleleh saat di makan', 'tersedia');
INSERT INTO `produk` VALUES (4, 2, 'brownis lumer kacang', 15000, 'kacang.jpg', 'Brownis lumer kacang adalah kue brownis dengan taburan atau isian kacang yang memberikan tekstur crunchy.', 'tersedia');
INSERT INTO `produk` VALUES (5, 2, 'brownis lumer mix1', 30000, ' brownis lumer mix1.jpg', 'Brownies lumer mix adalah kue brownies dengan campuran topping seperti cokelat, keju, kacang dan lainnya.', 'tersedia');
INSERT INTO `produk` VALUES (6, 3, 'brownis lumer mix2', 30000, 'brownis lumer mix 2.jpg', 'Brownies lumer mix adalah kue brownies dengan campuran topping seperti cokelat, keju, kacang dan lainnya.', 'tersedia');


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user 1', '123');

SET FOREIGN_KEY_CHECKS = 1;
