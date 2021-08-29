<?php if (!defined('THINK_PATH')) exit();?><!--编辑广告--><div class="dialog_content"><form id="info_form" action="<?php echo u('ad/edit');?>" method="post"><table width="100%" cellpadding="2" cellspacing="1" class="table_form"><tr><th width="80"><?php echo L('ad_name');?> :</th><td><input type="text" name="name" id="name" class="input-text" size="40" value="<?php echo ($info["name"]); ?>"></td></tr><tr><th><?php echo L('ad_url');?> :</th><td><input type="text" name="url" class="input-text" size="40" value="<?php echo ($info["url"]); ?>"></td></tr><tr><th><?php echo L('adboard');?> :</th><td class="blue"><?php echo ($board_info["name"]); ?> (<?php echo ($board_info["width"]); ?>*<?php echo ($board_info["height"]); ?>)
        </td></tr><tr><th><?php echo L('ad_type');?> :</th><td><select name="type" id="type"><?php if(is_array($ad_type_arr)): $i = 0; $__LIST__ = $ad_type_arr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><option value="<?php echo ($key); ?>" <?php if($info['type'] == $key): ?>selected="selected"<?php endif; ?>><?php echo ($val); ?></option><?php endforeach; endif; else: echo "" ;endif; ?></select></td></tr><tr id="ad_image" class="bill_media"><th><?php echo L('ad_image');?> :</th><td><input type="text" name="img1" id="J_img1" disabled="disabled" class="input-text fl mr10" size="30" value="<?php echo ($info["content"]); ?>"><input type="hidden" name="img" id="J_img" class="input-text fl mr10" size="30" value="<?php echo ($info["content"]); ?>"><div id="J_upload_img" class="upload_btn"><span><?php echo L('upload');?></span></div><?php if($info["type"] == 'image'): if(!empty($info['content'])): ?><span class="attachment_icon J_attachment_icon" file-type="image" file-rel="<?php echo ($img_dir); echo ($info["content"]); ?>"><img src="__PUBLIC__/images/filetype/image_s.gif" /></span><?php endif; endif; ?></td></tr><tr id="ad_code" class="bill_media" style="display:none;"><th><?php echo L('ad_code');?> :</th><td><textarea rows="3" cols="50" name="code" id="code"><?php echo ($info["content"]); ?></textarea></td></tr><tr id="ad_flash" class="bill_media" style="display:none;"><th><?php echo L('ad_flash');?> :</th><td><input type="text" name="flash1" id="J_flash1" disabled="disabled" class="input-text fl mr10" size="30" value="<?php echo ($info["content"]); ?>"><input type="hidden" name="flash" id="J_flash" class="input-text fl mr10" size="30" value="<?php echo ($info["content"]); ?>"><div id="J_upload_flash" class="upload_btn"><span><?php echo L('upload');?></span></div></td></tr><tr id="ad_text" class="bill_media" style="display:none;"><th><?php echo L('ad_text');?> :</th><td><textarea rows="3" cols="50" name="text" id="text"><?php echo ($info["content"]); ?></textarea></td></tr><tr><th><?php echo L('ad_ext_image');?> :</th><td><input type="text" name="extimg1" id="J_extimg1" disabled="disabled" class="input-text fl mr10" size="30" value="<?php echo ($info["extimg"]); ?>"><input type="hidden" name="extimg" id="J_extimg" class="input-text fl mr10" size="30" value="<?php echo ($info["extimg"]); ?>"><div id="J_upload_extimg" class="upload_btn"><span><?php echo L('upload');?></span></div></td></tr><tr><th><?php echo L('ad_ext_val');?> :</th><td><input type="text" name="extval" class="input-text fl mr10" value="<?php echo ($info["extval"]); ?>"></td></tr><tr><th><?php echo L('ad_desc');?> :</th><td><input type="text" name="desc" class="input-text fl mr10" size="30" value="<?php echo ($info["desc"]); ?>"></td></tr><tr><th><?php echo L('ad_time');?> :</th><td><input type="text" name="start_time" id="start_time" class="date" size="12" value="<?php echo (date('Y-m-d',$info["start_time"])); ?>"><input type="text" name="end_time" id="end_time" class="date" size="12" value="<?php echo (date('Y-m-d',$info["end_time"])); ?>"></td></tr><tr><th><?php echo L('enabled');?> :</th><td><label><input type="radio" <?php if($info['status'] == '1'): ?>checked="checked"<?php endif; ?> value="1" name="status"><?php echo L('yes');?></label>&nbsp;&nbsp;
            <label><input type="radio" <?php if($info['status'] == '0'): ?>checked="checked"<?php endif; ?> value="0" name="status"><?php echo L('no');?></label></td></tr></table><input type="hidden" name="id" id="id" value="<?php echo ($info["id"]); ?>" /></form></div><script src="__PUBLIC__/js/ajaxupload.js"></script><script type="text/javascript">Calendar.setup({
    inputField : "start_time",
    ifFormat   : "%Y-%m-%d",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "end_time",
    ifFormat   : "%Y-%m-%d",
    showsTime  : false,
    timeFormat : "24"
});

$(function(){
    $("#type").change(function(){
        $(".bill_media").hide();
        $("#ad_"+$(this).val()).show();
    });
    $("#type").change();

	$.formValidator.initConfig({formid:"info_form",mode:"AutoTip",theme:"mt_theme"});
    $("#name").formValidator({onShow:"请填写广告名称",onFocus:"请填写广告名称"}).inputValidator({min:1,onError:"请填写广告名称"}).defaultPassed();
    $('#info_form').ajaxForm({success:complate,dataType:'json'});
    function complate(result){
        if(result.status == 1){
            $.dialog.get(result.dialog).close();
            $.mtceo.tip({content:result.msg});
            window.location.reload();
        } else {
			$.mtceo.tip({content:result.msg, icon:'alert'});
        }
    }
    
    var ajaxupload = new AjaxUpload('#J_upload_img',{
		action:"<?php echo U('ad/ajax_upload_img');?>",
		name:"img",
		responseType:'json',
		onSubmit:function(file,ext){
			if(ext && /^(jpg|jpeg|png|gif)$/.test(ext)){
				
				
			}else{	
				
				$.mtceo.tip({content:'必须为图片格式', icon:'error'});
				return false;
			}
		},
		onComplete:function(file,response){
			
			
			
			
			if(response.status){
			$('#J_img1').val(response.info);
			$('#J_img').val(response.info);
			$('#J_upload_img').html("<span><?php echo L('hasupload');?></span>");
			$('#J_upload_img').prop({disabled:true});
			}
			else
			{
				$.mtceo.tip({content:response.info, icon:'error'});
				
			}
			
		}
	});
//上传图片
var ajaxupload1 = new AjaxUpload('#J_upload_extimg',{
		action:"<?php echo U('ad/ajax_upload_img', array('type'=>'extimg'));?>",
		name:"extimg",
		responseType:'json',
		onSubmit:function(file,ext){
			if(ext && /^(jpg|jpeg|png|gif)$/.test(ext)){
				
				
			}else{	
				
				$.mtceo.tip({content:'必须为图片格式', icon:'error'});
				return false;
			}
		},
		onComplete:function(file,response){
			
			
			
			
			if(response.status){
			$('#J_extimg1').val(response.info);
			$('#J_extimg').val(response.info);
			$('#J_upload_extimg').html("<span><?php echo L('hasupload');?></span>");
			$('#J_upload_extimg').prop({disabled:true});
			}
			else
			{
				$.mtceo.tip({content:response.info, icon:'error'});
				
			}
			
		}
	});
//上传图片
var ajaxupload2 = new AjaxUpload('#J_upload_flash',{
		action:"<?php echo U('ad/ajax_upload_img', array('type'=>'flash'));?>",
		name:"flash",
		responseType:'json',
		onSubmit:function(file,ext){
			if(ext && /^(swf)$/.test(ext)){
				
				
			}else{	
				
				$.mtceo.tip({content:'必须为swf格式', icon:'error'});
				return false;
			}
		},
		onComplete:function(file,response){
			
			
			
			
			if(response.status){
			$('#J_flash1').val(response.info);
			$('#J_flash').val(response.info);
			$('#J_upload_flash').html("<span><?php echo L('hasupload');?></span>");
			$('#J_upload_flash').prop({disabled:true});
			}
			else
			{
				$.mtceo.tip({content:response.info, icon:'error'});
				
			}
			
		}
	});
//上传图片
})
</script>