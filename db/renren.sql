/*
Navicat MySQL Data Transfer

Source Server         : 47.100.182.33
Source Server Version : 50731
Source Host           : 47.100.182.33:3306
Source Database       : renren

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2021-04-08 16:14:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `companyinfo`;
CREATE TABLE `companyinfo` (
  `companyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `idNumber` varchar(20) DEFAULT NULL,
  `user_id` tinyint(20) DEFAULT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companyinfo
-- ----------------------------
INSERT INTO `companyinfo` VALUES ('1', '郑州至璞信息技术有限公司', '17803903903', '金水区', '126@qq.com', '11111111111111111111', '12345', '1');
INSERT INTO `companyinfo` VALUES ('2', '小米公司', '12345678901', '湖北省武汉市', '12345678@qq.com', '致力于为消费者服务', null, '20');

-- ----------------------------
-- Table structure for companyjob
-- ----------------------------
DROP TABLE IF EXISTS `companyjob`;
CREATE TABLE `companyjob` (
  `companyId` tinyint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `jobName` varchar(20) NOT NULL,
  `jobDetail` varchar(200) NOT NULL,
  `jobDuty` varchar(200) NOT NULL,
  `money` varchar(200) NOT NULL,
  `required` varchar(200) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companyjob
-- ----------------------------
INSERT INTO `companyjob` VALUES ('1', '北京东方国信公司', 'Java开发', '会使用springboot，vue等技术', '负责项目开发，代码测试', '五险一金', '本科', '1');
INSERT INTO `companyjob` VALUES ('3', '北京东方国信公司', '项目经理', '带领团队', '项目负责人', '五险一金', '本科，五年工作经验以上', '1');
INSERT INTO `companyjob` VALUES ('4', '郑州至璞信息技术有限公司', 'php', '熟练PHP技术', '编程员', '五险一金', '本科', '1');
INSERT INTO `companyjob` VALUES ('5', '小米公司', 'Java开发', '使用springboot技术，vue技术开发', '负责项目开发，测试等工作', '五险一金，16薪', '本科', '20');
INSERT INTO `companyjob` VALUES ('6', '小米公司', '运维人员', '测试项目功能', '负责项目测试部署等工作', '五险一金，14薪', '本科', '20');

-- ----------------------------
-- Table structure for company_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `company_userinfo`;
CREATE TABLE `company_userinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `companyId` int(20) NOT NULL,
  `userId` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_userinfo
-- ----------------------------
INSERT INTO `company_userinfo` VALUES ('1', '1', '1');
INSERT INTO `company_userinfo` VALUES ('2', '3', '1');
INSERT INTO `company_userinfo` VALUES ('3', '1', '1');
INSERT INTO `company_userinfo` VALUES ('4', '1', '12');
INSERT INTO `company_userinfo` VALUES ('5', '3', '12');
INSERT INTO `company_userinfo` VALUES ('6', '1', '12');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001737E71B5407874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001737E731CA07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-FMK1EBV1614836711670', '1614837063554', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1614837600000', '-1', '5', 'WAITING', 'CRON', '1595555635000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001737E71B5407874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1614837600000', '-1', '5', 'WAITING', 'CRON', '1595555636000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001737E731CA07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'renren', '0 0/30 * * * ?', '0', '参数测试', '2020-07-24 09:30:48');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'renren', '0 0/30 * * * ?', '0', '参数测试', '2020-07-24 09:32:20');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'renren', '0', null, '2', '2020-07-24 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '2', 'testTask', 'renren', '0', null, '5', '2020-07-24 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'renren', '0', null, '2', '2020-07-24 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '2', 'testTask', 'renren', '0', null, '3', '2020-07-24 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'renren', '0', null, '19', '2020-07-24 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '2', 'testTask', 'renren', '0', null, '1', '2020-07-24 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'renren', '0', null, '16', '2020-07-24 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('8', '2', 'testTask', 'renren', '0', null, '2', '2020-07-24 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'renren', '0', null, '6', '2020-07-24 12:00:06');
INSERT INTO `schedule_job_log` VALUES ('10', '2', 'testTask', 'renren', '0', null, '1', '2020-07-24 12:00:06');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'renren', '0', null, '1', '2020-07-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('12', '2', 'testTask', 'renren', '0', null, '1', '2020-07-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '2', 'testTask', 'renren', '0', null, '1', '2020-08-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'renren', '0', null, '1', '2020-08-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'renren', '0', null, '1', '2020-08-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '2', 'testTask', 'renren', '0', null, '1', '2020-08-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'renren', '0', null, '2', '2020-08-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '2', 'testTask', 'renren', '0', null, '0', '2020-08-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'renren', '0', null, '5', '2020-08-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('20', '2', 'testTask', 'renren', '0', null, '1', '2020-08-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'renren', '0', null, '3', '2020-08-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '2', 'testTask', 'renren', '0', null, '0', '2020-08-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'renren', '0', null, '1', '2020-08-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '2', 'testTask', 'renren', '0', null, '1', '2020-08-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'renren', '0', null, '2', '2020-08-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('26', '2', 'testTask', 'renren', '0', null, '1', '2020-08-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'renren', '0', null, '1', '2020-08-06 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('28', '2', 'testTask', 'renren', '0', null, '2', '2020-08-06 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'renren', '0', null, '1', '2020-08-06 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '2', 'testTask', 'renren', '0', null, '0', '2020-08-06 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'renren', '0', null, '2', '2020-08-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('32', '2', 'testTask', 'renren', '0', null, '1', '2020-08-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'renren', '0', null, '0', '2021-03-02 16:30:05');
INSERT INTO `schedule_job_log` VALUES ('34', '2', 'testTask', 'renren', '0', null, '2', '2021-03-02 16:30:14');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'renren', '0', null, '1', '2021-03-02 17:00:10');
INSERT INTO `schedule_job_log` VALUES ('36', '2', 'testTask', 'renren', '0', null, '0', '2021-03-02 17:00:31');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'renren', '0', null, '1', '2021-03-02 17:30:01');
INSERT INTO `schedule_job_log` VALUES ('38', '2', 'testTask', 'renren', '0', null, '1', '2021-03-02 17:30:03');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'renren', '0', null, '1', '2021-03-02 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('40', '2', 'testTask', 'renren', '0', null, '0', '2021-03-02 18:00:02');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'renren', '0', null, '3', '2021-03-03 09:30:05');
INSERT INTO `schedule_job_log` VALUES ('42', '2', 'testTask', 'renren', '0', null, '1', '2021-03-03 09:30:12');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 10:00:19');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'renren', '0', null, '5', '2021-03-03 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('45', '2', 'testTask', 'renren', '0', null, '2', '2021-03-03 10:30:01');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('47', '2', 'testTask', 'renren', '0', null, '0', '2021-03-03 11:00:01');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('49', '2', 'testTask', 'renren', '0', null, '0', '2021-03-03 11:30:01');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 12:00:01');
INSERT INTO `schedule_job_log` VALUES ('51', '2', 'testTask', 'renren', '0', null, '1', '2021-03-03 12:00:04');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('53', '2', 'testTask', 'renren', '0', null, '0', '2021-03-03 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('55', '2', 'testTask', 'renren', '0', null, '0', '2021-03-03 14:00:02');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('57', '2', 'testTask', 'renren', '0', null, '1', '2021-03-03 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'renren', '0', null, '3', '2021-03-03 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('59', '2', 'testTask', 'renren', '0', null, '0', '2021-03-03 15:00:01');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'renren', '0', null, '3', '2021-03-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('61', '2', 'testTask', 'renren', '0', null, '0', '2021-03-03 15:30:01');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'renren', '0', null, '1', '2021-03-03 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('63', '2', 'testTask', 'renren', '0', null, '1', '2021-03-03 16:00:01');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'renren', '0', null, '0', '2021-03-03 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('65', '2', 'testTask', 'renren', '0', null, '0', '2021-03-03 16:30:02');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('056af5ef-cdb0-432e-8de3-ef88547446ec', 'nm6g4', '2021-04-03 18:57:49');
INSERT INTO `sys_captcha` VALUES ('07dfa473-7d92-4b85-8d79-ab3318b73ee5', 'd5gnn', '2021-03-03 14:16:59');
INSERT INTO `sys_captcha` VALUES ('08c673f5-2431-4d29-8184-fe4c2525893e', 'c2y7f', '2021-03-03 11:03:51');
INSERT INTO `sys_captcha` VALUES ('0dc89243-cd1c-464a-8fa7-c39fee66f787', 'da74g', '2021-03-14 17:29:48');
INSERT INTO `sys_captcha` VALUES ('0e8db5f2-fe29-4dc4-8326-669c94ca6a08', 'd3ap5', '2021-04-03 18:56:22');
INSERT INTO `sys_captcha` VALUES ('0ebf5ec1-00ea-4943-8e22-3c27f8a4ed2a', 'nmem8', '2021-03-21 18:08:00');
INSERT INTO `sys_captcha` VALUES ('0fa3f0cb-e9ca-4719-81df-c29dc1a23fb2', 'gge4f', '2021-04-03 18:13:28');
INSERT INTO `sys_captcha` VALUES ('0ffdcbea-d647-446f-86d1-bb4244486376', '4b3nn', '2021-03-03 14:06:10');
INSERT INTO `sys_captcha` VALUES ('104e7ecb-b911-4ebb-89ae-187910f97b7e', 'x4yay', '2021-04-03 18:56:34');
INSERT INTO `sys_captcha` VALUES ('12951342-d0d7-4599-8356-d57791bbdaeb', 'ygggm', '2021-03-14 17:29:38');
INSERT INTO `sys_captcha` VALUES ('1a4e987f-e8aa-4b0f-8938-128e6571368f', '8d6c3', '2021-03-03 11:03:59');
INSERT INTO `sys_captcha` VALUES ('1a5d0dec-a47d-42b6-8d60-c01b696b0279', '4wg67', '2021-03-03 11:04:29');
INSERT INTO `sys_captcha` VALUES ('1b09774b-d45a-48d2-8452-5f113690c1ea', '5fep3', '2021-03-12 20:42:56');
INSERT INTO `sys_captcha` VALUES ('1e3a7308-f8bc-4dba-89f1-f8236d65cf23', '3ny7p', '2021-03-03 14:08:32');
INSERT INTO `sys_captcha` VALUES ('2172e930-192a-4906-8819-d263f086c5b6', '272af', '2021-03-03 17:17:08');
INSERT INTO `sys_captcha` VALUES ('240ef48c-0eb3-4a34-83a9-ab5c504e8f5c', 'e7nem', '2021-03-15 03:56:26');
INSERT INTO `sys_captcha` VALUES ('273cd3f2-e646-4780-8b86-7a8cfa6c5d20', 'xf2pn', '2021-03-27 18:53:24');
INSERT INTO `sys_captcha` VALUES ('2ba1a984-edaa-4585-8cac-f1d638a7adbc', 'wwfn5', '2021-03-03 14:30:09');
INSERT INTO `sys_captcha` VALUES ('31f03d31-4997-4205-8525-1f176dd33d6d', 'f42g3', '2021-03-03 17:23:55');
INSERT INTO `sys_captcha` VALUES ('32ed65e8-2817-4378-8a0d-4f8674b419a3', '54f6a', '2021-03-03 17:25:44');
INSERT INTO `sys_captcha` VALUES ('3b631624-4bb1-4f09-87e8-bc1214eec30c', 'wnnc7', '2021-03-03 11:07:53');
INSERT INTO `sys_captcha` VALUES ('3d4e69b4-0651-4490-8c0a-31ff5cef8830', '2anaf', '2021-03-30 11:27:03');
INSERT INTO `sys_captcha` VALUES ('428c3992-c742-4949-88b0-e29d81c5a072', 'af83f', '2021-03-03 11:02:24');
INSERT INTO `sys_captcha` VALUES ('4309e33e-252a-4ee2-8f4c-a911142804c0', 'pdc54', '2021-03-03 11:45:50');
INSERT INTO `sys_captcha` VALUES ('43305a73-117e-47bb-8407-002f2ba8e6f0', 'x6pm5', '2021-03-03 17:37:14');
INSERT INTO `sys_captcha` VALUES ('457de656-8671-4041-855e-3416bf4116ad', 'pga4y', '2021-04-03 18:56:54');
INSERT INTO `sys_captcha` VALUES ('4619b89f-2568-4dd6-8bd4-b4791eca8021', '8ymc6', '2020-08-06 11:28:40');
INSERT INTO `sys_captcha` VALUES ('48f3c7e1-f8b6-47ef-8b47-985afc0ad02e', 'pmam2', '2021-03-20 16:46:29');
INSERT INTO `sys_captcha` VALUES ('4be5edb5-3515-415b-8a81-c70771d05686', 'ecpfa', '2021-03-03 11:01:29');
INSERT INTO `sys_captcha` VALUES ('4f058515-e27a-4579-8b5c-6cacd1667f68', 'wfn8f', '2021-03-03 11:34:28');
INSERT INTO `sys_captcha` VALUES ('4f606f53-4cb8-4187-8751-e5a9a9f01be9', '6x7dy', '2021-03-03 11:10:43');
INSERT INTO `sys_captcha` VALUES ('511bf76c-9457-4927-868a-5aefcf1de8f6', '8ngpx', '2020-08-06 11:27:47');
INSERT INTO `sys_captcha` VALUES ('51a8a489-c7b9-458d-82b9-709064166c39', 'nnxd4', '2021-03-03 13:54:37');
INSERT INTO `sys_captcha` VALUES ('5269b643-3faa-457d-8d72-65e841af94d1', 'ae2f4', '2021-04-08 14:31:34');
INSERT INTO `sys_captcha` VALUES ('5aa8a4b2-1190-4330-88ce-5052ebd085b8', '68wxn', '2021-03-03 14:32:57');
INSERT INTO `sys_captcha` VALUES ('5d39ca95-0b61-46d1-841a-a1c953f4ffff', 'gy38a', '2021-03-04 11:22:06');
INSERT INTO `sys_captcha` VALUES ('5e6ba903-3108-47a7-8eea-6715ae5be7ec', '3f5wp', '2021-03-03 17:25:33');
INSERT INTO `sys_captcha` VALUES ('5ecff5c8-42f9-4c44-8b10-a9a30072a02c', 'n27mm', '2021-03-03 11:46:00');
INSERT INTO `sys_captcha` VALUES ('62070d1b-c72b-4dd5-8eaa-676c39d252d9', 'n4g33', '2020-08-06 11:28:02');
INSERT INTO `sys_captcha` VALUES ('660b0eff-80ac-42fd-8774-bd043a5e08d9', 'wd5d8', '2020-08-03 16:20:45');
INSERT INTO `sys_captcha` VALUES ('6712b265-57cc-487a-82ee-fb3a6b27acff', 'pe5n5', '2021-03-03 17:28:19');
INSERT INTO `sys_captcha` VALUES ('6b220b8d-1372-438c-834e-1f03ba452ec5', 'fdnpb', '2021-03-03 17:24:39');
INSERT INTO `sys_captcha` VALUES ('6b506ccb-32c8-4057-8fae-675d2e8611e1', '725n7', '2020-08-06 11:37:33');
INSERT INTO `sys_captcha` VALUES ('6d9756d0-14e8-4179-81e6-e3c763f46263', 'yb8w7', '2021-03-09 09:50:15');
INSERT INTO `sys_captcha` VALUES ('7362f0f7-a661-4868-8a3b-7bccf021c2c0', 'mn7xx', '2021-03-17 23:26:17');
INSERT INTO `sys_captcha` VALUES ('747c796a-7c01-4d61-84ec-54182c10acdc', 'f2ew7', '2021-03-03 11:42:35');
INSERT INTO `sys_captcha` VALUES ('75f10ec1-cc35-4516-8ae8-6ae24c3f8c6d', 'bd8wf', '2021-03-04 11:01:14');
INSERT INTO `sys_captcha` VALUES ('77fc27d0-695c-42f7-8a35-1b31723d2268', '57wfp', '2021-04-03 17:29:11');
INSERT INTO `sys_captcha` VALUES ('7b6d536e-59c1-4a2d-8bd1-f7273ca98d76', 'e4by8', '2021-03-03 09:41:42');
INSERT INTO `sys_captcha` VALUES ('7bcd3665-699e-492c-8b14-10d349a662c3', 'w44c5', '2020-08-06 14:42:52');
INSERT INTO `sys_captcha` VALUES ('7c27af5f-f737-41a9-8dc4-f148758dccbe', 'n7mne', '2021-03-03 11:12:14');
INSERT INTO `sys_captcha` VALUES ('7cb8c56d-2f17-4ba3-859d-529acbe4c3d4', 'g64nn', '2021-03-03 14:16:42');
INSERT INTO `sys_captcha` VALUES ('7d29c283-d5ca-419d-853b-0954260da6f3', 'axc36', '2021-04-03 18:41:26');
INSERT INTO `sys_captcha` VALUES ('7df9764a-0069-4665-8cd6-5895f9a28234', '54gpf', '2021-04-03 17:29:11');
INSERT INTO `sys_captcha` VALUES ('821e4b8e-1190-4a8d-82d2-f3f3aefd9b1b', 'b6x6f', '2021-04-03 17:28:02');
INSERT INTO `sys_captcha` VALUES ('8681c2e9-01eb-4595-850a-2505593706d2', 'b444g', '2021-03-09 09:55:58');
INSERT INTO `sys_captcha` VALUES ('868be266-c96a-40a2-8f66-bc5080ba3e01', 'yfe5c', '2021-03-03 17:24:50');
INSERT INTO `sys_captcha` VALUES ('8f243dd6-a9ea-4b06-820c-0323e7302e49', '2c4na', '2021-03-20 16:31:49');
INSERT INTO `sys_captcha` VALUES ('8f6c8009-787f-4c56-814c-cc98d4e50864', 'g7npp', '2021-03-02 16:20:42');
INSERT INTO `sys_captcha` VALUES ('974837b8-3a6e-42ad-820f-2dfe10f157ae', 'xp74n', '2021-03-04 10:45:35');
INSERT INTO `sys_captcha` VALUES ('a150c352-d265-4f2c-88bf-0d718c9e5dd4', 'pd3wa', '2021-03-03 14:05:28');
INSERT INTO `sys_captcha` VALUES ('a818b76f-1a4e-44a7-8fc7-37cbef558004', 'fbcb8', '2021-03-03 14:15:51');
INSERT INTO `sys_captcha` VALUES ('aa61b684-2d54-4ef3-843b-468089d9f65a', 'cencx', '2021-04-08 16:05:49');
INSERT INTO `sys_captcha` VALUES ('aaaf644c-a528-4c13-8403-c1fa40d7d068', '6yeem', '2021-03-21 18:07:26');
INSERT INTO `sys_captcha` VALUES ('ac37dfac-0b11-43df-8b98-9458f2c570b3', 'b6aeb', '2021-04-07 13:43:43');
INSERT INTO `sys_captcha` VALUES ('b0600aaf-2842-4c42-839b-b0aeae602c15', 'y2g6n', '2020-08-03 16:20:50');
INSERT INTO `sys_captcha` VALUES ('b145d026-8f11-486e-82ec-075bc713c4f5', 'cd4ay', '2021-03-15 03:56:14');
INSERT INTO `sys_captcha` VALUES ('b1660778-0ed6-4041-854d-58f2c3628f99', 'dxc87', '2021-03-27 19:04:14');
INSERT INTO `sys_captcha` VALUES ('b3db1dd1-e21f-479d-816a-4a8b9ea11680', '53f2f', '2021-03-03 17:36:34');
INSERT INTO `sys_captcha` VALUES ('bab24a4e-29ff-4a0a-86ca-15d8d3b64c5a', '65n6b', '2021-03-14 18:15:44');
INSERT INTO `sys_captcha` VALUES ('c62dedba-4035-48fa-8ad3-a097b1a59092', 'gff44', '2021-03-03 11:39:37');
INSERT INTO `sys_captcha` VALUES ('c7ac37e4-6f15-413b-8ddb-dfa4b4080354', '825bg', '2021-03-03 14:16:25');
INSERT INTO `sys_captcha` VALUES ('c92732a4-b54c-4d6e-8c95-0004fd72305b', 'fnfd6', '2021-03-23 17:56:42');
INSERT INTO `sys_captcha` VALUES ('c9dee1bf-d9c1-4249-80ab-fa9fc4c7be8f', 'wmwac', '2020-08-03 16:20:49');
INSERT INTO `sys_captcha` VALUES ('cb069ffa-a175-498e-898a-6eea870f2f5f', 'nf2c6', '2020-08-06 11:40:27');
INSERT INTO `sys_captcha` VALUES ('ce5463b9-c094-44d8-8a3c-69482863d99e', 'p6ba4', '2021-03-03 17:26:39');
INSERT INTO `sys_captcha` VALUES ('cea690c4-660a-4a18-80f9-90867bde7101', '7fdd4', '2021-03-03 14:37:39');
INSERT INTO `sys_captcha` VALUES ('d0dadebe-b821-4ebc-8c11-9d139427611d', '62ben', '2021-03-03 14:33:09');
INSERT INTO `sys_captcha` VALUES ('d267080e-4697-45af-8bde-c49cfe006ba0', '62em8', '2020-08-06 11:27:40');
INSERT INTO `sys_captcha` VALUES ('d3d2aad0-cdb4-4bf0-8876-aeff9bee77d9', 'cdb24', '2021-03-03 11:19:43');
INSERT INTO `sys_captcha` VALUES ('d5bec764-5c2a-4625-83ea-bdea75553a81', 'xye8e', '2021-03-04 11:21:56');
INSERT INTO `sys_captcha` VALUES ('d8c98d9a-1589-454a-8c2e-9de002061f96', 'emgn3', '2021-03-20 16:35:38');
INSERT INTO `sys_captcha` VALUES ('d9cdb9b2-ce46-4aff-881b-6f6d7664be47', 'nbd28', '2021-03-03 17:29:59');
INSERT INTO `sys_captcha` VALUES ('dc59e74e-9707-4051-8c7c-f2015b87ba9b', '4ddf5', '2021-03-03 11:36:41');
INSERT INTO `sys_captcha` VALUES ('e71d91bc-45cf-4d33-82eb-8a23afc9cb58', '8dxa6', '2021-03-21 15:50:50');
INSERT INTO `sys_captcha` VALUES ('e7bbd7c8-1950-4b13-8847-377f194ba9e3', 'w42pe', '2021-04-03 17:29:08');
INSERT INTO `sys_captcha` VALUES ('ee337356-1c8c-4c4f-887b-0db27f1262ac', '7naxx', '2021-03-03 11:39:25');
INSERT INTO `sys_captcha` VALUES ('f1b3bc8f-2e7d-4c49-894b-5904c4d605ec', 'cfnp5', '2021-03-03 14:39:58');
INSERT INTO `sys_captcha` VALUES ('f3d882dc-256c-47bb-80c8-9b914d441ca9', '55nwn', '2021-03-03 11:45:14');
INSERT INTO `sys_captcha` VALUES ('f6d4b973-e7a6-4be6-8dad-63361659c237', 'n5gwn', '2021-03-04 10:56:54');
INSERT INTO `sys_captcha` VALUES ('f838aa43-42b0-4bc6-827a-3438ccfbd299', 'bxn3c', '2021-03-09 09:50:57');
INSERT INTO `sys_captcha` VALUES ('faa9092c-4886-4c06-8952-31ce749a0c97', 'xc47n', '2021-03-27 19:22:13');
INSERT INTO `sys_captcha` VALUES ('fbc9acf6-32b0-463b-8b3b-67b343a27124', 'b365b', '2021-04-03 18:56:25');
INSERT INTO `sys_captcha` VALUES ('fc57b624-c98c-42a8-89fe-f69b8a13233d', '3yngf', '2021-03-04 11:20:02');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"admin1\",\"password\":\"68e21acf4118753fbf328bad2d4a58c87f76ef880793ff8c1860867a7521840a\",\"salt\":\"dcOspUiXkVbPU9Xnkctq\",\"email\":\"12345678@qq.com\",\"mobile\":\"12345678900\",\"status\":1,\"createUserId\":1,\"createTime\":\"Jul 24, 2020 2:21:07 PM\",\"roleIdList\":[]}]', '75', '0:0:0:0:0:0:0:1', '2020-07-24 14:21:07');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"小明\",\"remark\":\"\",\"createUserId\":1,\"createTime\":\"Jul 24, 2020 2:23:16 PM\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666]}]', '158', '0:0:0:0:0:0:0:1', '2020-07-24 14:23:16');
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"招聘公司\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[-666666]}]', '1609', '0:0:0:0:0:0:0:1', '2021-03-02 16:19:32');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"求职者\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Mar 2, 2021 4:20:24 PM\"}]', '4821', '0:0:0:0:0:0:0:1', '2021-03-02 16:20:28');
INSERT INTO `sys_log` VALUES ('5', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[6]', '1', '0:0:0:0:0:0:0:1', '2021-03-02 16:21:19');
INSERT INTO `sys_log` VALUES ('6', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[6]', '0', '0:0:0:0:0:0:0:1', '2021-03-02 16:23:29');
INSERT INTO `sys_log` VALUES ('7', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[5]', '0', '0:0:0:0:0:0:0:1', '2021-03-02 16:24:17');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"菜单\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0}]', '1961', '0:0:0:0:0:0:0:1', '2021-03-02 17:00:34');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"完善个人信息\",\"url\":\"userInfo\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '243', '0:0:0:0:0:0:0:1', '2021-03-02 17:04:43');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"完善个人信息\",\"url\":\"user/userInfo\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]', '240', '0:0:0:0:0:0:0:1', '2021-03-02 17:05:38');
INSERT INTO `sys_log` VALUES ('11', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":31,\"name\":\"实名认证\",\"url\":\"user/certification\",\"perms\":\"\",\"type\":1,\"icon\":\"suoding\",\"orderNum\":0}]', '271', '0:0:0:0:0:0:0:1', '2021-03-02 17:58:35');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8081/renren-fast/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('31', '0', '菜单', null, null, '0', 'zonghe', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '完善个人信息', 'user/userInfo', '', '1', 'admin', '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '实名认证', 'user/certification', '', '1', 'suoding', '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '完善简历', 'user/resume', '', '1', 'bianji', '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '企业信息填写', 'company/info', '', '1', 'bianji', '0');
INSERT INTO `sys_menu` VALUES ('36', '31', '企业认证', 'company/certification', '', '1', 'suoding', '0');
INSERT INTO `sys_menu` VALUES ('37', '31', '招聘信息', 'company/job', '', '1', 'sousuo', '0');
INSERT INTO `sys_menu` VALUES ('38', '31', '求职者个人信息查看', 'user/viewInfo', '', '1', 'geren', '0');
INSERT INTO `sys_menu` VALUES ('39', '31', '岗位目录', 'user/jobInfo', '', '1', 'zhedie', '0');
INSERT INTO `sys_menu` VALUES ('41', '31', '招聘目录', 'company/jobInfo', '', '1', 'zhedie', '0');
INSERT INTO `sys_menu` VALUES ('42', '31', '企业个人信息查看', 'company/viewInfo', '', '1', 'geren', '0');
INSERT INTO `sys_menu` VALUES ('43', '31', '投递简历者信息', 'company/userInfo', '', '1', 'xiangqu', '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '招聘公司', '', '1', '2020-07-24 14:23:16');
INSERT INTO `sys_role` VALUES ('2', '求职者', '', '1', '2021-03-02 16:20:24');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('71', '2', '32');
INSERT INTO `sys_role_menu` VALUES ('72', '2', '33');
INSERT INTO `sys_role_menu` VALUES ('73', '2', '34');
INSERT INTO `sys_role_menu` VALUES ('74', '2', '38');
INSERT INTO `sys_role_menu` VALUES ('75', '2', '39');
INSERT INTO `sys_role_menu` VALUES ('76', '2', '-666666');
INSERT INTO `sys_role_menu` VALUES ('77', '2', '31');
INSERT INTO `sys_role_menu` VALUES ('78', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('79', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('80', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('81', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('82', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('83', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('84', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('85', '1', '31');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `certification` tinyint(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '7080b83011e455ffb8c40c6f9f442253baa86dda3a75261c1fb67a763a92e3c0', 'jepFyh6bL9xun8C4Xs7P', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11', '0001');
INSERT INTO `sys_user` VALUES ('19', '1', '4ae1075451773c6da8b3f88363766541955aa1feea098db6c7f8bbc5671deefe', 'PfKIOb9uzW8LlIP36izj', '1111@qq.com', '11111111111', '1', '1', '2021-04-08 14:26:49', '0000');
INSERT INTO `sys_user` VALUES ('20', '2', 'ec28b69946bf8a72941bae904a3b0e66b2ded8e7a72e70aab7e087d3510ad935', 'ohYIiu0FsKabDf8BRSML', '12345678@qq.com', '12345678901', '1', null, '2021-04-08 14:31:04', '0000');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '13', '1');
INSERT INTO `sys_user_role` VALUES ('3', '14', '2');
INSERT INTO `sys_user_role` VALUES ('8', '12', '2');
INSERT INTO `sys_user_role` VALUES ('9', '16', '2');
INSERT INTO `sys_user_role` VALUES ('12', '15', '1');
INSERT INTO `sys_user_role` VALUES ('16', '19', '2');
INSERT INTO `sys_user_role` VALUES ('17', '20', '1');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '18d4c6b4f20ea1826ac5b195e2a7e926', '2021-04-09 04:01:11', '2021-04-08 16:01:11');
INSERT INTO `sys_user_token` VALUES ('6', '1afe8ae0a18d8944a693461fd66274a7', '2021-03-04 23:03:22', '2021-03-04 11:03:22');
INSERT INTO `sys_user_token` VALUES ('12', '90b90768ceeb62fd0916b999965d83b0', '2021-03-31 06:56:39', '2021-03-30 18:56:39');
INSERT INTO `sys_user_token` VALUES ('13', 'c8c8ca7dfb218e125e83e381e894117f', '2021-03-06 22:45:52', '2021-03-06 10:45:52');
INSERT INTO `sys_user_token` VALUES ('14', '264d82598709e93b67e59da0811746b2', '2021-03-13 08:35:21', '2021-03-12 20:35:21');
INSERT INTO `sys_user_token` VALUES ('15', 'a9b698d5a592b8dfc9df7ab25caa0e33', '2021-03-31 06:22:50', '2021-03-30 18:22:50');
INSERT INTO `sys_user_token` VALUES ('18', '9afa7b48135289447c41aecfb13da20c', '2021-04-09 01:53:50', '2021-04-08 13:53:50');
INSERT INTO `sys_user_token` VALUES ('19', '90e8645e792c9f91084d0763ab1ee8a2', '2021-04-09 02:29:21', '2021-04-08 14:29:21');
INSERT INTO `sys_user_token` VALUES ('20', '2a42be52e0984423573ba1c2e3f99719', '2021-04-09 02:45:07', '2021-04-08 14:45:07');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  `family` varchar(200) DEFAULT NULL,
  `education` varchar(200) DEFAULT NULL,
  `work` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `idNumber` varchar(20) DEFAULT NULL,
  `user_id` tinyint(20) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '张三', '111111', '2000-03-09 17:19:33', '111@qq.com', '北京', null, '222222222222', '22222222222222', '2222222222', '22222222222222', null, '0');
INSERT INTO `userinfo` VALUES ('5', '李四', '17803903903', '2021-03-03 00:00:00', '111@qq.com', '河南省郑州市', '11111', '1111111111111111111111111111111111111111111111', '111111111111111111111111111111111111111111111111', '111111111111111111111111111111111111111111111111111', '11111111111111111111111111111111111111111111111111111', '412827199710118011', '1');
INSERT INTO `userinfo` VALUES ('6', '张三', '111111', '1997-03-12 00:00:00', '111@qq.com', '北京', '热爱学习', '222222222222', '22222222222222', '2222222222', '22222222222222', null, '12');
INSERT INTO `userinfo` VALUES ('7', '张三', '1234567890', '2000-07-05 00:00:00', '1234567890@qq.com', null, '爱好动漫，游戏，羽毛球', null, null, null, null, null, '18');
