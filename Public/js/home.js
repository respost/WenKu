/**
 * **********************后台操作JS************************
 * ajax 状态显示
 * confirmurl 操作询问
 * showdialog 弹窗表单
 * attachment_icon 附件预览效果
 * preview 预览图片大图
 * cate_select 多级菜单动态加载
 * 
 * 
 * author: andery@foxmail.com
 */
;$(function($){
	//AJAX请求效果
	$('#J_ajax_loading').ajaxStart(function(){
		$(this).show();
	}).ajaxSuccess(function(){
		$(this).hide();
	});

	//确认操作
	$('.J_confirmurl').live('click', function(){
		var self = $(this),
			uri = self.attr('data-uri'),
			acttype = self.attr('data-acttype'),
			title = (self.attr('data-title') != undefined) ? self.attr('data-title') : lang.confirm_title,
			msg = self.attr('data-msg'),
			callback = self.attr('data-callback');
			
		$.dialog({
			title:title,
			content:msg,
			padding:'10px 20px',
			lock:true,
			ok:function(){
				if(acttype == 'ajax'){
					$.getJSON(uri, function(result){
						if(result.status == 1){
							$.mtceo.tip({content:result.msg});
							if(callback != undefined){
								eval(callback+'(self)');
							}else{
								window.location.reload();
							}
						}else{
							$.mtceo.tip({content:result.msg, icon:'error'});
						}
					});
				}else{
					location.href = uri;
				}
			},
			cancel:function(){}
		});
	});
	//弹出窗口非表单
	$('#download').click(function (){
		var self = $(this);
		$.dialog({id:self.id}).close();
		window.location.reload();
		
	});
	
	
	
	$('.J_shownoform').live('click', function(){
		
		var self = $(this),
		dtitle = self.attr('data-title'),
		did = self.attr('data-id'),
		duid = self.attr('data-uid'),
		duri = self.attr('data-uri'),
		dfix = self.attr('data-fix'),
		dwidth = parseInt(self.attr('data-width')),
		dheight = parseInt(self.attr('data-height')),
		dpadding = (self.attr('data-padding') != undefined) ? self.attr('data-padding') : '',
		dcallback = self.attr('data-callback');
		
		if(duid == ''){
			$.mtceo.tip({content:'请先登录！',icon:'alert'});
			return false;
		}
		
		
		 if(url_mode == false){
		    	duri = duri;
		    	}else{
		    		duri = duri.replace('.'+url_htm,'');
		    		var re = /&|=/g;
		    		duri = duri.replace(re,url_str);
		    		
		    		duri = duri + '.'+ url_htm;	
		    		
		    	}
		
		 $.dialog({
				fixed:dfix,
				id:did,
				title:dtitle,
				width:dwidth ? dwidth : 'auto',
				height:dheight ? dheight : 'auto',
				padding:dpadding,
				lock:true
				
				
			});
		 $.getJSON(duri, function(result){
				
				if(result.status == 1){
					
					$.dialog.get(did).content(result.data);
				}
			});
			return false;
		
	});
	//弹窗表单
	$('.J_showdialog').live('click', function(){
		var self = $(this),
			dtitle = self.attr('data-title'),
			did = self.attr('data-id'),
			duri = self.attr('data-uri'),
			dwidth = parseInt(self.attr('data-width')),
			dheight = parseInt(self.attr('data-height')),
			dpadding = (self.attr('data-padding') != undefined) ? self.attr('data-padding') : '',
			dcallback = self.attr('data-callback');
			//ALERT(duri);
		$.dialog({id:did}).close();
		$.dialog({
			id:did,
			title:dtitle,
			width:dwidth ? dwidth : 'auto',
			height:dheight ? dheight : 'auto',
			padding:dpadding,
			lock:true,
			ok:function(){
				var info_form = this.dom.content.find('#info_form');
				if(info_form[0] != undefined){
					info_form.submit();
					if(dcallback != undefined){
						eval(dcallback+'()');
					}
					return false;
				}
				if(dcallback != undefined){
					eval(dcallback+'()');
				}
			},
			cancel:function(){}
		});
		$.getJSON(duri, function(result){
			if(result.status == 1){
				$.dialog.get(did).content(result.data);
			}
		});
		return false;
	});
	
	

});



;(function($){
    //联动菜单
    $.fn.cate_select = function(options) {
        var settings = {
            field: 'J_cate_id',
            top_option: lang.please_select
        };
        if(options) {
            $.extend(settings, options);
        }

        var self = $(this),
            pid = self.attr('data-pid'),
            uri = self.attr('data-uri'),
            selected = self.attr('data-selected'),
            selected_arr = [];
        if(selected != undefined && selected != '0'){
        	if(selected.indexOf('|')){
        		selected_arr = selected.split('|');
        	}else{
        		selected_arr = [selected];
        	}
        }
       
        self.nextAll('.J_cate_select').remove();
        $('<option value="">--'+settings.top_option+'--</option>').appendTo(self);
        $.getJSON(uri, {id:pid}, function(result){
            if(result.status == '1'){
                for(var i=0; i<result.data.length; i++){
                $('<option value="'+result.data[i].id+'">'+result.data[i].name+'</option>').appendTo(self);
                }
            }
            if(selected_arr.length > 0){
            	//IE6 BUG
            	setTimeout(function(){
            		self.find('option[value="'+selected_arr[0]+'"]').attr("selected", true);
	        		self.trigger('change');
            	}, 1);
            }
        });

        var j = 1;
        $('.J_cate_select').die('change').live('change', function(){
            var _this = $(this),
            _pid = _this.val();
            _this.nextAll('.J_cate_select').remove();
            if(_pid != ''){
                $.getJSON(uri, {id:_pid}, function(result){
                    if(result.status == '1'){
                        var _childs = $('<select class="J_cate_select mr10" data-pid="'+_pid+'"><option value="">--'+settings.top_option+'--</option></select>')
                        for(var i=0; i<result.data.length; i++){
                            $('<option value="'+result.data[i].id+'">'+result.data[i].name+'</option>').appendTo(_childs);
                        }
                        _childs.insertAfter(_this);
                        if(selected_arr[j] != undefined){
                        	//IE6 BUG
                        	//setTimeout(function(){
			            		_childs.find('option[value="'+selected_arr[j]+'"]').attr("selected", true);
				        		_childs.trigger('change');
			            	//}, 1);
			            }
                        j++;
                    }
                });
                $('#'+settings.field).val(_pid);
            }else{
            	$('#'+settings.field).val(_this.attr('data-pid'));
            }
        });
    }
})(jQuery);