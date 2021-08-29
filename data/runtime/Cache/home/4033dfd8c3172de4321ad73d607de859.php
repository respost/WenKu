<?php if (!defined('THINK_PATH')) exit();?><div id="adimg"><div class="adtitle"><div class="fl">下方广告将在<s id="adtime"><?php echo C('mtceo_score_pay.adtime');?></s>秒后消失</div><div style="float:right;"><a href="<?php echo U('user/login');?>" target="_blank"><s>注册或登录后，去掉广告</s></a></div></div><div class="adhtml"><?php if(is_array($ad_list)): $i = 0; $__LIST__ = $ad_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ad): $mod = ($i % 2 );++$i; echo ($ad["html"]); endforeach; endif; else: echo "" ;endif; ?></div></div><script>    $(function(){   	  
		var adtime=parseInt($('#adtime').text())+1;
		var t;
		t=setInterval(Autogo,1000);
		function Autogo(){ 	  
			adtime=adtime-1;
			$('#adtime').text(adtime);
			if(adtime ==0){
				clearInterval(t);
				$('#focusad').hide() ;     	 
			}
		}
    });   
    </script>