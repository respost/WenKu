-- 主机: www.mtceo.net


SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `mtceo`
--

-- --------------------------------------------------------
--
-- 表的结构 `mt_user_scoresum`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_ad`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mt_adboard`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mt_admin_auth`
--

DROP TABLE IF EXISTS `mt_admin_auth`;
CREATE TABLE `mt_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mt_badword`
--

DROP TABLE IF EXISTS `mt_badword`;
CREATE TABLE `mt_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- 表的结构 `mt_article_cate`
--

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
--
-- 表的结构 `mt_doc_cate`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_article`
--

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


--
-- 表的结构 `mt_doc_con`
--

DROP TABLE IF EXISTS `mt_doc_con`;
CREATE TABLE `mt_doc_con` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` smallint(4) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `score` int(10) NOT NULL  DEFAULT '0',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- 表的结构 `mt_zj`
--

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


--
-- 表的结构 `mt_comment`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


-- --------------------------------------------------------


--
-- 表的结构 `mt_flink`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mt_flink_cate`
--

DROP TABLE IF EXISTS `mt_flink_cate`;
CREATE TABLE `mt_flink_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- 表的结构 `mt_global`
--

DROP TABLE IF EXISTS `mt_global`;
CREATE TABLE `mt_global` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



--
-- 表的结构 `mt_ipban`
--

DROP TABLE IF EXISTS `mt_ipban`;
CREATE TABLE `mt_ipban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mt_menu`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `mt_nav`
--

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

-- --------------------------------------------------------

--
-- 表的结构 `mt_oauth`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mt_score_log`
--
DROP TABLE IF EXISTS `mt_score_log`;
CREATE TABLE `mt_score_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- 表的结构 `mt_user`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mt_userinfo`
--

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

-- --------------------------------------------------------

--
-- 表的结构 `mt_user_role`
--

DROP TABLE IF EXISTS `mt_user_role`;
CREATE TABLE `mt_user_role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_user_stat`
--

DROP TABLE IF EXISTS `mt_user_stat`;
CREATE TABLE `mt_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_user_bind`
--

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

--
-- 表的结构 `mt_user_mail`
--

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



--
-- 表的结构 `mt_focus`
--

DROP TABLE IF EXISTS `mt_focus`;
CREATE TABLE `mt_focus` (
  `uid` int(20) NOT NULL,
  `focusuid` int(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_bindmail`
--

DROP TABLE IF EXISTS `mt_bindmail`;
CREATE TABLE `mt_bindmail` (
  `uid` int(20) NOT NULL,
  `bind` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- 表的结构 `mt_itemlog`
--

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

--
-- 表的结构 `mt_topiclog`
--

DROP TABLE IF EXISTS `mt_topiclog`;
CREATE TABLE `mt_topiclog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `itemid` int(5) NOT NULL,
  `type` int(5) NOT NULL COMMENT '1:喜欢',
  `istopic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- 表的结构 `mt_raty`
--

DROP TABLE IF EXISTS `mt_raty`;
CREATE TABLE `mt_raty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voter` int(10) NOT NULL DEFAULT '0' COMMENT '评分次数',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '总分',
  `typeid` int(11) NOT NULL DEFAULT '0' COMMENT '1:文档2：活动3：待定',
  `itemid` int(11) NOT NULL COMMENT '内容id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_raty_user`
--

DROP TABLE IF EXISTS `mt_raty_user`;
CREATE TABLE `mt_raty_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ratyid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_tag`
--

DROP TABLE IF EXISTS `mt_tag`;
CREATE TABLE `mt_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_recharge`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- 表的结构 `mt_withdraw`
--

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



--
-- 表的结构 `mt_payment`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- 表的结构 `mt_score_order`
--

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

--
-- 表的结构 `mt_score_item_cate`
--

DROP TABLE IF EXISTS `mt_score_item_cate`;
CREATE TABLE `mt_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


--
-- 表的结构 `mt_score_item`
--

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


表的结构 `mt_mail_queue`

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
)ENGINE=MyISAM DEFAULT CHARSET=utf8;