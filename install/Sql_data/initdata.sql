-- 主机: www.mtceo.net

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `mtceo`
--
--
-- 导出表中的数据 `mt_user_role`
--

INSERT INTO `mt_user_role` (`id`, `name`, `score`, `status`, `isAdmin`) VALUES
(1, '管理员', 0, 1, 1),
(2, '新手上路', 0, 1, 0);
--
-- 导出表中的数据 `mt_adboard`
--

INSERT INTO `mt_adboard` (`id`, `name`, `tpl`, `width`, `height`, `description`, `status`) VALUES
(1, '文档预览前广告', 'indexfocus', 440, 400, '', 1),
(2, '首页顶部伸缩广告', 'banner', 960, 90, '', 1),
(3, '导航下方横幅', 'banner', 960, 90, '', 1),
(4, '底部横幅', 'banner', 960, 90, '', 1),
(5, '详细页评论下方', 'banner', 390, 90, '', 1);

--
-- 导出表中的数据 `mt_menu`
--

INSERT INTO `mt_menu` (`id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`) VALUES
(1, '全局', 0, 'global', 'index', '', '', 0, 1),
(2, '界面', 0, 'view', 'index', '', '', 0, 2),
(3, '用户', 0, 'user', 'index', '', '', 0, 3),
(4, '内容', 0, 'content', 'index', '', '', 0, 4),
(5, '运营', 0, 'operation', 'index', '', '', 0, 5),
(6, '工具', 0, 'tools', 'index', '', '', 0, 6),
(7, '应用', 0, 'app', 'index', '', '', 0, 7),
(8, '核心设置', 1, 'global', 'index', '', '', 0, 1),
(9, '站点设置', 8, 'global', 'index', '', '', 0, 1),
(10, '附件设置', 8, 'global', 'index', '&type=attach', '', 0, 2),
(11, '邮件设置', 8, 'global', 'index', '&type=mail', '', 0, 3),
(81, '网站开关', 8, 'global', 'index', '&type=switch', '', 0, 4),
(12, '用户管理', 3, 'user', 'index', '', '', 0, 1),
(13, '会员管理', 12, 'user', 'index', '', '', 0, 1),
(14, '工具集合', 6, 'tools', 'index', '', '', 0, 1),
(15, '清理缓存', 14, 'cache', 'index', '', '', 0, 5),
(16, '积分设置', 8, 'score', 'setting', '', '', 0, 4),
(17, '积分记录', 16, 'score', 'logs', '', '', 0, 2),
(18, '积分规则', 16, 'score', 'setting', '', '', 0, 1),
(19, '注册选项', 8, 'global', 'index', '&type=register', '', 0, 5),
(20, 'SEO设置', 8, 'seo', 'page', '', '', 0, 6),
(21, '用户组管理', 12, 'user_role', 'index', '', '', 0, 2),
(22, '会员充值记录', 12, 'recharge', 'index', '', '', 0, 3),
(30, '会员积分统计', 12, 'user_scoresum', 'index', '', '', 0, 5),
(23, '界面设置', 2, 'view', 'index', '', '', 0, 1),
(24, '导航设置', 23, 'nav', 'index', '', '', 0, 1),
(25, '网站插件', 7, 'app', 'index', '', '', 0, 1),
(26, '主导航', 24, 'nav', 'index', '', '', 0, 1),
(27, '底部导航', 24, 'nav', 'index', '&type=bottom', '', 0, 2),
(28, '登陆插件', 25, 'oauth', 'index', '', '', 0, 1),
(29, '登陆整合', 25, 'integrate', 'index', '', '', 0, 2),
(31, '支付接口', 25, 'payment', 'index', '', '', 0, 3),
(32, '会员提现记录', 12, 'withdraw', 'index', '', '', 0, 4),
(33, '数据备份', 14, 'backup', 'index', '', '', 0, 1),
(34, '数据恢复', 14, 'backup', 'restore', '', '', 0, 2),
(35, '在线升级', 14, 'update', 'index', '', '', 0, 3),
(36, '黑名单管理', 14, 'ipban', 'index', '', '', 0, 3),
(44, '伪静态设置', 20, 'seo', 'url', '', '', 0, 2),
(45, 'SEO设置', 20, 'seo', 'page', '', '', 0, 1),
(46, '内容管理', 4, 'content', 'index', '', '', 0, 1),
(59, '广告管理', 5, 'ad', 'index', '', '', 0, 1),
(60, '广告管理', 59, 'ad', 'index', '', '', 0, 0),
(61, '广告位管理', 59, 'adboard', 'index', '', '', 0, 2),
(62, '友情链接', 5, 'flink', 'index', '', '', 0, 2),
(63, '友情链接', 62, 'flink', 'index', '', '', 0, 0),
(65, '模版设置', 23, 'view', 'tpl', '', '', 0, 2),
(66, '表情管理', 23, 'view', 'expression', '', '', 0, 3),
(67, '文档管理', 46, 'doc_con', 'index', '', '', 0, 3),
(69, '积分商城', 3, 'score_item', 'index', '', '', 0, 3),
(70, '积分商品', 69, 'score_item', 'index', '', '', 0, 2),
(71, '商品分类', 69, 'score_item_cate', 'index', '', '', 0, 1),
(72, '积分订单', 69, 'score_order', 'index', '', '', 0, 3),
(73, '添加商品', 70, 'score_item', 'add', '', '', 0, 2),
(74, '积分商品', 70, 'score_item', 'index', '', '', 0, 1),
(75, '站内信管理', 3, 'user_mail', 'index', '', '', 0, 2),
(76, '系统通知', 75, 'user_mail', 'index', '', '', 0, 0),
(77, '文档分类', 46, 'doc_cate', 'index', '', '', 0, 5),
(78, '网站模式', 8, 'global', 'index', '&type=model', '', 0, 10);
--
-- 导出表中的数据 `mt_oauth`
--

INSERT INTO `mt_oauth` (`id`, `code`, `name`, `config`, `desc`, `author`, `ordid`, `status`) VALUES
(1, 'qq', 'QQ登录', 'a:2:{s:7:"app_key";s:9:"100330010";s:10:"app_secret";s:32:"098381fd5d6a89f44127d61f0f2645da";}', '申请地址：http://connect.opensns.qq.com/', 'MTCEO', 2, 1),
(2, 'sina', '微博登陆', 'a:2:{s:7:"app_key";s:10:"3115666660";s:10:"app_secret";s:32:"e59677c031210b6d063a2661b6a895cf";}', '申请地址：http://open.weibo.com/', 'MTCEO', 1, 1),
(3, 'taobao', '淘宝登录', 'a:2:{s:7:"app_key";s:8:"21270789";s:10:"app_secret";s:32:"0c28536510e0b0b429750f478222d549";}', '申请地址：http://open.taobao.com/', 'MTCEO', 3, 1);


--
-- 导出表中的数据 `mt_global`--

INSERT INTO `mt_global` (`name`, `data`, `remark`) VALUES
('web_switch', 'a:3:{s:7:"doc_con";s:1:"2";s:7:"comment";s:1:"1";s:5:"ipban";s:1:"0";}', ''),
('score_name', '金币', ''),
('score_pay', 'a:5:{s:7:"isscore";s:1:"1";s:8:"getscore";s:1:"1";s:6:"iscash";s:1:"1";s:7:"getcash";s:1:"1";s:6:"adtime";s:2:"10";}', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('reg_status', '1', ''),
('attach_path', 'data/upload/', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('statics_url', '', ''),
('verinfo', '2.4', ''),
('web_model', '1', ''),
('doctype', 'doc|docx|xls|xlsx|ppt|pptx|wps|et|pdf|txt', ''),
('ipban_switch', '1', ''),
('avatar_size', '24,32,48,64,120,big', ''),
('attr_allow_exts', 'jpg,jpeg,png,gif,swf', ''),
('attr_allow_size', '2048', ''),
('seo_config', '', ''),
('reg_protocol', '注册协议', ''),
('integrate_config', '', ''),
('integrate_code', 'default', ''),
('mail_server', '', ''),
('score_rule', 'a:8:{s:8:"register";s:2:"10";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"docdown";s:1:"0";s:8:"docscore";s:1:"0";s:5:"docup";s:1:"0";s:6:"docdel";s:1:"0";}', '\r\n'),
('statistics_code', '', ''),
('site_icp', '浙ICP备0000000号', ''),
('site_description', 'mtceo', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_keyword', 'mtceo', ''),
('site_title', 'mtceo', ''),
('site_url', 'http://www.mtceo.net', ''),
('site_theme', 'blue', ''),
('auto_time', '1', ''),
('site_name', 'www.mtceo.net', '');
--
-- 导出表中的数据 `mt_user_role`
--

INSERT INTO `mt_user_role` (`id`, `name`, `score`, `status`, `isAdmin`) VALUES
(1, '管理员', 0, 1, 1),
(2, '新手上路', 200, 1, 0);
--
-- 导出表中的数据 `mt_userinfo`
--

INSERT INTO `mt_userinfo` (`uid`, `gender`, `tags`, `intro`, `byear`, `bmonth`, `bday`, `province`, `city`, `county`, `contact`) VALUES
(1, 1, '管理员', '我是管理员', 1980, 8, 1, '北京市', '北京市', '东城区', '010-00000000');

INSERT INTO `mt_user_scoresum` (`uid`, `score`) VALUES
(1, 0);
INSERT INTO `mt_payment` (`id`, `name`, `mark`, `description`, `logo`, `merchant`, `account`, `key`, `ordid`, `status`) VALUES
(1, '支付宝', 'Alipay', '支付宝 知托付！', '51b70e8a73274.png', '', '', '', 1, 1),
(2, '财付通', 'Tenpay', '会支付 会生活', '51b70e80ab3e6.png', '', '', '', 0, 1);


INSERT INTO `mt_score_item_cate` (`id`, `name`, `status`, `ordid`) VALUES
(2, '美容', 1, 0),
(3, '虚拟', 1, 0),
(4, '生活', 1, 0),
(5, '运动', 1, 0),
(6, '吃完', 1, 0);

INSERT INTO `mt_flink_cate` (`id`, `name`, `ordid`, `status`) VALUES
(1, '图文链接', 255, 1),
(2, '文字链接', 255, 1);