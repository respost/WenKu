<?php if (!defined('THINK_PATH')) exit();?><!doctype html><html class="off"><head><meta charset="utf-8" /><link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/style.css" /><title><?php echo L('website_manage');?></title><script>	var URL = '__URL__';
	
	var SELF = '__SELF__';
	var ROOT_PATH = '__ROOT__';
	var APP	 =	 '__APP__';
	//语言项目
	var lang = new Object();
	<?php $_result=L('js_lang');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?>lang.<?php echo ($key); ?> = "<?php echo ($val); ?>";<?php endforeach; endif; else: echo "" ;endif; ?></script></head><body scroll="no"><div id="header"><div class="logo"><a href="#" title="<?php echo L('website_manage');?>"></a></div><div class="fr"><div class="cut_line admin_info tr"><a href="./" target="_blank"><?php echo L('site_home');?></a><span class="cut">|</span><a href="javascript:;" title="<?php echo L('common_menu_set');?>" id="J_often_menu"	class="often_menu" data-uri="<?php echo U('index/often_menu');?>" hidefocus="true"><?php echo L('common_menu_set');?></a><span class="cut">|</span><span class="mr10"><?php echo ($my_admin["username"]); ?></span><a href="<?php echo u('index/logout');?>">[<?php echo L('logout');?>]</a></div></div><ul class="nav white" id="J_tmenu"><li class="top_menu"><a href="javascript:;" data-id="0"
		hidefocus="true" style="outline: none;">控制台</a></li><?php if(is_array($top_menus)): $i = 0; $__LIST__ = $top_menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><li class="top_menu"><a href="javascript:;" data-id="<?php echo ($val["id"]); ?>"
		hidefocus="true" style="outline: none;"><?php echo L($val['name']);?></a></li><?php endforeach; endif; else: echo "" ;endif; ?></ul></div><div id="content"><div class="left_menu fl"><div id="J_lmenu" class="J_lmenu" data-uri="<?php echo U('index/left');?>"></div><a href="javascript:;" id="J_lmoc"	style="outline-style: none; outline-color: invert; outline-width: medium;"
	hidefocus="true" class="open" title="<?php echo L('expand_or_contract');?>"></a></div><div class="right_main"><div class="crumbs"><div class="options"><a href="javascript:;"	title="<?php echo L('refresh_page');?>" id="J_refresh" class="refresh"
	hidefocus="true"><?php echo L('refresh_page');?></a><a href="javascript:;"
	title="<?php echo L('full_screen');?>" id="J_full_screen" class="admin_full"
	hidefocus="true"><?php echo L('full_screen');?></a><a href="javascript:;"	title="<?php echo L('flush_cache');?>" id="J_flush_cache" class="flush_cache"	data-uri="<?php echo U('cache/qclear');?>" hidefocus="true"><?php echo L('flush_cache');?></a><a href="javascript:;" title="<?php echo L('background_map');?>" id="J_admin_map"	class="admin_map" data-uri="<?php echo U('index/map');?>" hidefocus="true"><?php echo L('background_map');?></a></div><div id="J_mtab" class="mtab"><a href="javascript:;" id="J_prev"	class="mtab_pre fl" title="上一页">上一页</a><a href="javascript:;"	id="J_next" class="mtab_next fr" title="下一页">下一页</a><div class="mtab_p"><div class="mtab_b"><ul id="J_mtab_h" class="mtab_h"><li class="current" data-id="0"><span><a>后台首页</a></span></li></ul></div></div></div></div><div id="J_rframe" class="rframe_b"><iframe id="rframe_0"
	src="<?php echo U('index/panel');?>" frameborder="0" scrolling="auto"
	style="height: 100%; width: 100%;"></iframe></div></div></div><script src="__PUBLIC__/js/jquery-1.8.3.js"></script><script src="__PUBLIC__/js/mtceo.js"></script><script>//初始化弹窗
(function (d) {
    d['okValue'] = lang.dialog_ok;
    d['cancelValue'] = lang.dialog_cancel;
    d['title'] = lang.dialog_title;
})($.dialog.defaults);
</script><script src="__PUBLIC__/js/adminindex.js"></script></body></html>