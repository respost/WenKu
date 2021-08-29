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
<div class="c_main_title"><?php echo L('step_finish_desc');?></div>
<div class="c_main_body finish">
<div class="succ"><?php echo L('install_successed');?></div>
<p><a href="__ROOT__/"><?php echo L('site_frontend_link');?></a></p>
<p><a href="__ROOT__/admin.php"><?php echo L('site_backend_link');?></a></p>
</div>
</div>
</div>
</body>
</html>