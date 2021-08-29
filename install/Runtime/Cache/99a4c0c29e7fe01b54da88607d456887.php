<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo L('page_title');?></title>
<link rel="stylesheet" type="text/css" href="__TMPL__public/css/install.css" />
<script type="text/javascript" src="__TMPL__public/js/jquery.js"></script>
</head>

<body>
<div class="header">
<div class="logo fl"></div>
<div class="fr">
<ul class="top_nav fr">
	<li><a href="http://bbs.mtceo.net/" target="_blank"><?php echo L('official_bbs');?></a></li>
	<li><a href="http://www.mtceo.net/" target="_blank"><?php echo L('user_manual');?></a></li>
</ul>
<h2 class="fr"><?php echo L('wellcom_user_mtceo');?></h2>
</div>

</div>
<div class="content">
<div class="step fl">
<h3></h3>
<ul>
	<li <?php if($step_curr == 'eula'): ?>class="curr"<?php endif; ?> ><span>1</span>
	<h4><?php echo L('step_eula');?></h4>
	</li>
	<li <?php if($step_curr == 'check'): ?>class="curr"<?php endif; ?> ><span>2</span>
	<h4><?php echo L('step_check');?></h4>
	</li>
	<li <?php if($step_curr == 'setconf'): ?>class="curr"<?php endif; ?> ><span>3</span>
	<h4><?php echo L('step_setconf');?></h4>
	</li>
	<li <?php if($step_curr == 'install'): ?>class="curr"<?php endif; ?> ><span>4</span>
	<h4><?php echo L('step_install');?></h4>
	</li>
	<li <?php if($step_curr == 'finish'): ?>class="curr"<?php endif; ?> ><span>5</span>
	<h4><?php echo L('step_finish');?></h4>
	</li>
</ul>
</div>
<div class="c_main fr">
<form action="<?php echo U('setconf');?>" method="post">
<div class="c_main_title"><?php echo L('step_setconf_desc');?></div>
<div class="c_main_body setconf"><?php if(isset($error_msg)): ?><div class="error_msg"><?php echo ($error_msg); ?></div><?php endif; ?>
<fieldset><legend><?php echo L('setconf_database');?></legend>
<ul>
	<li><span class="field"><?php echo L('database_host');?>：</span><input
		type="text" name="db_host" class="text_input" size="30"
		value="<?php echo ($db_host); ?>" /><span class="field port"><?php echo L('database_port');?>：</span><input
		type="text" name="db_port" class="text_input" size="8"
		value="<?php echo ($db_port); ?>" /></li>
	<li><span class="field"><?php echo L('database_user');?>：</span><input
		type="text" name="db_user" class="text_input" size="30"
		value="<?php echo ($db_user); ?>" /><span class="field_tip"><?php echo L('database_user_tip');?></span></li>
	<li><span class="field"><?php echo L('database_pass');?>：</span><input
		type="password" name="db_pass" id="db_pass" class="text_input"
		size="30" value="<?php echo ($db_pass); ?>" /><span class="field_tip"><?php echo L('database_pass_tip');?></span></li>
	<li><span class="field"><?php echo L('database_name');?>：</span><input
		type="text" name="db_name" class="text_input" size="30"
		value="<?php echo ($db_name); ?>" /><span class="field_tip"><?php echo ($database_name_tip); ?></span></li>
	<li><span class="field"><?php echo L('table_prefix');?>：</span><input
		type="text" name="db_prefix" class="text_input" size="30"
		value="<?php echo ($db_prefix); ?>" /><span class="field_tip"><?php echo L('table_prefix_tip');?></span></li>
</ul>
</fieldset>
<fieldset class="admin_info"><legend><?php echo L('setconf_webbase');?></legend>
<ul>
	<li><span class="field"><?php echo L('admin_user');?>：</span><input
		type="text" name="admin_user" class="text_input" size="30"
		value="<?php echo ($admin_user); ?>" /></li>
	<li><span class="field"><?php echo L('admin_pass');?>：</span><input
		type="password" name="admin_pass" class="text_input" size="30"
		value="<?php echo ($admin_pass); ?>" /></li>
	<li><span class="field"><?php echo L('admin_pass_confirm');?>：</span><input
		type="password" name="admin_pass_confirm" class="text_input" size="30"
		value="<?php echo ($admin_pass_confirm); ?>" /></li>
	<li><span class="field"><?php echo L('admin_email');?>：</span><input
		type="text" name="admin_email" class="text_input" size="30"
		value="<?php echo ($admin_email); ?>" /></li>
	<li><span class="field"><?php echo L('web_md5');?>：</span><input type="text"
		name="web_md5" class="text_input" size="30" value="<?php echo ($web_md5); ?>" /><span
		class="field_tip"><?php echo L('web_md5tip');?></span></li>
</ul>
</fieldset>
</div>
<div class="act">
<div class="btn"><input type="submit" value="<?php echo L('next');?>"
	class="btn_next" /></div>
</div>
</form>
</div>
</div>
</body>
</html>