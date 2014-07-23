/*
Navicat MySQL Data Transfer

Source Server         : localhost1
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : kaoyan

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2014-07-23 18:19:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aws_active_data`
-- ----------------------------
DROP TABLE IF EXISTS `aws_active_data`;
CREATE TABLE `aws_active_data` (
  `active_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `expire_time` int(10) DEFAULT NULL,
  `active_code` varchar(32) DEFAULT NULL,
  `active_type_code` varchar(16) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `add_ip` bigint(12) DEFAULT NULL,
  `active_time` int(10) DEFAULT NULL,
  `active_ip` bigint(12) DEFAULT NULL,
  PRIMARY KEY (`active_id`),
  KEY `active_code` (`active_code`),
  KEY `active_type_code` (`active_type_code`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_active_data
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_answer`
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer`;
CREATE TABLE `aws_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答id',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `answer_content` text COMMENT '回答内容',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '反对人数',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '支持人数',
  `uid` int(11) DEFAULT '0' COMMENT '发布问题用户ID',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论总数',
  `uninterested_count` int(11) DEFAULT '0' COMMENT '不感兴趣',
  `thanks_count` int(11) DEFAULT '0' COMMENT '感谢数量',
  `category_id` int(11) DEFAULT '0' COMMENT '分类id',
  `has_attach` tinyint(1) DEFAULT '0' COMMENT '是否存在附件',
  `ip` bigint(11) DEFAULT NULL,
  `force_fold` tinyint(1) DEFAULT '0' COMMENT '强制折叠',
  `anonymous` tinyint(1) DEFAULT '0',
  `publish_source` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  KEY `agree_count` (`agree_count`),
  KEY `against_count` (`against_count`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `uninterested_count` (`uninterested_count`),
  KEY `force_fold` (`force_fold`),
  KEY `anonymous` (`anonymous`),
  KEY `publich_source` (`publish_source`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='回答';

-- ----------------------------
-- Records of aws_answer
-- ----------------------------
INSERT INTO `aws_answer` VALUES ('1', '3', 'fasafa', '1403943295', '0', '0', '1', '0', '0', '0', '1', '0', '2130706433', '0', '0', null);

-- ----------------------------
-- Table structure for `aws_answer_comments`
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_comments`;
CREATE TABLE `aws_answer_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_answer_thanks`
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_thanks`;
CREATE TABLE `aws_answer_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_thanks
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_answer_uninterested`
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_uninterested`;
CREATE TABLE `aws_answer_uninterested` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_uninterested
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_answer_vote`
-- ----------------------------
DROP TABLE IF EXISTS `aws_answer_vote`;
CREATE TABLE `aws_answer_vote` (
  `voter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动ID',
  `answer_id` int(11) DEFAULT NULL COMMENT '回复id',
  `answer_uid` int(11) DEFAULT NULL COMMENT '回复作者id',
  `vote_uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `vote_value` tinyint(4) NOT NULL COMMENT '-1反对 1 支持',
  `reputation_factor` int(10) DEFAULT '0',
  PRIMARY KEY (`voter_id`),
  KEY `answer_id` (`answer_id`),
  KEY `vote_value` (`vote_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_answer_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_approval`
-- ----------------------------
DROP TABLE IF EXISTS `aws_approval`;
CREATE TABLE `aws_approval` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_approval
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_article`
-- ----------------------------
DROP TABLE IF EXISTS `aws_article`;
CREATE TABLE `aws_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `comments` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `lock` int(1) NOT NULL DEFAULT '0',
  `votes` int(10) DEFAULT '0',
  `title_fulltext` text,
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `major_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `has_attach` (`has_attach`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`),
  KEY `views` (`views`),
  KEY `add_time` (`add_time`),
  KEY `lock` (`lock`),
  KEY `votes` (`votes`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_article
-- ----------------------------
INSERT INTO `aws_article` VALUES ('1', '1', 'wecenter的第一个文章', 'wecenter的第一个文章wecenter的第一个文章wecenter的第一个文章wecenter的第一个文章', '0', '6', '1403937027', '0', '0', '0', 'wecenter 315321996820010 2599131456', '1', '0', '1');
INSERT INTO `aws_article` VALUES ('2', '2', 'wecenter的第一个文章', 'wecenter的第一个文章', '0', '1', '1403937027', '0', '0', '0', 'wecenter 315321996820010 259913', '0', '0', '0');
INSERT INTO `aws_article` VALUES ('3', '1', 'fafafq', 'fafaf', '0', '2', '1403943375', '0', '0', '0', 'fafafq', '1', '0', '1');

-- ----------------------------
-- Table structure for `aws_article_comments`
-- ----------------------------
DROP TABLE IF EXISTS `aws_article_comments`;
CREATE TABLE `aws_article_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `article_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `at_uid` int(10) DEFAULT NULL,
  `votes` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `article_id` (`article_id`),
  KEY `add_time` (`add_time`),
  KEY `votes` (`votes`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_article_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_article_vote`
-- ----------------------------
DROP TABLE IF EXISTS `aws_article_vote`;
CREATE TABLE `aws_article_vote` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(10) NOT NULL,
  `rating` tinyint(1) DEFAULT '0',
  `time` int(10) NOT NULL,
  `reputation_factor` int(10) DEFAULT '0',
  `item_uid` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`),
  KEY `item_uid` (`item_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_article_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_attach`
-- ----------------------------
DROP TABLE IF EXISTS `aws_attach`;
CREATE TABLE `aws_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `access_key` varchar(32) DEFAULT NULL COMMENT '批次 Key',
  `add_time` int(10) DEFAULT '0' COMMENT '上传时间',
  `file_location` varchar(255) DEFAULT NULL COMMENT '文件位置',
  `is_image` int(1) DEFAULT '0',
  `item_type` varchar(32) DEFAULT '0' COMMENT '关联类型',
  `item_id` int(11) DEFAULT '0' COMMENT '关联 ID',
  `wait_approval` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `access_key` (`access_key`),
  KEY `is_image` (`is_image`),
  KEY `fetch` (`item_id`,`item_type`),
  KEY `wait_approval` (`wait_approval`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_attach
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_category`
-- ----------------------------
DROP TABLE IF EXISTS `aws_category`;
CREATE TABLE `aws_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `url_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_category
-- ----------------------------
INSERT INTO `aws_category` VALUES ('1', '默认分类', 'question', null, '0', '0', null);

-- ----------------------------
-- Table structure for `aws_draft`
-- ----------------------------
DROP TABLE IF EXISTS `aws_draft`;
CREATE TABLE `aws_draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `data` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_draft
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_edm_task`
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_task`;
CREATE TABLE `aws_edm_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_task
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_edm_taskdata`
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_taskdata`;
CREATE TABLE `aws_edm_taskdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sent_time` int(10) NOT NULL,
  `view_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `sent_time` (`sent_time`),
  KEY `view_time` (`view_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_taskdata
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_edm_userdata`
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_userdata`;
CREATE TABLE `aws_edm_userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usergroup` (`usergroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_edm_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `aws_edm_usergroup`;
CREATE TABLE `aws_edm_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_edm_usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_education_experience`
-- ----------------------------
DROP TABLE IF EXISTS `aws_education_experience`;
CREATE TABLE `aws_education_experience` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `education_years` int(11) DEFAULT NULL COMMENT '入学年份',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类别',
  `departments` varchar(64) DEFAULT NULL COMMENT '院系',
  `add_time` int(10) DEFAULT NULL COMMENT '记录添加时间',
  PRIMARY KEY (`education_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教育经历';

-- ----------------------------
-- Records of aws_education_experience
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `aws_favorite`;
CREATE TABLE `aws_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `answer_id` (`answer_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_favorite_tag`
-- ----------------------------
DROP TABLE IF EXISTS `aws_favorite_tag`;
CREATE TABLE `aws_favorite_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_favorite_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_feature`
-- ----------------------------
DROP TABLE IF EXISTS `aws_feature`;
CREATE TABLE `aws_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '专题标题',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '专题图标',
  `topic_count` int(11) DEFAULT '0' COMMENT '话题计数',
  `css` text COMMENT '自定义CSS',
  `url_token` varchar(32) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_feature
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_feature_topic`
-- ----------------------------
DROP TABLE IF EXISTS `aws_feature_topic`;
CREATE TABLE `aws_feature_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) DEFAULT '0' COMMENT '专题ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题ID',
  PRIMARY KEY (`id`),
  KEY `feature_id` (`feature_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_feature_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_geo_location`
-- ----------------------------
DROP TABLE IF EXISTS `aws_geo_location`;
CREATE TABLE `aws_geo_location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_type` (`item_type`),
  KEY `add_time` (`add_time`),
  KEY `geo_location` (`latitude`,`longitude`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_geo_location
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_inbox`
-- ----------------------------
DROP TABLE IF EXISTS `aws_inbox`;
CREATE TABLE `aws_inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '发送者 ID',
  `dialog_id` int(11) DEFAULT NULL COMMENT '对话id',
  `message` text COMMENT '内容',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `sender_remove` tinyint(1) DEFAULT '0',
  `recipient_remove` tinyint(1) DEFAULT '0',
  `receipt` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialog_id` (`dialog_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `sender_remove` (`sender_remove`),
  KEY `recipient_remove` (`recipient_remove`),
  KEY `sender_receipt` (`receipt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_inbox
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_inbox_dialog`
-- ----------------------------
DROP TABLE IF EXISTS `aws_inbox_dialog`;
CREATE TABLE `aws_inbox_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对话ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者UID',
  `sender_unread` int(11) DEFAULT NULL COMMENT '发送者未读',
  `recipient_uid` int(11) DEFAULT NULL COMMENT '接收者UID',
  `recipient_unread` int(11) DEFAULT NULL COMMENT '接收者未读',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `sender_count` int(11) DEFAULT NULL COMMENT '发送者显示对话条数',
  `recipient_count` int(11) DEFAULT NULL COMMENT '接收者显示对话条数',
  PRIMARY KEY (`id`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `sender_uid` (`sender_uid`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_inbox_dialog
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_integral_log`
-- ----------------------------
DROP TABLE IF EXISTS `aws_integral_log`;
CREATE TABLE `aws_integral_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `action` varchar(16) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `action` (`action`),
  KEY `time` (`time`),
  KEY `integral` (`integral`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_integral_log
-- ----------------------------
INSERT INTO `aws_integral_log` VALUES ('1', '1', 'REGISTER', '2000', '初始资本', '2000', '0', '1394627776');
INSERT INTO `aws_integral_log` VALUES ('2', '1', 'NEW_QUESTION', '-20', '发起问题 #1', '1980', '1', '1394719449');
INSERT INTO `aws_integral_log` VALUES ('3', '1', 'NEW_QUESTION', '-20', '发起问题 #2', '1960', '2', '1394719468');
INSERT INTO `aws_integral_log` VALUES ('4', '1', 'NEW_QUESTION', '-20', '发起问题 #3', '1940', '3', '1403943287');
INSERT INTO `aws_integral_log` VALUES ('5', '2', 'REGISTER', '2000', '初始资本', '2000', '0', '1404305984');

-- ----------------------------
-- Table structure for `aws_invitation`
-- ----------------------------
DROP TABLE IF EXISTS `aws_invitation`;
CREATE TABLE `aws_invitation` (
  `invitation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `invitation_code` varchar(32) DEFAULT NULL COMMENT '激活码',
  `invitation_email` varchar(255) DEFAULT NULL COMMENT '激活email',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `add_ip` bigint(12) DEFAULT NULL COMMENT '添加IP',
  `active_expire` tinyint(1) DEFAULT '0' COMMENT '激活过期',
  `active_time` int(10) DEFAULT NULL COMMENT '激活时间',
  `active_ip` bigint(12) DEFAULT NULL COMMENT '激活IP',
  `active_status` tinyint(4) DEFAULT '0' COMMENT '1已使用0未使用-1已删除',
  `active_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `uid` (`uid`),
  KEY `invitation_code` (`invitation_code`),
  KEY `invitation_email` (`invitation_email`),
  KEY `active_time` (`active_time`),
  KEY `active_ip` (`active_ip`),
  KEY `active_status` (`active_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_invitation
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `aws_jobs`;
CREATE TABLE `aws_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(64) DEFAULT NULL COMMENT '职位名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_jobs
-- ----------------------------
INSERT INTO `aws_jobs` VALUES ('1', '销售');
INSERT INTO `aws_jobs` VALUES ('2', '市场/市场拓展/公关');
INSERT INTO `aws_jobs` VALUES ('3', '商务/采购/贸易');
INSERT INTO `aws_jobs` VALUES ('4', '计算机软、硬件/互联网/IT');
INSERT INTO `aws_jobs` VALUES ('5', '电子/半导体/仪表仪器');
INSERT INTO `aws_jobs` VALUES ('6', '通信技术');
INSERT INTO `aws_jobs` VALUES ('7', '客户服务/技术支持');
INSERT INTO `aws_jobs` VALUES ('8', '行政/后勤');
INSERT INTO `aws_jobs` VALUES ('9', '人力资源');
INSERT INTO `aws_jobs` VALUES ('10', '高级管理');
INSERT INTO `aws_jobs` VALUES ('11', '生产/加工/制造');
INSERT INTO `aws_jobs` VALUES ('12', '质控/安检');
INSERT INTO `aws_jobs` VALUES ('13', '工程机械');
INSERT INTO `aws_jobs` VALUES ('14', '技工');
INSERT INTO `aws_jobs` VALUES ('15', '财会/审计/统计');
INSERT INTO `aws_jobs` VALUES ('16', '金融/银行/保险/证券/投资');
INSERT INTO `aws_jobs` VALUES ('17', '建筑/房地产/装修/物业');
INSERT INTO `aws_jobs` VALUES ('18', '交通/仓储/物流');
INSERT INTO `aws_jobs` VALUES ('19', '普通劳动力/家政服务');
INSERT INTO `aws_jobs` VALUES ('20', '零售业');
INSERT INTO `aws_jobs` VALUES ('21', '教育/培训');
INSERT INTO `aws_jobs` VALUES ('22', '咨询/顾问');
INSERT INTO `aws_jobs` VALUES ('23', '学术/科研');
INSERT INTO `aws_jobs` VALUES ('24', '法律');
INSERT INTO `aws_jobs` VALUES ('25', '美术/设计/创意');
INSERT INTO `aws_jobs` VALUES ('26', '编辑/文案/传媒/影视/新闻');
INSERT INTO `aws_jobs` VALUES ('27', '酒店/餐饮/旅游/娱乐');
INSERT INTO `aws_jobs` VALUES ('28', '化工');
INSERT INTO `aws_jobs` VALUES ('29', '能源/矿产/地质勘查');
INSERT INTO `aws_jobs` VALUES ('30', '医疗/护理/保健/美容');
INSERT INTO `aws_jobs` VALUES ('31', '生物/制药/医疗器械');
INSERT INTO `aws_jobs` VALUES ('32', '翻译（口译与笔译）');
INSERT INTO `aws_jobs` VALUES ('33', '公务员');
INSERT INTO `aws_jobs` VALUES ('34', '环境科学/环保');
INSERT INTO `aws_jobs` VALUES ('35', '农/林/牧/渔业');
INSERT INTO `aws_jobs` VALUES ('36', '兼职/临时/培训生/储备干部');
INSERT INTO `aws_jobs` VALUES ('37', '在校学生');
INSERT INTO `aws_jobs` VALUES ('38', '其他');

-- ----------------------------
-- Table structure for `aws_lbuser_detail`
-- ----------------------------
DROP TABLE IF EXISTS `aws_lbuser_detail`;
CREATE TABLE `aws_lbuser_detail` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL COMMENT '用户类型 0 表示 学生 1 表示老师',
  `major_id` varchar(255) DEFAULT NULL COMMENT '专业ID',
  `schooli_d` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL COMMENT '分数',
  `resource_url` varchar(255) DEFAULT NULL COMMENT '该用户的资料存放地址',
  `exame_date` varchar(255) NOT NULL DEFAULT '' COMMENT '考研时期',
  `major_name` varchar(255) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `hot_rank` varchar(128) DEFAULT '该学生或者老师的热度排名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_lbuser_detail
-- ----------------------------
INSERT INTO `aws_lbuser_detail` VALUES ('1', 'teacher', '1', '1', '23', '11', '11', '阿发发发', '22222', '2');

-- ----------------------------
-- Table structure for `aws_lb_province`
-- ----------------------------
DROP TABLE IF EXISTS `aws_lb_province`;
CREATE TABLE `aws_lb_province` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_lb_province
-- ----------------------------
INSERT INTO `aws_lb_province` VALUES ('1', '北京');
INSERT INTO `aws_lb_province` VALUES ('2', '上海');
INSERT INTO `aws_lb_province` VALUES ('3', '黑龙江');
INSERT INTO `aws_lb_province` VALUES ('4', '吉林');
INSERT INTO `aws_lb_province` VALUES ('5', '辽宁');
INSERT INTO `aws_lb_province` VALUES ('6', '天津');
INSERT INTO `aws_lb_province` VALUES ('7', '安徽');
INSERT INTO `aws_lb_province` VALUES ('8', '江苏');
INSERT INTO `aws_lb_province` VALUES ('9', '浙江');
INSERT INTO `aws_lb_province` VALUES ('10', '陕西');
INSERT INTO `aws_lb_province` VALUES ('11', '湖北');
INSERT INTO `aws_lb_province` VALUES ('12', '广东');
INSERT INTO `aws_lb_province` VALUES ('13', '湖南');
INSERT INTO `aws_lb_province` VALUES ('14', '甘肃');
INSERT INTO `aws_lb_province` VALUES ('15', '四川');
INSERT INTO `aws_lb_province` VALUES ('16', '山东');
INSERT INTO `aws_lb_province` VALUES ('17', '福建');
INSERT INTO `aws_lb_province` VALUES ('18', '河南');
INSERT INTO `aws_lb_province` VALUES ('19', '重庆');
INSERT INTO `aws_lb_province` VALUES ('20', '云南');
INSERT INTO `aws_lb_province` VALUES ('21', '河北');
INSERT INTO `aws_lb_province` VALUES ('22', '江西');
INSERT INTO `aws_lb_province` VALUES ('23', '山西');
INSERT INTO `aws_lb_province` VALUES ('24', '贵州');
INSERT INTO `aws_lb_province` VALUES ('25', '广西');
INSERT INTO `aws_lb_province` VALUES ('26', '内蒙古');
INSERT INTO `aws_lb_province` VALUES ('27', '宁夏');
INSERT INTO `aws_lb_province` VALUES ('28', '青海');
INSERT INTO `aws_lb_province` VALUES ('29', '新疆');
INSERT INTO `aws_lb_province` VALUES ('30', '海南');
INSERT INTO `aws_lb_province` VALUES ('31', '西藏');
INSERT INTO `aws_lb_province` VALUES ('32', '香港');
INSERT INTO `aws_lb_province` VALUES ('33', '澳门');
INSERT INTO `aws_lb_province` VALUES ('34', '台湾');

-- ----------------------------
-- Table structure for `aws_lb_school`
-- ----------------------------
DROP TABLE IF EXISTS `aws_lb_school`;
CREATE TABLE `aws_lb_school` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(256) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_lb_school
-- ----------------------------
INSERT INTO `aws_lb_school` VALUES ('1001', '清华大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1002', '北京大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1003', '中国人民大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1004', '北京航空航天大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1005', '北京邮电大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1006', '北京师范大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1007', '中国传媒大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1008', '北京语言大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1009', '北京科技大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1010', '中国农业大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1011', '北京理工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1012', '北京林业大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1013', '北京交通大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1014', '中国矿业大学（北京）', '1');
INSERT INTO `aws_lb_school` VALUES ('1015', '北京信息科技大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1016', '北京工业大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1017', '北京化工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1018', '中国政法大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1019', '对外经贸大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1020', '中央民族大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1021', '中国地质大学（北京）', '1');
INSERT INTO `aws_lb_school` VALUES ('1022', '中科院', '1');
INSERT INTO `aws_lb_school` VALUES ('1023', '北京中医药大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1024', '首都经济贸易大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1025', '中央财经大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1026', '北方工业大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1027', '中国石油大学（北京）', '1');
INSERT INTO `aws_lb_school` VALUES ('1028', '外交学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1029', '首都师范大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1030', '中央戏剧学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1031', '中国青年政治学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1032', '北京外国语大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1033', '华北电力大学（北京）', '1');
INSERT INTO `aws_lb_school` VALUES ('1034', '中国人民公安大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1035', '北京协和医学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1036', '北京体育大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1037', '北京工商大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1038', '北京联合大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1039', '首都医科大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1040', '国际关系学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1041', '中央美术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1042', '北京电子科技学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1043', '中国劳动关系学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1044', '中华女子学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1045', '北京建筑工程学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1046', '北京印刷学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1047', '北京石油化工学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1048', '首钢工学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1049', '北京农学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1050', '首都体育学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1051', '北京第二外国语学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1052', '北京物资学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1053', '北京警察学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1054', '中央音乐学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1055', '中国戏曲学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1056', '北京舞蹈学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1057', '北京城市学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1058', '北京电影学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1059', '北京服装学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1060', '青岛教育学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1061', '北京体育职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1062', '中国人民解放军装甲兵工程学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1067', '中国石油勘探开发研究院', '1');
INSERT INTO `aws_lb_school` VALUES ('1068', '北京生命科学研究所', '1');
INSERT INTO `aws_lb_school` VALUES ('1069', '中国电影资料馆', '1');
INSERT INTO `aws_lb_school` VALUES ('1070', '北京工商大学嘉华学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1071', '首都师范大学科德学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1072', '北京工业大学耿丹学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1073', '北京化工大学北方学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1074', '北京联合大学广告学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1075', '北京邮电大学世纪学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1076', '北京国际商务学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1101', '北京大学医学部', '1');
INSERT INTO `aws_lb_school` VALUES ('1102', '北京政法职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1103', '北京信息职业技术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1104', '北京现代职业技术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1105', '北京现代音乐研修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1106', '北京戏曲艺术职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1107', '北京锡华国际经贸职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1108', '北京盛基艺术学校', '1');
INSERT INTO `aws_lb_school` VALUES ('1109', '北京培黎职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1110', '北京农业职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1111', '北京科技职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1112', '北京科技经营管理学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1113', '北京经贸职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1114', '北京经济技术职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1115', '北京京北职业技术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1116', '北京交通职业技术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1117', '北京吉利大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1118', '北京汇佳职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1119', '北京工业职业技术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1120', '北京工商管理专修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1121', '北京电子科技职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1122', '北京财贸职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1123', '北京北大方正软件技术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1124', '北大资源美术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1125', '北京人文大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1126', '北京高等秘书学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1127', '北京应用技术大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1128', '中国防卫科技学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1129', '中国音乐学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1130', '中国信息大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1131', '北京青年政治学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1132', '北京财经专修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1133', '北京经济管理职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1134', '北京美国英语语言学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1135', '中国管理软件学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1136', '财政部财政科学研究所', '1');
INSERT INTO `aws_lb_school` VALUES ('1137', '北大资源学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1138', '现代管理大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1139', '北京民族大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1140', '北京市劳动保障职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1141', '北京市建设职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1142', '北京市房地产职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1143', '北京市汽车工业总公司职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1144', '北京市西城经济科学大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1145', '北京市丰台区职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1146', '北京广播电视大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1147', '北京教育学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1148', '北京市东城区职工业余大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1149', '北京市总工会职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1150', '北京市海淀区职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1151', '北京市崇文区职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1152', '北京宣武红旗业余大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1153', '北京市石景山区业余大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1154', '北京市朝阳区职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1155', '北京市机械工业局职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1156', '北京医药集团职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1157', '北京劳动保障职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1158', '北京社会管理职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1160', '北京演艺专修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1161', '北京兴华大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1162', '北京新园明职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1163', '中央党校研究生院', '1');
INSERT INTO `aws_lb_school` VALUES ('1164', '中国社科院', '1');
INSERT INTO `aws_lb_school` VALUES ('1165', '北京旅游专修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1166', '东方文化艺术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1167', '首都联合职工大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1168', '中国农业科学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1169', '北京影视研修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1170', '国家法官学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1171', '北京建设大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1172', '北京金融学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1173', '北京黄埔大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1174', '中瑞酒店管理学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1175', '中国建筑设计研究院', '1');
INSERT INTO `aws_lb_school` VALUES ('1176', '北京文理研修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1177', '北京当代艺术学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1178', '北京大学国际法学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1179', '北京交通运输职业学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1180', '中国艺术研究院', '1');
INSERT INTO `aws_lb_school` VALUES ('1181', '北京工业大学通州分校', '1');
INSERT INTO `aws_lb_school` VALUES ('1182', '北京八维研修学院', '1');
INSERT INTO `aws_lb_school` VALUES ('1998', '网络销售大学', '1');
INSERT INTO `aws_lb_school` VALUES ('1999', '朝阳二外', '1');
INSERT INTO `aws_lb_school` VALUES ('2000', '中北国际演艺学校', '1');
INSERT INTO `aws_lb_school` VALUES ('2001', '复旦大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2002', '上海交通大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2003', '同济大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2004', '华东师大', '2');
INSERT INTO `aws_lb_school` VALUES ('2005', '上海财经', '2');
INSERT INTO `aws_lb_school` VALUES ('2006', '华东理工', '2');
INSERT INTO `aws_lb_school` VALUES ('2007', '上海商学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2008', '东华大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2009', '上海理工', '2');
INSERT INTO `aws_lb_school` VALUES ('2010', '上海大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2011', '上海外国语大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2012', '上海海事', '2');
INSERT INTO `aws_lb_school` VALUES ('2013', '上海工程', '2');
INSERT INTO `aws_lb_school` VALUES ('2014', '上海海洋大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2015', '上海中医药', '2');
INSERT INTO `aws_lb_school` VALUES ('2016', '上海师大', '2');
INSERT INTO `aws_lb_school` VALUES ('2017', '建桥学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2018', '上海政法', '2');
INSERT INTO `aws_lb_school` VALUES ('2019', '上海电机', '2');
INSERT INTO `aws_lb_school` VALUES ('2020', '上海二工大', '2');
INSERT INTO `aws_lb_school` VALUES ('2021', '上海应用技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2022', '上海电力', '2');
INSERT INTO `aws_lb_school` VALUES ('2023', '上海外贸', '2');
INSERT INTO `aws_lb_school` VALUES ('2024', '上海金融', '2');
INSERT INTO `aws_lb_school` VALUES ('2025', '上海立信会计学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2026', '上海体院', '2');
INSERT INTO `aws_lb_school` VALUES ('2027', '上海音乐学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2028', '上海戏剧学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2029', '杉达学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2030', '华东政法大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2031', '上海师范大学青年学院 ', '2');
INSERT INTO `aws_lb_school` VALUES ('2035', '上外贤达经济人文学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2036', '同济大学同科学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2037', '上海师范大学天华学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2038', '上海东方文化职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2039', '上海工商学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2102', '复旦大学上海视觉艺术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2103', '复旦大学上海医学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2104', '复旦大学太平洋金融学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2105', '上海邦德职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2106', '上海诚信学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2107', '上海城市管理职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2108', '上海出版印刷高等专科学校', '2');
INSERT INTO `aws_lb_school` VALUES ('2109', '上海电影艺术职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2110', '上海电子信息职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2111', '上海东海职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2112', '上海工会管理职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2113', '上海工商外国语学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2115', '上海工艺美术职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2116', '上海公安高等专科学校', '2');
INSERT INTO `aws_lb_school` VALUES ('2117', '上海海关学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2118', '上海海事职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2119', '上海济光职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2120', '上海建峰职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2121', '上海交通职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2122', '上海科学技术职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2123', '上海立达职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2124', '上海旅游高等专科学校', '2');
INSERT INTO `aws_lb_school` VALUES ('2125', '上海民远职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2126', '上海农林职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2127', '上海欧华职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2128', '上海思博职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2129', '上海托普信息技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2130', '上海新侨职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2131', '上海行健职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2132', '上海医疗器械高等专科学校', '2');
INSERT INTO `aws_lb_school` VALUES ('2133', '上海医药高等专科学校', '2');
INSERT INTO `aws_lb_school` VALUES ('2135', '上海震旦职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2136', '上海中华职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2137', '上海中侨职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2138', '上海纺织工业职工大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2139', '上海体育职业学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2140', '上海医药职工大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2141', '上海市广播电视大学', '2');
INSERT INTO `aws_lb_school` VALUES ('2142', '上海职工医学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2143', '上海职工体育运动技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2145', '华东理工大学网络教育学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2146', '上海市经济管理干部学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2147', '上海社会科学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2148', '上海大学艺术研究院', '2');
INSERT INTO `aws_lb_school` VALUES ('2149', '中国科学院上海生命科学研究院', '2');
INSERT INTO `aws_lb_school` VALUES ('2155', '上海生物制品研究所', '2');
INSERT INTO `aws_lb_school` VALUES ('2160', '上海行政学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2162', '上海科技学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2164', '拉萨尔国际设计学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2167', '上海青年管理干部学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2168', '上海鸿文职业技术学院', '2');
INSERT INTO `aws_lb_school` VALUES ('2169', '上海大学巴士汽车学院', '2');
INSERT INTO `aws_lb_school` VALUES ('3001', '哈尔滨工业大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3002', '哈工程', '3');
INSERT INTO `aws_lb_school` VALUES ('3003', '东北林大', '3');
INSERT INTO `aws_lb_school` VALUES ('3004', '东北农业大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3005', '哈尔滨医科大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3006', '黑龙江中医药', '3');
INSERT INTO `aws_lb_school` VALUES ('3007', '黑工程', '3');
INSERT INTO `aws_lb_school` VALUES ('3008', '黑龙江科技大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3009', '哈尔滨学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3010', '哈尔滨体院', '3');
INSERT INTO `aws_lb_school` VALUES ('3011', '东方学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3012', '黑龙江大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3013', '哈尔滨商业大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3014', '哈师大', '3');
INSERT INTO `aws_lb_school` VALUES ('3015', '哈尔滨理工大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3016', '黑龙江技师学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3017', '黑龙江省护理高等专科学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3051', '佳木斯大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3101', '齐齐哈尔大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3102', '齐齐哈尔医学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3151', '黑龙江八一农垦大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3152', '东北石油大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3153', '大庆师范学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3201', '牡丹江医学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3202', '牡丹江师范', '3');
INSERT INTO `aws_lb_school` VALUES ('3251', '绥化学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3301', '黑河学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3401', '大庆医学高等专科学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3402', '大庆职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3403', '大兴安岭职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3404', '哈尔滨电力职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3405', '哈尔滨华夏计算机职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3406', '哈尔滨金融学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3407', '哈尔滨铁道职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3408', '哈尔滨现代公共关系职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3409', '哈尔滨职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3410', '鹤岗师范高等专科学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3411', '黑龙江北开职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3412', '黑龙江工商职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3414', '黑龙江建筑职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3415', '黑龙江林业职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3416', '黑龙江旅游职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3417', '黑龙江煤炭职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3418', '黑龙江民族职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3419', '黑龙江农垦林业职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3420', '黑龙江农垦农业职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3421', '黑龙江农垦职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3422', '黑龙江农业工程职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3423', '黑龙江农业经济职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3424', '黑龙江农业职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3425', '黑龙江三江美术职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3426', '黑龙江商业职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3427', '黑龙江生态工程职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3428', '黑龙江生物科技职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3429', '黑龙江司法警官职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3430', '黑龙江信息技术职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3431', '黑龙江畜牧兽医职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3432', '黑龙江艺术职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3433', '鸡西大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3434', '牡丹江大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3435', '七台河职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3436', '齐齐哈尔高等师范专科学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3437', '齐齐哈尔工程学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3438', '伊春职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3439', '哈尔滨师范大学阿城学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3441', '黑龙江省政法管理干部学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3442', '黑龙江交通职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3443', '哈尔滨应用职业技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3501', '黑龙江省教育学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3502', '哈尔滨理工大学远东学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3503', '哈尔滨师范大学呼兰学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3516', '黑龙江外国语学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3517', '哈尔滨商业大学德强商务学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3518', '东北石油大学华瑞学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3519', '东北农业大学成栋学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3521', '黑龙江大学剑桥学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3522', '哈尔滨商业大学广厦学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3523', '哈尔滨工业大学华德应用技术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3525', '哈尔滨市职工医学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3527', '佳木斯教育学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3529', '黑龙江幼儿师范高等专科学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3530', '哈尔滨外国语学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3533', '哈尔滨科学技术职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3534', '黑龙江粮食职业学院　　', '3');
INSERT INTO `aws_lb_school` VALUES ('3535', '佳木斯职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3536', '黑龙江广播电视大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3537', '哈尔滨广播电视大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3538', '黑龙江大鹏传媒学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3539', '鸡西市北方外国语学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3540', '牡丹江市精英计算机学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3542', '黑龙江中医药大学', '3');
INSERT INTO `aws_lb_school` VALUES ('3543', '齐齐哈尔林业学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3544', '齐齐哈尔林业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3545', '黑龙江生态职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3546', '哈尔滨阳光计算机专修学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3547', '齐齐哈尔市卫生学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3548', '伟建工学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3549', '诚实外语学院（肇庆分院）', '3');
INSERT INTO `aws_lb_school` VALUES ('3550', '黑龙江省畜牧职业学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3551', '哈尔滨德强商务学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3552', '黑龙江现代艺术学院', '3');
INSERT INTO `aws_lb_school` VALUES ('3553', '黑龙江省对外贸易学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3554', '哈尔滨市幼儿师范学校', '3');
INSERT INTO `aws_lb_school` VALUES ('3555', '黑龙江省社会科学院研究生部', '3');
INSERT INTO `aws_lb_school` VALUES ('4001', '吉林大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4002', '东北师范大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4003', '长春大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4004', '吉林农大', '4');
INSERT INTO `aws_lb_school` VALUES ('4005', '长春中医药', '4');
INSERT INTO `aws_lb_school` VALUES ('4006', '东北电力大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4007', '吉林化工', '4');
INSERT INTO `aws_lb_school` VALUES ('4008', '吉林建工', '4');
INSERT INTO `aws_lb_school` VALUES ('4009', '长春工程学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4010', '长春师范学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4011', '吉林工程师范', '4');
INSERT INTO `aws_lb_school` VALUES ('4012', '吉林华桥外国语学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4013', '吉林财经大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4014', '吉林体院', '4');
INSERT INTO `aws_lb_school` VALUES ('4015', '吉林艺术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4016', '长春工业大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4017', '长春理工大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4018', '吉林俄语学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4051', '延边大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4101', '北华大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4102', '吉林农业科技学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4103', '吉林医药学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4151', '吉林师范', '4');
INSERT INTO `aws_lb_school` VALUES ('4201', '白城师范学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4251', '通化师范', '4');
INSERT INTO `aws_lb_school` VALUES ('4301', '白城医学高等专科学校', '4');
INSERT INTO `aws_lb_school` VALUES ('4302', '长春东方职业学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4303', '长春金融高等专科学校', '4');
INSERT INTO `aws_lb_school` VALUES ('4304', '长春汽车工业高等专科学校', '4');
INSERT INTO `aws_lb_school` VALUES ('4305', '长春信息技术职业学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4306', '长春医学高等专科学校', '4');
INSERT INTO `aws_lb_school` VALUES ('4307', '长春职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4308', '东北师范大学人文学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4309', '吉林工商学院—财经校区', '4');
INSERT INTO `aws_lb_school` VALUES ('4310', '吉林大学—莱姆顿学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4311', '吉林电子信息职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4312', '吉林对外经贸职业学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4313', '吉林工业职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4315', '吉林交通职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4316', '吉林工商学院—工程校区', '4');
INSERT INTO `aws_lb_school` VALUES ('4317', '吉林农业工程职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4318', '吉林工商学院—商贸校区', '4');
INSERT INTO `aws_lb_school` VALUES ('4319', '吉林司法警官职业学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4320', '辽源职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4321', '四平职业大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4322', '松原职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4323', '吉林省教育学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4324', '吉林经济管理干部学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4325', '长春大学光华学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4326', '长春大学旅游学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4327', '长春工业大学人文信息学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4328', '吉林动画学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4329', '长春理工大学光电信息学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4331', '吉林农业大学发展学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4332', '吉林师范大学博达学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4333', '吉林铁道职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4334', '白城职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4335', '长春建筑学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4336', '吉林建筑工程学院城建学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4337', '通化市职工大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4338', '通化钢铁公司职工大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4339', '吉林省经济管理干部学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4340', '吉林广播电视大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4341', '长春教育学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4343', '梨树农村成人高等专科学校', '4');
INSERT INTO `aws_lb_school` VALUES ('4344', '延边黎明农民大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4345', '吉林职工医科大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4346', '吉林省行政管理干部学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4347', '吉林化学工业公司职工大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4348', '延边职工大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4349', '长春职工医科大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4350', '长春市直属机关业余大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4351', '长春市建筑职工业余大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4352', '长春职工大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4353', '长春广播电视大学', '4');
INSERT INTO `aws_lb_school` VALUES ('4354', '长白山职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4355', '长春邮电学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4357', '吉林科技职业技术学院', '4');
INSERT INTO `aws_lb_school` VALUES ('4363', '长春艺术学校', '4');
INSERT INTO `aws_lb_school` VALUES ('4364', '吉林警察学院', '4');
INSERT INTO `aws_lb_school` VALUES ('5001', '大连理工', '5');
INSERT INTO `aws_lb_school` VALUES ('5002', '东北大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5003', '辽宁大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5004', '大连海事', '5');
INSERT INTO `aws_lb_school` VALUES ('5005', '东北财经', '5');
INSERT INTO `aws_lb_school` VALUES ('5006', '大连大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5007', '大连交大', '5');
INSERT INTO `aws_lb_school` VALUES ('5008', '大连医大', '5');
INSERT INTO `aws_lb_school` VALUES ('5009', '辽宁师大', '5');
INSERT INTO `aws_lb_school` VALUES ('5010', '大连民族', '5');
INSERT INTO `aws_lb_school` VALUES ('5011', '大连工大', '5');
INSERT INTO `aws_lb_school` VALUES ('5012', '大连海洋大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5013', '大连外国语学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5014', '辽宁外经贸', '5');
INSERT INTO `aws_lb_school` VALUES ('5015', '辽宁现代服务职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5016', '铁岭卫生职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5017', '辽宁工程职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5051', '沈阳大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5052', '沈阳理工', '5');
INSERT INTO `aws_lb_school` VALUES ('5053', '沈阳工大', '5');
INSERT INTO `aws_lb_school` VALUES ('5054', '沈阳建筑', '5');
INSERT INTO `aws_lb_school` VALUES ('5055', '沈阳农大', '5');
INSERT INTO `aws_lb_school` VALUES ('5056', '辽宁中医药', '5');
INSERT INTO `aws_lb_school` VALUES ('5057', '沈阳药科', '5');
INSERT INTO `aws_lb_school` VALUES ('5058', '沈阳师范', '5');
INSERT INTO `aws_lb_school` VALUES ('5059', '中国刑警学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5060', '沈阳化工', '5');
INSERT INTO `aws_lb_school` VALUES ('5061', '沈阳航空航天大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5062', '沈阳工程', '5');
INSERT INTO `aws_lb_school` VALUES ('5063', '沈阳医学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5064', '沈阳体院', '5');
INSERT INTO `aws_lb_school` VALUES ('5065', '鲁迅美院', '5');
INSERT INTO `aws_lb_school` VALUES ('5066', '沈阳音乐学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5067', '中国医科大', '5');
INSERT INTO `aws_lb_school` VALUES ('5101', '辽宁工程技术大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5151', '辽宁石化', '5');
INSERT INTO `aws_lb_school` VALUES ('5201', '辽宁科大', '5');
INSERT INTO `aws_lb_school` VALUES ('5202', '鞍山师范学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5251', '渤海大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5252', '辽宁工业大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5253', '辽宁医学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5301', '辽宁科技学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5351', '辽东学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5401', '鞍山市高等职业专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5402', '渤海船舶职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5403', '渤海大学文理学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5404', '朝阳师范高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5405', '大连东软信息学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5406', '大连翻译职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5407', '大连枫叶职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5408', '大连软件职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5409', '大连商务职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5410', '大连艺术职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5411', '大连职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5412', '抚顺师范高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5413', '抚顺职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5414', '阜新高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5415', '辽宁理工学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5416', '锦州师范高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5418', '辽宁广播电视大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5419', '辽宁广告职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5420', '辽宁机电职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5421', '辽宁交通高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5422', '沈阳大学师范学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5423', '辽宁金融职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5424', '辽宁经济职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5425', '辽宁警官高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5426', '辽宁科技大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5427', '辽宁林业职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5428', '辽宁美术职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5429', '辽宁农业职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5430', '辽宁商贸职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5431', '辽宁石化职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5432', '大连广播电视大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5433', '辽宁体育运动职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5434', '辽宁信息职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5435', '辽阳职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5436', '盘锦职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5437', '沈阳航空职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5438', '沈阳职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5439', '辽宁职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5440', '铁岭师范高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5441', '营口职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5442', '沈阳广播电视大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5443', '青岛峻通科技专修学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5444', '辽河石油职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5445', '青岛广播电视大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5446', '沈阳航空工业学院北方科技学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5447', '沈阳理工大学应用技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5448', '大连工业大学艺术与信息工程学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5449', '大连交通大学信息工程学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5450', '沈阳建筑大学城市建设学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5451', '辽宁科技大学信息技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5452', '辽宁石油化工大学顺华能源学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5453', '沈阳化工学院科亚学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5454', '沈阳农业大学科学技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5455', '中国医科大学临床医药学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5456', '大连医科大学中山学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5457', '辽宁医学院医疗学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5458', '辽宁中医药大学杏林学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5459', '沈阳医学院何氏视觉科学学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5460', '辽宁师范大学海华学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5461', '东北财经大学津桥商学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5462', ' 辽宁财贸学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5463', '大连理工大学城市学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5464', '沈阳大学科技工程学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5465', '辽宁装备制造职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5466', '辽宁文化艺术职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5467', '辽宁公安司法管理干部学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5468', '沈阳工业大学工程学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5469', '海军职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5471', '阜新矿务局职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5472', '沈阳机械工业职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5474', '阜新煤炭职工医学专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5475', '辽宁财贸职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5476', '大连市教育学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5477', '朝阳职工工学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5478', '鞍山钢铁集团公司职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5479', '抚顺石油化工公司职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5480', '辽宁兵器工业职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5481', '本溪钢铁公司职工工学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5482', '大连工人大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5483', '大连职工大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5484', '抚顺矿务局职工工学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5485', '辽宁地质工程职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5486', '辽宁中医药大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5487', '辽宁建筑职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5488', '沈阳国际科学技术专修学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5489', '辽宁商务职业学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5490', '辽宁财贸学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5491', '大连市工人大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5492', '辽宁广告设计学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5493', '沈阳工业大学（辽阳校区）', '5');
INSERT INTO `aws_lb_school` VALUES ('5494', '沈阳工业大学(辽阳校区)', '5');
INSERT INTO `aws_lb_school` VALUES ('5495', '辽宁省交通高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5496', '辽宁省城市建设职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5497', '辽宁对外经贸学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5498', '鲁迅美术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5499', '大连艺术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5500', '辽宁税务高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5501', '沈阳职业技术学院计算机学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5502', '吉林大学工商管理学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5503', '辽宁卫生职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5505', '大连航运职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5506', '辽宁东方中医学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5508', '辽宁公安司法干部管理学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5509', '中国人民解放军大连医学高等专科学校', '5');
INSERT INTO `aws_lb_school` VALUES ('5511', '大连装备制造职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5512', '沈阳建筑大学', '5');
INSERT INTO `aws_lb_school` VALUES ('5513', '大连东方外国语学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5514', '锦州医学院畜牧兽医学院', '5');
INSERT INTO `aws_lb_school` VALUES ('5515', '辽宁铁道职业技术学院', '5');
INSERT INTO `aws_lb_school` VALUES ('6001', '南开大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6002', '天津大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6003', '河北工大', '6');
INSERT INTO `aws_lb_school` VALUES ('6004', '天津师大', '6');
INSERT INTO `aws_lb_school` VALUES ('6005', '天津工大', '6');
INSERT INTO `aws_lb_school` VALUES ('6006', '天津科大', '6');
INSERT INTO `aws_lb_school` VALUES ('6007', '天津理工', '6');
INSERT INTO `aws_lb_school` VALUES ('6008', '天津医大', '6');
INSERT INTO `aws_lb_school` VALUES ('6009', '天津中医药', '6');
INSERT INTO `aws_lb_school` VALUES ('6010', '天津财经', '6');
INSERT INTO `aws_lb_school` VALUES ('6011', '中国民航大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6012', '天津城市建设学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6013', '天津农院', '6');
INSERT INTO `aws_lb_school` VALUES ('6015', '天津外国语', '6');
INSERT INTO `aws_lb_school` VALUES ('6016', '天津商业大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6017', '天津体院', '6');
INSERT INTO `aws_lb_school` VALUES ('6018', '天津音乐学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6019', '天津美院', '6');
INSERT INTO `aws_lb_school` VALUES ('6020', '天津市国际商务学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6101', '天津天狮学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6102', '天津滨海职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6103', '天津渤海职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6104', '天津城市建设管理职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6105', '天津城市职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6106', '天津电子信息职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6107', '天津对外经济贸易职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6108', '天津工程职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6109', '天津工商职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6110', '天津工业职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6111', '天津工艺美术职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6112', '天津公安警官职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6113', '天津海运职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6114', '天津机电职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6115', '天津交通职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6116', '天津开发区职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6117', '天津青年职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6118', '天津轻工职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6119', '天津生物工程职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6120', '天津石油职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6121', '天津铁道职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6122', '天津现代职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6123', '天津冶金职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6124', '天津医学高等专科学校', '6');
INSERT INTO `aws_lb_school` VALUES ('6125', '天津艺术职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6126', '天津职业大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6127', '天津中德职业技术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6128', '天津市工会管理干部学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6129', '天津外国语学院滨海外事学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6130', '天津体育学院运动与文化艺术学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6131', '天津商学院宝德学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6132', '天津医科大学临床医学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6133', '北京科技大学天津学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6134', '天津师范大学津沽学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6135', '天津理工大学中环信息学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6136', '天津大学仁爱学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6137', '天津财经大学珠江学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6138', '南开大学滨海学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6140', '天津市职工经济技术大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6141', '天津市房地产局职工大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6142', '天津市政法管理干部学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6143', '天津市财贸管理干部学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6144', '天津市广播电视大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6145', '天津市管理干部学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6146', '天津市渤海化工职工学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6147', '天津市南开区职工大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6148', '天津市红桥区职工大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6149', '天津市建筑工程职工大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6150', '天津市河东区职工大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6151', '天津市河西区职工大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6152', '天津市和平区新华职工大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6153', '天津物资管理干部学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6154', '天津市海军工程大学', '6');
INSERT INTO `aws_lb_school` VALUES ('6155', '中国旅游干部管理学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6159', '天津海运职业学校', '6');
INSERT INTO `aws_lb_school` VALUES ('6160', '天津市国土资源和房屋职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6161', '天津轻工职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6162', '斯波泰克高级技工学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6163', '天津广播影视职业学院', '6');
INSERT INTO `aws_lb_school` VALUES ('6164', '天津职业技术师范大学', '6');
INSERT INTO `aws_lb_school` VALUES ('7001', '中国科大', '7');
INSERT INTO `aws_lb_school` VALUES ('7002', '安徽大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7003', '合肥工大', '7');
INSERT INTO `aws_lb_school` VALUES ('7004', '安徽医科大', '7');
INSERT INTO `aws_lb_school` VALUES ('7005', '安徽建工', '7');
INSERT INTO `aws_lb_school` VALUES ('7006', '安徽中医', '7');
INSERT INTO `aws_lb_school` VALUES ('7007', '合肥学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7008', '安徽汽车职业技术学院 ', '7');
INSERT INTO `aws_lb_school` VALUES ('7009', '安徽农大', '7');
INSERT INTO `aws_lb_school` VALUES ('7010', '安徽长江职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7011', '桐城师范高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7051', '安徽工业大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7101', '安徽科技', '7');
INSERT INTO `aws_lb_school` VALUES ('7102', '皖南医学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7103', '安徽师大', '7');
INSERT INTO `aws_lb_school` VALUES ('7109', '安徽工程大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7151', '蚌埠医学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7152', '安徽财经', '7');
INSERT INTO `aws_lb_school` VALUES ('7201', '阜阳师范', '7');
INSERT INTO `aws_lb_school` VALUES ('7251', '淮南师范', '7');
INSERT INTO `aws_lb_school` VALUES ('7252', '安徽理工', '7');
INSERT INTO `aws_lb_school` VALUES ('7301', '淮北师范大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7351', '安庆师范', '7');
INSERT INTO `aws_lb_school` VALUES ('7401', '铜陵学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7402', '皖西学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7451', '巢湖学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7501', '滁州学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7551', '宿州学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7601', '黄山学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7602', '新华学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7701', '蚌埠学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7702', '安徽财贸职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7703', '安徽城市管理职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7704', '安徽电气工程职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7705', '安徽电子信息职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7706', '安徽工贸职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7707', '安徽工商职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7708', '安徽工业经济职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7709', '安徽公安职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7710', '安徽广播影视职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7711', '安徽国防科技职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7712', '安徽国际商务职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7713', '安徽机电职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7714', '安徽交通职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7715', '安徽教育学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7716', '安徽经济管理学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7717', '安徽警官职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7718', '安徽林业职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7719', '安徽明星科技职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7720', '安徽商贸职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7721', '安徽审计职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7722', '安徽三联学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7724', '安徽水利水电职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7725', '安徽体育运动职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7726', '安徽文达信息技术职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7727', '安徽新闻出版职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7728', '安徽冶金科技职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7729', '安徽医学高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7730', '安徽艺术职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7731', '安徽邮电职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7732', '安徽职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7733', '安徽中澳科技职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7734', '安徽中医药高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7735', '安庆职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7736', '蚌埠高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7737', '蚌埠职业教育专修学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7738', '亳州师范高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7739', '亳州职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7740', '巢湖职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7741', '池州学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7742', '池州职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7743', '滁州职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7744', '阜阳科技职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7745', '阜阳职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7746', '合肥市万博科技职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7747', '合肥通用职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7748', '淮北职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7749', '淮南联合大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7750', '淮南职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7752', '六安职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7753', '马鞍山师范高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7754', '安徽外国语学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7755', '民办合肥经济技术职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7756', '宿州职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7757', '铜陵职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7758', '芜湖信息技术职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7759', '芜湖职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7760', '宣城职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7761', '安徽师范大学皖江学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7762', '合肥师范学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7763', '凤阳师范高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7764', '安庆医药高等专科学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7765', '安徽工业职业技术学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7766', '合肥幼儿师范学校', '7');
INSERT INTO `aws_lb_school` VALUES ('7767', '蚌埠经济技术职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7768', '合肥财经职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7769', '徽商职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7770', '民办安徽旅游职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7771', '宿县地区教育学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7772', '淮南市职工大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7773', '合肥职工科技大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7774', '合肥市职工大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7775', '安徽省广播电视大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7776', '安徽绿海商务职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7777', '河海大学文天学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7778', '安徽涉外经济职业学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7780', '皖南农学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7781', '安徽蚌埠汽车管理学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7785', '安徽新华电脑专修学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7787', '蚌埠坦克学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7789', '安徽合肥机电技师学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7790', '安徽技术师范学院', '7');
INSERT INTO `aws_lb_school` VALUES ('7791', '宿州市联合大学', '7');
INSERT INTO `aws_lb_school` VALUES ('7792', '安徽经济管理干部学院', '7');
INSERT INTO `aws_lb_school` VALUES ('8001', '南京大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8002', '河海大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8003', '南京师大', '8');
INSERT INTO `aws_lb_school` VALUES ('8004', '南京理工', '8');
INSERT INTO `aws_lb_school` VALUES ('8005', '东南大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8006', '南京航空航天大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8007', '南京财经', '8');
INSERT INTO `aws_lb_school` VALUES ('8008', '南京医科大', '8');
INSERT INTO `aws_lb_school` VALUES ('8009', '南京工大', '8');
INSERT INTO `aws_lb_school` VALUES ('8010', '南京农大', '8');
INSERT INTO `aws_lb_school` VALUES ('8011', '南京林大', '8');
INSERT INTO `aws_lb_school` VALUES ('8012', '南邮', '8');
INSERT INTO `aws_lb_school` VALUES ('8013', '南京信息工程大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8014', '南京中医药', '8');
INSERT INTO `aws_lb_school` VALUES ('8015', '南京工程', '8');
INSERT INTO `aws_lb_school` VALUES ('8016', '金陵科技学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8017', '南京晓庄学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8018', '南京审计学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8019', '江苏警官学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8020', '南京体院', '8');
INSERT INTO `aws_lb_school` VALUES ('8021', '南京艺术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8022', '三江学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8023', '中国药科大', '8');
INSERT INTO `aws_lb_school` VALUES ('8024', '苏州工业园区服务外包职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8025', '无锡高等师范学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8026', '南京工程高等职业学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8027', '南京政治学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8028', '江苏技术师范学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8029', '淮安广播电视大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8030', '徐州经贸高等职业学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8031', '江苏师范大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8051', '苏州大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8101', '江南大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8151', '中国矿业大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8152', '徐州师大', '8');
INSERT INTO `aws_lb_school` VALUES ('8154', '徐州医学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8201', '扬州大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8251', '江苏大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8252', '江苏科大', '8');
INSERT INTO `aws_lb_school` VALUES ('8301', '南通大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8351', '常州大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8352', '常州工学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8353', '江苏技术师范', '8');
INSERT INTO `aws_lb_school` VALUES ('8401', '淮阴工学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8402', '淮阴师范', '8');
INSERT INTO `aws_lb_school` VALUES ('8451', '淮海工学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8501', '盐城工学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8502', '盐城师范学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8551', '常熟理工', '8');
INSERT INTO `aws_lb_school` VALUES ('8601', '常州纺织服装职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8602', '常州工程职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8603', '常州机电职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8605', '常州轻工职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8606', '常州信息职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8607', '硅湖职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8608', '河海大学常州校区', '8');
INSERT INTO `aws_lb_school` VALUES ('8609', '淮安信息职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8610', '建东职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8611', '健雄职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8612', '江海职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8613', '江南影视艺术职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8614', '江苏财经职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8615', '江苏海事职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8616', '江苏经贸职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8617', '江苏联合职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8618', '江苏农林职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8619', '江苏食品职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8620', '江苏信息职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8621', '江苏畜牧兽医职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8622', '江阴职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8623', '金肯职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8624', '金山职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8625', '九州职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8626', '昆山登云科技职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8627', '连云港师范高等专科学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8628', '连云港职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8629', '民办明达职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8630', '南京动力高等专科学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8631', '南京工业职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8632', '南京化工职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8633', '南京交通职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8634', '南京人口管理干部学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8635', '南京森林警察学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8636', '南京视觉艺术职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8637', '南京特殊教育职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8638', '南京铁道职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8639', '南京信息职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8640', '南通纺织职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8641', '南通航运职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8642', '南通农业职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8643', '南通职业大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8644', '培尔职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8645', '沙洲职业工学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8646', '苏州港大思培科技职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8647', '苏州工业园区职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8648', '苏州工业职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8649', '苏州工艺美术职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8650', '苏州经贸职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8651', '苏州科技大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8654', '苏州农业职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8655', '苏州托普信息职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8656', '苏州职业大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8657', '宿迁学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8658', '泰州师范高等专科学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8659', '泰州职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8660', '无锡城市职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8661', '无锡工艺职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8662', '无锡科技职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8663', '无锡南洋职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8664', '无锡轻工大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8665', '无锡商业职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8666', '无锡职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8667', '徐州工业职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8668', '徐州广播电视大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8669', '徐州建筑职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8670', '徐州教育学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8671', '徐州工程学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8672', '炎黄职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8673', '盐城纺织职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8674', '扬州工业职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8675', '扬州环境资源管理学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8676', '扬州环境资源职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8677', '扬州教育学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8678', '扬州职业大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8679', '应天职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8680', '镇江市高等专科学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8681', '正德职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8682', '中国传媒大学南广学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8683', '钟山职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8684', '紫琅职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8685', '江苏广播电视大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8686', '江苏教育学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8687', '徐州师范高等专科学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8688', '江苏省省级机关管理干部学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8689', '江苏职工医科大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8690', '苏州卫生职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8691', '盐城卫生职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8692', '金陵旅馆管理干部学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8693', '南京市广播电视大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8694', '南京机电职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8695', '江苏城市职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8697', '苏州高博软件技术职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8698', '南京旅游职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8699', '空军第一职工大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8700', '江苏省青年管理干部学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8701', '江苏省广播电视大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8702', '南京金陵旅馆管理干部学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8703', '南通市工人业余大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8704', '常州市职工大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8705', '南京市职工大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8706', '南京联合职工大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8707', '江苏电力职工大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8710', '宿迁职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8711', '南京工程兵工程学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8712', '南京理工大学泰州科技学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8713', '东南大学成贤学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8714', '南京理工大学紫金学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8715', '南京航空航天大学金城学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8716', '南京财经大学红山学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8717', '南京师范大学泰州学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8718', '南京审计学院金审学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8719', '南通大学杏林学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8720', '江苏工业学院怀德学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8721', '江苏科技大学南徐学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8722', '南京邮电大学通达学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8723', '徐州师范大学科文学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8724', '扬州大学广陵学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8725', '江苏大学京江学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8726', '苏州科技学院天平学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8727', '苏州大学应用技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8728', '苏州大学文正学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8729', '南京信息工程大学滨江学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8730', '南京中医药大学翰林学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8731', '南京医科大学康达学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8732', '南京师范大学中北学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8733', '南京工业大学浦江学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8734', '江南大学太湖学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8735', '南通体臣卫生学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8736', '南通市广播电视大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8737', '江苏省南通商贸高等职业学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8738', '南通高等师范学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8739', '如皋高等师范学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8740', '南通市中等专业学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8741', '太湖创意职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8742', '西交利物浦大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8743', '南京中天专修学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8744', '江苏苏州广播电视大学', '8');
INSERT INTO `aws_lb_school` VALUES ('8745', '南京金陵科技专修学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8746', '江苏科技经贸专修学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8747', '江苏省无锡交通高等职业技术学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8748', '南京新华电脑专修学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8749', '河海大学继续教育学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8750', '南京技师学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8751', '江苏建康职业学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8752', '江苏城镇建设学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8753', '南京航天管理干部学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8754', '中国人民大学国际学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8755', '徐州幼儿高等师范学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8756', '江苏技术师范东方学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8757', '南京高等职业技术学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8758', '江苏省司法警官高等职业学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8760', '苏州大学宿迁学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8761', '徐州医学院华方学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8762', '中国矿业大学徐海学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8764', '苏州信息职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8765', '江苏东南科技专修学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8766', '盐城生物工程高等职业技术学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8767', '江苏电大通州学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8768', '南京大学金陵学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8769', '运河高等师范学校', '8');
INSERT INTO `aws_lb_school` VALUES ('8770', '南京东方文理研修学院', '8');
INSERT INTO `aws_lb_school` VALUES ('8771', '徐州财经高等职业技术学校', '8');
INSERT INTO `aws_lb_school` VALUES ('9001', '浙江大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9002', '浙江理工', '9');
INSERT INTO `aws_lb_school` VALUES ('9003', '浙江工大', '9');
INSERT INTO `aws_lb_school` VALUES ('9004', '杭州电子科大', '9');
INSERT INTO `aws_lb_school` VALUES ('9005', '浙江中医药', '9');
INSERT INTO `aws_lb_school` VALUES ('9006', '浙江工商', '9');
INSERT INTO `aws_lb_school` VALUES ('9007', '中国计量', '9');
INSERT INTO `aws_lb_school` VALUES ('9008', '浙江科技', '9');
INSERT INTO `aws_lb_school` VALUES ('9009', '浙江农林大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9010', '杭州师范', '9');
INSERT INTO `aws_lb_school` VALUES ('9011', '浙江传媒', '9');
INSERT INTO `aws_lb_school` VALUES ('9012', '浙江财经', '9');
INSERT INTO `aws_lb_school` VALUES ('9013', '中国美术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9014', '树人大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9015', '浙江农业商贸职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9016', '浙江三联专修学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9017', '杭州之江专修学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9018', '上海杉达学院嘉善光彪学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9051', '宁波大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9052', '宁波工程', '9');
INSERT INTO `aws_lb_school` VALUES ('9053', '万里学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9054', '诺丁汉大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9101', '嘉兴学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9151', '浙江海洋', '9');
INSERT INTO `aws_lb_school` VALUES ('9201', '温州大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9202', '温州医学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9251', '湖州师范', '9');
INSERT INTO `aws_lb_school` VALUES ('9301', '台州学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9351', '绍兴文理学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9401', '丽水学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9451', '浙江师大', '9');
INSERT INTO `aws_lb_school` VALUES ('9501', '长征职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9502', '公安海警学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9503', '杭州万向职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9504', '杭州职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9505', '湖州职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9507', '嘉兴职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9508', '金华职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9509', '科技求是学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9510', '丽水职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9511', '宁波城市职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9512', '宁波大红鹰学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9513', '宁波大学科技学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9514', '宁波天一职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9515', '宁波职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9516', '衢州职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9517', '绍兴职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9518', '浙江越秀外国语学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9519', '台州职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9520', '温州职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9521', '义乌工商职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9522', '浙江大学城市学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9523', '浙江大学宁波理工学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9524', '浙江东方职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9525', '浙江纺织服装职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9526', '浙江工贸职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9527', '浙江工商职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9528', '浙江工业职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9529', '浙江警察学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9530', '浙江广厦建设职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9531', '浙江机电职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9532', '浙江建设职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9533', '浙江交通职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9534', '浙江外国语学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9535', '浙江金融职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9536', '浙江经济职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9537', '浙江经贸职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9538', '浙江警官职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9539', '浙江旅游职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9540', '浙江商业职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9541', '浙江水利水电专科学校', '9');
INSERT INTO `aws_lb_school` VALUES ('9542', '浙江医学高等专科学校', '9');
INSERT INTO `aws_lb_school` VALUES ('9543', '浙江医药高等专科学校', '9');
INSERT INTO `aws_lb_school` VALUES ('9544', '浙江艺术职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9545', '浙江育英职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9546', '浙江电力职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9547', '嘉兴南洋职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9548', '浙江国际海运职业技术学校', '9');
INSERT INTO `aws_lb_school` VALUES ('9549', '衢州学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9552', '浙江国际海运职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9553', '温州市工人业余大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9554', '宁波市广播电视大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9555', '浙江嘉兴教育学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9556', '浙江经济管理职工大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9557', '浙江省广播电视大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9558', '金华教育学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9559', '宁波教育学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9561', '杭州成人科技大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9562', '杭州市工人业余大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9563', '浙江省省级机关职工业余大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9564', '浙江同济科技职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9565', '浙江邮电职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9566', '浙江体育职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9567', '台州科技职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9568', '温州科技职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9569', '浙江理工大学成教学院北景园分院', '9');
INSERT INTO `aws_lb_school` VALUES ('9570', '同济大学浙江学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9572', '浙江横店影视职业学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9573', '杭州科技职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9577', '浙江汽车职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9578', '中国美术学院艺术设计职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9579', '金华广播电视大学', '9');
INSERT INTO `aws_lb_school` VALUES ('9580', '杭州老和山职业技术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9581', '杭州师范大学钱江学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9582', '浙江新世纪经贸专修学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9584', '杭州人文专修学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9585', '上海财经大学浙江学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9586', '浙江师范大学行知学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9587', '浙江理工大学科技与艺术学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9589', '浙江工业大学之江学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9591', '杭州江南专修学院', '9');
INSERT INTO `aws_lb_school` VALUES ('9592', '江南专修学院', '9');
INSERT INTO `aws_lb_school` VALUES ('10001', '西安交大', '10');
INSERT INTO `aws_lb_school` VALUES ('10002', '长安大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10003', '西北工大', '10');
INSERT INTO `aws_lb_school` VALUES ('10004', '西北大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10005', '陕西师大', '10');
INSERT INTO `aws_lb_school` VALUES ('10006', '西安电子科大', '10');
INSERT INTO `aws_lb_school` VALUES ('10007', '西安理工', '10');
INSERT INTO `aws_lb_school` VALUES ('10008', '西安科大', '10');
INSERT INTO `aws_lb_school` VALUES ('10009', '西安工大', '10');
INSERT INTO `aws_lb_school` VALUES ('10010', '西外', '10');
INSERT INTO `aws_lb_school` VALUES ('10011', '西邮', '10');
INSERT INTO `aws_lb_school` VALUES ('10012', '西安医学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10013', '西安财经', '10');
INSERT INTO `aws_lb_school` VALUES ('10014', '西北政法', '10');
INSERT INTO `aws_lb_school` VALUES ('10015', '西安体院', '10');
INSERT INTO `aws_lb_school` VALUES ('10016', '西安美院', '10');
INSERT INTO `aws_lb_school` VALUES ('10017', '西安音乐学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10018', '西安文理学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10019', '西京学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10020', '西安翻译学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10021', '培华学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10022', '欧亚学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10023', '西安外事', '10');
INSERT INTO `aws_lb_school` VALUES ('10024', '陕西工商职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10025', '西安石油', '10');
INSERT INTO `aws_lb_school` VALUES ('10026', '西安建筑科大', '10');
INSERT INTO `aws_lb_school` VALUES ('10027', '第四军医大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10028', '西安电子科技大学高等职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10029', '西北工业大学明德学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10030', '陕西师范大学高等职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10031', '长安大学兴华学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10032', '西安数字技术学院 ', '10');
INSERT INTO `aws_lb_school` VALUES ('10033', '陕西工商职业学院 ', '10');
INSERT INTO `aws_lb_school` VALUES ('10051', '延安大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10101', '陕西中医学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10102', '咸阳师范学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10103', '陕西科大', '10');
INSERT INTO `aws_lb_school` VALUES ('10151', '宝鸡文理学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10201', '渭南师范', '10');
INSERT INTO `aws_lb_school` VALUES ('10251', '陕西理工', '10');
INSERT INTO `aws_lb_school` VALUES ('10301', '榆林学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10351', '商洛学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10401', '安康学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10451', '西北农林科大', '10');
INSERT INTO `aws_lb_school` VALUES ('10501', '安康职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10502', '宝鸡职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10503', '汉中职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10504', '陕西财经职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10505', '陕西电子科技职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10506', '陕西电子信息职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10507', '陕西纺织服装职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10508', '陕西服装艺术职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10509', '陕西工业职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10510', '陕西国防工业职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10511', '陕西国际商贸学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10512', '陕西航空职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10513', '陕西交通职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10514', '陕西经济管理职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10515', '陕西警官职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10516', '陕西旅游烹饪职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10517', '陕西能源职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10518', '陕西青年职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10519', '陕西铁路工程职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10520', '陕西邮电职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10521', '陕西职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10522', '商洛职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10523', '铜川职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10524', '渭南职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10525', '西安电力高等专科学校', '10');
INSERT INTO `aws_lb_school` VALUES ('10526', '西安东方亚太职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10527', '西安高新科技职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10529', '西安海棠职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10530', '西安航空技术高等专科学校', '10');
INSERT INTO `aws_lb_school` VALUES ('10531', '西安航空职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10532', '西安科技商贸职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10533', '西安汽车科技职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10534', '西安三资职业学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10535', '西安思源学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10536', '西安铁路职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10537', '西安职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10538', '咸阳职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10540', '延安职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10541', '杨凌职业技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10542', '陕西银行学校', '10');
INSERT INTO `aws_lb_school` VALUES ('10543', '西安机电信息技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10544', '陕西教育学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10546', '陕西省旅游学校', '10');
INSERT INTO `aws_lb_school` VALUES ('10547', '西安铁路工程职工大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10549', '西安华西专修大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10550', '西安航空职工大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10551', '西安建筑科技大学华清学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10552', '西安财经学院行知学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10553', '陕西科技大学镐京学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10554', '西安工业大学北方信息工程学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10555', '延安大学西安创新学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10556', '西安电子科技大学长安学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10559', '西安理工大学高科学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10560', '西安科技大学高新学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10563', '西安交通大学城市学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10564', '西北大学现代学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10565', '西安工程技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10566', '陕西航天职工大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10568', '陕西工运学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10569', '陕西广播电视大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10570', '陕西省建筑职工大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10571', '陕西通信技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10575', '西安航空旅游学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10579', '西安工程机械专修学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10581', '陕西建设技术学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10582', '西安冶金建筑专修学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10583', ' 西安联合职业培训学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10584', '西安外贸职工大学', '10');
INSERT INTO `aws_lb_school` VALUES ('10585', '西安金融财贸学院', '10');
INSERT INTO `aws_lb_school` VALUES ('10586', '西安技师学院', '10');
INSERT INTO `aws_lb_school` VALUES ('11001', '武汉大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11002', '华中科大', '11');
INSERT INTO `aws_lb_school` VALUES ('11003', '华中农大', '11');
INSERT INTO `aws_lb_school` VALUES ('11004', '武汉理工', '11');
INSERT INTO `aws_lb_school` VALUES ('11005', '中国地质大学（武汉）', '11');
INSERT INTO `aws_lb_school` VALUES ('11006', '中南财经政法大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11007', '中南民族大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11008', '华中师大', '11');
INSERT INTO `aws_lb_school` VALUES ('11009', '武汉工业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11010', '武汉纺织大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11011', '湖北中医药大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11012', '湖北经济学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11013', '湖北警官学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11014', '武汉体院', '11');
INSERT INTO `aws_lb_school` VALUES ('11015', '湖北美院', '11');
INSERT INTO `aws_lb_school` VALUES ('11016', '武汉音乐学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11017', '武汉生物工程学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11018', '湖北工业大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11019', '湖北大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11020', '江汉大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11021', '武汉工大', '11');
INSERT INTO `aws_lb_school` VALUES ('11022', '武汉科大', '11');
INSERT INTO `aws_lb_school` VALUES ('11023', '湖北美术学院继续教育学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11024', '华中农业大学楚天学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11025', '湖北科技职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11026', '三峡旅游职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11051', '长江大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11101', '三峡大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11151', '湖北汽院', '11');
INSERT INTO `aws_lb_school` VALUES ('11152', '湖北医药学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11201', '湖北工程学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11251', '湖北师范学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11252', '湖北理工学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11301', '黄冈师院', '11');
INSERT INTO `aws_lb_school` VALUES ('11351', '湖北民族学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11401', '湖北文理学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11451', '湖北科技学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11501', '长江工程职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11502', '长江职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11504', '鄂东职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11505', '鄂州大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11507', '恩施职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11508', '湖北财经高等专科学校', '11');
INSERT INTO `aws_lb_school` VALUES ('11509', '湖北财税职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11510', '湖北城市建设职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11511', '湖北工业大学商贸学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11512', '湖北国土资源职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11513', '湖北黄石机电职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11514', '湖北交通职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11515', '湖北第二师范学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11516', '湖北经济管理干部学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11517', '湖北开放职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11518', '湖北民族学院科技学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11519', '湖北轻工职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11520', '湖北三峡职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11521', '湖北生态工程职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11522', '湖北生物科技职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11523', '湖北省水利水电职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11524', '湖北师范学院文理学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11525', '湖北艺术职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11526', '湖北职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11527', '湖北中医药高等专科学校', '11');
INSERT INTO `aws_lb_school` VALUES ('11528', '黄冈科技职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11529', '黄冈职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11530', '江汉艺术职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11531', '荆楚理工学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11532', '荆州职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11533', '荆州理工职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11534', '沙洋师范高等专科学校', '11');
INSERT INTO `aws_lb_school` VALUES ('11535', '十堰职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11536', '随州职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11537', '武汉船舶职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11538', '武汉电力职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11539', '武汉工程职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11541', '武汉工业职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11542', '武汉航海职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11543', '武汉交通职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11544', '武汉警官职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11545', '武汉科技职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11546', '武汉理工大学华夏学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11547', '武汉民政职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11548', '武汉软件工程职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11549', '武汉商贸学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11550', '武汉商业服务学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11551', '武汉时代职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11552', '武汉铁路职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11553', '武汉外语外事职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11554', '武汉信息传播职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11556', '武汉职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11557', '仙桃职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11558', '咸宁职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11559', '襄樊职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11560', '湖北工程学院新技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11561', '郧阳师范高等专科学校', '11');
INSERT INTO `aws_lb_school` VALUES ('11562', '武汉长江工商学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11563', '黄冈广播电视大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11564', '华中科技大学文华学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11566', '汉口学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11567', '湖北大学知行学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11568', '三峡大学科技学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11570', '湖北工业大学工程技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11571', '武汉工业学院工商学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11572', '武汉工程大学邮电与信息工程学院　', '11');
INSERT INTO `aws_lb_school` VALUES ('11573', '武汉科技学院外经贸学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11574', '江汉大学文理学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11575', '湖北汽车工业学院科技学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11576', '湖北经济学院法商学院　', '11');
INSERT INTO `aws_lb_school` VALUES ('11577', '武汉体育学院体育科技学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11579', '湖北医药学院药护学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11580', '湖北文理学院理工学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11581', '中国地质大学江城学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11582', '长江大学文理学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11583', '长江大学工程技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11584', '华中师范大学武汉传媒学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11585', '武汉东湖学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11587', '中南财经政法武汉学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11588', '华中科技大学武昌分校　', '11');
INSERT INTO `aws_lb_school` VALUES ('11589', '武汉工贸职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11590', '三峡电力职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11591', '湖北青年职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11595', '武汉语言文化职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11596', '黄石职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11597', '海军工程大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11598', '湖北广播电视大学', '11');
INSERT INTO `aws_lb_school` VALUES ('11599', '武汉科技大学城市学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11600', '宜昌市商业学校', '11');
INSERT INTO `aws_lb_school` VALUES ('11603', '湖北澳新教育专修学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11604', '武汉城市建设学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11605', '湖北孝感职业技术学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11606', '葛洲坝水电工程学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11608', '武汉冶金管理干部学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11609', '武汉城市职业学院', '11');
INSERT INTO `aws_lb_school` VALUES ('11610', '武汉大学珞珈学院', '11');
INSERT INTO `aws_lb_school` VALUES ('12001', '华南理工大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12002', '中山大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12003', '暨南大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12004', '华南师范大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12005', '广东工业大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12006', '华南农业大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12007', '广州大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12008', '广东外语外贸大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12009', '广州中医药大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12010', '南方医科大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12011', '南方科技大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12012', '仲恺农业工程学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12013', '广州医学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12014', '广东药学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12015', '广东金融学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12016', '广东商学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12017', '广东警官学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12018', '广州体育学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12019', '广州美术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12020', '星海音乐学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12021', '广东技术师范学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12022', '广东培正学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12023', '广东白云学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12024', '清华大学深圳研究生院', '12');
INSERT INTO `aws_lb_school` VALUES ('12051', '深圳大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12101', '汕头大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12151', '五邑大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12201', '肇庆学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12251', '广东石油化工学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12301', '东莞理工', '12');
INSERT INTO `aws_lb_school` VALUES ('12351', '广东医学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12352', '湛江师范', '12');
INSERT INTO `aws_lb_school` VALUES ('12353', '广东海洋', '12');
INSERT INTO `aws_lb_school` VALUES ('12401', '韶关学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12451', '韩山师范', '12');
INSERT INTO `aws_lb_school` VALUES ('12501', '嘉应学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12551', '惠州学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12601', '佛山科技学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12602', '中山大学南方学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12603', '广东外语外贸大学南国商学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12604', '华南理工大学广州汽车学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12701', '北京理工大学珠海学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12702', '北京师范大学珠海分校', '12');
INSERT INTO `aws_lb_school` VALUES ('12703', '电子科技大学中山学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12704', '东莞理工学院城市学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12705', '广东科技学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12706', '番禺职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12707', '佛山职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12708', '广东财经职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12709', '广东潮汕职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12710', '广东纺织职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12711', '广东工程职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12712', '广东工贸职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12713', '广东工业大学华立学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12714', '广东海洋大学寸金学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12715', '广东海洋大学海滨学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12717', '广东机电职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12719', '广东建华职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12720', '广东建设职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12721', '广东交通职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12722', '广东第二师范学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12723', '广东科学技术职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12724', '广东理工职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12725', '广东岭南职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12726', '广东农工商职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12727', '广东女子职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12728', '广东轻工职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12729', '广东省新闻出版技师学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12730', '广东水利电力职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12731', '广东司法警官职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12732', '广东松山职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12733', '广东体育职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12734', '广东外语外贸大学公开学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12735', '广东外语艺术职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12736', '广东文艺职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12737', '广东新安职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12738', '广东行政职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12739', '广东亚视演艺职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12740', '广东邮电职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12741', '广州城市职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12743', '广州大学华软软件学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12744', '广州大学市政技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12745', '广州大学松田学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12746', '广州工程技术职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12747', '广州工商职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12748', '广州航海高等专科学校', '12');
INSERT INTO `aws_lb_school` VALUES ('12749', '广州华立科技职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12750', '广州华南商贸职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12751', '广州康大职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12752', '广州科技贸易职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12753', '广州科技职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12754', '广州民航职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12755', '广州南洋理工职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12756', '广州涉外经济职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12757', '广州体育职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12758', '广州铁路职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12759', '广州现代信息工程职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12760', '河源职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12761', '华澳国际会计学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12762', '华南农业大学珠江学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12763', '华南师范大学增城学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12764', '惠州经济职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12765', '吉林大学珠海学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12766', '江门职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12767', '揭阳职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12768', '罗定职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12769', '茂名职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12770', '南华工商学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12771', '南海东软信息技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12772', '清远职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12773', '汕头职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12774', '汕尾职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12775', '深圳信息职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12776', '深圳振西科技学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12777', '深圳职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12778', '顺德职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12779', '私立华联学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12780', '阳江职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12781', '湛江技师学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12783', '湛师基础教育学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12784', '肇庆工商职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12785', '肇庆科技职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12786', '肇庆医学高等专科学校', '12');
INSERT INTO `aws_lb_school` VALUES ('12787', '中山火炬职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12788', '珠海城市职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12789', '珠海艺术职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12790', '遵义医学院珠海校区', '12');
INSERT INTO `aws_lb_school` VALUES ('12791', '广东技术师范学院天河分校', '12');
INSERT INTO `aws_lb_school` VALUES ('12792', '广东科学技术职业学院国防工大', '12');
INSERT INTO `aws_lb_school` VALUES ('12793', '茂名广播电视大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12794', '广东石油化工职业技术学校', '12');
INSERT INTO `aws_lb_school` VALUES ('12795', '中山大学新华学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12796', '广东商学院华商学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12797', '南开大学深圳金融工程学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12798', '北京师范大学－香港浸会大学联合国际学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12799', '广州金桥管理干部学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12800', '广州大学纺织服装学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12801', '华南师范大学南海校区', '12');
INSERT INTO `aws_lb_school` VALUES ('12802', '暨南大学深圳旅游学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12803', '暨南大学珠海学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12804', '潮汕职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12805', '广东科贸职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12806', '中山职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12807', '广东省外语艺术职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12809', '广东食品药品职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12810', '广州城建职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12811', '湛江现代科技职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12812', '广州松田职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12813', '广州珠江职业技术学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12814', '广东新华教育学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12815', '广东省广播电视大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12816', '广东社会科学大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12817', '广东青年管理干部学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12818', '深圳市广播电视大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12819', '广州市广播电视大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12820', '韶关市职工大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12821', '汕头市业余大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12822', '广东省国防工业职工大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12823', '南海成人学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12824', '广东省电子商务技师学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12825', '深圳信息学院', '12');
INSERT INTO `aws_lb_school` VALUES ('12827', '江门市广播电视大学', '12');
INSERT INTO `aws_lb_school` VALUES ('12828', '北京大学深圳研究生院', '12');
INSERT INTO `aws_lb_school` VALUES ('12829', '江门艺华旅游职业学院', '12');
INSERT INTO `aws_lb_school` VALUES ('13001', '湖南师大', '13');
INSERT INTO `aws_lb_school` VALUES ('13002', '中南大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13003', '湖南大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13004', '长沙理工', '13');
INSERT INTO `aws_lb_school` VALUES ('13005', '湖南农大', '13');
INSERT INTO `aws_lb_school` VALUES ('13006', '湖南中医药', '13');
INSERT INTO `aws_lb_school` VALUES ('13007', '中南林业科大', '13');
INSERT INTO `aws_lb_school` VALUES ('13008', '长沙学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13009', '长沙医学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13010', '湖南涉外经济', '13');
INSERT INTO `aws_lb_school` VALUES ('13011', '湖南商学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13012', '湖南人文科技', '13');
INSERT INTO `aws_lb_school` VALUES ('13013', '湖南三一工业职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13014', '湖南食品药品职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13051', '湘潭大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13052', '湖南科大', '13');
INSERT INTO `aws_lb_school` VALUES ('13053', '湖南工程学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13101', '南华大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13151', '吉首大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13201', '湖南工大', '13');
INSERT INTO `aws_lb_school` VALUES ('13251', '湖南城市学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13301', '湖南理工学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13351', '湘南学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13401', '衡阳师院', '13');
INSERT INTO `aws_lb_school` VALUES ('13451', '湖南文理', '13');
INSERT INTO `aws_lb_school` VALUES ('13501', '怀化学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13551', '湖南科技学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13601', '邵阳学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13701', '保险职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13702', '长沙电力职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13703', '长沙航空职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13704', '长沙环境保护职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13705', '长沙民政职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13706', '长沙南方职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13707', '长沙商贸旅游职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13710', '长沙师范专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13711', '长沙通信职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13712', '长沙职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13713', '长沙职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13714', '常德职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13715', '郴州职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13716', '衡阳财经工业职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13717', '湖南安全技术职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13718', '湖南财政经济学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13719', '湖南城建职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13720', '湖南大众传媒学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13721', '湖南第一师范学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13722', '湖南对外经济贸易职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13723', '湖南工程职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13724', '湖南工学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13725', '湖南工业职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13726', '湖南工艺美术职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13727', '湖南警察学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13728', '湖南广播电视大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13729', '湖南化工职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13730', '湖南环境生物职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13731', '湖南机电职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13732', '湖南建材高等专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13733', '湖南高速铁路职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13734', '湖南交通职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13735', '湖南经济干部管理学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13736', '湖南九嶷职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13737', '湖南科技经贸职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13738', '湖南科技职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13739', '湖南理工职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13740', '湖南娄底远东职业学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13741', '湖南民族职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13742', '湖南农业大学国际学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13743', '湖南女子学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13744', '湖南软件职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13745', '湖南商务职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13747', '湖南生物机电职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13749', '湖南省水利水电职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13750', '湖南石油化工职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13751', '湖南税务高等专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13752', '湖南司法警官职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13753', '湖南体育职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13754', '湖南铁道职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13755', '湖南铁路科技职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13756', '湖南同德职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13757', '湖南网络工程职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13758', '湖南现代物流职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13759', '湖南信息科学职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13760', '湖南信息职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13761', '湖南行政学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13762', '湖南冶金职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13763', '湖南艺术职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13764', '湖南中医药高等专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13765', '怀化医学高等专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13766', '怀化职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13768', '娄底理工学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13769', '娄底市卫生学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13770', '娄底职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13771', '邵阳医学高等专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13772', '邵阳职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13773', '湘潭职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13774', '湘西民族职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13775', '潇湘职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13776', '益阳职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13777', '永州职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13778', '岳阳职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13779', '张家界航空工业职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13780', '株洲师范高等专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13781', '株洲职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13782', '湘潭大学兴湘学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13783', '湖南工业大学科技学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13784', '湖南科技大学潇湘学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13785', '南华大学船山学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13786', '湖南商学院北津学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13787', '湖南师范大学树达学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13788', '湖南农业大学东方科技学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13789', '中南林业科技大学涉外学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13790', '湖南文理学院芙蓉学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13791', '湖南理工学院南湖学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13792', '衡阳师范学院南岳学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13793', '湖南工程学院应用技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13794', '湖南中医药大学湘杏学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13795', '吉首大学张家界学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13796', '长沙理工大学城南学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13797', '湖南都市职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13798', '湖南电子科技职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13799', '湖南外国语职业学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13805', '湖南生物与机电工程职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13806', '湖南科技工业职业技术学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13807', '衡阳工业职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13808', '湘西民族教师进修学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13809', '湖南有色金属职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13810', '湖南纺织职工大学湖', '13');
INSERT INTO `aws_lb_school` VALUES ('13811', '湖南金融技术职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13812', '益阳教育学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13813', '长沙工业职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13814', '湖南兵器工业职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13815', '长沙教育学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13816', '衡阳有色冶金职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13817', '株洲市职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13819', '湖南工业科技职工大学', '13');
INSERT INTO `aws_lb_school` VALUES ('13820', '南方动力机械公司职工工学院', '13');
INSERT INTO `aws_lb_school` VALUES ('13821', '益阳医学高等专科学校', '13');
INSERT INTO `aws_lb_school` VALUES ('13822', '湖南师范大学法学院', '13');
INSERT INTO `aws_lb_school` VALUES ('14001', '兰州大学', '14');
INSERT INTO `aws_lb_school` VALUES ('14002', '西北民大', '14');
INSERT INTO `aws_lb_school` VALUES ('14003', '西北师范大学', '14');
INSERT INTO `aws_lb_school` VALUES ('14004', '甘肃中医学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14005', '兰州商学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14006', '甘肃政法学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14007', '兰州城市学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14008', '甘肃农大', '14');
INSERT INTO `aws_lb_school` VALUES ('14009', '兰州理工', '14');
INSERT INTO `aws_lb_school` VALUES ('14010', '兰州交大', '14');
INSERT INTO `aws_lb_school` VALUES ('14011', '西北师范大学知行学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14051', '天水师院', '14');
INSERT INTO `aws_lb_school` VALUES ('14101', '陇东学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14151', '河西学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14201', '兰州石化职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14202', '甘肃工业职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14203', '甘肃警察职业学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14204', '兰州理工大学技术工程学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14205', '兰州职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14206', '武威职业学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14207', '张掖医学高等专科学校', '14');
INSERT INTO `aws_lb_school` VALUES ('14208', '甘肃畜牧工程职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14209', '陇南师范高等专科学校', '14');
INSERT INTO `aws_lb_school` VALUES ('14210', '合作民族师范高等专科学校', '14');
INSERT INTO `aws_lb_school` VALUES ('14211', '甘肃联合大学', '14');
INSERT INTO `aws_lb_school` VALUES ('14212', '甘肃林业职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14213', '甘肃建筑职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14214', '酒泉职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14216', '甘肃农业职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14217', '平凉医学高等专科学校', '14');
INSERT INTO `aws_lb_school` VALUES ('14218', '兰州资源环境职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14219', '定西师范高等专科学校', '14');
INSERT INTO `aws_lb_school` VALUES ('14220', '兰州交通大学博文学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14221', '兰州工业高等专科学校', '14');
INSERT INTO `aws_lb_school` VALUES ('14222', '兰州外语职业学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14223', '兰州教育学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14224', '甘肃钢铁职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14225', '甘肃交通职业技术学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14226', '兰州商学院长青学院', '14');
INSERT INTO `aws_lb_school` VALUES ('14227', '兰州商学院陇桥学院', '14');
INSERT INTO `aws_lb_school` VALUES ('15001', '四川大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15002', '四川农大', '15');
INSERT INTO `aws_lb_school` VALUES ('15003', '电子科技大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15004', '西南交大', '15');
INSERT INTO `aws_lb_school` VALUES ('15005', '成都理工', '15');
INSERT INTO `aws_lb_school` VALUES ('15006', '四川师大', '15');
INSERT INTO `aws_lb_school` VALUES ('15007', '西南民族大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15008', '成都大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15009', '西南财经', '15');
INSERT INTO `aws_lb_school` VALUES ('15010', '西华大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15011', '成都中医药', '15');
INSERT INTO `aws_lb_school` VALUES ('15012', '成都信息工程大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15013', '成都医学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15014', '四川文理学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15015', '成都体院', '15');
INSERT INTO `aws_lb_school` VALUES ('15016', '四川音乐学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15017', '西南石油', '15');
INSERT INTO `aws_lb_school` VALUES ('15018', '西南交通大学希望学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15019', '四川长江职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15020', '四川传媒学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15051', '中国民航飞行学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15101', '四川理工', '15');
INSERT INTO `aws_lb_school` VALUES ('15151', '泸州医学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15152', '四川警察学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15201', '川北医学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15202', '西华师大', '15');
INSERT INTO `aws_lb_school` VALUES ('15251', '内江师范', '15');
INSERT INTO `aws_lb_school` VALUES ('15301', '乐山师院', '15');
INSERT INTO `aws_lb_school` VALUES ('15351', '绵阳师范', '15');
INSERT INTO `aws_lb_school` VALUES ('15352', '西南科大', '15');
INSERT INTO `aws_lb_school` VALUES ('15401', '西昌学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15451', '宜宾学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15501', '攀枝花学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15601', '阿坝师范高等专科学校', '15');
INSERT INTO `aws_lb_school` VALUES ('15602', '成都电子机械高等专科学校', '15');
INSERT INTO `aws_lb_school` VALUES ('15603', '成都东软学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15604', '成都纺织高等专科学校', '15');
INSERT INTO `aws_lb_school` VALUES ('15605', '成都广播电视大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15606', '成都航空职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15607', '成都理工大学广播影视学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15608', '成都农业科技职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15610', '成都艺术职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15611', '成都职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15612', '达州职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15613', '电子科技大学成都学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15614', '广安职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15616', '乐山职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15617', '泸州职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15618', '眉山职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15619', '绵阳职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15620', '民办四川天一学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15621', '内江职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15622', '南充职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15623', '四川大学龙泉校区', '15');
INSERT INTO `aws_lb_school` VALUES ('15624', '四川电力职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15625', '四川工程职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15626', '四川工商职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15627', '四川管理职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15628', '四川广播电视大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15629', '四川国际标榜职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15630', '四川航天职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15631', '四川华新现代职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15632', '四川化工职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15633', '四川机电职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15634', '四川建筑职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15635', '四川交通职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15636', '四川教育学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15637', '四川警安职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15638', '四川烹饪高等专科学校', '15');
INSERT INTO `aws_lb_school` VALUES ('15639', '四川商务职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15640', '四川师范大学绵阳初等教育学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15641', '四川水利职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15642', '四川司法警官职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15643', '四川托普信息技术职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15644', '四川外语学院成都学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15645', '四川文化传媒职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15646', '四川信息工程学校', '15');
INSERT INTO `aws_lb_school` VALUES ('15647', '四川邮电职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15648', '四川职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15649', '四川中医药高等专科学校', '15');
INSERT INTO `aws_lb_school` VALUES ('15650', '雅安职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15651', '宜宾职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15652', '四川大学锦城学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15653', '四川大学锦江学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15654', '德阳职业技术学校', '15');
INSERT INTO `aws_lb_school` VALUES ('15655', '四川信息职业技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15656', '四川艺术职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15657', '四川师范大学成都学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15658', '四川师范大学文理学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15659', '成都信息工程学院银杏酒店管理学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15660', '成都理工大学工程技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15661', '四川文化产业职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15662', '四川科技职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15664', '西南科技大学城市学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15665', '四川音乐学院绵阳艺术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15667', '西南财经大学天府学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15677', '四川中医药高等专科学', '15');
INSERT INTO `aws_lb_school` VALUES ('15681', '中国科学院成都分院职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15682', '成都市职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15683', '南充市职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15684', '四川省广播电视大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15685', '四川经济管理干部学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15686', '四川农业管理干部学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15687', '广元职工医学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15688', '四川省职工运动技术学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15689', '四川省东方动力职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15690', '成都电力职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15691', '成都市广播电视大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15692', '中国工程物理研究院职工工学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15693', '成都发动机公司职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15694', '四川核工业职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15695', '四川科技职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15696', '四川省化工职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15697', '成都电子职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15698', '国营涪江机器厂职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15699', '成都冶金职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15700', '第五冶金建设公司职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15701', '成都工业职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15702', '成都飞机工业公司职工工学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15704', '四川财经职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15706', '四川城市职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15707', '中国五冶职工大学', '15');
INSERT INTO `aws_lb_school` VALUES ('15708', '四川师范大学经济职业学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15711', '四川省卫生管理干部学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15714', '四川民族学院', '15');
INSERT INTO `aws_lb_school` VALUES ('15715', '四川师范大学电影电视学院', '15');
INSERT INTO `aws_lb_school` VALUES ('16001', '山东大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16002', '中国海洋大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16003', '济南大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16004', '山东建筑大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16005', '山东师大', '16');
INSERT INTO `aws_lb_school` VALUES ('16006', '山东财经大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16007', '山东中医药', '16');
INSERT INTO `aws_lb_school` VALUES ('16008', '山东轻工', '16');
INSERT INTO `aws_lb_school` VALUES ('16009', '山东交通学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16010', '山东警院', '16');
INSERT INTO `aws_lb_school` VALUES ('16011', '山东体院', '16');
INSERT INTO `aws_lb_school` VALUES ('16012', '山东艺术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16013', '山东工美', '16');
INSERT INTO `aws_lb_school` VALUES ('16014', '山东海事职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16015', '曲阜师大', '16');
INSERT INTO `aws_lb_school` VALUES ('16016', '北京电影学院现代创意媒体学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16051', '烟台大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16052', '鲁东大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16053', '山东工商', '16');
INSERT INTO `aws_lb_school` VALUES ('16054', '烟台南山学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16101', '青岛大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16102', '山东科大', '16');
INSERT INTO `aws_lb_school` VALUES ('16103', '青岛科大', '16');
INSERT INTO `aws_lb_school` VALUES ('16104', '青岛理工', '16');
INSERT INTO `aws_lb_school` VALUES ('16105', '青岛农业大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16106', '滨海学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16151', '中国石油大学（华东）', '16');
INSERT INTO `aws_lb_school` VALUES ('16201', '聊城大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16251', '山东理工', '16');
INSERT INTO `aws_lb_school` VALUES ('16301', '潍坊医学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16302', '潍坊学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16351', '泰山医学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16352', '山东财政', '16');
INSERT INTO `aws_lb_school` VALUES ('16353', '泰山学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16354', '山东农大', '16');
INSERT INTO `aws_lb_school` VALUES ('16401', '滨州医学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16402', '滨州学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16451', '济宁医学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16501', '临沂大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16551', '德州学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16601', '枣庄学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16651', '菏泽学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16701', '滨州职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16702', '德州教育学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16703', '德州科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16704', '东营职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16705', '哈工大(威海)', '16');
INSERT INTO `aws_lb_school` VALUES ('16706', '菏泽医学专科学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16707', '济南工程职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16708', '山东职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16709', '济南职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16710', '济宁学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16711', '济宁职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16712', '莱芜职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16713', '聊城职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16714', '青岛飞洋职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16715', '青岛港湾职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16716', '青岛恒星职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16717', '青岛黄海职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16719', '青岛求实职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16720', '青岛远洋船员学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16721', '青岛职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16722', '曲阜远东职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16723', '日照职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16724', '山东大王职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16725', '山东大学威海分校', '16');
INSERT INTO `aws_lb_school` VALUES ('16726', '山东电力高等专科学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16727', '山东电子职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16729', '山东服装职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16730', '山东工业职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16731', '山东华宇职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16732', '山东化工职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16733', '山东交通职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16734', '山东经贸职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16736', '山东凯文科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16737', '山东科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16738', '山东劳动职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16739', '山东力明科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16740', '山东旅游职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16741', '山东铝业职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16742', '山东商业职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16743', '山东胜利职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16744', '山东省青岛酒店管理学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16745', '山东水利职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16746', '山东省潍坊艺术学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16747', '山东圣翰财贸职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16748', '山东水利职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16749', '山东水利专科学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16750', '山东丝绸纺织职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16751', '山东外国语职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16752', '山东外贸职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16753', '山东外事翻译学院威海分校', '16');
INSERT INTO `aws_lb_school` VALUES ('16754', '山东外事翻译职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16755', '山东万杰医学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16756', '山东威海财经专修学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16757', '山东威海外国语进修学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16758', '山东现代职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16759', '山东协和职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16760', '山东信息职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16761', '山东行政学院(山东经济管理干部学院)', '16');
INSERT INTO `aws_lb_school` VALUES ('16762', '山东杏林科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16763', '山东畜牧兽医职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16764', '山东药品食品职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16765', '山东医学高等专科学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16766', '山东英才学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16767', '山东政法学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16768', '山东中医药高等专科学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16769', '泰山职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16770', '万杰科技学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16771', '威海市广播电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16772', '威海市交通学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16773', '威海职业(技术)学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16774', '威海中加国际工商学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16775', '潍坊工商职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16776', '潍坊工程职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16777', '潍坊科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16778', '潍坊职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16779', '文登师范', '16');
INSERT INTO `aws_lb_school` VALUES ('16780', '烟台职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16781', '枣庄科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16782', '中国石油大学(华东)东营校区', '16');
INSERT INTO `aws_lb_school` VALUES ('16783', '淄博广播电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16784', '淄博恒星外国语学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16785', '淄博科技职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16786', '淄博师专', '16');
INSERT INTO `aws_lb_school` VALUES ('16787', '淄博职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16788', '齐鲁师范学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16789', '山东技师学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16790', '日照广播电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16792', '山东城市建设职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16793', '烟台工程职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16794', '山东商务职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16795', '烟台汽车工程职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16796', '山东省农业管理干部学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16797', '山东青年政治学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16798', '山东省工会管理干部学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16800', '山东广播电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16812', '德州职业技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16820', '中国石油大学胜利学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16821', '烟台大学文经学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16822', '青岛理工大学琴岛学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16823', '山东科技大学泰山科技学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16824', '青岛工学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16825', '山东财经大学燕山学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16826', '青岛农业大学海都学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16827', '曲阜师范大学杏坛学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16828', '山东财政学院东方学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16829', '山东师范大学历山学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16830', '聊城大学东昌学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16831', '济南大学泉城学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16832', '中国农业大学（烟台校区）', '16');
INSERT INTO `aws_lb_school` VALUES ('16833', '日照师范学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16834', '山东艺术设计学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16835', '滨州技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16837', '山东冶金技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16838', '山东省济宁市技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16839', '济南广播电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16840', '山东省聊城教育学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16842', '山东财政职工大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16843', '青岛市广播电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16844', '青岛理工大学费县校区', '16');
INSERT INTO `aws_lb_school` VALUES ('16845', '山东兵器工业职工大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16846', '新汶矿务局职工大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16848', '山东工贸职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16849', '山东新华学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16850', '山东省医学科学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16851', '山东化工技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16852', '山东海天软件工程学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16853', '青岛军政人文大学信息工程管理学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16854', '哈理工荣成学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16855', '山东省第二技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16856', '临沂职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16857', '青岛北港学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16858', '山东司法警官职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16860', '山东文化职业产业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16861', '菏泽家政职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16866', '山东理工职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16867', '威海工业技术学校(原二职)', '16');
INSERT INTO `aws_lb_school` VALUES ('16868', '山东传媒学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16869', '营口电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16870', '山东传媒职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16871', '山东省益都卫生学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16873', '山东烟台建文学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16874', '山东省潍坊卫生学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16875', '寿光科技学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16878', '山东省广播电视大学', '16');
INSERT INTO `aws_lb_school` VALUES ('16881', '烟台城乡建设学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16882', '青岛市电子信息技术学校', '16');
INSERT INTO `aws_lb_school` VALUES ('16884', '青岛滨海学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16885', '山东医药技师学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16887', '济南协和职业学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16889', '山东黄金技术学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16890', '山东交通学院海运学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16892', '山东工业技师学院', '16');
INSERT INTO `aws_lb_school` VALUES ('16893', '山东女子学院', '16');
INSERT INTO `aws_lb_school` VALUES ('17001', '厦门大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17002', '集美大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17003', '厦门理工学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17004', '泉州轻工职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17005', '泉州师范学院软件学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17051', '福州大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17052', '福建师范大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17053', '福建农林大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17054', '福建医科大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17055', '福建工程学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17056', '福建中医药大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17057', '闽江学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17101', '华侨大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17102', '仰恩大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17103', '泉州师范学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17151', '漳州师范', '17');
INSERT INTO `aws_lb_school` VALUES ('17201', '莆田学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17251', '三明学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17301', '龙岩学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17303', '厦门大学嘉庚学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17304', '集美大学诚毅学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17305', '福州大学阳光学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17306', '福州大学至诚学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17307', '福建师范大学协和学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17308', '福建师范大学闽南科技学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17309', '福建农林大学东方学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17310', '福建农林大学金山学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17401', '福建电力职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17402', '福建对外经济贸易职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17403', '福建警察学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17404', '福建广播电视大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17405', '福建华南女子职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17406', '福建船政交通职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17407', '福建教育学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17409', '福建警官职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17410', '福建林业职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17411', '福建农业职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17412', '福建商业高等专科学校', '17');
INSERT INTO `aws_lb_school` VALUES ('17413', '福建生物工程职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17414', '福建水利电力职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17415', '福建卫生职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17416', '福建信息职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17418', '福建中医学院五洲科技学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17419', '福州海峡职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17420', '福州科技职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17421', '福州黎明职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17422', '福州软件职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17424', '福州英华职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17425', '福州职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17426', '黎明职业大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17427', '湄洲湾职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17428', '闽北职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17429', '闽西职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17430', '武夷学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17432', '泉州纺织服装职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17433', '闽南理工学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17434', '泉州华光摄影艺术职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17435', '泉州经贸职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17436', '泉州信息职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17437', '泉州医学高等专科学校', '17');
INSERT INTO `aws_lb_school` VALUES ('17438', '泉州理工学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17439', '三明职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17440', '厦门海洋职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17441', '厦门华天涉外职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17442', '厦门华厦职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17443', '厦门南洋学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17444', '厦门兴才职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17445', '厦门演艺职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17446', '漳州职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17447', '福建政法管理干部学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17449', '厦门城市职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17550', '漳州卫生职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17551', '江夏学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17552', '福州教育学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17553', '厦门市广播电视大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17554', '福建财会管理干部学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17555', '福建经济管理干部学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17556', '福建省漳州业余大学', '17');
INSERT INTO `aws_lb_school` VALUES ('17557', '龙岩技师学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17558', '德化陶瓷职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17559', '厦门东海学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17560', '泉州儿童发展职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17561', '厦门科技学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17562', '福建儿童发展职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17563', '厦门软件职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17565', '福建艺术职业学校', '17');
INSERT INTO `aws_lb_school` VALUES ('17566', '漳州城市职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17567', '漳州天福茶职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17568', '福州外语外贸学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17569', '福建省艺术职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17570', '厦门医学高等专科学校', '17');
INSERT INTO `aws_lb_school` VALUES ('17571', '厦门安防科技学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17573', '漳州吉马职业印刷技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17574', '福建体育职业技术学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17575', '厦门安防科技职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17576', '厦门技师学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17577', '华侨大学厦门工学院', '17');
INSERT INTO `aws_lb_school` VALUES ('17578', '武夷山职业学院', '17');
INSERT INTO `aws_lb_school` VALUES ('18001', '郑州大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18002', '河南工业', '18');
INSERT INTO `aws_lb_school` VALUES ('18003', '河南农大', '18');
INSERT INTO `aws_lb_school` VALUES ('18004', '华北水利水电', '18');
INSERT INTO `aws_lb_school` VALUES ('18005', '郑州轻工', '18');
INSERT INTO `aws_lb_school` VALUES ('18006', '郑州航空工业', '18');
INSERT INTO `aws_lb_school` VALUES ('18007', '黄河科技', '18');
INSERT INTO `aws_lb_school` VALUES ('18008', '中原工学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18009', '河南中医学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18010', '河南财经政法', '18');
INSERT INTO `aws_lb_school` VALUES ('18011', '郑州城市职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18012', '新乡学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18013', '开封文化艺术职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18051', '河南大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18101', '河南科技大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18102', '洛阳师院', '18');
INSERT INTO `aws_lb_school` VALUES ('18151', '安阳工学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18152', '安阳师院', '18');
INSERT INTO `aws_lb_school` VALUES ('18201', '南阳理工', '18');
INSERT INTO `aws_lb_school` VALUES ('18202', '南阳师院', '18');
INSERT INTO `aws_lb_school` VALUES ('18251', '河南城建学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18252', '平顶山学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18301', '新乡医学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18302', '河南科技学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18303', '河南师大', '18');
INSERT INTO `aws_lb_school` VALUES ('18351', '信阳师院', '18');
INSERT INTO `aws_lb_school` VALUES ('18401', '商丘师院', '18');
INSERT INTO `aws_lb_school` VALUES ('18451', '周口师院', '18');
INSERT INTO `aws_lb_school` VALUES ('18501', '黄淮学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18551', '许昌学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18601', '河南理工', '18');
INSERT INTO `aws_lb_school` VALUES ('18701', '河南财政税务高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18702', '河南工程学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18703', '河南工业贸易职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18704', '河南工业职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18705', '河南警察学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18706', '河南广播影视学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18707', '河南机电高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18708', '河南检察职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18709', '河南交通职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18710', '河南教育学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18711', '河南经贸职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18712', '河南农业职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18713', '河南商业高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18714', '河南省工商行政管理广播电视大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18716', '河南司法警官职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18717', '河南新华电脑学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18718', '河南职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18719', '河南质量工程职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18720', '鹤壁职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18721', '黄河水利职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18722', '济源职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18723', '焦作大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18724', '焦作师范高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18725', '开封大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18726', '开封市电子科技专修学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18727', '洛阳大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18728', '洛阳理工学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18729', '漯河医学高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18730', '漯河职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18731', '南阳医学高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18732', '平顶山教育学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18733', '平顶山工业职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18735', '濮阳职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18736', '三门峡职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18737', '商丘科技职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18738', '商丘医学高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18739', '商丘职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18740', '嵩山少林武术职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18741', '铁道警官高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18744', '信阳农业高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18745', '信阳职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18746', '许昌职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18747', '永城职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18748', '郑州大学西亚斯国际学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18749', '郑州电力高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18750', '郑州电子信息职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18751', '郑州工业安全职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18752', '郑州华信学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18753', '郑州交通学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18754', '郑州经贸职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18755', '郑州科技职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18756', '郑州旅游职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18757', '郑州牧业工程高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18758', '郑州师范学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18759', '郑州澍青医学高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18760', '郑州铁路职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18761', '郑州信息科技职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18762', '郑州职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18763', '中州大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18764', '周口职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18765', '郑州升达经贸管理学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18767', '洛阳工业高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18768', '河南职工医学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18769', '河南科技学院新科学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18770', '河南理工大学万方科技学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18771', '中原工学院信息商务学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18772', '安阳师范学院人文管理学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18773', '商丘学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18774', '河南财经学院成功学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18775', '开封教育学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18777', '河南卫生职工学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18778', '河南建筑职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18779', '河南大学民生学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18780', '河南师范大学新联学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18781', '新乡医学院三全学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18782', '信阳师范学院华锐学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18793', '郑州电力职业技术学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18798', '周口科技职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18979', '河南省广播电视大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18980', '中国人民解放军外国语学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18981', '清华IT河南校区', '18');
INSERT INTO `aws_lb_school` VALUES ('18983', '第一拖拉机制造厂拖拉机学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18984', '郑州煤炭管理干部学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18985', '河南工业大学化学工业职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18991', '河南省轻工业职工大学', '18');
INSERT INTO `aws_lb_school` VALUES ('18994', '郑州交通职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18995', '郑州牧业高等专科学校', '18');
INSERT INTO `aws_lb_school` VALUES ('18996', '郑州布瑞达理工职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('18997', '河南医科大学教育中心', '18');
INSERT INTO `aws_lb_school` VALUES ('18999', '郑州轻工业轻工职业学院', '18');
INSERT INTO `aws_lb_school` VALUES ('19001', '重庆大学', '19');
INSERT INTO `aws_lb_school` VALUES ('19002', '西南大学', '19');
INSERT INTO `aws_lb_school` VALUES ('19003', '重庆师大', '19');
INSERT INTO `aws_lb_school` VALUES ('19004', '西南政法', '19');
INSERT INTO `aws_lb_school` VALUES ('19005', '重庆交大', '19');
INSERT INTO `aws_lb_school` VALUES ('19006', '重庆邮电大学', '19');
INSERT INTO `aws_lb_school` VALUES ('19007', '重庆医大', '19');
INSERT INTO `aws_lb_school` VALUES ('19008', '重庆工商', '19');
INSERT INTO `aws_lb_school` VALUES ('19009', '重庆科技学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19010', '重庆理工大学', '19');
INSERT INTO `aws_lb_school` VALUES ('19011', '长江师范学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19012', '四川外国语', '19');
INSERT INTO `aws_lb_school` VALUES ('19013', '四川美院', '19');
INSERT INTO `aws_lb_school` VALUES ('19014', '重庆三峡学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19015', '重庆文理', '19');
INSERT INTO `aws_lb_school` VALUES ('19016', '重庆化工职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19017', '后勤工程学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19018', '重庆能源职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19019', '重庆商务职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19020', '重庆旅游职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19021', '重庆五一高级技师学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19022', '重庆通信学院 ', '19');
INSERT INTO `aws_lb_school` VALUES ('19023', '重庆轻工职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19024', '重庆经贸职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19025', '重庆公共运输职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19102', '重庆房地产职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19103', '重庆城市职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19104', '重庆电力高等专科学校', '19');
INSERT INTO `aws_lb_school` VALUES ('19105', '重庆电子工程职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19106', '重庆航天职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19107', '重庆工程职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19108', '重庆工商职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19109', '重庆工业职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19110', '重庆传媒职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19111', '重庆海联职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19112', '重庆机电职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19113', '重庆警官职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19114', '重庆民生职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19115', '重庆三峡医药高等专科学校', '19');
INSERT INTO `aws_lb_school` VALUES ('19116', '重庆三峡职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19118', '重庆水利电力职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19119', '重庆信息技术职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19120', '重庆医药高等专科学校', '19');
INSERT INTO `aws_lb_school` VALUES ('19121', '重庆正大软件职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19122', '重庆职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19123', '重庆教育学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19124', '重庆应用外国语专修学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19126', '重庆大学城市科技学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19128', '西南大学育才学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19130', '四川外语学院重庆南方翻译学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19132', '重庆师范大学涉外商贸学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19134', '重庆工商大学融智学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19136', '重庆工商大学派斯学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19138', '重庆邮电大学移通学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19140', '重庆工贸职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19142', '重庆青年职业技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19144', '重庆城市管理职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19145', '重庆财经职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19146', '重庆科创职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19147', '重庆建筑工程职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19148', '重庆五一技师学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19150', '重庆通信学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19151', '西南大学应用技术学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19152', '重庆交通职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('19153', '重庆电讯职业学院', '19');
INSERT INTO `aws_lb_school` VALUES ('20001', '昆明理工', '20');
INSERT INTO `aws_lb_school` VALUES ('20002', '云南农大', '20');
INSERT INTO `aws_lb_school` VALUES ('20003', '云南师大', '20');
INSERT INTO `aws_lb_school` VALUES ('20004', '云南财经', '20');
INSERT INTO `aws_lb_school` VALUES ('20005', '云南民大', '20');
INSERT INTO `aws_lb_school` VALUES ('20006', '西南林业大学', '20');
INSERT INTO `aws_lb_school` VALUES ('20007', '昆明医学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20008', '云南中医学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20009', '红河学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20010', '云南警官学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20011', '云南艺术', '20');
INSERT INTO `aws_lb_school` VALUES ('20012', '云南大学', '20');
INSERT INTO `aws_lb_school` VALUES ('20013', '云南工商学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20014', '云南财贸外事职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20015', '云南经贸外事职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20016', '大理医学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20017', '云南民族大学文化学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20051', '曲靖师范', '20');
INSERT INTO `aws_lb_school` VALUES ('20101', '玉溪师院', '20');
INSERT INTO `aws_lb_school` VALUES ('20151', '楚雄师院', '20');
INSERT INTO `aws_lb_school` VALUES ('20201', '大理学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20301', '保山学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20302', '保山中医药高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20303', '楚雄医药高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20304', '德宏师范高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20305', '云南大学滇池学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20306', '昆明大学', '20');
INSERT INTO `aws_lb_school` VALUES ('20307', '昆明工业职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20308', '昆明师范高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20309', '云南工程职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20310', '昆明冶金高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20311', '昆明艺术职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20312', '丽江师范高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20313', '曲靖医学高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20314', '思茅师范高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20315', '文山学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20316', '西双版纳职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20317', '玉溪农业职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20318', '云南爱因森软件职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20319', '云南北美职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20321', '云南国防工业职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20322', '云南国土资源职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20323', '云南机电职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20324', '云南交通职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20326', '云南经济管理职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20327', '云南科技信息职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20328', '云南林业职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20329', '云南能源职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20330', '云南农业职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20331', '云南热带作物职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20332', '云南省林业科学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20333', '云南师范大学商学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20334', '云南司法警官职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20335', '云南体育运动职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20336', '云南文化艺术职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20337', '云南新兴职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20338', '云南医学高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20339', '云南昭通师范专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20342', '昆明理工大学津桥学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20343', '云南师范大学文理学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20344', '昆明医学院海源学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20345', '云南艺术学院文华学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20346', '云南大学旅游文化学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20347', '临沧师范高等专科学校', '20');
INSERT INTO `aws_lb_school` VALUES ('20348', '云南锡业职业技术学院', '20');
INSERT INTO `aws_lb_school` VALUES ('20349', '云南科技信息职业学院', '20');
INSERT INTO `aws_lb_school` VALUES ('21001', '河北大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21002', '河北农大', '21');
INSERT INTO `aws_lb_school` VALUES ('21003', '中央司法警官学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21004', '石家庄铁道大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21005', '石家庄经院', '21');
INSERT INTO `aws_lb_school` VALUES ('21006', '河北京安学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21007', '泊头职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21008', '河北财经学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21009', '石家庄幼儿师范高等专科学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21051', '河北师大', '21');
INSERT INTO `aws_lb_school` VALUES ('21052', '河北科技', '21');
INSERT INTO `aws_lb_school` VALUES ('21053', '河北医科', '21');
INSERT INTO `aws_lb_school` VALUES ('21054', '河北经贸', '21');
INSERT INTO `aws_lb_school` VALUES ('21055', '河北体院', '21');
INSERT INTO `aws_lb_school` VALUES ('21056', '石家庄学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21101', '燕山大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21102', '河北科师', '21');
INSERT INTO `aws_lb_school` VALUES ('21151', '河北联合大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21152', '华北煤炭医学', '21');
INSERT INTO `aws_lb_school` VALUES ('21153', '唐山学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21159', '唐山师范', '21');
INSERT INTO `aws_lb_school` VALUES ('21202', '北华航天工业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21203', '廊坊师范', '21');
INSERT INTO `aws_lb_school` VALUES ('21251', '防灾科技学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21252', '华北科技', '21');
INSERT INTO `aws_lb_school` VALUES ('21301', '河北建工', '21');
INSERT INTO `aws_lb_school` VALUES ('21302', '北方学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21351', '承德医学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21401', '邢台学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21451', '河北工程', '21');
INSERT INTO `aws_lb_school` VALUES ('21452', '邯郸学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21501', '衡水学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21601', '保定电力职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21602', '保定科技职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21603', '河北金融学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21604', '保定学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21605', '保定职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21606', '渤海石油职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21607', '沧州师范专科学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21608', '沧州医学高等专科学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21609', '沧州职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21610', '河北旅游职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21611', '河北民族师范学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21612', '承德石油高等专科学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21615', '东北大学秦皇岛校区', '21');
INSERT INTO `aws_lb_school` VALUES ('21616', '邯郸职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21617', '河北大学医学部', '21');
INSERT INTO `aws_lb_school` VALUES ('21618', '河北工程技术高等专科学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21619', '河北工业职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21620', '河北公安警察职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21621', '河北化工医药职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21622', '河北机电职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21623', '河北建材职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21624', '河北交通职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21625', '河北京都高尔夫职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21626', '河北农业大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21627', '河北农业大学海洋学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21628', '河北女子职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21629', '河北软件职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21630', '河北省艺术职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21631', '河北石油职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21632', '河北司法警官职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21633', '河北通信职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21634', '河北远东职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21635', '河北政法管理干部学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21636', '河北职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21637', '衡水职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21638', '华北电力大学（保定）', '21');
INSERT INTO `aws_lb_school` VALUES ('21639', '监督管理局', '21');
INSERT INTO `aws_lb_school` VALUES ('21642', '廊坊大学城北大方正软件学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21643', '廊坊东方大学城北京澳际联邦英语学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21644', '廊坊东方大学城北京财经学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21645', '廊坊东方大学城北京城市学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21646', '廊坊东方大学城北京传媒学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21647', '廊坊东方大学城北京经济技术职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21648', '廊坊东方大学城北京经贸职业学院航空服务学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21649', '廊坊东方大学城北京联合大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21651', '廊坊东方大学城河北体育学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21652', '廊坊东方大学城廊坊职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21653', '秦皇岛教育学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21654', '河北外国语职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21655', '秦皇岛职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21656', '河北美术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21657', '石家庄法商职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21658', '石家庄工商职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21659', '石家庄计算机职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21660', '石家庄科技信息职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21661', '石家庄理工职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21662', '石家庄铁路职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21663', '石家庄外国语职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21664', '石家庄外经贸职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21665', '石家庄外语翻译职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21666', '石家庄信息工程职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21667', '石家庄医学高等专科学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21668', '河北传媒学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21669', '石家庄邮电职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21670', '石家庄职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21671', '唐山工业职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21672', '唐山广播电视大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21673', '唐山科技职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21674', '唐山职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21675', '邢台医学高等专科学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21676', '邢台职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21677', '张家口职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21678', '中国地质大学长城学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21679', '中国环境管理干部学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21680', '中国民航管理干部学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21681', '张家口教育学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21682', '河北能源职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21683', '承德卫生学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21684', '邯郸中原外国语职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21685', '河北师范大学汇华学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21686', '河北联合大学冀唐学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21687', '河北医科大学临床学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21688', '河北农业大学现代科技学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21689', '石家庄铁道学院四方学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21690', '燕山大学里仁学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21691', '河北工程大学科信学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21692', '河北联合大学轻工学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21693', '河北大学工商学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21694', '河北经贸大学经济管理学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21695', '廊坊职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21696', '石家庄外事职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21697', '河北政法职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21698', '冀中职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21699', '石家庄科技工程职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21701', '河北劳动关系职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21704', '河北行政学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21705', '华北煤炭医学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21706', '赣州东方学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21707', '北京中医药大学东方学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21708', '承德燕北职业技术专修学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21709', '河北工业大学廊坊分院', '21');
INSERT INTO `aws_lb_school` VALUES ('21712', '石家庄铁路工程技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21713', '石家庄经济学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21714', '石家庄经济学院华信学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21716', '中国轻工业干部管理学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21717', '河北宣化通信士官学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21718', '承德民族职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21719', '河北省保定市财贸学校', '21');
INSERT INTO `aws_lb_school` VALUES ('21720', '宣化科技职业学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21721', '河北青年管理干部学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21722', '北京交通大学海滨学院', '21');
INSERT INTO `aws_lb_school` VALUES ('21723', '石家庄职工大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21725', '河北地质职工大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21726', '河北广播电视大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21727', '保定广播电视大学', '21');
INSERT INTO `aws_lb_school` VALUES ('21728', '河北广播电视大学高等职业技术学院', '21');
INSERT INTO `aws_lb_school` VALUES ('22001', '江西财经', '22');
INSERT INTO `aws_lb_school` VALUES ('22002', '南昌大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22003', '华东交通大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22004', '南昌航空大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22005', '南昌工程', '22');
INSERT INTO `aws_lb_school` VALUES ('22006', '南昌理工', '22');
INSERT INTO `aws_lb_school` VALUES ('22007', '江西中医学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22008', '江西科技师范大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22009', '蓝天学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22010', '江西农大', '22');
INSERT INTO `aws_lb_school` VALUES ('22011', '江西师大', '22');
INSERT INTO `aws_lb_school` VALUES ('22012', '江西太阳能科技学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22051', '东华理工大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22101', '景德镇陶瓷学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22151', '赣南医学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22152', '赣南师范学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22153', '江西理工', '22');
INSERT INTO `aws_lb_school` VALUES ('22201', '上饶师范学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22251', '井冈山大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22301', '宜春学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22351', '九江学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22401', '抚州职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22402', '赣南教育学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22403', '赣西科技职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22404', '江西财经职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22405', '江西城市职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22406', '江西大宇学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22407', '江西电力职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22408', '江西服装学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22409', '南昌工学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22410', '江西工程职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22411', '江西工业工程职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22412', '江西工业贸易职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22413', '江西工业职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22414', '江西警察学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22415', '江西航空职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22416', '江西护理职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22417', '江西环境工程职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22418', '江西机电职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22419', '江西建设职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22420', '江西交通职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22421', '江西教育学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22422', '江西经济管理干部学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22423', '江西经济管理职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22424', '江西科技职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22425', '江西旅游商贸职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22426', '江西南昌教育学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22427', '江西农业工程职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22428', '江西青年职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22429', '江西轻工职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22430', '江西生物科技职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22431', '江西省广播电视大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22432', '江西司法警官职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22433', '江西陶瓷工艺美术职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22434', '江西外语外贸职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22435', '江西先锋软件职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22436', '江西现代职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22437', '江西信息应用职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22438', '江西行政管理干部学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22439', '江西艺术职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22440', '江西应用技术职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22441', '江西渝州科技职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22442', '江西制造职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22443', '江西中医药高等专科学校', '22');
INSERT INTO `aws_lb_school` VALUES ('22444', '景德镇高等专科学校', '22');
INSERT INTO `aws_lb_school` VALUES ('22445', '九江职业大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22446', '九江职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22447', '南昌钢铁职工大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22448', '南昌师范高等专科学校', '22');
INSERT INTO `aws_lb_school` VALUES ('22449', '南昌市业余大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22450', '南昌市职工科技大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22451', '萍乡高等专科学校', '22');
INSERT INTO `aws_lb_school` VALUES ('22452', '上饶职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22453', '新余钢铁有限责任公司职工大学', '22');
INSERT INTO `aws_lb_school` VALUES ('22454', '新余学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22455', '宜春职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22456', '鹰潭职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22457', '江西应用工程职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22458', '江西农业大学南昌商学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22459', '江西师范大学科学技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22460', '华东交通大学理工学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22461', '江西理工大学应用科学学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22462', '东华理工大学长江学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22463', '南昌航空大学科技学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22464', '江西中医学院科技学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22465', '江西财经大学现代经济管理学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22466', '赣南师范学院科技学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22467', '景德镇陶瓷学院科技艺术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22468', '江西科技师范学院理工学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22469', '南昌大学共青学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22470', '南昌大学科学技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22471', '江西泰豪动漫职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22472', '江西枫林涉外经贸职业学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22473', '江西中山职业技术学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22475', '江西艺术设计学院', '22');
INSERT INTO `aws_lb_school` VALUES ('22477', '江西师大鹰潭学院', '22');
INSERT INTO `aws_lb_school` VALUES ('23001', '山西大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23002', '太原理工', '23');
INSERT INTO `aws_lb_school` VALUES ('23003', '中北大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23004', '山西医大', '23');
INSERT INTO `aws_lb_school` VALUES ('23005', '山西中医学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23006', '太原师范', '23');
INSERT INTO `aws_lb_school` VALUES ('23007', '太原科大', '23');
INSERT INTO `aws_lb_school` VALUES ('23008', '山西财经', '23');
INSERT INTO `aws_lb_school` VALUES ('23009', '运城职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23010', '阳泉师范高等专科学校', '23');
INSERT INTO `aws_lb_school` VALUES ('23051', '山西师大', '23');
INSERT INTO `aws_lb_school` VALUES ('23101', '山西农大', '23');
INSERT INTO `aws_lb_school` VALUES ('23151', '大同大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23201', '长治医学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23202', '长治学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23251', '运城学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23301', '晋中学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23351', '忻州师范', '23');
INSERT INTO `aws_lb_school` VALUES ('23401', '北岳职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23402', '长治职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23403', '晋城职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23404', '晋中职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23405', '临汾职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23406', '潞安职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23407', '吕梁学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23408', '山西财贸职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23409', '山西财政税务专科学校', '23');
INSERT INTO `aws_lb_school` VALUES ('23410', '山西电力职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23411', '山西工程职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23412', '山西工商学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23413', '山西管理职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23414', '山西国际商务职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23415', '山西华澳商贸职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23416', '山西机电职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23417', '山西建筑职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23418', '山西交通职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23419', '山西金融职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23420', '山西警官高等专科学校', '23');
INSERT INTO `aws_lb_school` VALUES ('23421', '山西警官职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23422', '山西林业职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23423', '山西旅游职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23424', '山西煤炭职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23425', '山西生物应用职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23426', '山西水利职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23427', '山西体育职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23428', '山西同文外语职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23429', '山西戏剧职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23430', '山西信息职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23431', '山西兴华职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23432', '山西艺术职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23433', '山西运城农业职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23435', '山西职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23436', '太原城市职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23437', '太原大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23438', '太原电力高等专科学校', '23');
INSERT INTO `aws_lb_school` VALUES ('23439', '太原旅游职业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23440', '忻州职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23441', '阳泉职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23443', '山西城市职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23444', '运城农业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23445', '山西广播电视大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23446', '晋中学院师范学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23448', '朔州职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23449', '山西农业大学平遥机电学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23450', '山西农业大学信息学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23451', '山西农业大学太原畜牧兽医学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23452', '山西农业大学太原园艺学院（太原农业学校）', '23');
INSERT INTO `aws_lb_school` VALUES ('23453', '山西农业大学原平农学院（原平农业学校）', '23');
INSERT INTO `aws_lb_school` VALUES ('23454', '太原科技大学运城工学院（运城工学院）', '23');
INSERT INTO `aws_lb_school` VALUES ('23455', '山西财经大学运城学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23456', '山西医科大学汾阳分院', '23');
INSERT INTO `aws_lb_school` VALUES ('23457', '山西医科大学晋祠学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23458', '太原科技大学华科学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23459', '山西财经大学华商学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23460', '中北大学信息商务学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23461', '山西师范大学现代文理学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23462', '忻州师范学院五寨分院（五寨师范学院）', '23');
INSERT INTO `aws_lb_school` VALUES ('23463', '山西大学商务学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23500', '太原工业学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23501', '山西经济管理干部学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23502', '山西青年职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23503', '山西省职工工艺美术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23504', '山西省吕梁市教育学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23506', '长治市教育学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23507', '山西煤炭管理干部学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23508', '山西政法管理干部学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23509', '阳泉市教育学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23510', '山西煤炭职工联合大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23512', '太原钢铁(集团)有限公司职工钢铁学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23513', '山西机电职工学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23514', '太原化学工业集团有限公司职工大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23515', '山西兵器工业职工大学', '23');
INSERT INTO `aws_lb_school` VALUES ('23516', '广播电影电视管理干部学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23517', '山西职工医学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23518', '山西省临汾电力技师学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23519', '太原大学外语师范学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23521', '运城幼儿师范高等专科学校', '23');
INSERT INTO `aws_lb_school` VALUES ('23522', '中国辐射防护研究院', '23');
INSERT INTO `aws_lb_school` VALUES ('23524', '山西师大临汾学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23525', '山西财经大学经济技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23526', '山西老区职业技术学院', '23');
INSERT INTO `aws_lb_school` VALUES ('23527', '中国日用化学工业研究院', '23');
INSERT INTO `aws_lb_school` VALUES ('24001', '贵州大学', '24');
INSERT INTO `aws_lb_school` VALUES ('24002', '贵阳医学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24003', '贵阳中医学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24004', '贵州财经', '24');
INSERT INTO `aws_lb_school` VALUES ('24005', '贵州民族', '24');
INSERT INTO `aws_lb_school` VALUES ('24006', '贵阳学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24007', '贵州师大', '24');
INSERT INTO `aws_lb_school` VALUES ('24008', '铜仁学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24009', '贵州职业技术学院 ', '24');
INSERT INTO `aws_lb_school` VALUES ('24010', '贵州省职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24051', '遵义医学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24052', '遵义师范', '24');
INSERT INTO `aws_lb_school` VALUES ('24101', '毕节学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24151', '黔南师院', '24');
INSERT INTO `aws_lb_school` VALUES ('24201', '安顺学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24251', '凯里学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24301', '安顺职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24302', '贵州电力职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24303', '贵州电子信息职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24304', '贵州航天职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24306', '贵州交通职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24307', '贵州警官职业学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24308', '贵州工业职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24310', '贵州轻工职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24311', '贵州商业高等专科学校', '24');
INSERT INTO `aws_lb_school` VALUES ('24312', '六盘水师范高等专科学校', '24');
INSERT INTO `aws_lb_school` VALUES ('24313', '六盘水职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24314', '黔东南民族职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24315', '黔南民族医学高等专科学校', '24');
INSERT INTO `aws_lb_school` VALUES ('24316', '黔南民族职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24318', '黔西南民族职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24319', '铜仁职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24320', '遵义医药高等专科学校', '24');
INSERT INTO `aws_lb_school` VALUES ('24321', '遵义职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24322', '贵州财经学院商务学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24323', '贵州民族学院人文科技学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24324', '贵州师范大学求是学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24325', '贵阳医学院神奇民族医药学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24326', '遵义医学院医学与科技学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24327', '贵阳中医学院时珍学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24328', '贵州大学明德学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24329', '贵州大学科技学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24330', '贵阳护理职业学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24331', '贵州亚泰职业学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24333', '贵州师范学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24334', '贵阳职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24335', '毕节职业技术学院', '24');
INSERT INTO `aws_lb_school` VALUES ('24336', '贵州广播电视大学', '24');
INSERT INTO `aws_lb_school` VALUES ('24337', '贵州省财经学院商务学院', '24');
INSERT INTO `aws_lb_school` VALUES ('25001', '广西大学', '25');
INSERT INTO `aws_lb_school` VALUES ('25002', '广西医科大学', '25');
INSERT INTO `aws_lb_school` VALUES ('25003', '广西民族大学', '25');
INSERT INTO `aws_lb_school` VALUES ('25004', '广西中医学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25005', '广西师范学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25006', '广西财经学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25007', '广西艺术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25008', '广西外国语学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25051', '桂林电子科技大学', '25');
INSERT INTO `aws_lb_school` VALUES ('25052', '广西师范大学', '25');
INSERT INTO `aws_lb_school` VALUES ('25053', '桂林理工大学', '25');
INSERT INTO `aws_lb_school` VALUES ('25054', '桂林医学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25101', '广西工学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25151', '右江民族医学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25152', '百色学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25201', '河池学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25251', '玉林师范学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25301', '钦州学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25351', '贺州学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25401', '梧州学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25404', '广西大学行健文理学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25405', '广西师范大学漓江学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25406', '桂林电子科技大学信息科技学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25407', '桂林工学院博文管理学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25408', '广西工学院鹿山学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25409', '广西师范学院师园学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25410', '广西民族大学相思湖学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25411', '广西中医学院赛恩斯新医药学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25501', '北海宏源足球职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25502', '北海艺术设计职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25503', '北海职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25504', '广西城市职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25505', '广西电力职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25506', '广西东方外语职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25507', '广西工商职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25508', '广西工业职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25509', '广西国际商务职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25510', '广西机电职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25511', '广西建设职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25512', '广西交通职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25513', '广西经济管理干部学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25514', '广西经贸职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25515', '广西警管高等专科学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25516', '广西农业职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25517', '广西轻工高级技工学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25518', '广西生态工程职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25519', '广西水利电力职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25520', '广西体育高等专科学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25521', '广西演艺职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25522', '广西英华国际职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25523', '广西邕江大学', '25');
INSERT INTO `aws_lb_school` VALUES ('25524', '广西幼儿师范学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25525', '广西职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25526', '贵港职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25527', '桂林航天工业高等专科学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25528', '桂林旅游高等专科学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25529', '桂林山水职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25530', '桂林师范高等专科学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25531', '河池职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25532', '柳州师范高等专科学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25533', '柳州医学高等专科学校', '25');
INSERT INTO `aws_lb_school` VALUES ('25534', '柳州铁道职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25535', '柳州职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25536', '广西民族师范学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25537', '南宁职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25538', '南宁地区教育学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25539', '北京航空航天大学北海学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25540', '桂林工学院南宁分院', '25');
INSERT INTO `aws_lb_school` VALUES ('25541', '百色职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25542', '广西教育学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25543', '梧州职业学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25544', '广西卫生管理干部学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25547', '广西政法管理干部学院', '25');
INSERT INTO `aws_lb_school` VALUES ('25548', '柳州城市职业技术学院', '25');
INSERT INTO `aws_lb_school` VALUES ('26001', '内蒙古大学', '26');
INSERT INTO `aws_lb_school` VALUES ('26002', '内蒙古工业大学', '26');
INSERT INTO `aws_lb_school` VALUES ('26003', '内蒙古农大', '26');
INSERT INTO `aws_lb_school` VALUES ('26004', '内蒙古师大', '26');
INSERT INTO `aws_lb_school` VALUES ('26005', '内蒙古医学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26006', '内蒙古财经', '26');
INSERT INTO `aws_lb_school` VALUES ('26007', '中央党校函授学院内蒙古分院', '26');
INSERT INTO `aws_lb_school` VALUES ('26008', '中共内蒙古自治区委员会党校', '26');
INSERT INTO `aws_lb_school` VALUES ('26009', '内蒙古自治区行政学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26051', '内蒙古科大', '26');
INSERT INTO `aws_lb_school` VALUES ('26101', '内蒙古民族大学', '26');
INSERT INTO `aws_lb_school` VALUES ('26151', '赤峰学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26201', '呼伦贝尔学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26301', '包头钢铁职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26302', '包头轻工职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26303', '包头职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26304', '河套大学', '26');
INSERT INTO `aws_lb_school` VALUES ('26305', '呼和浩特职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26307', '科尔沁艺术职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26308', '内蒙古财税职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26309', '内蒙古电子信息职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26310', '内蒙古青城大学', '26');
INSERT INTO `aws_lb_school` VALUES ('26311', '内蒙古化工职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26312', '内蒙古机电职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26313', '内蒙古建筑职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26314', '内蒙古交通职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26315', '呼和浩特民族学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26316', '内蒙古商贸职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26317', '内蒙古体育职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26318', '通辽职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26319', '乌海职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26320', '乌兰察布职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26321', '锡林郭勒职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26322', '兴安职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26323', '内蒙古警察职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26325', '内蒙古北方职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26326', '内蒙古丰州学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26327', '内蒙古经贸外语职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26328', '内蒙古科技职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26329', '赤峰职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26330', '包头铁道职业技术学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26331', '内蒙古广播电视大学直属学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26332', '集宁师范学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26333', '内蒙古财经学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26334', '包头师范学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26335', '内蒙古科技大学包头师范学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26336', '内蒙古医药专修学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26337', '鄂尔多斯职业学院', '26');
INSERT INTO `aws_lb_school` VALUES ('26338', '乌兰察布医学高等专科学校', '26');
INSERT INTO `aws_lb_school` VALUES ('27001', '宁夏大学', '27');
INSERT INTO `aws_lb_school` VALUES ('27002', '北方民大', '27');
INSERT INTO `aws_lb_school` VALUES ('27003', '宁夏医科大学', '27');
INSERT INTO `aws_lb_school` VALUES ('27051', '宁夏理工', '27');
INSERT INTO `aws_lb_school` VALUES ('27201', '吴忠职业技术学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27202', '宁夏职业技术学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27203', '宁夏财经职业技术学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27204', '宁夏司法警官职业学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27205', '宁夏师范学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27206', '宁夏工业职业学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27207', '宁夏工商职业技术学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27208', '宁夏建设职业技术学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27209', '银川科技职业学院（银川大学）', '27');
INSERT INTO `aws_lb_school` VALUES ('27210', '宁夏大学新华学院', '27');
INSERT INTO `aws_lb_school` VALUES ('27211', '中国矿业大学银川学院', '27');
INSERT INTO `aws_lb_school` VALUES ('28001', '青海大学', '28');
INSERT INTO `aws_lb_school` VALUES ('28002', '青海师大', '28');
INSERT INTO `aws_lb_school` VALUES ('28003', '青海民大', '28');
INSERT INTO `aws_lb_school` VALUES ('28101', '青海民族师范高等专科学校', '28');
INSERT INTO `aws_lb_school` VALUES ('28102', '青海财经职业学院', '28');
INSERT INTO `aws_lb_school` VALUES ('28103', '青海畜牧兽医职业技术学院', '28');
INSERT INTO `aws_lb_school` VALUES ('28104', '青海建筑职业技术学院', '28');
INSERT INTO `aws_lb_school` VALUES ('28105', '青海师范高等专科学校', '28');
INSERT INTO `aws_lb_school` VALUES ('28106', '青海警官职业学院', '28');
INSERT INTO `aws_lb_school` VALUES ('28107', '青海交通职业技术学院', '28');
INSERT INTO `aws_lb_school` VALUES ('28108', '青海卫生职业技术学院', '28');
INSERT INTO `aws_lb_school` VALUES ('29001', '新疆大学', '29');
INSERT INTO `aws_lb_school` VALUES ('29002', '新疆农大', '29');
INSERT INTO `aws_lb_school` VALUES ('29003', '新疆医科大', '29');
INSERT INTO `aws_lb_school` VALUES ('29004', '新疆师大', '29');
INSERT INTO `aws_lb_school` VALUES ('29005', '新疆财经', '29');
INSERT INTO `aws_lb_school` VALUES ('29006', '新疆艺术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29007', '伊犁师范奎屯校区', '29');
INSERT INTO `aws_lb_school` VALUES ('29051', '石河子大学', '29');
INSERT INTO `aws_lb_school` VALUES ('29101', '塔里木大学', '29');
INSERT INTO `aws_lb_school` VALUES ('29151', '喀什师院', '29');
INSERT INTO `aws_lb_school` VALUES ('29201', '伊犁师院', '29');
INSERT INTO `aws_lb_school` VALUES ('29251', '昌吉学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29301', '阿克苏职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29302', '巴音郭楞职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29303', '昌吉职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29304', '和田师范专科学校', '29');
INSERT INTO `aws_lb_school` VALUES ('29305', '克拉玛依职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29306', '乌鲁木齐职业大学', '29');
INSERT INTO `aws_lb_school` VALUES ('29307', '新疆兵团警官高等专科学校', '29');
INSERT INTO `aws_lb_school` VALUES ('29308', '新疆工业高等专科学校', '29');
INSERT INTO `aws_lb_school` VALUES ('29309', '新疆机电职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29310', '新疆建设职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29311', '新疆交通职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29312', '新疆警官高等专科学校', '29');
INSERT INTO `aws_lb_school` VALUES ('29313', '新疆能源职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29314', '新疆农业职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29315', '新疆轻工职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29316', '新疆石河子职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29317', '新疆天山职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29318', '新疆维吾尔医学专科学校', '29');
INSERT INTO `aws_lb_school` VALUES ('29319', '新疆现代职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29320', '伊犁职业技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29321', '新疆科信学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29322', '新疆职业大学', '29');
INSERT INTO `aws_lb_school` VALUES ('29323', '新疆石油学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29324', '新疆大学科学技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29325', '新疆农业大学科学技术学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29326', '新疆财经大学商务学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29327', '新疆医科大学厚博学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29328', '石河子大学科技学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29329', '新疆教育学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29331', '新疆政法学院', '29');
INSERT INTO `aws_lb_school` VALUES ('29332', '新疆广播电视大学', '29');
INSERT INTO `aws_lb_school` VALUES ('30001', '海南大学', '30');
INSERT INTO `aws_lb_school` VALUES ('30002', '海南医学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30005', '海南师范大学', '30');
INSERT INTO `aws_lb_school` VALUES ('30051', '华南热带农大', '30');
INSERT INTO `aws_lb_school` VALUES ('30101', '琼州大学', '30');
INSERT INTO `aws_lb_school` VALUES ('30201', '海口经济学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30202', '海南经贸职业技术学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30203', '海南软件职业技术学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30204', '海南外国语职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30205', '海南工商职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30206', '海南政法职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30207', '海南职业技术学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30208', '琼台师范高等专科学校', '30');
INSERT INTO `aws_lb_school` VALUES ('30209', '三亚航空旅游职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30210', '三亚卓达旅游职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30211', '海南大学三亚学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30212', '三亚城市职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30213', '海南科技职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('30214', '三亚理工职业学院', '30');
INSERT INTO `aws_lb_school` VALUES ('31001', '西藏大学', '31');
INSERT INTO `aws_lb_school` VALUES ('31002', '西藏藏医学院', '31');
INSERT INTO `aws_lb_school` VALUES ('31003', '西藏民院', '31');
INSERT INTO `aws_lb_school` VALUES ('31101', '拉萨师范高等专科学校', '31');
INSERT INTO `aws_lb_school` VALUES ('31102', '西藏警官高等专科学校', '31');
INSERT INTO `aws_lb_school` VALUES ('31103', '西藏职业技术学院', '31');
INSERT INTO `aws_lb_school` VALUES ('31104', '西藏民族学院', '31');
INSERT INTO `aws_lb_school` VALUES ('32001', '香港大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32002', '香港中文大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32003', '香港科技大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32004', '香港理工大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32005', '香港城市大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32006', '香港浸会大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32007', '香港岭南大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32008', '香港国际工商管理学院', '32');
INSERT INTO `aws_lb_school` VALUES ('32009', '香港珠海学院', '32');
INSERT INTO `aws_lb_school` VALUES ('32010', '香港教育学院', '32');
INSERT INTO `aws_lb_school` VALUES ('32011', '香港树仁大学', '32');
INSERT INTO `aws_lb_school` VALUES ('32012', '香港演艺学院', '32');
INSERT INTO `aws_lb_school` VALUES ('32013', 'The Open University of HongKong', '32');
INSERT INTO `aws_lb_school` VALUES ('33001', '澳门大学', '33');
INSERT INTO `aws_lb_school` VALUES ('33002', '澳门理工学院', '33');
INSERT INTO `aws_lb_school` VALUES ('33003', '澳门科技大学', '33');
INSERT INTO `aws_lb_school` VALUES ('33004', '澳门旅游学院', '33');
INSERT INTO `aws_lb_school` VALUES ('33005', '澳门镜湖护理学院', '33');
INSERT INTO `aws_lb_school` VALUES ('33006', '澳门城市大学', '33');
INSERT INTO `aws_lb_school` VALUES ('33007', '天主教辅仁大学', '33');
INSERT INTO `aws_lb_school` VALUES ('33008', '长庚大学', '33');
INSERT INTO `aws_lb_school` VALUES ('33009', '私立义守大学', '33');
INSERT INTO `aws_lb_school` VALUES ('33010', '东海大学', '33');
INSERT INTO `aws_lb_school` VALUES ('34001', '国立台湾大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34002', '国立中正大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34003', '国立台湾艺术大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34004', '国立清华大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34005', '国立中山大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34006', '国立政治大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34007', '国立成功大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34008', '国立中央大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34009', '国立阳明大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34010', '国立东华大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34011', '国立中兴大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34012', '国立台湾师范大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34013', '国立台湾海洋大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34014', '国立高雄大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34015', '国立嘉义大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34016', '国立台湾科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34017', '国立空中大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34018', '国立台北大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34019', '国立高雄师范大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34020', '国立联合大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34021', '国立暨南国际大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34022', '国立屏东科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34023', '国立彰化师范大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34024', '国立台北科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34025', '国立台东大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34026', '国立宜蓝大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34027', '国立台北艺术大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34028', '国立云林科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34029', '国立台南大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34030', '国立虎尾科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34031', '国立花莲教育大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34032', '国立高雄第一科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34033', '国立屏东教育大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34034', '国立新竹教育大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34035', '国立澎湖科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34036', '建国科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34037', '国立台南艺术大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34038', '国立高雄应用科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34039', '国立高雄海洋科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34040', '国立勤益科技大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34041', '东吴大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34042', '国立交通大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34043', '逢甲大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34044', '高雄醫學大學', '34');
INSERT INTO `aws_lb_school` VALUES ('34045', '淡江大學', '34');
INSERT INTO `aws_lb_school` VALUES ('34046', '辅仁大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34047', '台湾静宜大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34048', '中国文化大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34049', '育達科技大學', '34');
INSERT INTO `aws_lb_school` VALUES ('34050', '世新大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34051', '铭传大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34052', '国立台北教育大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34053', '台湾亚洲大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34054', '中原大学', '34');
INSERT INTO `aws_lb_school` VALUES ('34055', '铭传大学 ', '34');

-- ----------------------------
-- Table structure for `aws_mail_queue`
-- ----------------------------
DROP TABLE IF EXISTS `aws_mail_queue`;
CREATE TABLE `aws_mail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `error_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_error` (`is_error`),
  KEY `send_to` (`send_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_mail_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_majors`
-- ----------------------------
DROP TABLE IF EXISTS `aws_majors`;
CREATE TABLE `aws_majors` (
  `id` int(11) NOT NULL DEFAULT '0',
  `school_name` varchar(255) DEFAULT NULL,
  `major_name` varchar(255) DEFAULT NULL,
  `major_url` varchar(255) DEFAULT NULL,
  `public_study_url` varchar(255) DEFAULT NULL COMMENT '该专业公共的资源信息下载',
  `countryPaiming` varchar(255) DEFAULT NULL COMMENT '专业排名',
  `year_score` varchar(255) DEFAULT NULL COMMENT '考研分数线',
  `companies` varchar(255) DEFAULT NULL COMMENT '该专业 毕业的主要就业公司',
  `temperature` varchar(255) DEFAULT NULL COMMENT '该专业热度排行',
  `focus_count` varchar(19) DEFAULT NULL,
  `discuss_count` varchar(12) DEFAULT NULL,
  `desc` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_majors
-- ----------------------------
INSERT INTO `aws_majors` VALUES ('0', '西安交通大学', '通信与系统', 'http://www.google.com', 'http://www.google.com', '1', '360', '华为中兴', '2', '19', '1', '通信与信息系统是国家重点专业');
INSERT INTO `aws_majors` VALUES ('1', '西安电子科技大学', '信号与信息处理', 'http://baidu.com', 'http://baidu.com', '1', '380', '华为/中兴', '1', '111', '2', '信号与信息处理是国家重点专业');

-- ----------------------------
-- Table structure for `aws_nav_menu`
-- ----------------------------
DROP TABLE IF EXISTS `aws_nav_menu`;
CREATE TABLE `aws_nav_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `type_id` int(11) DEFAULT '0',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`link`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_nav_menu
-- ----------------------------
INSERT INTO `aws_nav_menu` VALUES ('1', '默认分类', '默认分类描述', 'category', '1', null, null, '0');

-- ----------------------------
-- Table structure for `aws_notification`
-- ----------------------------
DROP TABLE IF EXISTS `aws_notification`;
CREATE TABLE `aws_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者ID',
  `recipient_uid` int(11) DEFAULT '0' COMMENT '接收者ID',
  `action_type` int(4) DEFAULT NULL COMMENT '操作类型',
  `model_type` smallint(11) NOT NULL DEFAULT '0',
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT '问题或比赛ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `read_flag` tinyint(1) DEFAULT '0' COMMENT '阅读状态',
  PRIMARY KEY (`notification_id`),
  KEY `recipient_read_flag` (`recipient_uid`,`read_flag`),
  KEY `sender_uid` (`sender_uid`),
  KEY `model_type` (`model_type`),
  KEY `source_id` (`source_id`),
  KEY `action_type` (`action_type`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统通知';

-- ----------------------------
-- Records of aws_notification
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_notification_data`
-- ----------------------------
DROP TABLE IF EXISTS `aws_notification_data`;
CREATE TABLE `aws_notification_data` (
  `notification_id` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`notification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统通知数据表';

-- ----------------------------
-- Records of aws_notification_data
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_pages`
-- ----------------------------
DROP TABLE IF EXISTS `aws_pages`;
CREATE TABLE `aws_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url_token` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contents` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_token` (`url_token`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_pages
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_posts_index`
-- ----------------------------
DROP TABLE IF EXISTS `aws_posts_index`;
CREATE TABLE `aws_posts_index` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) NOT NULL,
  `post_type` varchar(16) NOT NULL DEFAULT '',
  `add_time` int(10) NOT NULL,
  `update_time` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `view_count` int(10) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  `popular_value` int(10) DEFAULT '0',
  `uid` int(10) NOT NULL,
  `lock` tinyint(1) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `answer_count` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `post_type` (`post_type`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `uid` (`uid`),
  KEY `lock` (`lock`),
  KEY `agree_count` (`agree_count`),
  KEY `answer_count` (`answer_count`),
  KEY `view_count` (`view_count`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_posts_index
-- ----------------------------
INSERT INTO `aws_posts_index` VALUES ('1', '1', 'question', '1394719448', '1394719448', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('2', '2', 'question', '1394719468', '1394719468', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('3', '1', 'article', '1403937027', '1403937027', '1', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `aws_posts_index` VALUES ('4', '3', 'question', '1403943287', '1403943295', '1', '0', '1', '0', '0', '1', '0', '0', '1');
INSERT INTO `aws_posts_index` VALUES ('5', '3', 'article', '1403943375', '1403943375', '1', '0', '0', '0', '0', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `aws_question`
-- ----------------------------
DROP TABLE IF EXISTS `aws_question`;
CREATE TABLE `aws_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) NOT NULL DEFAULT '' COMMENT '问题内容',
  `question_detail` text COMMENT '问题说明',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  `published_uid` int(11) DEFAULT NULL COMMENT '发布用户UID',
  `answer_count` int(11) DEFAULT '0' COMMENT '回答计数',
  `answer_users` int(11) DEFAULT '0' COMMENT '回答人数',
  `view_count` int(11) DEFAULT '0' COMMENT '浏览次数',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注数',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论数',
  `action_history_id` int(11) DEFAULT '0' COMMENT '动作的记录表的关连id',
  `category_id` int(11) DEFAULT '0' COMMENT '分类 ID',
  `agree_count` int(11) DEFAULT '0' COMMENT '回复赞同数总和',
  `against_count` int(11) DEFAULT '0' COMMENT '回复反对数总和',
  `best_answer` int(11) DEFAULT '0' COMMENT '最佳回复 ID',
  `has_attach` tinyint(1) DEFAULT '0' COMMENT '是否存在附件',
  `unverified_modify` text,
  `ip` bigint(11) DEFAULT NULL,
  `last_answer` int(11) DEFAULT '0' COMMENT '最后回答 ID',
  `popular_value` double DEFAULT '0',
  `popular_value_update` int(10) DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0' COMMENT '是否锁定',
  `anonymous` tinyint(1) DEFAULT '0',
  `thanks_count` int(10) DEFAULT '0',
  `question_content_fulltext` text,
  `is_recommend` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`),
  KEY `published_uid` (`published_uid`),
  KEY `answer_count` (`answer_count`),
  KEY `agree_count` (`agree_count`),
  KEY `question_content` (`question_content`),
  KEY `lock` (`lock`),
  KEY `thanks_count` (`thanks_count`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `best_answer` (`best_answer`),
  KEY `popular_value_update` (`popular_value_update`),
  KEY `against_count` (`against_count`),
  KEY `is_recommend` (`is_recommend`),
  FULLTEXT KEY `question_content_fulltext` (`question_content_fulltext`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='问题列表';

-- ----------------------------
-- Records of aws_question
-- ----------------------------
INSERT INTO `aws_question` VALUES ('1', 'question1', 'question1', '1394719448', '1394719448', '1', '0', '0', '2', '1', '0', '0', '1', '0', '0', '0', '0', null, '2130706433', '0', '1', '1399083148', '0', '0', '0', 'question1', '0');
INSERT INTO `aws_question` VALUES ('2', 'question2', 'question2', '1394719468', '1394719468', '1', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', null, '2130706433', '0', '0', '1394719469', '0', '0', '0', 'question2', '0');
INSERT INTO `aws_question` VALUES ('3', 'saasfaf', 'asfaf', '1403943287', '1403943295', '1', '1', '1', '2', '1', '0', '0', '1', '0', '0', '0', '0', null, '2130706433', '1', '1', '1404733590', '0', '0', '0', 'saasfaf', '0');

-- ----------------------------
-- Table structure for `aws_question_comments`
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_comments`;
CREATE TABLE `aws_question_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_question_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_question_focus`
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_focus`;
CREATE TABLE `aws_question_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `question_id` (`question_id`),
  KEY `question_uid` (`question_id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='问题关注表';

-- ----------------------------
-- Records of aws_question_focus
-- ----------------------------
INSERT INTO `aws_question_focus` VALUES ('1', '1', '1', '1394719449');
INSERT INTO `aws_question_focus` VALUES ('2', '2', '1', '1394719468');
INSERT INTO `aws_question_focus` VALUES ('3', '3', '1', '1403943287');

-- ----------------------------
-- Table structure for `aws_question_invite`
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_invite`;
CREATE TABLE `aws_question_invite` (
  `question_invite_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) NOT NULL COMMENT '问题ID',
  `sender_uid` int(11) NOT NULL,
  `recipients_uid` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '受邀Email',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `available_time` int(10) DEFAULT '0' COMMENT '生效时间',
  PRIMARY KEY (`question_invite_id`),
  KEY `question_id` (`question_id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipients_uid` (`recipients_uid`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请问答';

-- ----------------------------
-- Records of aws_question_invite
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_question_thanks`
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_thanks`;
CREATE TABLE `aws_question_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `question_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_question_thanks
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_question_uninterested`
-- ----------------------------
DROP TABLE IF EXISTS `aws_question_uninterested`;
CREATE TABLE `aws_question_uninterested` (
  `interested_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`interested_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题不感兴趣表';

-- ----------------------------
-- Records of aws_question_uninterested
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_redirect`
-- ----------------------------
DROP TABLE IF EXISTS `aws_redirect`;
CREATE TABLE `aws_redirect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT '0',
  `target_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_redirect
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_related_links`
-- ----------------------------
DROP TABLE IF EXISTS `aws_related_links`;
CREATE TABLE `aws_related_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `link` varchar(255) NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_type` (`item_type`),
  KEY `item_id` (`item_id`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_related_links
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_related_topic`
-- ----------------------------
DROP TABLE IF EXISTS `aws_related_topic`;
CREATE TABLE `aws_related_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT '0' COMMENT '话题 ID',
  `related_id` int(11) DEFAULT '0' COMMENT '相关话题 ID',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `related_id` (`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_related_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_report`
-- ----------------------------
DROP TABLE IF EXISTS `aws_report`;
CREATE TABLE `aws_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '举报用户id',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `target_id` int(11) DEFAULT '0' COMMENT 'ID',
  `reason` varchar(255) DEFAULT NULL COMMENT '举报理由',
  `url` varchar(255) DEFAULT NULL,
  `add_time` int(11) DEFAULT '0' COMMENT '举报时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理',
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_report
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_reputation_category`
-- ----------------------------
DROP TABLE IF EXISTS `aws_reputation_category`;
CREATE TABLE `aws_reputation_category` (
  `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `category_id` smallint(4) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  `reputation` int(10) DEFAULT '0',
  `thanks_count` int(10) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `question_count` int(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  UNIQUE KEY `uid_category_id` (`uid`,`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_reputation_category
-- ----------------------------
INSERT INTO `aws_reputation_category` VALUES ('1', '1', '1', '1405165676', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `aws_reputation_topic`
-- ----------------------------
DROP TABLE IF EXISTS `aws_reputation_topic`;
CREATE TABLE `aws_reputation_topic` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题ID',
  `topic_count` int(10) DEFAULT '0' COMMENT '威望问题话题计数',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞成',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢',
  `reputation` int(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  KEY `topic_count` (`topic_count`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `reputation` (`reputation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_reputation_topic
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_school`
-- ----------------------------
DROP TABLE IF EXISTS `aws_school`;
CREATE TABLE `aws_school` (
  `school_id` int(11) NOT NULL COMMENT '自增ID',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类型ID',
  `school_code` int(11) DEFAULT NULL COMMENT '学校编码',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名称',
  `area_code` int(11) DEFAULT NULL COMMENT '地区代码',
  PRIMARY KEY (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学校';

-- ----------------------------
-- Records of aws_school
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `aws_sessions`;
CREATE TABLE `aws_sessions` (
  `id` varchar(32) NOT NULL,
  `modified` int(10) NOT NULL,
  `data` text NOT NULL,
  `lifetime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modified` (`modified`),
  KEY `lifetime` (`lifetime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_sessions
-- ----------------------------
INSERT INTO `aws_sessions` VALUES ('jfos9lo8ju29qmcubo0qoloq72', '1405165676', 'kfv__Anwsion|a:3:{s:10:\"permission\";a:8:{s:10:\"visit_site\";s:1:\"1\";s:13:\"visit_explore\";s:1:\"1\";s:12:\"search_avail\";s:1:\"1\";s:14:\"visit_question\";s:1:\"1\";s:11:\"visit_topic\";s:1:\"1\";s:13:\"visit_feature\";s:1:\"1\";s:12:\"visit_people\";s:1:\"1\";s:11:\"answer_show\";s:1:\"1\";}s:11:\"client_info\";N;s:11:\"human_valid\";N;}', '1440');

-- ----------------------------
-- Table structure for `aws_system_setting`
-- ----------------------------
DROP TABLE IF EXISTS `aws_system_setting`;
CREATE TABLE `aws_system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `varname` varchar(255) NOT NULL COMMENT '字段名',
  `value` text COMMENT '变量值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `varname` (`varname`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='系统设置';

-- ----------------------------
-- Records of aws_system_setting
-- ----------------------------
INSERT INTO `aws_system_setting` VALUES ('1', 'db_engine', 's:6:\"MyISAM\";');
INSERT INTO `aws_system_setting` VALUES ('2', 'site_name', 's:11:\"kaoyancloud\";');
INSERT INTO `aws_system_setting` VALUES ('3', 'description', 's:33:\"kaoyancloud 曾经的梦想还在\";');
INSERT INTO `aws_system_setting` VALUES ('4', 'keywords', 's:50:\"kaoyancloud,考研社区,社交社区,问答社区\";');
INSERT INTO `aws_system_setting` VALUES ('5', 'sensitive_words', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('6', 'def_focus_uids', 's:1:\"1\";');
INSERT INTO `aws_system_setting` VALUES ('7', 'answer_edit_time', 's:2:\"30\";');
INSERT INTO `aws_system_setting` VALUES ('8', 'cache_level_high', 's:2:\"60\";');
INSERT INTO `aws_system_setting` VALUES ('9', 'cache_level_normal', 's:3:\"600\";');
INSERT INTO `aws_system_setting` VALUES ('10', 'cache_level_low', 's:4:\"1800\";');
INSERT INTO `aws_system_setting` VALUES ('11', 'unread_flush_interval', 's:3:\"100\";');
INSERT INTO `aws_system_setting` VALUES ('12', 'newer_invitation_num', 's:1:\"5\";');
INSERT INTO `aws_system_setting` VALUES ('13', 'index_per_page', 's:2:\"20\";');
INSERT INTO `aws_system_setting` VALUES ('14', 'from_email', 's:17:\"wangdk789@163.com\";');
INSERT INTO `aws_system_setting` VALUES ('15', 'base_url', 's:28:\"http://localhost:9090/kaoyan\";');
INSERT INTO `aws_system_setting` VALUES ('16', 'img_url', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('17', 'upload_url', 's:36:\"http://localhost:9090/kaoyan/uploads\";');
INSERT INTO `aws_system_setting` VALUES ('18', 'upload_dir', 's:30:\"E:/xampp/htdocs/kaoyan/uploads\";');
INSERT INTO `aws_system_setting` VALUES ('19', 'ui_style', 's:7:\"default\";');
INSERT INTO `aws_system_setting` VALUES ('20', 'uninterested_fold', 's:1:\"5\";');
INSERT INTO `aws_system_setting` VALUES ('21', 'sina_akey', null);
INSERT INTO `aws_system_setting` VALUES ('22', 'sina_skey', null);
INSERT INTO `aws_system_setting` VALUES ('23', 'qq_app_key', null);
INSERT INTO `aws_system_setting` VALUES ('24', 'qq_app_secret', null);
INSERT INTO `aws_system_setting` VALUES ('25', 'sina_weibo_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('26', 'qq_t_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('27', 'answer_unique', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('28', 'notifications_per_page', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('29', 'contents_per_page', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('30', 'hot_question_period', 's:1:\"7\";');
INSERT INTO `aws_system_setting` VALUES ('31', 'category_display_mode', 's:4:\"icon\";');
INSERT INTO `aws_system_setting` VALUES ('32', 'recommend_users_number', 's:1:\"6\";');
INSERT INTO `aws_system_setting` VALUES ('33', 'ucenter_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('34', 'register_valid_type', 's:5:\"email\";');
INSERT INTO `aws_system_setting` VALUES ('35', 'best_answer_day', 's:2:\"30\";');
INSERT INTO `aws_system_setting` VALUES ('36', 'answer_self_question', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('37', 'censoruser', 's:5:\"admin\";');
INSERT INTO `aws_system_setting` VALUES ('38', 'best_answer_min_count', 's:1:\"3\";');
INSERT INTO `aws_system_setting` VALUES ('39', 'reputation_function', 's:78:\"[最佳答案]*3+[赞同]*1-[反对]*1+[发起者赞同]*2-[发起者反对]*1\";');
INSERT INTO `aws_system_setting` VALUES ('40', 'db_version', 's:8:\"20140228\";');
INSERT INTO `aws_system_setting` VALUES ('41', 'statistic_code', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('42', 'upload_enable', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('43', 'answer_length_lower', 's:1:\"2\";');
INSERT INTO `aws_system_setting` VALUES ('44', 'quick_publish', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('45', 'register_type', 's:4:\"open\";');
INSERT INTO `aws_system_setting` VALUES ('46', 'question_title_limit', 's:3:\"100\";');
INSERT INTO `aws_system_setting` VALUES ('47', 'register_seccode', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('48', 'admin_login_seccode', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('49', 'comment_limit', 's:1:\"0\";');
INSERT INTO `aws_system_setting` VALUES ('50', 'backup_dir', '');
INSERT INTO `aws_system_setting` VALUES ('51', 'best_answer_reput', 's:2:\"20\";');
INSERT INTO `aws_system_setting` VALUES ('52', 'publisher_reputation_factor', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('53', 'request_route_custom', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('54', 'upload_size_limit', 's:3:\"512\";');
INSERT INTO `aws_system_setting` VALUES ('55', 'upload_avatar_size_limit', 's:3:\"512\";');
INSERT INTO `aws_system_setting` VALUES ('56', 'topic_title_limit', 's:2:\"12\";');
INSERT INTO `aws_system_setting` VALUES ('57', 'url_rewrite_enable', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('58', 'best_agree_min_count', 's:1:\"3\";');
INSERT INTO `aws_system_setting` VALUES ('59', 'site_close', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('60', 'close_notice', 's:39:\"站点已关闭，管理员请登录。\";');
INSERT INTO `aws_system_setting` VALUES ('61', 'qq_login_enabled', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('62', 'qq_login_app_id', '');
INSERT INTO `aws_system_setting` VALUES ('63', 'qq_login_app_key', '');
INSERT INTO `aws_system_setting` VALUES ('64', 'integral_system_enabled', 's:1:\"N\",');
INSERT INTO `aws_system_setting` VALUES ('65', 'integral_system_config_register', 's:4:\"2000\",');
INSERT INTO `aws_system_setting` VALUES ('66', 'integral_system_config_profile', 's:3:\"100\",');
INSERT INTO `aws_system_setting` VALUES ('67', 'integral_system_config_invite', 's:3:\"200\",');
INSERT INTO `aws_system_setting` VALUES ('68', 'integral_system_config_best_answer', 's:3:\"200\",');
INSERT INTO `aws_system_setting` VALUES ('69', 'integral_system_config_answer_fold', 's:3:\"-50\",');
INSERT INTO `aws_system_setting` VALUES ('70', 'integral_system_config_new_question', 's:3:\"-20\",');
INSERT INTO `aws_system_setting` VALUES ('71', 'integral_system_config_new_answer', 's:2:\"-5\",');
INSERT INTO `aws_system_setting` VALUES ('72', 'integral_system_config_thanks', 's:3:\"-10\",');
INSERT INTO `aws_system_setting` VALUES ('73', 'integral_system_config_invite_answer', 's:3:\"-10\",');
INSERT INTO `aws_system_setting` VALUES ('74', 'username_rule', 's:1:\"1\";');
INSERT INTO `aws_system_setting` VALUES ('75', 'username_length_min', 's:1:\"2\";');
INSERT INTO `aws_system_setting` VALUES ('76', 'username_length_max', 's:2:\"14\";');
INSERT INTO `aws_system_setting` VALUES ('77', 'category_enable', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('78', 'integral_unit', 's:6:\"金币\";');
INSERT INTO `aws_system_setting` VALUES ('79', 'nav_menu_show_child', 's:1:\"1\";');
INSERT INTO `aws_system_setting` VALUES ('80', 'anonymous_enable', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('81', 'report_reason', 's:63:\"广告/SPAM\n恶意灌水\n违规内容\n文不对题\n重复发问\";');
INSERT INTO `aws_system_setting` VALUES ('82', 'allowed_upload_types', 's:41:\"jpg,jpeg,png,gif,zip,doc,docx,rar,pdf,psd\";');
INSERT INTO `aws_system_setting` VALUES ('83', 'site_announce', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('84', 'icp_beian', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('85', 'report_message_uid', 's:1:\"1\";');
INSERT INTO `aws_system_setting` VALUES ('86', 'today_topics', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('87', 'welcome_recommend_users', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('88', 'welcome_message_pm', 's:180:\"尊敬的{username}，您已经注册成为{sitename}的会员，请您在发表言论时，遵守当地法律法规。\n如果您有什么疑问可以联系管理员。\n\n{sitename}\";');
INSERT INTO `aws_system_setting` VALUES ('89', 'time_style', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('90', 'reputation_log_factor', 's:1:\"3\";');
INSERT INTO `aws_system_setting` VALUES ('91', 'advanced_editor_enable', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('92', 'auto_question_lock_day', 's:1:\"0\";');
INSERT INTO `aws_system_setting` VALUES ('93', 'default_timezone', 's:9:\"Etc/GMT-8\";');
INSERT INTO `aws_system_setting` VALUES ('94', 'reader_questions_last_days', 's:2:\"30\";');
INSERT INTO `aws_system_setting` VALUES ('95', 'reader_questions_agree_count', 's:2:\"10\"');
INSERT INTO `aws_system_setting` VALUES ('96', 'weixin_mp_token', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('97', 'new_user_email_setting', 'a:2:{s:9:\"FOLLOW_ME\";s:1:\"N\";s:10:\"NEW_ANSWER\";s:1:\"N\";}');
INSERT INTO `aws_system_setting` VALUES ('98', 'new_user_notification_setting', 'a:0:{}');
INSERT INTO `aws_system_setting` VALUES ('99', 'user_action_history_fresh_upgrade', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('100', 'cache_dir', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('101', 'ucenter_charset', 's:5:\"UTF-8\";');
INSERT INTO `aws_system_setting` VALUES ('102', 'question_topics_limit', 's:2:\"10\";');
INSERT INTO `aws_system_setting` VALUES ('103', 'mail_config', 'a:7:{s:9:\"transport\";s:8:\"sendmail\";s:7:\"charset\";s:5:\"UTF-8\";s:6:\"server\";s:0:\"\";s:3:\"ssl\";s:1:\"0\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}');
INSERT INTO `aws_system_setting` VALUES ('104', 'auto_create_social_topics', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('105', 'weixin_subscribe_message_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('106', 'weixin_no_result_message_key', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('107', 'weixin_mp_menu', 'a:0:{}');
INSERT INTO `aws_system_setting` VALUES ('108', 'new_question_force_add_topic', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('109', 'unfold_question_comments', 's:1:\"N\";');
INSERT INTO `aws_system_setting` VALUES ('110', 'report_diagnostics', 's:1:\"Y\";');
INSERT INTO `aws_system_setting` VALUES ('111', 'weixin_app_id', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('112', 'weixin_app_secret', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('113', 'wecenter_access_token', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('114', 'wecenter_access_secret', 's:0:\"\";');
INSERT INTO `aws_system_setting` VALUES ('115', 'weixin_account_role', 's:7:\"general\";');
INSERT INTO `aws_system_setting` VALUES ('116', 'register_agreement', 's:1626:\"当您申请用户时，表示您已经同意遵守本规章。\r\n欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：\r\n\r\n一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：\r\n　（一）煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　（二）煽动颠覆国家政权，推翻社会主义制度的；\r\n　（三）煽动分裂国家、破坏国家统一的；\r\n　（四）煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　（八）损害国家机关信誉的；\r\n　（九）其他违反宪法和法律行政法规的；\r\n　（十）进行商业广告行为的。\r\n\r\n二、互相尊重，对自己的言论和行为负责。\r\n三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。\r\n四、禁止以任何方式对本站进行各种破坏行为。\r\n五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。\";');

-- ----------------------------
-- Table structure for `aws_topic`
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic`;
CREATE TABLE `aws_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `topic_title` varchar(64) DEFAULT NULL COMMENT '话题标题',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `discuss_count` int(11) DEFAULT '0' COMMENT '讨论计数',
  `topic_description` text COMMENT '话题描述',
  `topic_pic` varchar(255) DEFAULT NULL COMMENT '话题图片',
  `topic_lock` tinyint(2) NOT NULL DEFAULT '0' COMMENT '话题是否锁定 1 锁定 0 未锁定',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注计数',
  `user_related` tinyint(1) DEFAULT '0' COMMENT '是否被用户关联',
  `url_token` varchar(32) DEFAULT NULL,
  `merged_id` int(11) DEFAULT '0',
  `seo_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic_title` (`topic_title`),
  KEY `url_token` (`url_token`),
  KEY `merged_id` (`merged_id`),
  KEY `discuss_count` (`discuss_count`),
  KEY `add_time` (`add_time`),
  KEY `user_related` (`user_related`),
  KEY `focus_count` (`focus_count`),
  KEY `topic_lock` (`topic_lock`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='话题';

-- ----------------------------
-- Records of aws_topic
-- ----------------------------
INSERT INTO `aws_topic` VALUES ('1', '默认话题', null, '1', '默认话题', '', '0', '1', '0', '', '0', '');
INSERT INTO `aws_topic` VALUES ('2', 'xinhaoyuxinxchuli', null, '0', 'hello', null, '0', '1', '0', null, '0', null);

-- ----------------------------
-- Table structure for `aws_topic_focus`
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic_focus`;
CREATE TABLE `aws_topic_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `topic_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`focus_id`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `topic_uid` (`topic_id`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='话题关注表';

-- ----------------------------
-- Records of aws_topic_focus
-- ----------------------------
INSERT INTO `aws_topic_focus` VALUES ('1', '2', '1', '1399085588');
INSERT INTO `aws_topic_focus` VALUES ('2', '1', '1', '1403937055');

-- ----------------------------
-- Table structure for `aws_topic_merge`
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic_merge`;
CREATE TABLE `aws_topic_merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0',
  `target_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `target_id` (`target_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_topic_merge
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_topic_relation`
-- ----------------------------
DROP TABLE IF EXISTS `aws_topic_relation`;
CREATE TABLE `aws_topic_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题id',
  `item_id` int(11) DEFAULT '0',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_topic_relation
-- ----------------------------
INSERT INTO `aws_topic_relation` VALUES ('1', '1', '3', '1403943287', '1', 'question');

-- ----------------------------
-- Table structure for `aws_users`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users`;
CREATE TABLE `aws_users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户的 UID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT 'EMAIL',
  `mobile` varchar(16) DEFAULT NULL COMMENT '用户手机',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(16) DEFAULT NULL COMMENT '用户附加混淆码',
  `avatar_file` varchar(128) DEFAULT NULL COMMENT '头像文件',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` int(10) DEFAULT NULL COMMENT '生日',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `job_id` int(10) DEFAULT '0' COMMENT '职业ID',
  `reg_time` int(10) DEFAULT NULL COMMENT '注册时间',
  `reg_ip` bigint(12) DEFAULT NULL COMMENT '注册IP',
  `last_login` int(10) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` bigint(12) DEFAULT NULL COMMENT '最后登录 IP',
  `online_time` int(10) DEFAULT '0' COMMENT '在线时间',
  `last_active` int(10) DEFAULT NULL COMMENT '最后活跃时间',
  `notification_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读系统通知',
  `inbox_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读短信息',
  `inbox_recv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-所有人可以发给我,1-我关注的人',
  `fans_count` int(10) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `friend_count` int(10) NOT NULL DEFAULT '0' COMMENT '观众数',
  `invite_count` int(10) NOT NULL DEFAULT '0' COMMENT '邀请我回答数量',
  `question_count` int(10) NOT NULL DEFAULT '0' COMMENT '问题数量',
  `answer_count` int(10) NOT NULL DEFAULT '0' COMMENT '回答数量',
  `topic_focus_count` int(10) NOT NULL DEFAULT '0' COMMENT '关注话题数量',
  `invitation_available` int(10) NOT NULL DEFAULT '0' COMMENT '邀请数量',
  `group_id` int(10) DEFAULT '0' COMMENT '用户组',
  `reputation_group` int(10) DEFAULT '0' COMMENT '威望对应组',
  `forbidden` tinyint(1) DEFAULT '0' COMMENT '是否禁止用户',
  `valid_email` tinyint(1) DEFAULT '0' COMMENT '邮箱验证',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '首次登录标记',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞同数量',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢数量',
  `views_count` int(10) DEFAULT '0' COMMENT '个人主页查看数量',
  `reputation` int(10) DEFAULT '0' COMMENT '威望',
  `reputation_update_time` int(10) DEFAULT '0' COMMENT '威望更新',
  `weibo_visit` tinyint(1) DEFAULT '1' COMMENT '微博允许访问',
  `integral` int(10) DEFAULT '0',
  `draft_count` int(10) DEFAULT NULL,
  `common_email` varchar(255) DEFAULT NULL COMMENT '常用邮箱',
  `url_token` varchar(32) DEFAULT NULL COMMENT '个性网址',
  `url_token_update` int(10) DEFAULT '0',
  `verified` varchar(32) DEFAULT NULL,
  `default_timezone` varchar(32) DEFAULT NULL,
  `email_settings` varchar(255) DEFAULT '',
  `weixin_settings` varchar(255) DEFAULT '',
  `recent_topics` text,
  `user_type` tinyint(1) DEFAULT '1' COMMENT '用户类别',
  `school_name` varchar(255) DEFAULT NULL,
  `major_name` varchar(255) DEFAULT NULL,
  `dst_school_name` varchar(255) DEFAULT NULL,
  `dst_major_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `reputation` (`reputation`),
  KEY `reputation_update_time` (`reputation_update_time`),
  KEY `group_id` (`group_id`),
  KEY `agree_count` (`agree_count`),
  KEY `thanks_count` (`thanks_count`),
  KEY `forbidden` (`forbidden`),
  KEY `valid_email` (`valid_email`),
  KEY `last_active` (`last_active`),
  KEY `integral` (`integral`),
  KEY `url_token` (`url_token`),
  KEY `verified` (`verified`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users
-- ----------------------------
INSERT INTO `aws_users` VALUES ('1', 'wangdk789', 'wangdk789@163.com', null, '38af20612b59adb156330ca1eb1f627c', 'tbhu', null, null, null, null, null, '0', '1394627776', '2130706433', '1403936633', '2130706433', '1680', '1403943425', '0', '0', '0', '1', '0', '0', '3', '1', '2', '10', '1', '5', '0', '1', '1', '0', '0', '4', '0', '1405165676', '1', '1940', '0', null, null, '0', null, null, '', '', 'a:1:{i:0;s:12:\"默认话题\";}', '1', null, null, null, null);
INSERT INTO `aws_users` VALUES ('2', 'wangdk', 'wangdk@163.com', '', '2e96ed80cf69e8d615645ea5e67b9dc4', 'ebpa', null, '3', null, '', '', '0', '1404305984', '0', '0', null, '0', '1394250026', '0', '0', '0', '0', '1', '0', '0', '0', '0', '5', '3', '5', '0', '1', '1', '0', '0', '0', '0', '1405165676', '1', '2000', null, null, null, '0', null, null, 'a:2:{s:9:\"FOLLOW_ME\";s:1:\"N\";s:10:\"NEW_ANSWER\";s:1:\"N\";}', '', null, '1', '', '', '', '');

-- ----------------------------
-- Table structure for `aws_users_attrib`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_attrib`;
CREATE TABLE `aws_users_attrib` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `introduction` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `signature` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `qq` bigint(15) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户附加属性表';

-- ----------------------------
-- Records of aws_users_attrib
-- ----------------------------
INSERT INTO `aws_users_attrib` VALUES ('1', '1', null, '', null, null);
INSERT INTO `aws_users_attrib` VALUES ('2', '2', null, '', null, null);

-- ----------------------------
-- Table structure for `aws_users_group`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_group`;
CREATE TABLE `aws_users_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT '0' COMMENT '0-会员组 1-系统组',
  `custom` tinyint(1) DEFAULT '0' COMMENT '是否自定义',
  `group_name` varchar(50) NOT NULL,
  `reputation_lower` int(11) DEFAULT '0',
  `reputation_higer` int(11) DEFAULT '0',
  `reputation_factor` float DEFAULT '0' COMMENT '威望系数',
  `permission` text COMMENT '权限设置',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Records of aws_users_group
-- ----------------------------
INSERT INTO `aws_users_group` VALUES ('1', '0', '0', '超级管理员', '0', '0', '5', 'a:15:{s:16:\"is_administortar\";s:1:\"1\";s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('2', '0', '0', '前台管理员', '0', '0', '4', 'a:14:{s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('3', '0', '0', '未验证会员', '0', '0', '0', 'a:5:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:11:\"human_valid\";s:1:\"1\";s:19:\"question_valid_hour\";s:1:\"2\";s:17:\"answer_valid_hour\";s:1:\"2\";}');
INSERT INTO `aws_users_group` VALUES ('4', '0', '0', '普通会员', '0', '0', '0', 'a:3:{s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:19:\"question_valid_hour\";s:2:\"10\";s:17:\"answer_valid_hour\";s:2:\"10\";}');
INSERT INTO `aws_users_group` VALUES ('5', '1', '0', '注册会员', '0', '100', '1', 'a:6:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:11:\"human_valid\";s:1:\"1\";s:19:\"question_valid_hour\";s:1:\"5\";s:17:\"answer_valid_hour\";s:1:\"5\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('6', '1', '0', '初级会员', '100', '200', '1', 'a:8:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:19:\"question_valid_hour\";s:1:\"5\";s:17:\"answer_valid_hour\";s:1:\"5\";s:15:\"publish_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('7', '1', '0', '中级会员', '200', '500', '1', 'a:9:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:10:\"edit_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('8', '1', '0', '高级会员', '500', '1000', '1', 'a:11:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('9', '1', '0', '核心会员', '1000', '999999', '1', 'a:12:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}');
INSERT INTO `aws_users_group` VALUES ('99', '0', '0', '游客', '0', '0', '0', 'a:8:{s:10:\"visit_site\";s:1:\"1\";s:13:\"visit_explore\";s:1:\"1\";s:12:\"search_avail\";s:1:\"1\";s:14:\"visit_question\";s:1:\"1\";s:11:\"visit_topic\";s:1:\"1\";s:13:\"visit_feature\";s:1:\"1\";s:12:\"visit_people\";s:1:\"1\";s:11:\"answer_show\";s:1:\"1\";}');

-- ----------------------------
-- Table structure for `aws_users_notification_setting`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_notification_setting`;
CREATE TABLE `aws_users_notification_setting` (
  `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) NOT NULL,
  `data` text COMMENT '设置数据',
  PRIMARY KEY (`notice_setting_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通知设定';

-- ----------------------------
-- Records of aws_users_notification_setting
-- ----------------------------
INSERT INTO `aws_users_notification_setting` VALUES ('1', '2', 'a:0:{}');

-- ----------------------------
-- Table structure for `aws_users_online`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_online`;
CREATE TABLE `aws_users_online` (
  `uid` int(11) NOT NULL COMMENT '用户 ID',
  `last_active` int(11) DEFAULT '0' COMMENT '上次活动时间',
  `ip` bigint(12) DEFAULT '0' COMMENT '客户端ip',
  `active_url` varchar(255) DEFAULT NULL COMMENT '停留页面',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户客户端信息',
  KEY `uid` (`uid`),
  KEY `last_active` (`last_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线用户列表';

-- ----------------------------
-- Records of aws_users_online
-- ----------------------------
INSERT INTO `aws_users_online` VALUES ('1', '1403943425', '2130706433', 'http://localhost:9090/kaoyan/?/topic/', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36');

-- ----------------------------
-- Table structure for `aws_users_qq`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_qq`;
CREATE TABLE `aws_users_qq` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `type` varchar(20) DEFAULT NULL COMMENT '类别',
  `name` varchar(64) DEFAULT NULL COMMENT '微博昵称',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `access_token` varchar(64) DEFAULT NULL,
  `oauth_token_secret` varchar(64) DEFAULT NULL,
  `nick` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_qq
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_users_sina`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_sina`;
CREATE TABLE `aws_users_sina` (
  `id` bigint(11) NOT NULL COMMENT '新浪用户 ID',
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `name` varchar(64) DEFAULT NULL COMMENT '微博昵称',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` text COMMENT '个人描述',
  `url` varchar(255) DEFAULT NULL COMMENT '用户博客地址',
  `profile_image_url` varchar(255) DEFAULT NULL COMMENT 'Sina 自定义头像地址',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `access_token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_sina
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_users_ucenter`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_ucenter`;
CREATE TABLE `aws_users_ucenter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `uc_uid` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uc_uid` (`uc_uid`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_ucenter
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_users_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `aws_users_weixin`;
CREATE TABLE `aws_users_weixin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `expires_in` int(10) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `scope` varchar(64) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0',
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `add_time` int(10) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location_update` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `openid` (`openid`),
  KEY `expires_in` (`expires_in`),
  KEY `scope` (`scope`),
  KEY `sex` (`sex`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  KEY `add_time` (`add_time`),
  KEY `latitude` (`latitude`,`longitude`),
  KEY `location_update` (`location_update`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_users_weixin
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_user_action_history`
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_action_history`;
CREATE TABLE `aws_user_action_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `associate_type` tinyint(1) DEFAULT NULL COMMENT '关联类型: 1 问题 2 回答 3 评论 4 话题',
  `associate_action` smallint(3) DEFAULT NULL COMMENT '操作类型',
  `associate_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `associate_attached` int(11) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT '0' COMMENT '是否匿名',
  `fold_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`history_id`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `associate_id` (`associate_id`),
  KEY `anonymous` (`anonymous`),
  KEY `fold_status` (`fold_status`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `associate_attached` (`associate_attached`),
  KEY `associate_with_id` (`associate_id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户操作记录';

-- ----------------------------
-- Records of aws_user_action_history
-- ----------------------------
INSERT INTO `aws_user_action_history` VALUES ('1', '1', '1', '101', '1', '1394719449', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('2', '1', '1', '101', '2', '1394719468', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('3', '1', '4', '406', '2', '1399085588', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('4', '1', '1', '501', '1', '1403937028', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('5', '1', '4', '406', '1', '1403937055', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('6', '1', '1', '401', '3', '1403943287', '1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('7', '1', '4', '401', '1', '1403943287', '3', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('8', '1', '1', '101', '3', '1403943287', '-1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('9', '1', '2', '201', '1', '1403943295', '3', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('10', '1', '1', '201', '3', '1403943295', '1', '0', '0');
INSERT INTO `aws_user_action_history` VALUES ('11', '1', '1', '501', '3', '1403943375', '-1', '0', '0');

-- ----------------------------
-- Table structure for `aws_user_action_history_data`
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_action_history_data`;
CREATE TABLE `aws_user_action_history_data` (
  `history_id` int(11) unsigned NOT NULL,
  `associate_content` text,
  `associate_attached` text,
  `addon_data` text COMMENT '附加数据',
  PRIMARY KEY (`history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_user_action_history_data
-- ----------------------------
INSERT INTO `aws_user_action_history_data` VALUES ('1', 'question1', 'question1', '');
INSERT INTO `aws_user_action_history_data` VALUES ('2', 'question2', 'question2', '');
INSERT INTO `aws_user_action_history_data` VALUES ('3', '', '', '');
INSERT INTO `aws_user_action_history_data` VALUES ('4', 'wecenter的第一个文章', 'wecenter的第一个文章wecenter的第一个文章wecenter的第一个文章wecenter的第一个文章', '');
INSERT INTO `aws_user_action_history_data` VALUES ('5', '', '', '');
INSERT INTO `aws_user_action_history_data` VALUES ('6', '默认话题', '', '');
INSERT INTO `aws_user_action_history_data` VALUES ('7', '默认话题', '', '');
INSERT INTO `aws_user_action_history_data` VALUES ('8', 'saasfaf', 'asfaf', '');
INSERT INTO `aws_user_action_history_data` VALUES ('9', 'fasafa', '', '');
INSERT INTO `aws_user_action_history_data` VALUES ('10', 'fasafa', '', '');
INSERT INTO `aws_user_action_history_data` VALUES ('11', 'fafafq', 'fafaf', '');

-- ----------------------------
-- Table structure for `aws_user_action_history_fresh`
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_action_history_fresh`;
CREATE TABLE `aws_user_action_history_fresh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NOT NULL,
  `associate_id` int(11) NOT NULL,
  `associate_type` tinyint(1) NOT NULL,
  `associate_action` smallint(3) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `history_id` (`history_id`),
  KEY `associate_with_id` (`id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`),
  KEY `anonymous` (`anonymous`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_user_action_history_fresh
-- ----------------------------
INSERT INTO `aws_user_action_history_fresh` VALUES ('4', '4', '1', '1', '501', '1403937028', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('2', '2', '2', '1', '101', '1394719468', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('3', '3', '2', '4', '406', '1399085588', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('7', '7', '1', '4', '401', '1403943287', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('11', '11', '3', '1', '501', '1403943375', '1', '0');
INSERT INTO `aws_user_action_history_fresh` VALUES ('9', '9', '1', '2', '201', '1403943295', '1', '0');

-- ----------------------------
-- Table structure for `aws_user_follow`
-- ----------------------------
DROP TABLE IF EXISTS `aws_user_follow`;
CREATE TABLE `aws_user_follow` (
  `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fans_uid` int(11) DEFAULT NULL COMMENT '关注人的UID',
  `friend_uid` int(11) DEFAULT NULL COMMENT '被关注人的uid',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`follow_id`),
  KEY `fans_uid` (`fans_uid`),
  KEY `friend_uid` (`friend_uid`),
  KEY `user_follow` (`fans_uid`,`friend_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of aws_user_follow
-- ----------------------------
INSERT INTO `aws_user_follow` VALUES ('1', '2', '1', '1404305984');

-- ----------------------------
-- Table structure for `aws_verify_apply`
-- ----------------------------
DROP TABLE IF EXISTS `aws_verify_apply`;
CREATE TABLE `aws_verify_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `time` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `status` tinyint(1) DEFAULT '0',
  `type` varchar(16) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `name` (`name`,`status`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_verify_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_weixin_login`
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_login`;
CREATE TABLE `aws_weixin_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `expire` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `token` (`token`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_weixin_login
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_weixin_message`
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_message`;
CREATE TABLE `aws_weixin_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weixin_id` varchar(32) NOT NULL,
  `content` varchar(255) NOT NULL,
  `action` varchar(32) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `weixin_id` (`weixin_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_weixin_message
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_weixin_reply_rule`
-- ----------------------------
DROP TABLE IF EXISTS `aws_weixin_reply_rule`;
CREATE TABLE `aws_weixin_reply_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `sort_status` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`),
  KEY `enabled` (`enabled`),
  KEY `sort_status` (`sort_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aws_weixin_reply_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `aws_work_experience`
-- ----------------------------
DROP TABLE IF EXISTS `aws_work_experience`;
CREATE TABLE `aws_work_experience` (
  `work_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `start_year` int(11) DEFAULT NULL COMMENT '开始年份',
  `end_year` int(11) DEFAULT NULL COMMENT '结束年月',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名',
  `job_id` int(11) DEFAULT NULL COMMENT '职位ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`work_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='工作经历';

-- ----------------------------
-- Records of aws_work_experience
-- ----------------------------
