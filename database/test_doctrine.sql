/*
 Navicat MySQL Data Transfer

 Source Server         : TESTLAMP
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 185.115.218.166:3306
 Source Schema         : test_doctrine

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 09/06/2022 11:06:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for doctrine_migration_versions
-- ----------------------------
DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions`  (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime NULL DEFAULT NULL,
  `execution_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctrine_migration_versions
-- ----------------------------
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220606140135', '2022-06-06 16:01:50', 334);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220607100650', '2022-06-07 12:08:49', 46);
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220607105059', '2022-06-07 12:51:43', 49);

-- ----------------------------
-- Table structure for punten_detail
-- ----------------------------
DROP TABLE IF EXISTS `punten_detail`;
CREATE TABLE `punten_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `datum` date NULL DEFAULT NULL,
  `aantal` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_6DA56532CB944F1A`(`student_id`) USING BTREE,
  CONSTRAINT `FK_6DA56532CB944F1A` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of punten_detail
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `voornaam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `geboortedatum` date NULL DEFAULT NULL,
  `punten` int(11) NULL DEFAULT NULL,
  `geslacht` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_B723AF33FC4DB938`(`naam`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `voornaam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `geboortedatum` date NULL DEFAULT NULL,
  `specialisatie` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'De Ryck', 'Steven', '1990-01-01', 'geen');
INSERT INTO `teacher` VALUES (2, 'Willems', 'Vera', '1990-01-02', 'zwemmen');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `naam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `voornaam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `telefoon` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_8D93D649E7927C74`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for vak
-- ----------------------------
DROP TABLE IF EXISTS `vak`;
CREATE TABLE `vak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vak
-- ----------------------------
INSERT INTO `vak` VALUES (1, 'Wiskunde');
INSERT INTO `vak` VALUES (2, 'Biologie');
INSERT INTO `vak` VALUES (3, 'Filosofie');
INSERT INTO `vak` VALUES (4, 'Klimaat');
INSERT INTO `vak` VALUES (5, 'Nederlands');

-- ----------------------------
-- Table structure for vak_teacher
-- ----------------------------
DROP TABLE IF EXISTS `vak_teacher`;
CREATE TABLE `vak_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `vak_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_3C9FC1AA41807E1D`(`teacher_id`) USING BTREE,
  INDEX `IDX_3C9FC1AABDCC7DA2`(`vak_id`) USING BTREE,
  CONSTRAINT `FK_3C9FC1AABDCC7DA2` FOREIGN KEY (`vak_id`) REFERENCES `vak` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_3C9FC1AA41807E1D` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vak_teacher
-- ----------------------------
INSERT INTO `vak_teacher` VALUES (1, 1, 1);
INSERT INTO `vak_teacher` VALUES (2, 1, 2);
INSERT INTO `vak_teacher` VALUES (3, 1, 3);
INSERT INTO `vak_teacher` VALUES (4, 2, 4);
INSERT INTO `vak_teacher` VALUES (5, 2, 5);
INSERT INTO `vak_teacher` VALUES (6, 2, 1);

SET FOREIGN_KEY_CHECKS = 1;
