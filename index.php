<?php
/**
 *  ┏┻━━━━━┻┓
 *  ┃　　　　　　  ┃
 *  ┃ ┳┛　  ┗┳ ┃
 *  ┃　　　┻　　  ┃
 *  ┗━┓　┏━━━┛
 *      ┃　┃神兽 保佑
 *      ┃　┃代码无BUG
 *      ┃　┗━━━━━━━━━┓
 *      ┃  资源驿站 zy13.net   ┣┓
 *      ┃　　 QQ:97887526　  ┏┛
 *      ┗━┓  ┏━━━┓  ┏┛
 *          ┗━┛      ┗━┛
 */ 
 
if (!is_file('./data/install.lock')) {
	header('Location: ./install.php');
	exit;
}
define('HOST','http://'.$_SERVER['HTTP_HOST']);
/* 应用名称*/
define('APP_NAME', 'app');
/* 应用目录*/
define('APP_PATH', './app/');
/* 数据目录*/
define('MT_DATA_PATH', './data/');
/* 配置文件目录*/
define('CONF_PATH', MT_DATA_PATH . 'config/');
/* 数据目录*/
define('RUNTIME_PATH', MT_DATA_PATH . 'runtime/');
/* HTML静态文件目录*/
define('HTML_PATH', MT_DATA_PATH . 'html/');
/* DEBUG调试开关*/
define('APP_DEBUG', false);
require("./mtceo/mtceo.php");