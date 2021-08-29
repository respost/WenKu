// JavaScript Document
$(function(){
		$('.placeholder').each(function(){
		var val=$(this).attr('placeholder');					 
			//alert(val);				 
		if(val!=''){
		
		$(this).val(val);
		$(this).addClass('placeholder');
		
		}
		
		
		$(this).focusin(function(){
						 
			
			
			if(val!=''){
		if( $(this).val()==val){
			 $(this).val('');
			$(this).removeClass('placeholder');
			}		
		}					 
			}).focusout(function(){
				
				
				if( $(this).val()==''){
				$(this).val(val);
		        $(this).addClass('placeholder');
				
				}
				
				
				
				});
        if(val == undefined){
			
			
			$(this).removeClass('placeholder');
			
		}
		

});
		//全选反选
		$('.J_checkall').live('click', function(){
			$('.J_checkitem').attr('checked', this.checked);
			$('.J_checkall').attr('checked', this.checked);
    	});
		$('.maillist').hover(function(){
			
			$(this).find('.pbclass').show();
			
    	},function(){
    		   		
    		$(this).find('.pbclass').hide();
    	});
		
		
		//批量操作
		$('input[data-tdtype="batch_action"]').live('click', function() {
			var btn = this;
			if($('.J_checkitem:checked').length == 0){
                $.mtceo.tip({content:lang.plsease_select_rows, icon:'alert'});
				return false;
            }
			var ids = '';
			$('.J_checkitem:checked').each(function(){
				ids += $(this).val() + ',';
			});
			ids = ids.substr(0, (ids.length - 1));
			var uri = $(btn).attr('data-uri') + '&' + $(btn).attr('data-name') + '=' + ids,
				msg = $(btn).attr('data-msg'),
				acttype = $(btn).attr('data-acttype'),
				title = ($(btn).attr('data-title') != undefined) ? $(this).attr('data-title') : lang.confirm_title;
				
				
			if(msg != undefined){
				$.dialog({
					id:'confirm',
					title:title,
					width:200,
					padding:'10px 20px',
					lock:true,
					content:msg,
					ok:function(){
					
						action();
					},
					cancel:function(){}
				});
			}else{
				action();
			}
			
			
			function action(){
				if(acttype == 'ajax_form'){
					var did = $(btn).attr('data-id'),
						dwidth = parseInt($(btn).attr('data-width')),
						dheight = parseInt($(btn).attr('data-height'));
					
					$.dialog({
						id:did,
						title:title,
						width:dwidth ? dwidth : 'auto',
						height:dheight ? dheight : 'auto',
						padding:'',
						lock:true,
						ok:function(){
							var info_form = this.dom.content.find('#info_form');
							
							if(info_form[0] != undefined){
								info_form.submit();
								return false;
							}
						},
						cancel:function(){}
					});
					$.getJSON(uri, function(result){
						if(result.status == 1){
							$.dialog.get(did).content(result.data);
						}
					});
				}else if(acttype == 'ajax'){
					
					$.getJSON(uri, function(result){
						
						if(result.status == 1){
							$.mtceo.tip({content:result.msg});
							window.location.reload();
						}else{
							$.mtceo.tip({content:result.msg, icon:'error'});
						}
					});
					
				}else{
					
					location.href = uri;
				}
			}
			
			
			
		});
		//粉丝关注
		$('.gzic').each(function (){
					
					var yhtml='';
					yhtml=$(this).html();
					$(this).hover(function(){

						  
						  $(this).find('span').removeClass('gz-icon');
						  $(this).find('span').addClass('gzcur-icon');
				          var html='<span  class="gzcur-icon qxgz-icon"></span>取消关注';

				          if($(this).find('span').hasClass('ygz-icon')||$(this).find('span').hasClass('xhgz-icon')){
				        	  $(this).html(html);
				          }
						},function(){

							$(this).find('span').removeClass('gzcur-icon');
							$(this).find('span').addClass('gz-icon');
							  $(this).html(yhtml);
					});
});



});

function pb_item(obj){//屏蔽消息

	var uri=$(obj).attr('datauri');
	$.get(uri,function (result){

		if(result.status == 1){
			
			$.mtceo.tip({content:result.msg});
			
			window.location.reload();
		}else{
			$.mtceo.tip({content:result.msg, icon:'error'});
		}

		});
}



function newgdcode(obj) {
	
	var time=new Date().getTime();

	url=$(obj).attr('url')+time;

	$(obj).attr('src',url);
	//后面传递一个随机参数，否则在IE7和火狐下，不刷新图片
}
function guanzhu(id,obj){
	
	var uri=$(obj).attr('data-uri');
	//alert(id);
	$.post(uri,{id:id},function (result){

		if(result.status == 1){
			
			$.mtceo.tip({content:result.msg});
			
			window.location.reload();
		}else{
			$.mtceo.tip({content:result.msg, icon:'error'});
		}

		});
	
	
	
	
}
function quxiaogz(id,obj){
	var uri=$(obj).attr('data-uri');
	//alert(id);
	$.post(uri,{id:id},function (result){

		
		if(result.status == 1){
			
			$.mtceo.tip({content:result.msg});
			
			window.location.reload();
		}else{
			$.mtceo.tip({content:result.msg, icon:'error'});
		}

		});
	
	
}
function yinyong(id,commentid) {
	
	var str;
	str='引用(<font color=orange>'+commentid+'楼</font>)';
	
	$('#yinyong').html(str);
	$('#toid').val(id);	
}
function youyong(id,obj) {
	
	
	var uri=$(obj).attr('data-uri');
	  var num=parseInt($('#youyong'+id).html());
	 
	
	
	  $.getJSON(uri,{id:id},function(data){
		 
		  if(data.status ==1 ){
			  $('#youyong'+id).html(num+1);
			  $.mtceo.tip({content:data.msg});
			  
		  }else{
			  
			  $.mtceo.tip({content:data.msg,icon:'error'});
		  }
		  
		 
		  
	  });
}
function front_operate(type,obj){//收藏
	
	  var uri=$(obj).attr('data-uri');
	  if(uri==''){
		  
		  $.mtceo.tip({content:'您已经进行过该操作',icon:'error'});
	  }else{
		  
		
			  $.getJSON(uri,{type:type},function(data){
				  
				  if(data.status ==1 ){
					  
					  $.mtceo.tip({content:data.msg});
					  //$(obj).addClass('grayoperate');
					  //$(obj).html(typename+'('+data.data+')');
					  $(obj).attr('data-uri','');
				  }else{
					  
					  $.mtceo.tip({content:data.msg,icon:'error'});
				  }
				  
				 
				  
			  }); 
		  
		  
		  
		  
	  }
	//alert($(obj).html());
	
	  
	  
	
}
function front_deloperate(type,obj){
	 var uri=$(obj).attr('data-uri');
	  $.getJSON(uri,{type:type},function(data){
		  
		  if(data.status ==1 ){
			  
			  $.mtceo.tip({content:data.msg});
			  window.location.reload();
		  }else{
			  
			  $.mtceo.tip({content:data.msg,icon:'error'});
		  }
		  
		 
		  
	  }); 
	
	
	
}
function formsub(val,type){


	
	

	if(type=='score'){
		$('#score').val(val);
	
	   
	
	}else if(type=='time'){
		$('#time').val(val);
		


		
	}

$('#search').submit();

	
}