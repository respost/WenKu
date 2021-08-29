<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title><?php echo ($seoconfig["title"]); ?></title><meta content="<?php echo ($seoconfig["description"]); ?>" name="description"><meta content="<?php echo ($seoconfig["keywords"]); ?>" name="keywords"><script>			var URL = '__URL__';
			var SELF = '__SELF__';
			var ROOT_PATH = '__ROOT__';
			var APP = '__APP__';
			//语言项目
			var lang = new Object(); 
			<?php $_result=L('js_lang');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?>lang.<?php echo ($key); ?> = "<?php echo ($val); ?>";<?php endforeach; endif; else: echo "" ;endif; ?></script><link href="__PUBLIC__/theme/baidu/css/base.css" rel="stylesheet" media="screen" /><link href="__PUBLIC__/theme/baidu/css/mtceodialogtip.css" rel="stylesheet" media="screen" /><script src="__PUBLIC__/js/jquery-1.8.3.js"></script><script src="__PUBLIC__/js/jquery.tools.min.js"></script><script src="__PUBLIC__/js/mtceo.js"></script><script src="__PUBLIC__/js/home.js"></script><script src="__PUBLIC__/js/home_extend.js"></script><script src="__PUBLIC__/js/jquery.form.js"></script><script src="__PUBLIC__/js/jquery.flash.js"></script><script src="__PUBLIC__/js/ad_top.js"></script><!--引入jquery-weui框架--><link rel="stylesheet" href="__PUBLIC__/weui/css/weui.min.css"><script src="__PUBLIC__/weui/js/jquery-weui.min.js" charset="utf-8"></script></head><body><?php if($cssnum == 1): ?><!--顶部折叠广告位--><div class='top-adver'><?php echo R('advert/index', array(2), 'Widget');?></div><?php endif; ?><div class="headnav"><div class="clear"></div></div><div class="top"><div class="logo fl"><a href="<?php echo C('mtceo_site_url');?>"></a></div><div class="top-search-box"><form action="<?php echo U('search/index');?>" method="get"><span class="s_ipt_wr"><input type="text" id="kw" name="searchword" maxlength="256" <?php if($searchword != null): ?>class="s_ipt" value="<?php echo ($searchword); ?>"<?php else: ?> class="s_ipt placeholder"   placeholder="请输入要搜索的文档"<?php endif; ?> /></span><span class="s_btn_wr"><input id="sb" value="搜索" class="searchbtn" type="submit"></span><span class="s_tools"></span><div class="g-sl" alog-group="switch.doctype"><label for="t_all"><input name="lm" value="0" id="t_all" <?php if($search["lm"] == 0): ?>checked=""<?php endif; ?> type="radio">全部</label><label for="t_doc"><input name="lm" value="1" id="t_doc" <?php if($search["lm"] == 1): ?>checked=""<?php endif; ?> type="radio">DOC</label><label for="t_ppt"><input name="lm" value="3" id="t_ppt" <?php if($search["lm"] == 3): ?>checked=""<?php endif; ?> type="radio">PPT</label><label for="t_txt"><input name="lm" value="5" id="t_txt" <?php if($search["lm"] == 5): ?>checked=""<?php endif; ?> type="radio">TXT</label><label for="t_pdf"><input name="lm" value="2" id="t_pdf" <?php if($search["lm"] == 2): ?>checked=""<?php endif; ?> type="radio">PDF</label><label for="t_xls"><input name="lm" value="4" id="t_xls" <?php if($search["lm"] == 4): ?>checked=""<?php endif; ?> type="radio">XLS</label><div style="clear:both"></div></div></form></div><div class="userinfo"><ul><?php if($visitor['uid'] == ''): ?><li><a href="<?php echo U('user/login');?>">登录</a>&nbsp;&nbsp;
								<a href="<?php echo U('user/register');?>">注册</a></li><?php endif; if($visitor['uid'] > 0): ?><a href="<?php echo U('ucenter/index');?>"><li>账号：<?php echo ($visitor['username']); ?></li></a><a href="<?php echo U('user/logout');?>"><li class="red">安全退出</li></a><?php endif; ?><ul></div></div><?php if($cssnum == 1): ?><div class="nav"><ul><li <?php if($modulename == 'index'): ?>class="cur"<?php endif; ?>><a href="<?php echo U('index/index');?>">文库首页</a></li><li id="allcate" <?php if($actionname == 'doccate'): ?>class="cur"<?php endif; ?>><a href="<?php echo U('doc/doccate');?>">全部分类</a><b class="d-ic disnone"></b></li><?php if(is_array($navlist['main'])): $i = 0; $__LIST__ = $navlist['main'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($vo["link"]); ?>" alt="<?php echo ($vo["alias"]); ?>" <?php if($vo['target'] == 1): ?>target="_blank"<?php endif; ?>><?php echo ($vo["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?><li <?php if($modulename == 'ucenter'): ?>class="cur"<?php endif; ?>><a href="<?php echo U('ucenter/index');?>">个人中心</a></li></ul></div><!--导航下方横幅广告位--><div style="width:960px;margin:0 auto;margin-bottom:10px;"><?php echo R('advert/index', array(3), 'Widget');?></div><?php endif; ?><div class="container<?php echo ($cssnum); ?>"><script src="__PUBLIC__/js/flexpaper/flexpaper.js"></script><script src="__PUBLIC__/js/flexpaper/flexpaper_handlers.js"></script><script src="__PUBLIC__/js/jquery.media.js"></script><div class="menu"><a href="<?php echo U('index/index');?>">文库首页</a><em class="bgcur"></em><?php echo getnavlist($info['cateid']);?></div><div class="conbox"><div class="conleft"><div class="contitle"><div class="icon <?php echo ($info["ext"]); ?>"></div><div class="titlename"><?php echo ($info["title"]); ?></div><div class="titleinfo"><?php echo ($info["hits"]); ?>人阅读</div></div><div class="coninfo"><p><?php echo ($info["intro"]); ?></p></div><div class="conflash" style="position:relative;"><!--
            <div class="flashtop"><a href="javascript:void(0);"
                <?php if($hasxh != 1): ?>data-uri="<?php echo U('common/operate',array('id'=>$info['id'],'typeid'=>1));?>"
                    <?php else: ?>                    data-uri=""<?php endif; ?>                onclick="front_operate(2,this);"><b class="tjicon"></b>                收藏
                </a><a href="javascript:void(0);"
                <?php if($hastj != 1): ?>data-uri="<?php echo U('common/operate',array('id'=>$info['id'],'typeid'=>1));?>"
                    <?php else: ?>                    data-uri=""<?php endif; ?>                onclick="front_operate(3,this);"><b class="xhicon"></b>                推荐</a></div><div class="flashmid"><div id="documentViewer" style="width:100%;height:100%;"><?php if(($uid < 1) OR ($uid == null)): ?><div id="focusad" style="width:<?php echo ($adinfo["width"]); ?>px;height:<?php echo ($adinfo["height"]); ?>px"><?php echo R('advert/index', array(1), 'Widget');?></div><?php else: ?><script>$(function () {
                            //显示swf动画
                            askflash();
                        });
                        </script><?php endif; ?></div></div>            --><img id="imgBox" src="<?php echo ($imgurl); ?>" width="100%" height="100%" style="display:none;"/><object id="pdfBox" classid="clsid:CA8A9780-280D-11CF-A24D-444553540000" width="100%" height="100%"
                    border="0"><!--IE--><param name="_Version" value="65539"><param name="_ExtentX" value="20108"><param name="_ExtentY" value="10866"><param name="_StockProps" value="0"><param name="SRC" value="<?php echo ($flashurl); ?>"><embed src="<?php echo ($flashurl); ?>" width="100%" height="100%" href="<?php echo ($flashurl); ?>"></embed><!--FF--></object><!---广告插件--><div id="documentViewer" style="width:100%;height:100%;position:absolute;top:30px;"><?php if(($uid < 1) OR ($uid == null)): ?><div id="focusad" style="width:<?php echo ($adinfo["width"]); ?>px;height:<?php echo ($adinfo["height"]); ?>px;"><?php echo R('advert/index', array(1), 'Widget');?></div><?php else: endif; ?></div></div><div class="doctool"><a href="javascript:void(0);" class="viewbtn scbtn"
            <?php if($hasxh != 1): ?>data-uri="<?php echo U('common/operate',array('id'=>$info['id'],'typeid'=>1));?>"
                <?php else: ?>                data-uri=""<?php endif; ?>            onclick="front_operate(2,this);"></a><div class="desinfo"><p style="color:#2E946A;line-height:36px;">免费</p></div><a href="javascript:void(0);" class="J_shownoform viewbtn downbtn" data-fix="true" data-padding="30px"
               data-uid="<?php echo ($uid); ?>" data-uri="<?php echo U('doc/showdownload','id='.$info['id']);?>" data-title="文档下载"
               data-id="showdownload" data-width="400" data-height="250"></a><div class="desinfo"><p style="line-height:18px;">大小:<?php echo (byte_format($info["filesize"])); ?></p><p style="line-height:18px;">所需财富值:<?php echo ($info["score"]); ?></p></div></div></div><div class="conright"><div class="docupload"><a href="<?php echo U('doc/doc_share');?>" class="viewbtn docupbtn"></a></div><div class="docinfotitle" style="border:0">文档信息</div><div class="docinfo"><p><a href="<?php echo U('member/mydoclist',array('uid'=>$info['uid']));?>"><?php echo (getusername($info['uid'])); ?></a>贡献于<?php echo (fdate($info["add_time"])); ?></p><div class="rate"><div class="big_rate"><span rate="2">&nbsp;</span><span rate="4">&nbsp;</span><span rate="6">&nbsp;</span><span rate="8">&nbsp;</span><span rate="10">&nbsp;</span><div style="width:45px;" class="big_rate_up"></div></div><p><span id="s" class="s"></span><span id="g" class="g"></span></p></div><p>(
                <?php if($ratydata['voter'] == null): ?>0<?php endif; echo ($ratydata['voter']); ?>人评分)
            </p><p>下载：<s><?php echo ($downnum); ?></s><em>|</em>收藏：<s><?php echo ($xhnum); ?></s><em>|</em>推荐：<s><?php echo ($tuijiannum); ?></s></p><p>(<?php echo ($commentcount); ?>人评论)&nbsp;&nbsp;<a href="<?php echo U('doc/docconcom',array('id'=>$info['id']));?>">查看所有评论</a></p><p><a href="javascript:void(0)" class="J_shownoform userEva-btn2 mycomment-btn" data-fix="true"
                  data-padding="30px" data-uid="<?php echo ($uid); ?>" data-uri="<?php echo U('doc/comment','id='.$info['id']);?>"
                  data-title="我要评论" data-id="mycomment" data-width="400" data-height="250"><b class="userEva-btn2 iccomment"></b>我要评论</a></p></div><div class="docinfotitle">同类别文档</div><div class="docinfo"><ul><?php $tag_doc_class = new docTag;$data = $tag_doc_class->lists(array('type'=>'lists','cateid'=>$info['cateid'],'exceptid'=>$info['id'],'how'=>'rate','order'=>'add_time desc','cache'=>'0','return'=>'data',)); if(is_array($data['list'])): $i = 0; $__LIST__ = array_slice($data['list'],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('doc/doccon',array('id'=>$vo['id']));?>"><?php echo (msubstr($vo["title"],0,14)); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?></ul></div><div class="docinfotitle">相关文档</div><div class="docinfo"><ul><?php $tag_doc_class = new docTag;$data = $tag_doc_class->lists(array('type'=>'lists','similar'=>$info['id'],'exceptid'=>$info['id'],'how'=>'rate','order'=>'add_time desc','cache'=>'0','return'=>'data',)); if(is_array($data['list'])): $i = 0; $__LIST__ = array_slice($data['list'],0,6,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('doc/doccon',array('id'=>$vo['id']));?>"><?php echo (msubstr($vo["title"],0,14)); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?></ul></div><div class="conad1"></div></div><div class="clear"></div></div><script type="text/javascript">    $(function ($) {
        //判断是不是IE浏览器
        if (window.ActiveXObject || "ActiveXObject" in window) {
			$("#pdfBox").hide();
			$("#imgBox").show();
			$.alert("对不起，IE浏览器不支持在线预览PDF文档，请更换其他浏览器！");			
        }
        //隐藏PDF文件工具栏
        //pdfBox.SetShowToolbar(false);
        //pdfBox.setShowScrollbars(true);
    });
    //禁止右键和F12调试
    $(document).bind("contextmenu", function () {
        return false;
    });
    document.oncontextmenu = function () {
        return false;
    };
    document.onkeydown = function () {
        if (window.event && window.event.keyCode == 123) {
            event.keyCode = 0;
            event.returnValue = false;
            return false;
        }
    }
</script><script type="text/javascript">    function askflash() {
        var flashurl = "<?php echo ($flashurl); ?>";
        $('#documentViewer').FlexPaperViewer(
            {
                config: {
                    SWFFile: flashurl,
                    Scale: 0.6,
                    ZoomTransition: 'easeOut',
                    ZoomTime: 0.5,
                    ZoomInterval: 0.2,
                    FitPageOnLoad: false,
                    FitWidthOnLoad: true,
                    FullScreenAsMaxWindow: true,
                    ProgressiveLoading: false,
                    MinZoomSize: 0.2,
                    MaxZoomSize: 5,
                    SearchMatchAll: false,
                    InitViewMode: 'Portrait',
                    RenderingOrder: 'flash',
                    StartAtPage: '',
                    ViewModeToolsVisible: true,
                    ZoomToolsVisible: true,
                    NavToolsVisible: true,
                    CursorToolsVisible: true,
                    SearchToolsVisible: true,
                    WMode: 'opaque',
                    localeChain: 'zh_cn'
                }
            }
        );
    }

    $(function () {
        $('#nextpage').click(function () {
            $FlexPaper('documentViewer').nextPage();
        });
        $('#prepage').click(function () {
            $FlexPaper('documentViewer').prevPage();
        });
        var rate = "<?php echo ($raty['raty']); ?>";
        var s = "<?php echo ($raty['s']); ?>";
        var g = "<?php echo ($raty['g']); ?>";
        $("#g").show();
        $("#s").text(s);
        $("#g").text("." + g);
        $(".big_rate_up").animate({width: (parseInt(s) + parseInt(g) / 10) * 14, height: 26}, 1000);
        $(".big_rate span").each(function () {
            $(this).mouseover(function () {
                $(".big_rate_up").width($(this).attr("rate") * 14);
                $("#s").text($(this).attr("rate"));
                $("#g").text("");
            }).click(function () {
                var score = $(this).attr("rate");
                //
                $.getJSON("<?php echo U('doc/setscore',array('id'=>$info['id'],'uid'=>$uid));?>",
                    {score: score},
                    function (data) {
                        if (data.status == 0) {
                            $.mtceo.tip({content: data.msg, icon: 'error'});
                        } else if (data.status == 1) {
                            s = data.msg.s;
                            g = data.msg.g;
                            $("#s").text(s);
                            $("#g").text("." + g);
                            $("#ratycount").text(data.msg.count);
                            $.mtceo.tip({content: "感谢您的评分!"});
                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        }
                    }
                );
            })
        });
        $(".big_rate").mouseout(function () {
            $("#s").text(s);
            $("#g").text("." + g);
            $(".big_rate_up").width((parseInt(s) + parseInt(g) / 10) * 14);
        });
    });
</script><script defer="defer">    $(window).keydown(function (event) {
        if (event.keyCode == 13) {
            var curr = $(this).val();
            if (parseInt(curr) == 'NaN') {
                $.mtceo.tip({content: "请输入有效整数!", icon: 'alert'});
            }
            if (parseInt(curr) > 32700 || parseInt(curr) < 0) {
                $.mtceo.tip({content: "超出范围!", icon: 'error'});
            } else {
                $FlexPaper('documentViewer').gotoPage(curr);
            }
        }
    });
</script><script src="__PUBLIC__/js/kindeditor/kindeditor.js"></script><script>    $(function () {
        KindEditor.create('#info', {
            themeType: 'simple',
            uploadJson: '<?php echo U("attachment/editer_upload");?>',
            fileManagerJson: '<?php echo U("attachment/editer_manager");?>',
            allowFileManager: true,
            items: ['emoticons'],
            emotPath: './public/images/emot/<?php echo ($emot); ?>/',
            emotwidth: '<?php echo ($emotwidth); ?>',
            emotnum: '<?php echo ($emotnum); ?>',
        });
    });
</script><!--底部横幅广告位--><div style="width:960px;margin:0 auto;margin-bottom:10px;"><?php echo R('advert/index', array(4), 'Widget');?></div><div class="footer"><div class="container"><div class="col-md-12"><p class="p-hide">版权所有：<span style="padding-right:10px;">美奇软件开发工作室</span>备案/许可证号：
				<a href="http://www.beian.miit.gov.cn/" target="_blank">蜀ICP备19029089号-2</a></p><p>Copyright ©2018-2020 美奇文库 All Rights Reserved</p></div></div></div><script>//初始化弹窗
(function (d) {
    d['okValue'] = lang.dialog_ok;
    d['cancelValue'] = lang.dialog_cancel;
    d['title'] = lang.dialog_title;
})($.dialog.defaults);
</script><script src="__PUBLIC__/js/var.js"></script></body></html>