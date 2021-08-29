/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : wenku_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-08-29 11:15:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mt_ad`
-- ----------------------------
DROP TABLE IF EXISTS `mt_ad`;
CREATE TABLE `mt_ad` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `extimg` varchar(255) NOT NULL,
  `extval` varchar(200) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_ad
-- ----------------------------
INSERT INTO `mt_ad` VALUES ('1', '1', 'image', '文档预览前广告位', 'https://wpa.qq.com/msgrd?v=3&uin=97887526&site=qqq&menu=yes', '2006/24/5ef2c4dfb904d.jpg', '', '', '', '1592409600', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('2', '2', 'image', '首页顶部伸缩广告', 'http://www.18pay.net/', '2108/29/612afb914f714.gif', '', '', '', '1592409600', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('3', '6', 'image', '资源驿站', 'http://zy13.net/', '2006/24/5ef2ce15dd175.jpg', '', '', '', '1590940800', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('4', '6', 'image', '限量秒杀', 'https://mac7.taobao.com/', '2006/24/5ef2ce4b8ee43.jpg', '', '', '', '1590940800', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('5', '6', 'image', '汽车隔热膜', 'https://mac7.taobao.com/', '2006/24/5ef2cefac47b7.jpg', '', '', '', '1590940800', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('6', '6', 'image', '车联网', 'https://mac7.taobao.com/', '2006/24/5ef2cf17b92aa.jpg', '', '', '', '1590940800', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('7', '3', 'image', '婚礼策划', 'http://zy13.net/', '2006/24/5ef2e6a0495ee.gif', '', '', '', '1590940800', '1656518400', '0', '0', '255', '0');
INSERT INTO `mt_ad` VALUES ('8', '3', 'image', '亲子旅行', 'http://zy13.net/', '2006/24/5ef2e6cb627ca.gif', '', '', '', '1590940800', '1656518400', '0', '0', '255', '0');
INSERT INTO `mt_ad` VALUES ('9', '3', 'image', '暑假班辅导', 'http://zy13.net/', '2006/24/5ef2e6ed1c175.gif', '', '', '', '1590940800', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('10', '3', 'image', '浪漫七夕节', 'http://zy13.net/', '2006/24/5ef2e71b47147.gif', '', '', '', '1590940800', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('11', '4', 'image', '娱乐游戏', 'http://zy13.net/', '2006/24/5ef2f543b4725.gif', '', '', '', '1590940800', '1656518400', '0', '0', '255', '1');
INSERT INTO `mt_ad` VALUES ('12', '4', 'image', '818狂欢购物节', 'http://zy13.net/', '2006/24/5ef2f56911156.gif', '', '', '', '1590940800', '1656518400', '0', '0', '255', '0');
INSERT INTO `mt_ad` VALUES ('13', '4', 'image', '单身交友', 'http://zy13.net/', '2006/24/5ef2f58533dc8.gif', '', '', '', '1590940800', '1656518400', '0', '0', '255', '0');

-- ----------------------------
-- Table structure for `mt_adboard`
-- ----------------------------
DROP TABLE IF EXISTS `mt_adboard`;
CREATE TABLE `mt_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tpl` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_adboard
-- ----------------------------
INSERT INTO `mt_adboard` VALUES ('1', '文档预览前广告', 'indexfocus', '400', '400', '', '1');
INSERT INTO `mt_adboard` VALUES ('2', '首页顶部折叠广告', 'banner', '1180', '99', '', '1');
INSERT INTO `mt_adboard` VALUES ('3', '导航下方横幅', 'banner', '960', '90', '', '1');
INSERT INTO `mt_adboard` VALUES ('4', '底部横幅', 'banner', '960', '90', '', '1');
INSERT INTO `mt_adboard` VALUES ('5', '详细页评论下方', 'banner', '390', '90', '', '1');
INSERT INTO `mt_adboard` VALUES ('6', '首页焦点图', 'focus', '559', '192', '', '1');

-- ----------------------------
-- Table structure for `mt_admin_auth`
-- ----------------------------
DROP TABLE IF EXISTS `mt_admin_auth`;
CREATE TABLE `mt_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_admin_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_article`
-- ----------------------------
DROP TABLE IF EXISTS `mt_article`;
CREATE TABLE `mt_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `cateid` int(10) NOT NULL,
  `content` text NOT NULL,
  `color` varchar(10) NOT NULL,
  `uid` int(20) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL,
  `tuijian` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `zhiding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_article
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_article_cate`
-- ----------------------------
DROP TABLE IF EXISTS `mt_article_cate`;
CREATE TABLE `mt_article_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) NOT NULL,
  `ordid` smallint(4) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_article_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_badword`
-- ----------------------------
DROP TABLE IF EXISTS `mt_badword`;
CREATE TABLE `mt_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_badword
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_bindmail`
-- ----------------------------
DROP TABLE IF EXISTS `mt_bindmail`;
CREATE TABLE `mt_bindmail` (
  `uid` int(20) NOT NULL,
  `bind` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_bindmail
-- ----------------------------
INSERT INTO `mt_bindmail` VALUES ('2', '0');

-- ----------------------------
-- Table structure for `mt_comment`
-- ----------------------------
DROP TABLE IF EXISTS `mt_comment`;
CREATE TABLE `mt_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(4) unsigned NOT NULL,
  `itemid` int(20) unsigned NOT NULL,
  `commentid` int(10) NOT NULL DEFAULT '1',
  `toid` int(10) NOT NULL,
  `info` varchar(255) NOT NULL,
  `uid` int(20) NOT NULL,
  `add_time` int(10) NOT NULL,
  `youyong` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_comment
-- ----------------------------
INSERT INTO `mt_comment` VALUES ('1', '1', '1', '1', '0', '挺不错的哟<img src=\"./public/images/emot/360/17.gif\" border=\"0\" alt=\"\" />', '2', '1592535971', '0', '1');

-- ----------------------------
-- Table structure for `mt_doc_cate`
-- ----------------------------
DROP TABLE IF EXISTS `mt_doc_cate`;
CREATE TABLE `mt_doc_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) NOT NULL,
  `ordid` smallint(4) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_doc_cate
-- ----------------------------
INSERT INTO `mt_doc_cate` VALUES ('1', '互联网', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('2', '建筑', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('3', '行业资料', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('4', '政务民生', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('5', '简历模板', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('6', '生活娱乐', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('7', '办公文档', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('8', '教育', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('9', '语言/资格考试', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('10', '实用模板', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('11', '法律', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('12', '说明书', '', '0', '0', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('13', '计算机', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('14', '数据库', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('15', '电子商务', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('16', '信息技术', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('17', '单片机', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('18', '程序设计', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('19', '大数据', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('20', '操作系统', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('21', '物联网', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('22', '信息技术', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('23', '服务器', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('24', '移动通信', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('25', '多媒体', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('26', '人工智能', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('27', '软件工程', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('28', '网络营销', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('29', '云计算', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('30', '网络安全', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('31', '路由器', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('32', '智慧城市', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('33', '网络信息安全', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('34', '微信公众平台', '', '1', '1|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('35', '施工方案', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('36', '组织设计', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('37', '施工图纸', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('38', '脚手架', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('39', '质量检验', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('40', '记录表', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('41', '施工工艺', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('42', '平面图', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('43', '施工方法', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('44', '招标文件', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('45', '流程图', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('46', '工程量清单', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('47', '技术措施', '', '2', '2|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('48', '房地产', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('49', '人力资源', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('50', '医疗器械', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('51', '栽培技术', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('52', '临床分析', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('53', '中小企业', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('54', '商业银行', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('55', '临床应用', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('56', '临床观察', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('57', '质量控制', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('58', '上市公司', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('59', '供应链', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('60', '传染病', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('61', '病虫害', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('62', '疗效观察', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('63', '物业管理', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('64', '污水处理', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('65', '质量管理体系', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('66', '健康教育', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('67', '自动化', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('68', '零售企业', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('69', '制造业', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('70', '临床研究', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('71', '国有企业', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('72', '影像学', '', '3', '3|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('73', '数据分析报告', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('74', '调查报告', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('75', '实施方案', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('76', '管理办法', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('77', '登记表', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('78', '申请表', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('79', '工作方案', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('80', '工作计划', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('81', '研究报告', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('82', '管理制度', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('83', '审批表', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('84', '策划方案', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('85', '应急预案', '', '4', '4|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('86', '简洁', '', '5', '5|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('87', '表格', '', '5', '5|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('88', '时尚', '', '5', '5|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('89', '创意', '', '5', '5|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('90', '通用', '', '5', '5|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('91', '应届生', '', '5', '5|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('92', '读后感', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('93', '观后感', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('94', '读书笔记', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('95', '人生感悟', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('96', '五线谱', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('97', '电视剧', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('98', '体育竞技', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('99', '游戏', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('100', '音乐', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('101', '历史', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('102', '心理学', '', '6', '6|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('103', '规章制度', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('104', '事项决策', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('105', '通知', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('106', '业务合同', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('107', '客户函件', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('108', '技术标准', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('109', '同行业资料', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('110', '人员招聘', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('111', '采购', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('112', '财务出纳', '', '7', '7|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('113', '课件', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('114', '教案', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('115', '练习题', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('116', '知识点', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('117', '作文', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('118', '模拟试题', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('119', '说课稿', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('120', '模拟试卷', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('121', '教学计划', '', '8', '8|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('122', '英语考试', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('123', '建造师', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('124', '工程师', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('125', '公务员', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('126', '继续教育', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('127', '教师资格证', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('128', '安全员', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('129', '会计师', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('130', '保育员', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('131', '健康管理师', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('132', '国家司法考试', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('133', '执业药师', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('134', '驾驶员', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('135', '心理咨询师', '', '9', '9|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('136', '工作总结', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('137', '演讲稿', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('138', '工作计划', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('139', '述职报告', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('140', '发言稿', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('141', '管理制度', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('142', '心得体会', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('143', '实习报告', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('144', '岗位职责', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('145', '申请书', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('146', '辞职报告', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('147', '活动方案', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('148', '建议书', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('149', '策划书', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('150', '自查报告', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('151', '年终总结', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('152', '登记表', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('153', '规章制度', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('154', '策划方案', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('155', '倡议书', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('156', '应急预案', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('157', '可行性分析', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('158', '求职信', '', '10', '10|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('159', '协议书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('160', '合同范本', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('161', '承诺书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('162', '股权转让协议', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('163', '证明书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('164', '起诉状', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('165', '委托书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('166', '管理制度', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('167', '离婚协议书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('168', '买卖合同', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('169', '责任书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('170', '招标文件', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('171', '行政公文', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('172', '建议书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('173', '保密协议', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('174', '保证书', '', '11', '11|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('175', '操作手册', '', '12', '12|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('176', '药品说明书', '', '12', '12|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('177', '使用说明书', '', '12', '12|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('178', '管理手册', '', '12', '12|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('179', '作业指导书', '', '12', '12|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('180', '维修手册', '', '12', '12|', '255', '1');
INSERT INTO `mt_doc_cate` VALUES ('181', '产品手册', '', '12', '12|', '255', '1');

-- ----------------------------
-- Table structure for `mt_doc_con`
-- ----------------------------
DROP TABLE IF EXISTS `mt_doc_con`;
CREATE TABLE `mt_doc_con` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` smallint(4) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  `ext` varchar(10) NOT NULL,
  `filesize` int(50) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `oldname` varchar(255) NOT NULL,
  `fileurl` varchar(255) NOT NULL,
  `viewurl` varchar(255) NOT NULL,
  `imgurl` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uid` int(20) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '0:关闭1:待审核2:通过3:置顶4:推荐5:焦点图',
  `model` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1:虚拟2:官方3:独立',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_doc_con
-- ----------------------------
INSERT INTO `mt_doc_con` VALUES ('1', '2', '建筑工地环境卫生管理方案', '建筑工地环境卫生管理方案', '0', 'doc', '696320', '5eec8a703d995', '建筑工地环境卫生管理方案', '5eec8a703d995.doc', '202006191015343153.pdf', '5eecc88608b4e.png', 'ef1eb401b786935f34e2c99d8e79a969', '2', '环境卫生,工地,方案,建筑,管理', '119', '1592560245', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('2', '5', '层次分明精品Word简历模板(人力类)', '层次分明精品Word简历模板(人力类)', '0', 'doc', '244736', '5eecb2409584d', '层次分明精品Word简历模板(人力类)', '5eecb2409584d.doc', '202006190842357364.pdf', '5eecb2ba64759.png', 'd8512212ca13931cb01f16a979a0b699', '2', '分明,层次,模板,人力,简历,精品,Word,简历模板', '13', '1592570495', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('3', '5', '创新风格严谨Word简历模板（IT类）', '创新风格严谨Word简历模板（IT类）', '0', 'doc', '121856', '5eecba39b2233', '创新风格严谨Word简历模板（IT类）', '5eecba39b2233.doc', '202006190914471095.pdf', '5eecba47484be.png', 'e4f73f815fc697f54190f91f0e382fbf', '2', '严谨,模板,风格,简历,创新,Word,简历模板', '3', '1592572487', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('4', '5', '创新风格专业Word简历模板（销售类）', '', '0', 'doc', '96768', '5eecbaba83591', '创新风格专业Word简历模板（销售类）', '5eecbaba83591.doc', '202006190916557442.pdf', '5eecbac6b0f76.png', '337745a83c32b5a4f7bf09e95c473a29', '2', '模板,风格,创新,简历,销售,专业,Word,简历模板', '3', '1592572615', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('5', '5', '创新美观Word简历模板（IT类）', '创新美观Word简历模板（IT类）', '0', 'doc', '69120', '5eecc445beb7c', '创新美观Word简历模板（IT类）', '5eecc445beb7c.doc', '202006190957417123.pdf', '5eecc454cca83.png', '668a97775a1c9238d5514f65a4128e0f', '2', '美观,模板,简历,创新,Word,简历模板', '1', '1592575061', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('6', '5', '大气创新风专业Word简历模板（建筑类）', '大气创新风专业Word简历模板（建筑类）', '0', 'doc', '96256', '5eecc47d0a431', '大气创新风专业Word简历模板（建筑类）', '5eecc47d0a431.doc', '202006190958352507.pdf', '5eecc48a70639.png', 'db90ed7666f83dd5b23e429981dd7ef7', '2', '建筑类,新风,大气,模板,简历,专业,Word,简历模板', '1', '1592575115', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('7', '5', '简约应届生Word简历模板', '简约应届生Word简历模板', '0', 'doc', '153648', '5eecc4adc24b8', '简约应届生Word简历模板', '5eecc4adc24b8.doc', '202006190959245453.pdf', '5eecc4bb9d70d.png', '7fdca6ea9286ef3e2039143f1f52f077', '2', '简约,应届,模板,简历,Word,简历模板', '122', '1592575164', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('8', '5', '经典创新风Word简历模板（销售类）', '经典创新风Word简历模板（销售类）', '0', 'doc', '130560', '5eecc4e0d7cea', '经典创新风Word简历模板（销售类）', '5eecc4e0d7cea.doc', '202006191000137457.pdf', '5eecc4ec8d75a.png', 'bb298a94dbd4820d6f0d3249b95f3812', '2', '新风,模板,简历,销售,经典,Word,简历模板', '1', '1592575213', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('9', '5', '商务大气Word简历模板(财务类)', '商务大气Word简历模板(财务类)', '0', 'doc', '78456', '5eecc5162d09d', '商务大气Word简历模板(财务类)', '5eecc5162d09d.doc', '202006191001076397.pdf', '5eecc5232cfe5.png', '89f9cde1c3b44a03f5fc99b92a871e76', '2', '大气,模板,财务,简历,商务,Word,简历模板', '4', '1592575267', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('10', '5', '时尚美观Word简历模板（IT类）', '时尚美观Word简历模板（IT类）', '0', 'doc', '134052', '5eecc54a33fac', '时尚美观Word简历模板（IT类）', '5eecc54a33fac.doc', '202006191001592664.pdf', '5eecc556c3303.png', 'a9601211b1ea6eede7457791dc6ae55b', '2', '美观,模板,简历,时尚,Word,简历模板', '1', '1592575319', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('11', '5', '通用风格严谨Word简历模板（IT类）', '通用风格严谨Word简历模板（IT类）', '0', 'doc', '135553', '5eecc59bcc35e', '通用风格严谨Word简历模板（IT类）', '5eecc59bcc35e.doc', '202006191003209640.pdf', '5eecc5a7b5577.png', '6a034bf96559f00ad5ae01af2144751c', '2', '严谨,模板,通用,风格,简历,Word,简历模板', '1', '1592575400', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('12', '5', '通用正式Word简历模板(财务类)', '通用正式Word简历模板(财务类)', '0', 'doc', '53256', '5eecc602a5fff', '通用正式Word简历模板(财务类)', '5eecc602a5fff.doc', '202006191005309202.pdf', '5eecc629c4871.png', 'a393fdab32d81530c81383bf71ecc96b', '2', '模板,通用,财务,正式,简历,Word,简历模板', '1', '1592575530', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('13', '5', '现代通用Word简历模板(财务类)', '现代通用Word简历模板(财务类)', '0', 'doc', '117626', '5eecc649714fb', '现代通用Word简历模板(财务类)', '5eecc649714fb.doc', '202006191006417640.pdf', '5eecc670e8746.png', 'f05ed0bedc412c8ec5254d0b8ca4e51b', '2', '模板,通用,财务,简历,现代,Word,简历模板', '1', '1592575601', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('14', '5', '应届生正式Word简历模板', '应届生正式Word简历模板', '0', 'doc', '154112', '5eecc724321cc', '应届生正式Word简历模板', '5eecc724321cc.doc', '202006191009525312.pdf', '5eecc72f8f52a.png', '91ea7f41a0a01db87c49a1457c9a8076', '2', '应届,模板,简历,正式,Word,简历模板', '1', '1592575792', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('15', '5', '重点清晰精品商务Word简历模板(人力类)', '重点清晰精品商务Word简历模板(人力类)', '0', 'doc', '225280', '5eecc756ae9d7', '重点清晰精品商务Word简历模板(人力类)', '5eecc756ae9d7.doc', '202006191010428100.pdf', '5eecc761d5c15.png', '958c53f4f264dea773d1c5f343919fa7', '2', '清晰,模板,重点,人力,简历,精品,商务,Word,简历模板', '1', '1592575842', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('16', '5', '专业沉稳人气Word简历模板（建筑类）', '专业沉稳人气Word简历模板（建筑类）', '0', 'doc', '44324', '5eecc78d6a320', '专业沉稳人气Word简历模板（建筑类）', '5eecc78d6a320.doc', '202006191011385918.pdf', '5eecc79991731.png', '3a0e4d9908a7207ab1ee02f7cbd99c4b', '2', '建筑类,沉稳,模板,人气,简历,专业,Word,简历模板', '2', '1592575898', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('17', '5', '专业创新人气Word简历模板（建筑类）', '专业创新人气Word简历模板（建筑类）', '0', 'doc', '95766', '5eecc7c17229a', '专业创新人气Word简历模板（建筑类）', '5eecc7c17229a.doc', '202006191012294674.pdf', '5eecc7cc15049.png', 'a4d4ff4c01ab882be97dfc28cc47e639', '2', '建筑类,模板,人气,创新,简历,专业,Word,简历模板', '3', '1592575949', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('18', '2', '施工现场环境卫生管理方案', '施工现场环境卫生管理方案', '0', 'doc', '25600', '5eecc8322143e', '施工现场环境卫生管理方案', '5eecc8322143e.doc', '202006191014229045.pdf', '5eecc83de6ba8.png', '5d79624126154db29fc1af81a694ad79', '2', '环境卫生,施工,现场,方案,管理,建筑', '1', '1592576062', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('19', '8', '学生居家观察家长承诺书', '学生居家观察家长承诺书', '0', 'doc', '15383', '5eeccd1317aff', '学生居家观察家长承诺书', '5eeccd1317aff.doc', '202006191037152631.pdf', '5eeccd1f488a3.png', '6b4081f219c5faba7799104e40fdd46e', '2', '承诺书,居家,家长,观察,学生,教育', '15', '1592577314', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('20', '1', '神码服云，北大青鸟结业项目参赛作品，网站演示PPT', '神码服云，北大青鸟结业项目参赛作品，网站演示PPT', '0', 'pptx', '2424279', '5eef05837a322', '神码服云', '5eef05837a322.pptx', '202006210538223711.pdf', '5eef062a55c00.png', 'db271c3090e994287bbc6982592cfb6b', '2', '北大青鸟,结业,参赛,演示,项目,作品,网站,神码服云，PPT,互联网', '19', '1592722987', '2', '1');
INSERT INTO `mt_doc_con` VALUES ('21', '8', '幼儿居家观察信息登记表', '', '0', 'xlsx', '14890', '5eef1f029dc36', '幼儿居家观察信息登记表', '5eef1f029dc36.xlsx', '202006210539274214.pdf', '5eef2ace3387d.png', '521d796a2c6a9cc3895e1de7f4be2d91', '2', '登记表,居家,幼儿,观察,信息,教育', '9', '1592729353', '2', '1');

-- ----------------------------
-- Table structure for `mt_flink`
-- ----------------------------
DROP TABLE IF EXISTS `mt_flink`;
CREATE TABLE `mt_flink` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cate_id` smallint(5) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_flink
-- ----------------------------
INSERT INTO `mt_flink` VALUES ('1', '百度', '5ef2f7ca31dd4.gif', 'https://www.baidu.com/', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('2', '360搜索', '5ef2f8f2ae4ed.gif', 'https://www.so.com/', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('3', '阿里云', '5ef2f91201dc4.jpg', 'https://www.aliyun.com', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('4', '搜狗', '5ef2f9589d5c0.gif', 'https://www.sogou.com/', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('5', '支付宝', '5ef2fa310f8ec.gif', 'https://www.alipay.com/', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('6', '微信支付', '5ef2fa5a9bb65.jpg', 'https://pay.weixin.qq.com', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('7', '腾讯云', '5ef2fac7d4345.jpg', 'https://cloud.tencent.com/', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('8', '财付通', '5ef31dcc82676.gif', 'https://www.tenpay.com', '1', '0', '1');
INSERT INTO `mt_flink` VALUES ('9', '美奇云', '5ef3206ab9160.png', 'http://zy13.net/', '1', '0', '1');

-- ----------------------------
-- Table structure for `mt_flink_cate`
-- ----------------------------
DROP TABLE IF EXISTS `mt_flink_cate`;
CREATE TABLE `mt_flink_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_flink_cate
-- ----------------------------
INSERT INTO `mt_flink_cate` VALUES ('1', '图文链接', '255', '1');
INSERT INTO `mt_flink_cate` VALUES ('2', '文字链接', '255', '1');

-- ----------------------------
-- Table structure for `mt_focus`
-- ----------------------------
DROP TABLE IF EXISTS `mt_focus`;
CREATE TABLE `mt_focus` (
  `uid` int(20) NOT NULL,
  `focusuid` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_focus
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_global`
-- ----------------------------
DROP TABLE IF EXISTS `mt_global`;
CREATE TABLE `mt_global` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_global
-- ----------------------------
INSERT INTO `mt_global` VALUES ('web_switch', 'a:3:{s:7:\"doc_con\";s:1:\"2\";s:7:\"comment\";s:1:\"1\";s:5:\"ipban\";s:1:\"0\";}', '');
INSERT INTO `mt_global` VALUES ('score_name', '金币', '');
INSERT INTO `mt_global` VALUES ('score_pay', 'a:5:{s:7:\"isscore\";s:1:\"1\";s:8:\"getscore\";s:1:\"1\";s:6:\"iscash\";s:1:\"1\";s:7:\"getcash\";s:1:\"1\";s:6:\"adtime\";s:2:\"10\";}', '');
INSERT INTO `mt_global` VALUES ('score_item_img', 'a:4:{s:6:\"bwidth\";s:3:\"350\";s:7:\"bheight\";s:3:\"350\";s:6:\"swidth\";s:3:\"210\";s:7:\"sheight\";s:3:\"210\";}', '');
INSERT INTO `mt_global` VALUES ('reg_closed_reason', '<h1>暂时关闭注册</h1>', '');
INSERT INTO `mt_global` VALUES ('reg_status', '1', '');
INSERT INTO `mt_global` VALUES ('attach_path', 'data/upload/', '');
INSERT INTO `mt_global` VALUES ('user_intro_default', '这个家伙太懒，什么都木留下~', '');
INSERT INTO `mt_global` VALUES ('statics_url', '', '');
INSERT INTO `mt_global` VALUES ('verinfo', '2.4', '');
INSERT INTO `mt_global` VALUES ('web_model', '1', '');
INSERT INTO `mt_global` VALUES ('doctype', 'doc|docx|xls|xlsx|ppt|pptx|wps|et|pdf|txt', '');
INSERT INTO `mt_global` VALUES ('ipban_switch', '1', '');
INSERT INTO `mt_global` VALUES ('avatar_size', '24,32,48,64,120,big', '');
INSERT INTO `mt_global` VALUES ('attr_allow_exts', 'jpg,jpeg,png,gif,swf', '');
INSERT INTO `mt_global` VALUES ('attr_allow_size', '10240', '');
INSERT INTO `mt_global` VALUES ('seo_config', 'a:7:{s:6:\"search\";a:3:{s:5:\"title\";s:21:\"搜索 - 美奇文库\";s:8:\"keywords\";s:65:\"学术论文,行业报告,行业资料,word办公文档,pdf模板\";s:11:\"description\";s:332:\"美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。\";}s:5:\"index\";a:3:{s:5:\"title\";s:42:\"美奇文库 - 分享文档，提升效率\";s:8:\"keywords\";s:65:\"学术论文,行业报告,行业资料,word办公文档,pdf模板\";s:11:\"description\";s:332:\"美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。\";}s:7:\"doclist\";a:3:{s:5:\"title\";s:12:\"美奇文库\";s:8:\"keywords\";s:65:\"学术论文,行业报告,行业资料,word办公文档,pdf模板\";s:11:\"description\";s:332:\"美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。\";}s:6:\"doccon\";a:3:{s:5:\"title\";s:12:\"美奇文库\";s:8:\"keywords\";s:65:\"学术论文,行业报告,行业资料,word办公文档,pdf模板\";s:11:\"description\";s:332:\"美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。\";}s:7:\"taglist\";a:3:{s:5:\"title\";s:12:\"美奇文库\";s:8:\"keywords\";s:65:\"学术论文,行业报告,行业资料,word办公文档,pdf模板\";s:11:\"description\";s:332:\"美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。\";}s:7:\"ucenter\";a:3:{s:5:\"title\";s:12:\"美奇文库\";s:8:\"keywords\";s:65:\"学术论文,行业报告,行业资料,word办公文档,pdf模板\";s:11:\"description\";s:332:\"美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。\";}s:6:\"member\";a:3:{s:5:\"title\";s:42:\"美奇文库 - 分享文档，提升效率\";s:8:\"keywords\";s:65:\"学术论文,行业报告,行业资料,word办公文档,pdf模板\";s:11:\"description\";s:332:\"美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。\";}}', '');
INSERT INTO `mt_global` VALUES ('reg_protocol', '本网站所提供的各项服务的所有权和经营权归美奇工作室所有。本协议的解释权归美奇工作室所有。\r\n\r\n    本网站及与其链接网站仅提供求职、招聘及其它与此相关联之服务。个人用户、企业用户行为必须受以下所列条款制约，如若不接受该协议，则不能成为本网站用户，接受本声明之条款，表明你将遵守本协议之规定。该协议一经接受立即生效。本网站保留更新本协议，之后再通知客户的权力。如果您对本网站声明有关本协议的任何更改都是不可接受的，这样您享有的相关资格与服务即被取消;否则本网站将默认您的行为构成对本协议更改的接受。\r\n\r\n   一、用户服务基本条款\r\n\r\n    1. 个人用户\r\n\r\n 个人用户必须同意使用本网站只可用于合法的目的——求职。已注册个人用户可把个人简历通过本网站或直接发送给在本网站已注册的公司。在此种情况下，个人用户个人简历仍然储存在本网站数据库中，但本网站不承诺个人用户个人简历长期储存在本网站数据库中。本网站保留对个人用户个人简历进行修改或修改任何不适信息的权利。未经个人用户的许可，本网站不会把个人用户的个人简历转发给任何未经注册的用户，但通过使用本网站搜索引擎及其他方式的第三方用户有权查询到个人用户的简要资料除外。但是个人用户须同意本网站可以采用其个人资料作为营销的用途。个人用户必须妥善保管在本网站注册的账户名和密码，所有使用上述账号和密码进行的操作均视为个人用户本人所为。个人用户必须独自全部承担由于向企业用户或其他用户发送个人资料所形成的一切风险,本网站对于个人用户的注册信息及个人简历信息的真实性不承担任何责任。本网站对于任何公司（不管它是否在中国境内）与个人用户之间所发生的任何纠纷，概不负责。\r\n\r\n2. 企业用户：包含企业/事业/院校等组织\r\n\r\n 本网站一经确认收到公司所须的相关服务费用，公司即获得享有本网站服务的资格。允许公司可根据双方所签署的书面协议（合同）中约定在本网站发布招聘职位或广告信息。已注册企业用户有权进入本网站人才库进行人才查询，但禁止利用此项权利进行查询人才以外的其他用途，任何用户必须保证不用于包括但不限于下列任何一种用途：\r\n\r\n· 供本网站的竞争同行用此方法寻求与企业用户的业务联络或进行与本网站相竞争的其他活动。\r\n\r\n· 擅自删除或修改任何其他人或本网站公布的资料。\r\n\r\n· 擅自将取自本网站的资料转给第三方使用或向第三方透露。\r\n\r\n 公司须独自对登记在本网站上及其他链接页面上的内容的正确性负责。本网站保留对注册企业用户资料进行修改或删除任何不适信息之权力。本网站保留在适当的时候制订新的服务收费标准的权力。本网站对拒绝接受新的收费标准的公司，保留延缓或终止为该公司服务的权力，而且，本网站的这种行为不构成任何侵权和免于一切损害赔偿。\r\n\r\n 企业用户若购买本网站企业会员服务，即有权进入本网站数据库进行不限量的简历查询，但不得利用此项权利进行查询人才以外的其他用途。\r\n\r\n 本网站提供的其它信息，仅应限于与其相应内容有关的目的而被使用；任何用户不得将任何本网站的信息用作任何商业目的。\r\n\r\n3. 关于信息的公开\r\n\r\n 本网站在未经用户授权同意的情况下，不会将用户的相关资料泄露给第三方。但以下情况除外。\r\n\r\n 根据执法单位之要求或为公共之目的向相关单位提供用户资料；\r\n\r\n 由于您将用户密码告知他人或与他人共享注册账户，由此导致的任何用户资料泄露；\r\n\r\n 由于计算机病毒侵入或发作、黑客攻击，政府管制而造成的暂时性关闭等影响网络正常经营之不可抗力而造成的用户资料泄露、丢失、被盗用或被窜改等；\r\n\r\n 由于与本网站链接的其它网站所造成之用户资料泄露及由此而导致的任何法律争议和后果；\r\n\r\n 为免除访问者在生命、身体或财产方面之急迫危险。\r\n\r\n 本网站因正常的系统维护、系统升级、或者因网络拥塞而导致网站不能访问，本网站不承担任何责任。\r\n\r\n 本网站有权在预先通知或不予通知的情况下终止任何免费服务。\r\n\r\n 所有发给用户的通告都可通过电子邮件或网站公告传送，且在传送后壹日内视为送达。服务条款的修改、服务变更、或其它重要事项都会以此形式进行。\r\n\r\n 在本网站所公开的任何信息，均有可能被任何本网站的访问者浏览，也可能被错误使用。用户承认，任何第三方错误使用信息的行为及其责任，均与本网站无关而应由该第三方承担。\r\n\r\n    4. 信息的准确性\r\n\r\n 企业用户须独自对登记在本网站上及其他链接页面上的内容正确性负责。\r\n\r\n 本网站将不能保证所有由第三方提供的信息，或本网站自行采集的信息完全准确。用户了解，对这些信息的使用，需要经过进一步核实。本网站对访问者未经自行核实误用本网站信息造成的任何损失不予承担任何责任。\r\n\r\n    5. 信息的安全性\r\n\r\n 用户不得破坏或企图破坏本网站或网站的安全规则，其中包括但不限于:接触未经许可的数据或进入未经许可的服务器或帐户; 没有得到许可，企图探查，扫描或测试系统或网络的弱点，或者破坏安全措施； 企图干涉对用户及网络的服务，包括，并不限于，通过超载， \"邮件炸弹\"或\"摧毁\"等手段; 发送促销，产品广告及服务的E-mail； 伪造TCP/IP数据包名称或部分名称。破坏系统或网络可能导致犯罪, 本网站将调查、干预此类破坏行为的发生，并将与执法当局合作，起诉此类破坏行为的使用者。\r\n\r\n 本网站可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与本网站同等的保护用户隐私的责任，则本网站有权将用户的注册资料等提供给该第三方。 在不透露单个用户隐私资料的前提下，本网站有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。 本网站应采取严格的措施，确保会员的隐私信息不被泄露。除非本人同意，或者依预先确定的规则等，会员的个人资料和其他隐私信息不得被公开。\r\n\r\n    6. 明令禁止条款\r\n\r\n 个人用户与企业用户严禁使用本网站试图实现以下所列之目的：\r\n\r\n· 个人用户不能登记（或邮寄）不完全的、错误的个人信息。\r\n\r\n· 个人用户试图获取职位以外的内容；用人单位试图得到个人用户个人简历以外的其他信息。\r\n\r\n· 除了信息的发布者外，任何访问者不得删除或更改其他个人或实体登记的资料。\r\n\r\n 严禁任何用户侵犯或试图侵犯本网站的安全性。包括：登录没有对其授权进入的服务器或帐号；进入没有对其开放的本网站数据库；试图探测或攻击本网站及其系统的薄弱点；试图干扰本网站对用户提供的服务；向用户发送包括促销产品广告或服务之类的未经相关用户允诺的电子邮件。对本网站系统或网络安全造成损害或破坏的所有个人或实体，本网站将依法追究其法律责任。\r\n\r\n 任何用户不得使用本网站传发或储存任何违反适用法律或法规的资料；不得以任何形式侵犯本网站及网站用户的版权、商标权、商业秘密或其他知识产权；不得侵犯个人和社会大众的隐私安全；禁止传输任何非法的、骚扰性的、中伤性的、辱骂性的、恐吓性的、伤害性、庸俗或淫秽的信息。\r\n\r\n   二、版权、商标权等\r\n\r\n 版权：本网站定义的内容包括但不限于：所有图标、图表、文字、字体、声音、相片、录像、软件；广告中的全部内容；电子邮件的全部内容；本网站为用户提供的商业信息。所有这些内容受版权、商标及其他相关法律的保护。没有本网站明确的书面批准，任何个人或实体不能擅自复制，再造这些内容，或创造与内容有关的派生产品。\r\n\r\n　商标：本网站的商标\"美奇\"属于美奇工作室所有。与本网站合作的商标属于合作者所有。未经商标所有者许可任何法人、其他组织、个人不得擅自使用。\r\n\r\n   三、免责条款\r\n\r\n 本网站并无随时监视此系统，但保留对其实施实时监视的权利。对于他方输入的，不是本网站发布的材料，本网站概不负任何法律责任。用户对其在职位数据库公布的材料独立承担一切法律责任。\r\n\r\n 本网站不保证对某一种职位描述会有一定数目的使用者来浏览，也不保证会有一位特定的使用者来浏览。对于其他网址链接在本网址的内容，本网站概不负法律责任。本网站不承诺本网站能够长期无错误运营；不保证其服务器免受病毒或其他机械故障的侵扰。如果任何用户在使用本网站网站时造成需要维修、更换设备或丢失数据的情况，本网站对这些损失不承担任何责任。\r\n\r\n 本网站因正常的系统维护、系统升级，或者因网络拥塞而导致网站不能访问，本网站不承担任何责任。\r\n\r\n 在任何情况下本网站及其领导人、主管、雇员和代理商拒绝对由于用户使用本网站及其内容或不能使用本网站而造成的一切损失提供任何担保。\r\n\r\n 除非法律另有规定，本网站在本合同项下承担的责任（不论是违约还是侵权），仅以本网站所收取的服务费为限，并且本网站不承担任何用户的任何期得利益损失或其他间接损失。\r\n\r\n   四、风险分担\r\n\r\n 用户理解并同意，本网站在本合同项下的义务是为用户提供发布招聘或应聘信息，或获取由他人登记的招聘或应聘信息的互联网软件平台服务，而非提供信息本身，因此任何用户使用本系统将可能承担以下风险：本系统的信息按\"信息提供当时之现状\"提供，本网站对信息不作任何明示的或暗示的保证。本网站不能保证信息的特殊目的不受阻挠或不出错误、不能保证错误一定能得到纠正，也不能保证本系统或制成本系统的信息不会含有病毒或其他有害成分。在涉及有关信息的使用或使用结果方面，本网站对信息的正确性、准确性、可靠性及其他同时不作出任何保证或说明。用户将承担因此而造成的一切必要的服务、修补和改正费用，除非现行的法律法规另有明文规定。\r\n\r\n 由于INTERNET发展的现状，有时线路速度会降低；有时因为网络调整会造成短时的线路中断，用户认同这些属正常情况。但中断时间以每月累计不超过（含）4小时为限（不可抗力除外）。\r\n\r\n   五、风险条款\r\n\r\n 用户应当独自承担由于登录本网站或通过本网站登录到其他站点而形成的全部风险。用户理解并同意其与他人交流信息及发送招聘或应聘意向或建立劳动或劳务关系所造成的后果与本网站无关，用户应自行承担上述行为所造成的后果。如因用户侵犯第三人的权益，使本网站受到第三方的任何索赔、权利主张或处罚，用户应为本网站辩护并使本网站免于任何经济或商誉损失，如用户怠于履行该义务，本网站有权自行采取辩护措施（包括但不限于聘请律师），由此所发生的一切费用及损失，应由用户向本网站作出补偿。 赔偿用户须承诺保障和维护本网站的利益；承诺赔偿由于其违反本协议或使用本网站而造成的对上述人员本网站的损害。\r\n\r\n本网站须承诺为用户提供本协议所规定的服务，承诺赔偿由于本网站违反本协议而对用户造成的损失。\r\n\r\n   六、争议解决\r\n\r\n双方应友好协商，解决彼此之间的分歧或争议。若协商不成，任何一方均有权提交至深圳市仲裁委员会申请仲裁。\r\n\r\n   七、不可抗力\r\n\r\n由于地震、台风、战争、罢工、政府行为、非因各方原因发生的火灾、基础电信网络意外中断造成的及其它不能预见并且对其发生和后果不能防止或避免的不可抗力原因，致使任何一方不能履行其在本协议项下的义务，该方不承担由此给另一方造成的损失；该方应及时通知另一方其不能履行或延迟履行协议义务的原因，并应尽快向另一方提供有关发生不可抗力的证明文件，按不可抗力原因对本协议的影响程度，双方协商是否终止本协议，免除或部分免除本协议的义务。\r\n\r\n   八、适用法律和管辖权限条款\r\n\r\n本协议服从中华人民共和国法律解释；用户与本网站双方都必须遵守中华人民共和国的司法管辖。如发生本协议相关条款与中华人民共和国法律相抵触时，则该条款将按相关法律重新解释，而其他条款则依旧保持对用户产生法律效力和影响。', '');
INSERT INTO `mt_global` VALUES ('integrate_config', '', '');
INSERT INTO `mt_global` VALUES ('integrate_code', 'default', '');
INSERT INTO `mt_global` VALUES ('mail_server', '', '');
INSERT INTO `mt_global` VALUES ('score_rule', 'a:8:{s:8:\"register\";s:2:\"10\";s:13:\"register_nums\";s:1:\"1\";s:5:\"login\";s:2:\"10\";s:10:\"login_nums\";s:1:\"5\";s:7:\"docdown\";s:1:\"0\";s:8:\"docscore\";s:1:\"0\";s:5:\"docup\";s:1:\"0\";s:6:\"docdel\";s:1:\"0\";}', '\r\n');
INSERT INTO `mt_global` VALUES ('statistics_code', '', '');
INSERT INTO `mt_global` VALUES ('site_icp', '蜀ICP备19029089号-2', '');
INSERT INTO `mt_global` VALUES ('site_description', '美奇文库是国内首个提供各行业文档资料下载分享平台,旨在为土木建筑、IT/互联网、环保水务、机电机械、包装印刷、卫生医疗、采矿冶炼、食品饮料、金融银行、电气电力、纺织服装,石油化工等行业从业人员提供一个行业知识共享的学习交流平台。', '');
INSERT INTO `mt_global` VALUES ('site_status', '1', '');
INSERT INTO `mt_global` VALUES ('closed_reason', '网站升级中。。', '');
INSERT INTO `mt_global` VALUES ('site_keyword', '学术论文,行业报告,行业资料,word办公文档,pdf模板', '');
INSERT INTO `mt_global` VALUES ('site_title', '美奇文库 - 分享文档，提升效率', '');
INSERT INTO `mt_global` VALUES ('site_url', 'http://doc.zy13.net', '');
INSERT INTO `mt_global` VALUES ('site_theme', 'blue', '');
INSERT INTO `mt_global` VALUES ('auto_time', '1', '');
INSERT INTO `mt_global` VALUES ('site_name', '美奇文库', '');

-- ----------------------------
-- Table structure for `mt_ipban`
-- ----------------------------
DROP TABLE IF EXISTS `mt_ipban`;
CREATE TABLE `mt_ipban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_ipban
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_itemlog`
-- ----------------------------
DROP TABLE IF EXISTS `mt_itemlog`;
CREATE TABLE `mt_itemlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `itemid` int(5) NOT NULL,
  `typeid` int(5) NOT NULL COMMENT '1:文档',
  `type` int(5) NOT NULL COMMENT '1:下载2:喜欢3:推荐',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_itemlog
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_mail_queue`
-- ----------------------------
DROP TABLE IF EXISTS `mt_mail_queue`;
CREATE TABLE `mt_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_mail_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mt_menu`;
CREATE TABLE `mt_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `action_name` varchar(20) NOT NULL,
  `data` varchar(120) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `often` tinyint(1) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_menu
-- ----------------------------
INSERT INTO `mt_menu` VALUES ('1', '全局', '0', 'global', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('2', '界面', '0', 'view', 'index', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('3', '用户', '0', 'user', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('4', '内容', '0', 'content', 'index', '', '', '0', '4');
INSERT INTO `mt_menu` VALUES ('5', '运营', '0', 'operation', 'index', '', '', '0', '5');
INSERT INTO `mt_menu` VALUES ('6', '工具', '0', 'tools', 'index', '', '', '0', '6');
INSERT INTO `mt_menu` VALUES ('7', '应用', '0', 'app', 'index', '', '', '0', '7');
INSERT INTO `mt_menu` VALUES ('8', '核心设置', '1', 'global', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('9', '站点设置', '8', 'global', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('10', '附件设置', '8', 'global', 'index', '&type=attach', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('11', '邮件设置', '8', 'global', 'index', '&type=mail', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('81', '网站开关', '8', 'global', 'index', '&type=switch', '', '0', '4');
INSERT INTO `mt_menu` VALUES ('12', '用户管理', '3', 'user', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('13', '会员管理', '12', 'user', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('14', '工具集合', '6', 'tools', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('15', '清理缓存', '14', 'cache', 'index', '', '', '0', '5');
INSERT INTO `mt_menu` VALUES ('16', '积分设置', '8', 'score', 'setting', '', '', '0', '4');
INSERT INTO `mt_menu` VALUES ('17', '积分记录', '16', 'score', 'logs', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('18', '积分规则', '16', 'score', 'setting', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('19', '注册选项', '8', 'global', 'index', '&type=register', '', '0', '5');
INSERT INTO `mt_menu` VALUES ('20', 'SEO设置', '8', 'seo', 'page', '', '', '0', '6');
INSERT INTO `mt_menu` VALUES ('21', '用户组管理', '12', 'user_role', 'index', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('22', '会员充值记录', '12', 'recharge', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('30', '会员积分统计', '12', 'user_scoresum', 'index', '', '', '0', '5');
INSERT INTO `mt_menu` VALUES ('23', '界面设置', '2', 'view', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('24', '导航设置', '23', 'nav', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('25', '网站插件', '7', 'app', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('26', '主导航', '24', 'nav', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('27', '底部导航', '24', 'nav', 'index', '&type=bottom', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('28', '登陆插件', '25', 'oauth', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('29', '登陆整合', '25', 'integrate', 'index', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('31', '支付接口', '25', 'payment', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('32', '会员提现记录', '12', 'withdraw', 'index', '', '', '0', '4');
INSERT INTO `mt_menu` VALUES ('33', '数据备份', '14', 'backup', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('34', '数据恢复', '14', 'backup', 'restore', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('35', '在线升级', '14', 'update', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('36', '黑名单管理', '14', 'ipban', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('44', '伪静态设置', '20', 'seo', 'url', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('45', 'SEO设置', '20', 'seo', 'page', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('46', '内容管理', '4', 'content', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('59', '广告管理', '5', 'ad', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('60', '广告管理', '59', 'ad', 'index', '', '', '0', '0');
INSERT INTO `mt_menu` VALUES ('61', '广告位管理', '59', 'adboard', 'index', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('62', '友情链接', '5', 'flink', 'index', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('63', '友情链接', '62', 'flink', 'index', '', '', '0', '0');
INSERT INTO `mt_menu` VALUES ('65', '模版设置', '23', 'view', 'tpl', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('66', '表情管理', '23', 'view', 'expression', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('67', '文档管理', '46', 'doc_con', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('69', '积分商城', '3', 'score_item', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('70', '积分商品', '69', 'score_item', 'index', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('71', '商品分类', '69', 'score_item_cate', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('72', '积分订单', '69', 'score_order', 'index', '', '', '0', '3');
INSERT INTO `mt_menu` VALUES ('73', '添加商品', '70', 'score_item', 'add', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('74', '积分商品', '70', 'score_item', 'index', '', '', '0', '1');
INSERT INTO `mt_menu` VALUES ('75', '站内信管理', '3', 'user_mail', 'index', '', '', '0', '2');
INSERT INTO `mt_menu` VALUES ('76', '系统通知', '75', 'user_mail', 'index', '', '', '0', '0');
INSERT INTO `mt_menu` VALUES ('77', '文档分类', '46', 'doc_cate', 'index', '', '', '0', '5');
INSERT INTO `mt_menu` VALUES ('78', '网站模式', '8', 'global', 'index', '&type=model', '', '0', '10');

-- ----------------------------
-- Table structure for `mt_nav`
-- ----------------------------
DROP TABLE IF EXISTS `mt_nav`;
CREATE TABLE `mt_nav` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `mod` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_nav
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `mt_oauth`;
CREATE TABLE `mt_oauth` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_oauth
-- ----------------------------
INSERT INTO `mt_oauth` VALUES ('1', 'qq', 'QQ登录', 'a:2:{s:7:\"app_key\";s:9:\"100330010\";s:10:\"app_secret\";s:32:\"098381fd5d6a89f44127d61f0f2645da\";}', '申请地址：http://connect.opensns.qq.com/', 'MTCEO', '2', '1');
INSERT INTO `mt_oauth` VALUES ('2', 'sina', '微博登陆', 'a:2:{s:7:\"app_key\";s:10:\"3115666660\";s:10:\"app_secret\";s:32:\"e59677c031210b6d063a2661b6a895cf\";}', '申请地址：http://open.weibo.com/', 'MTCEO', '1', '1');
INSERT INTO `mt_oauth` VALUES ('3', 'taobao', '淘宝登录', 'a:2:{s:7:\"app_key\";s:8:\"21270789\";s:10:\"app_secret\";s:32:\"0c28536510e0b0b429750f478222d549\";}', '申请地址：http://open.taobao.com/', 'MTCEO', '3', '1');

-- ----------------------------
-- Table structure for `mt_payment`
-- ----------------------------
DROP TABLE IF EXISTS `mt_payment`;
CREATE TABLE `mt_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `description` text,
  `logo` varchar(255) DEFAULT NULL,
  `merchant` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `ordid` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0禁用1启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_payment
-- ----------------------------
INSERT INTO `mt_payment` VALUES ('1', '支付宝', 'Alipay', '支付宝 知托付！', '51b70e8a73274.png', '', '', '', '1', '1');
INSERT INTO `mt_payment` VALUES ('2', '财付通', 'Tenpay', '会支付 会生活', '51b70e80ab3e6.png', '', '', '', '0', '1');

-- ----------------------------
-- Table structure for `mt_raty`
-- ----------------------------
DROP TABLE IF EXISTS `mt_raty`;
CREATE TABLE `mt_raty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voter` int(10) NOT NULL DEFAULT '0' COMMENT '评分次数',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '总分',
  `typeid` int(11) NOT NULL DEFAULT '0' COMMENT '1:文档2：活动3：待定',
  `itemid` int(11) NOT NULL COMMENT '内容id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_raty
-- ----------------------------
INSERT INTO `mt_raty` VALUES ('1', '1', '8', '1', '1');

-- ----------------------------
-- Table structure for `mt_raty_user`
-- ----------------------------
DROP TABLE IF EXISTS `mt_raty_user`;
CREATE TABLE `mt_raty_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ratyid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_raty_user
-- ----------------------------
INSERT INTO `mt_raty_user` VALUES ('1', '1', '2', '8');

-- ----------------------------
-- Table structure for `mt_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `mt_recharge`;
CREATE TABLE `mt_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `score` varchar(255) NOT NULL,
  `cash` varchar(255) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `have_pay` tinyint(1) NOT NULL,
  `add_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_recharge
-- ----------------------------
INSERT INTO `mt_recharge` VALUES ('1', 'RECtdBDwNj20200619', '2', 'qq1234', '1', '1', '支付宝', '0', '1592535928', '0');
INSERT INTO `mt_recharge` VALUES ('2', 'REitQFOeBS20200619', '2', 'qq1234', '10', '10', '支付宝', '0', '1592535932', '0');
INSERT INTO `mt_recharge` VALUES ('3', 'REBENQbCAz20200619', '2', 'qq1234', '10', '10', '财付通', '0', '1592535935', '0');

-- ----------------------------
-- Table structure for `mt_score_item`
-- ----------------------------
DROP TABLE IF EXISTS `mt_score_item`;
CREATE TABLE `mt_score_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(120) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：实物；1：虚拟',
  `img` varchar(255) NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_num` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `buy_num` mediumint(8) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_score_item
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_score_item_cate`
-- ----------------------------
DROP TABLE IF EXISTS `mt_score_item_cate`;
CREATE TABLE `mt_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_score_item_cate
-- ----------------------------
INSERT INTO `mt_score_item_cate` VALUES ('2', '美容', '1', '0');
INSERT INTO `mt_score_item_cate` VALUES ('3', '虚拟', '1', '0');
INSERT INTO `mt_score_item_cate` VALUES ('4', '生活', '1', '0');
INSERT INTO `mt_score_item_cate` VALUES ('5', '运动', '1', '0');
INSERT INTO `mt_score_item_cate` VALUES ('6', '吃完', '1', '0');

-- ----------------------------
-- Table structure for `mt_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `mt_score_log`;
CREATE TABLE `mt_score_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_score_log
-- ----------------------------
INSERT INTO `mt_score_log` VALUES ('1', '2', 'qq1234', 'register', '10', '1592535139');
INSERT INTO `mt_score_log` VALUES ('2', '2', 'qq1234', 'login', '10', '1592535139');
INSERT INTO `mt_score_log` VALUES ('3', '2', 'qq1234', 'login', '10', '1592536493');
INSERT INTO `mt_score_log` VALUES ('4', '2', 'qq1234', 'login', '10', '1592550454');
INSERT INTO `mt_score_log` VALUES ('5', '2', 'qq1234', 'login', '10', '1592551932');
INSERT INTO `mt_score_log` VALUES ('6', '2', 'qq1234', 'login', '10', '1592555314');
INSERT INTO `mt_score_log` VALUES ('7', '2', 'qq1234', 'login', '10', '1592559387');
INSERT INTO `mt_score_log` VALUES ('8', '2', 'qq1234', 'login', '10', '1592559533');
INSERT INTO `mt_score_log` VALUES ('9', '2', 'qq1234', 'login', '10', '1592561258');
INSERT INTO `mt_score_log` VALUES ('10', '2', 'qq1234', 'login', '10', '1592575013');
INSERT INTO `mt_score_log` VALUES ('11', '2', 'qq1234', 'login', '10', '1592720322');
INSERT INTO `mt_score_log` VALUES ('12', '2', 'qq1234', 'login', '10', '1592746966');
INSERT INTO `mt_score_log` VALUES ('13', '2', 'qq1234', 'login', '10', '1592975673');
INSERT INTO `mt_score_log` VALUES ('14', '2', 'qq1234', 'login', '10', '1592993221');
INSERT INTO `mt_score_log` VALUES ('15', '2', 'qq1234', 'login', '10', '1592994097');
INSERT INTO `mt_score_log` VALUES ('16', '2', 'qq1234', 'login', '10', '1592994300');
INSERT INTO `mt_score_log` VALUES ('17', '2', 'qq1234', 'login', '10', '1592994755');

-- ----------------------------
-- Table structure for `mt_score_order`
-- ----------------------------
DROP TABLE IF EXISTS `mt_score_order`;
CREATE TABLE `mt_score_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_name` varchar(120) NOT NULL,
  `item_num` mediumint(8) NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_score` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_score_order
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_tag`
-- ----------------------------
DROP TABLE IF EXISTS `mt_tag`;
CREATE TABLE `mt_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_tag
-- ----------------------------
INSERT INTO `mt_tag` VALUES ('1', 'doc', '2');
INSERT INTO `mt_tag` VALUES ('2', '建筑', '29');
INSERT INTO `mt_tag` VALUES ('3', 'docx', '3');
INSERT INTO `mt_tag` VALUES ('4', '办公文档', '3');
INSERT INTO `mt_tag` VALUES ('5', '环境卫生', '26');
INSERT INTO `mt_tag` VALUES ('6', '工地', '25');
INSERT INTO `mt_tag` VALUES ('7', '方案', '26');
INSERT INTO `mt_tag` VALUES ('8', '管理', '26');
INSERT INTO `mt_tag` VALUES ('9', '分明', '2');
INSERT INTO `mt_tag` VALUES ('10', '层次', '2');
INSERT INTO `mt_tag` VALUES ('11', '模板', '17');
INSERT INTO `mt_tag` VALUES ('12', '人力', '3');
INSERT INTO `mt_tag` VALUES ('13', '简历', '25');
INSERT INTO `mt_tag` VALUES ('14', '精品', '3');
INSERT INTO `mt_tag` VALUES ('15', 'Word', '17');
INSERT INTO `mt_tag` VALUES ('16', '简历模板', '26');
INSERT INTO `mt_tag` VALUES ('17', '严谨', '2');
INSERT INTO `mt_tag` VALUES ('18', '风格', '3');
INSERT INTO `mt_tag` VALUES ('19', '创新', '4');
INSERT INTO `mt_tag` VALUES ('20', '销售', '2');
INSERT INTO `mt_tag` VALUES ('21', '专业', '4');
INSERT INTO `mt_tag` VALUES ('22', '美观', '2');
INSERT INTO `mt_tag` VALUES ('23', '建筑类', '3');
INSERT INTO `mt_tag` VALUES ('24', '新风', '2');
INSERT INTO `mt_tag` VALUES ('25', '大气', '2');
INSERT INTO `mt_tag` VALUES ('26', '简约', '1');
INSERT INTO `mt_tag` VALUES ('27', '应届', '2');
INSERT INTO `mt_tag` VALUES ('28', '经典', '1');
INSERT INTO `mt_tag` VALUES ('29', '财务', '3');
INSERT INTO `mt_tag` VALUES ('30', '商务', '2');
INSERT INTO `mt_tag` VALUES ('31', '时尚', '1');
INSERT INTO `mt_tag` VALUES ('32', '通用', '3');
INSERT INTO `mt_tag` VALUES ('33', '正式', '2');
INSERT INTO `mt_tag` VALUES ('34', '现代', '1');
INSERT INTO `mt_tag` VALUES ('35', '清晰', '1');
INSERT INTO `mt_tag` VALUES ('36', '重点', '1');
INSERT INTO `mt_tag` VALUES ('37', '沉稳', '1');
INSERT INTO `mt_tag` VALUES ('38', '人气', '2');
INSERT INTO `mt_tag` VALUES ('39', '施工', '1');
INSERT INTO `mt_tag` VALUES ('40', '现场', '1');
INSERT INTO `mt_tag` VALUES ('41', '承诺书', '4');
INSERT INTO `mt_tag` VALUES ('42', '居家', '13');
INSERT INTO `mt_tag` VALUES ('43', '家长', '4');
INSERT INTO `mt_tag` VALUES ('44', '观察', '13');
INSERT INTO `mt_tag` VALUES ('45', '学生', '4');
INSERT INTO `mt_tag` VALUES ('46', '教育', '12');
INSERT INTO `mt_tag` VALUES ('47', '登记表', '9');
INSERT INTO `mt_tag` VALUES ('48', '幼儿', '9');
INSERT INTO `mt_tag` VALUES ('49', '信息', '9');
INSERT INTO `mt_tag` VALUES ('50', '美奇', '10');
INSERT INTO `mt_tag` VALUES ('51', '兑换', '10');
INSERT INTO `mt_tag` VALUES ('52', '接口', '10');
INSERT INTO `mt_tag` VALUES ('53', '说明', '7');
INSERT INTO `mt_tag` VALUES ('54', '平台', '10');
INSERT INTO `mt_tag` VALUES ('55', '互联网', '23');
INSERT INTO `mt_tag` VALUES ('56', '花名册', '1');
INSERT INTO `mt_tag` VALUES ('57', '农民工', '1');
INSERT INTO `mt_tag` VALUES ('58', '北大青鸟', '12');
INSERT INTO `mt_tag` VALUES ('59', '结业', '12');
INSERT INTO `mt_tag` VALUES ('60', '参赛', '12');
INSERT INTO `mt_tag` VALUES ('61', '演示', '12');
INSERT INTO `mt_tag` VALUES ('62', '项目', '12');
INSERT INTO `mt_tag` VALUES ('63', '作品', '12');
INSERT INTO `mt_tag` VALUES ('64', '网站', '12');
INSERT INTO `mt_tag` VALUES ('65', '神码服云，PPT', '12');
INSERT INTO `mt_tag` VALUES ('66', 'PPT', '1');
INSERT INTO `mt_tag` VALUES ('67', '说明书', '3');
INSERT INTO `mt_tag` VALUES ('68', '黄媚', '8');

-- ----------------------------
-- Table structure for `mt_topiclog`
-- ----------------------------
DROP TABLE IF EXISTS `mt_topiclog`;
CREATE TABLE `mt_topiclog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `itemid` int(5) NOT NULL,
  `type` int(5) NOT NULL COMMENT '1:喜欢',
  `istopic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_topiclog
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_user`
-- ----------------------------
DROP TABLE IF EXISTS `mt_user`;
CREATE TABLE `mt_user` (
  `uid` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `uc_id` tinyint(1) NOT NULL DEFAULT '0',
  `roleid` int(10) NOT NULL DEFAULT '2',
  `add_time` int(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_user
-- ----------------------------
INSERT INTO `mt_user` VALUES ('1', 'admin', '4e67f3a592603ce86f40d07012e418e9', 'admin@qq.com', '1', '0', '1', '1592535046');
INSERT INTO `mt_user` VALUES ('2', 'qq1234', '4e67f3a592603ce86f40d07012e418e9', '97887526@qq.com', '1', '0', '2', '1592535139');

-- ----------------------------
-- Table structure for `mt_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `mt_userinfo`;
CREATE TABLE `mt_userinfo` (
  `uid` int(20) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男，0女，2保密',
  `tags` varchar(50) NOT NULL COMMENT '个人标签',
  `intro` varchar(500) NOT NULL,
  `byear` smallint(4) unsigned NOT NULL,
  `bmonth` tinyint(2) unsigned NOT NULL,
  `bday` tinyint(2) unsigned NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `county` varchar(20) NOT NULL,
  `contact` int(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_userinfo
-- ----------------------------
INSERT INTO `mt_userinfo` VALUES ('1', '1', '管理员', '我是管理员', '1980', '8', '1', '北京市', '北京市', '东城区', '10');
INSERT INTO `mt_userinfo` VALUES ('2', '0', '', '这个家伙太懒，什么都木留下~', '0', '0', '0', '', '', '', '0');

-- ----------------------------
-- Table structure for `mt_user_bind`
-- ----------------------------
DROP TABLE IF EXISTS `mt_user_bind`;
CREATE TABLE `mt_user_bind` (
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(60) NOT NULL,
  `keyid` varchar(100) NOT NULL,
  `info` text NOT NULL,
  KEY `uid` (`uid`),
  KEY `uid_type` (`uid`,`type`),
  KEY `type_keyid` (`type`,`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_user_bind
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_user_mail`
-- ----------------------------
DROP TABLE IF EXISTS `mt_user_mail`;
CREATE TABLE `mt_user_mail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `fromid` int(10) NOT NULL,
  `toid` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `info` varchar(255) NOT NULL,
  `re_id` int(10) NOT NULL,
  `is_sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:私信，1:通知',
  `add_time` int(10) NOT NULL,
  `new` tinyint(1) NOT NULL DEFAULT '1',
  `pb` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_user_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `mt_user_role`;
CREATE TABLE `mt_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_user_role
-- ----------------------------
INSERT INTO `mt_user_role` VALUES ('1', '管理员', '0', '1', '1');
INSERT INTO `mt_user_role` VALUES ('2', '新手上路', '0', '1', '0');

-- ----------------------------
-- Table structure for `mt_user_scoresum`
-- ----------------------------
DROP TABLE IF EXISTS `mt_user_scoresum`;
CREATE TABLE `mt_user_scoresum` (
  `uid` int(20) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '总积分',
  `doc` int(10) NOT NULL DEFAULT '0' COMMENT '文档所得',
  `down` int(10) NOT NULL DEFAULT '0' COMMENT '下载花费',
  `up` int(10) NOT NULL DEFAULT '0' COMMENT '上传所得',
  `pay` int(10) NOT NULL DEFAULT '0' COMMENT '充值所得',
  `chengfa` int(10) NOT NULL DEFAULT '0' COMMENT '惩罚',
  `register` int(10) NOT NULL DEFAULT '0' COMMENT '注册所得',
  `login` int(10) NOT NULL DEFAULT '0' COMMENT '登录所得',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '论坛兑换',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_user_scoresum
-- ----------------------------
INSERT INTO `mt_user_scoresum` VALUES ('1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `mt_user_scoresum` VALUES ('2', '170', '0', '0', '0', '0', '0', '10', '160', '0');

-- ----------------------------
-- Table structure for `mt_user_stat`
-- ----------------------------
DROP TABLE IF EXISTS `mt_user_stat`;
CREATE TABLE `mt_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_user_stat
-- ----------------------------
INSERT INTO `mt_user_stat` VALUES ('2', 'register', '1', '0');
INSERT INTO `mt_user_stat` VALUES ('2', 'login', '1', '0');

-- ----------------------------
-- Table structure for `mt_withdraw`
-- ----------------------------
DROP TABLE IF EXISTS `mt_withdraw`;
CREATE TABLE `mt_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `cash` varchar(255) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `user_account` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_withdraw
-- ----------------------------

-- ----------------------------
-- Table structure for `mt_zj`
-- ----------------------------
DROP TABLE IF EXISTS `mt_zj`;
CREATE TABLE `mt_zj` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `cateid` int(10) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `uid` int(20) NOT NULL,
  `add_time` int(10) NOT NULL,
  `tuijian` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `zhiding` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mt_zj
-- ----------------------------
