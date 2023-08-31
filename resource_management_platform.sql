/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : resource_management_platform

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 08/08/2023 18:30:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for damage_record
-- ----------------------------
DROP TABLE IF EXISTS `damage_record`;
CREATE TABLE `damage_record`  (
  `damage_record_id` bigint NOT NULL AUTO_INCREMENT,
  `damage_record_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '损坏描述',
  `damage_record_time` datetime NULL DEFAULT NULL COMMENT '物品损坏时间',
  `item_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品名称',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `damage_record_isread` tinyint(1) NULL DEFAULT 0 COMMENT '管理员是否已读',
  `damage_record_img` varchar(2250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品损坏图片',
  `damage_record_ishandle` tinyint(1) NULL DEFAULT 0 COMMENT '是否处理',
  PRIMARY KEY (`damage_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1688539362744770562 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物品损坏记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of damage_record
-- ----------------------------
INSERT INTO `damage_record` VALUES (1688857657058447362, '坏了就是坏了，还能骗你不成//////////1', '2023-08-08 00:00:00', '椅子', 'lifang', 0, 'http://localhost:9090/damage/record/img-find/79135c88-da99-4e38-853e-e59bfc3b6d46.png', 0);

-- ----------------------------
-- Table structure for funds
-- ----------------------------
DROP TABLE IF EXISTS `funds`;
CREATE TABLE `funds`  (
  `id` bigint NOT NULL COMMENT '主键ID',
  `asset` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '资产名称',
  `asset_value` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '资产价值',
  `judge` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '资产是否可支配（1/0）',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of funds
-- ----------------------------
INSERT INTO `funds` VALUES (1687102921124814849, '股票', '60000', '是', '2023-08-06 21:20:11');
INSERT INTO `funds` VALUES (1688363451466625025, '分红', '45230', '是', '2023-08-07 09:36:30');
INSERT INTO `funds` VALUES (1688728175538548738, '现金', '4520', '否', '2023-08-08 12:17:40');

-- ----------------------------
-- Table structure for funds_log
-- ----------------------------
DROP TABLE IF EXISTS `funds_log`;
CREATE TABLE `funds_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `summary` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `asset_id` bigint NULL DEFAULT NULL COMMENT '资产ID',
  `asset` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '资产名',
  `asset_value` bigint NULL DEFAULT NULL COMMENT '资产价值',
  `judge` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '资产是否可支配（是/否）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1688363969924542466 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of funds_log
-- ----------------------------
INSERT INTO `funds_log` VALUES (1688178105315418115, '2023-08-06 21:20:00', '增加资金', 1688178105315418114, '债卷', 45200, '否');
INSERT INTO `funds_log` VALUES (1688178154351026177, '2023-08-06 21:20:11', '修改资金', 1687102921124814849, '股票', 60000, '是');
INSERT INTO `funds_log` VALUES (1688178232776122369, '2023-08-06 21:20:30', '修改资金', 1688178105315418114, '债卷', 50000, '否');
INSERT INTO `funds_log` VALUES (1688363451466625026, '2023-08-07 09:36:30', '增加资金', 1688363451466625025, '分红', 45230, '是');
INSERT INTO `funds_log` VALUES (1688363969924542466, '2023-08-07 09:38:33', '删除资金', 1688178105315418114, '债卷', 50000, '否');
INSERT INTO `funds_log` VALUES (1688728175538548739, '2023-08-08 09:45:47', '增加资金', 1688728175538548738, '现金', 4520, '是');
INSERT INTO `funds_log` VALUES (1688758191081086978, '2023-08-08 11:45:03', '修改资金', 1688728175538548738, '现金', 4520, '否');
INSERT INTO `funds_log` VALUES (1688758318541791235, '2023-08-08 11:45:33', '增加资金', 1688758318541791234, '测试', 4520, '否');
INSERT INTO `funds_log` VALUES (1688766337786810369, '2023-08-08 12:17:25', '修改资金', 1688758318541791234, '测试', 4520, '是');
INSERT INTO `funds_log` VALUES (1688766370355580930, '2023-08-08 12:17:33', '修改资金', 1688728175538548738, '现金', 4520, '是');
INSERT INTO `funds_log` VALUES (1688766400474877954, '2023-08-08 12:17:40', '修改资金', 1688728175538548738, '现金', 4520, '否');
INSERT INTO `funds_log` VALUES (1688845290429960194, '2023-08-08 17:31:09', '删除资金', 1688758318541791234, '测试', 4520, '是');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `item_id` bigint NOT NULL AUTO_INCREMENT COMMENT '物品ID',
  `item_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物品名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `number` int NULL DEFAULT NULL COMMENT '数量',
  `price` double NULL DEFAULT 1 COMMENT '价格',
  `imgs` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `videos` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1688538728045912066 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1688757962877394946, '服务器', '用于部署开发', 1, 4520, 'http://localhost:9090/item/img-find/488fd9cc-050e-40b5-8918-7d41a551e5d6.JPG', '');
INSERT INTO `item` VALUES (1688758049867259906, '测试视频', '测试', 1, 1210, '', 'http://localhost:9090/item/img-find/6ca7f6ae-9144-4385-b116-09abd20f32fe.mp4');
INSERT INTO `item` VALUES (1688844575263379458, '椅子', '用于办公使用', 1, 12, 'http://localhost:9090/item/img-find/bc1b37d7-c03c-4959-baee-4dd2cfdce9de.JPG', '');
INSERT INTO `item` VALUES (1688844663096299522, '电脑', '用于项目开发', 1, 4520, 'http://localhost:9090/item/img-find/2d22506f-eb3a-46de-9b4e-36b200fe8b7c.JPG', '');
INSERT INTO `item` VALUES (1688844818340073474, '打印机', '便于大家使用', 1, 600, 'http://localhost:9090/item/img-find/a696f4d0-864c-4a45-b6b9-4dc2761ac6ed.JPG', '');

-- ----------------------------
-- Table structure for item_apply
-- ----------------------------
DROP TABLE IF EXISTS `item_apply`;
CREATE TABLE `item_apply`  (
  `apply_id` bigint NOT NULL COMMENT '申请id 主键',
  `apply_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请人',
  `apply_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请内容',
  `apply_money` double NOT NULL COMMENT '申请金额',
  `apply_status` int NOT NULL DEFAULT -1 COMMENT '申请状态',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item_apply
-- ----------------------------
INSERT INTO `item_apply` VALUES (1688760260466794497, '李智超', '椅子//////////1//////////没椅子坐了', 45, 1, '2023-08-08 11:53:16');

-- ----------------------------
-- Table structure for item_response
-- ----------------------------
DROP TABLE IF EXISTS `item_response`;
CREATE TABLE `item_response`  (
  `response_id` bigint NOT NULL COMMENT 'id主键',
  `apply_id` bigint NULL DEFAULT NULL COMMENT '申请id',
  `apply_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `response_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回应人',
  `response_status` int NULL DEFAULT -1 COMMENT '回应状态',
  `response_result` int NULL DEFAULT NULL COMMENT '回应结果（同意与否）',
  `result_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果原因',
  `response_time` datetime NULL DEFAULT NULL COMMENT '回应时间',
  PRIMARY KEY (`response_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of item_response
-- ----------------------------
INSERT INTO `item_response` VALUES (1688760426926137345, 1688760260466794497, '李智超', '管理员', 1, 0, '那就别坐了', '2023-08-08 11:53:56');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint NOT NULL COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码（加密后）',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '盐值',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `user_status` int NOT NULL DEFAULT 1 COMMENT '用户状态（管理员还是普通用户）',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱地址',
  `registration_time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE COMMENT '设置字段唯一'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1685270500158922754, 'admain', '93E9A27A5F2C8947D7BE8A407D8DA8B4', 'F843C650-9577-44FB-A12C-A7F9E4EC31F8', '管理员', 0, 'admain@email.com', '2023-07-29 09:49:28');
INSERT INTO `user` VALUES (1688359715692269569, 'lifang', '0F16759931190440DC6DF22AE472661C', '9F47D2D0-3C79-45F5-A4BD-ACE6593CA7F3', '李智超', 1, '2658085067@qq.com', '2023-08-07 09:21:39');

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `log_id` bigint NOT NULL COMMENT '主键id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端ip地址',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_log
-- ----------------------------
INSERT INTO `user_log` VALUES (1686947522547515393, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-03 11:50:06');
INSERT INTO `user_log` VALUES (1686959593657962498, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 12:38:04');
INSERT INTO `user_log` VALUES (1686960110417186818, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 12:40:07');
INSERT INTO `user_log` VALUES (1686961221966467073, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 12:44:32');
INSERT INTO `user_log` VALUES (1687030944326434817, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 17:21:35');
INSERT INTO `user_log` VALUES (1687035950970634242, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 17:41:29');
INSERT INTO `user_log` VALUES (1687036685837803522, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 17:44:24');
INSERT INTO `user_log` VALUES (1687050565645459457, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 18:39:33');
INSERT INTO `user_log` VALUES (1687055005823729665, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-03 18:57:12');
INSERT INTO `user_log` VALUES (1687055005823729666, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-03 18:57:12');
INSERT INTO `user_log` VALUES (1687056062121443329, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 19:01:24');
INSERT INTO `user_log` VALUES (1687057081165369345, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-03 19:05:27');
INSERT INTO `user_log` VALUES (1687057339618381826, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 19:06:28');
INSERT INTO `user_log` VALUES (1687057461521633282, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 19:06:58');
INSERT INTO `user_log` VALUES (1687067568468910082, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 19:47:07');
INSERT INTO `user_log` VALUES (1687101463440572417, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 22:01:48');
INSERT INTO `user_log` VALUES (1687103565864837121, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-03 22:10:10');
INSERT INTO `user_log` VALUES (1687107400691818497, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-03 22:25:24');
INSERT INTO `user_log` VALUES (1687296514238152705, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 10:56:52');
INSERT INTO `user_log` VALUES (1687296555577212929, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 10:57:02');
INSERT INTO `user_log` VALUES (1687296730748125186, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 10:57:44');
INSERT INTO `user_log` VALUES (1687297134240169986, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-04 10:59:20');
INSERT INTO `user_log` VALUES (1687305846543593473, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 11:33:57');
INSERT INTO `user_log` VALUES (1687308116148596737, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-04 11:42:58');
INSERT INTO `user_log` VALUES (1687317851379838978, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 12:21:39');
INSERT INTO `user_log` VALUES (1687318325311025153, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 12:23:32');
INSERT INTO `user_log` VALUES (1687401021945131009, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 17:52:09');
INSERT INTO `user_log` VALUES (1687446937196539905, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 20:54:36');
INSERT INTO `user_log` VALUES (1687481057540804610, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 23:10:11');
INSERT INTO `user_log` VALUES (1687481208699326465, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 23:10:47');
INSERT INTO `user_log` VALUES (1687481825916301313, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-04 23:13:14');
INSERT INTO `user_log` VALUES (1687642713323409410, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 09:52:32');
INSERT INTO `user_log` VALUES (1687642713323409411, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 09:52:32');
INSERT INTO `user_log` VALUES (1687642713323409412, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 09:52:32');
INSERT INTO `user_log` VALUES (1687642713323409413, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 09:52:32');
INSERT INTO `user_log` VALUES (1687676229067149314, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 12:05:43');
INSERT INTO `user_log` VALUES (1687676985618927618, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-05 12:08:44');
INSERT INTO `user_log` VALUES (1687741177885589505, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-05 16:23:48');
INSERT INTO `user_log` VALUES (1687741629515661314, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 16:25:36');
INSERT INTO `user_log` VALUES (1687761706650652674, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 17:45:23');
INSERT INTO `user_log` VALUES (1687761874011770882, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 17:46:03');
INSERT INTO `user_log` VALUES (1687844491914588161, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-05 23:14:20');
INSERT INTO `user_log` VALUES (1688007164622995457, 1686687518754054145, 'lifang', 'http://127.0.0.1:5500', '2023-08-06 10:00:44');
INSERT INTO `user_log` VALUES (1688185273745842178, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-06 21:48:29');
INSERT INTO `user_log` VALUES (1688359745438273538, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-07 09:21:46');
INSERT INTO `user_log` VALUES (1688364842272665602, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 09:42:01');
INSERT INTO `user_log` VALUES (1688366081953738754, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-07 09:46:57');
INSERT INTO `user_log` VALUES (1688366113251635202, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 09:47:04');
INSERT INTO `user_log` VALUES (1688368576243400706, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 09:56:52');
INSERT INTO `user_log` VALUES (1688368674075570178, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 09:57:15');
INSERT INTO `user_log` VALUES (1688396172146438146, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 11:46:31');
INSERT INTO `user_log` VALUES (1688398199513579521, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 11:54:34');
INSERT INTO `user_log` VALUES (1688539223548403714, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-07 21:14:57');
INSERT INTO `user_log` VALUES (1688540206357716994, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 21:18:51');
INSERT INTO `user_log` VALUES (1688541959182565377, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-07 21:25:49');
INSERT INTO `user_log` VALUES (1688552451523399682, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 22:07:31');
INSERT INTO `user_log` VALUES (1688552982891384833, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-07 22:09:38');
INSERT INTO `user_log` VALUES (1688554493369307137, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-07 22:15:38');
INSERT INTO `user_log` VALUES (1688560643120762882, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-07 22:40:04');
INSERT INTO `user_log` VALUES (1688726280774221826, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 09:38:15');
INSERT INTO `user_log` VALUES (1688753630949842945, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 11:26:56');
INSERT INTO `user_log` VALUES (1688754778939260929, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 11:31:30');
INSERT INTO `user_log` VALUES (1688756500260630530, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 11:38:20');
INSERT INTO `user_log` VALUES (1688757306498134017, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 11:41:32');
INSERT INTO `user_log` VALUES (1688758609404190721, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 11:46:43');
INSERT INTO `user_log` VALUES (1688758729956876289, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 11:47:12');
INSERT INTO `user_log` VALUES (1688758800698007554, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 11:47:28');
INSERT INTO `user_log` VALUES (1688759091744956417, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 11:48:38');
INSERT INTO `user_log` VALUES (1688760020170924033, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 11:52:19');
INSERT INTO `user_log` VALUES (1688760149108023297, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 11:52:50');
INSERT INTO `user_log` VALUES (1688760321439391745, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 11:53:31');
INSERT INTO `user_log` VALUES (1688760467719938050, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 11:54:06');
INSERT INTO `user_log` VALUES (1688762784183672833, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 12:03:18');
INSERT INTO `user_log` VALUES (1688836605850914818, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 16:56:39');
INSERT INTO `user_log` VALUES (1688837345172389890, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 16:59:35');
INSERT INTO `user_log` VALUES (1688837970044071937, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 17:02:04');
INSERT INTO `user_log` VALUES (1688838643825487874, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 17:04:44');
INSERT INTO `user_log` VALUES (1688839813964996610, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 17:09:23');
INSERT INTO `user_log` VALUES (1688840450848985089, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 17:11:55');
INSERT INTO `user_log` VALUES (1688842624702275586, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 17:20:34');
INSERT INTO `user_log` VALUES (1688844123733970946, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:26:31');
INSERT INTO `user_log` VALUES (1688844284891713538, 1685270500158922754, 'admain', 'http://127.0.0.1:5500', '2023-08-08 17:27:09');
INSERT INTO `user_log` VALUES (1688845372172750849, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:31:29');
INSERT INTO `user_log` VALUES (1688847011013177346, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:37:59');
INSERT INTO `user_log` VALUES (1688847237723672578, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:38:53');
INSERT INTO `user_log` VALUES (1688849344652587009, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:47:16');
INSERT INTO `user_log` VALUES (1688849940143071233, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:49:38');
INSERT INTO `user_log` VALUES (1688850266476728322, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:50:56');
INSERT INTO `user_log` VALUES (1688850861619109890, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:53:17');
INSERT INTO `user_log` VALUES (1688850869382766593, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:53:19');
INSERT INTO `user_log` VALUES (1688850927079612417, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:53:33');
INSERT INTO `user_log` VALUES (1688850948365705217, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 17:53:38');
INSERT INTO `user_log` VALUES (1688857229340086274, 1688359715692269569, 'lifang', 'http://127.0.0.1:5500', '2023-08-08 18:18:36');

SET FOREIGN_KEY_CHECKS = 1;
