-- SET NAMES utf8mb4;
-- SET FOREIGN_KEY_CHECKS = 0;
 
-- CREATE TABLE `t_employee` (
--   `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID',
--   `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名字',
--   `gender` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
--   `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
--   `dob` datetime DEFAULT NULL COMMENT '出生日期',
--   `title` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职位',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='雇员';
 
-- INSERT INTO `t_employee` VALUES ('1', '应卓', 'MALE', '9e21b083aff2ea3acdd9cf9df5a91141', '1982-08-19 00:00:00', '高级软件工程师');
 
-- SET FOREIGN_KEY_CHECKS = 1;