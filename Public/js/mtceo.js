;(function($){
    $.mtceo = $.mtceo || {version: "v1.0.0"},
    $.extend($.mtceo, {
        util: {
            getStrLength: function(str) {
                str = $.trim(str);
                var length = str.replace(/[^\x00-\xff]/g, "**").length;
                return parseInt(length / 2) == length / 2 ? length / 2: parseInt(length / 2) + .5;
            },
            empty: function(str) {
                return void 0 === str || null === str || "" === str
            },
            isURl: function(str) {
                return /([\w-]+\.)+[\w-]+.([^a-z])(\/[\w-.\/?%&=]*)?|[a-zA-Z0-9\-\.][\w-]+.([^a-z])(\/[\w-.\/?%&=]*)?/i.test(str) ? !0 : !1
            },
            isEmail: function(str) {
                return /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(str);
            },
            minLength: function(str, length) {
                var strLength = $.qupai.util.getStrLength(str);
                return strLength >= length;
            },
            maxLength: function(str, length) {
                var strLength = $.qupai.util.getStrLength(str);
                return strLength <= length;
            },
            redirect: function(uri, toiframe) {
                if(toiframe != undefined){
                    $('#' + toiframe).attr('src', uri);
                    return !1;
                }
                location.href = uri;
            },
            base64_decode: function(input) {
                var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
                var output = "";
                var chr1, chr2, chr3 = "";
                var enc1, enc2, enc3, enc4 = "";
                var i = 0;
                //if(typeof input.length=='undefined')return '';
                if(input.length%4!=0){
                    return "";
                }
                var base64test = /[^A-Za-z0-9\+\/\=]/g;
                
                if(base64test.exec(input)){
                    return "";
                }
                
                do {
                    enc1 = keyStr.indexOf(input.charAt(i++));
                    enc2 = keyStr.indexOf(input.charAt(i++));
                    enc3 = keyStr.indexOf(input.charAt(i++));
                    enc4 = keyStr.indexOf(input.charAt(i++));
                    
                    chr1 = (enc1 << 2) | (enc2 >> 4);
                    chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
                    chr3 = ((enc3 & 3) << 6) | enc4;
                    
                    output = output + String.fromCharCode(chr1);
                    
                    if (enc3 != 64) {
                        output+=String.fromCharCode(chr2);
                    }
                    if (enc4 != 64) {
                        output+=String.fromCharCode(chr3);
                    }
                    
                    chr1 = chr2 = chr3 = "";
                    enc1 = enc2 = enc3 = enc4 = "";
                
                } while (i < input.length);
                return output;
            }
        }
    });
})(jQuery);

;(function($){
    //把对象调整到中心位置
    $.fn.setmiddle = function() {
        var dl = $(document).scrollLeft(),
            dt = $(document).scrollTop(),
            ww = $(window).width(),
            wh = $(window).height(),
            ow = $(this).width(),
            oh = $(this).height(),
            left = (ww - ow) / 2 + dl,
            top = (oh < 4 * wh / 7 ? wh * 0.382 - oh / 2 : (wh - oh) / 2) + dt;
                
        $(this).css({left:Math.max(left, dl) + 'px',top:Math.max(top, dt) + 'px'});             
        return this;
    }
    //返回顶部
    $.fn.returntop = function() {
        var self = $(this);
        self.live({
            mouseover: function() {
                $(this).addClass('return_top_hover');
            },
            mouseout: function() {
                $(this).removeClass('return_top_hover');
            },
            click: function() {
                $("html, body").animate({scrollTop: 0}, 120);
            }
        });
        $(window).bind("scroll", function() {
            $(document).scrollTop() > 0 ? self.fadeIn() : self.fadeOut();
        });
    }
})(jQuery);
;(function($){
    //幻灯片
	
	  $.mtceo.slider = function (options) {
		  var t=n=length=count=0;

          var html;
		 
         var setting = {
            style:0,
			showtime:3000,//幻灯更换时间
            atime:2000//动画时间
        };
		if(options) {
            $.extend(setting, options);
        }
      
		
		

var length=$("#slider").find("li").length;
$("#slider li:not(:first-child)").hide();
html=$("#img1").html();
$("#li-title").html(html);


$("#slider").find("span").click(function (){
var num=$(this).text();
var count=num-1;
$('#slider li').filter(":visible").hide();//可见图片隐藏
$('#slider span').filter(".cur").removeClass('cur');//去掉下面序号的样式


if(setting.style==2){
$("#slider").find("li").eq(count).slideDown(setting.atime);//显示点击查看的图片
}else if(setting.style==1){
$("#slider").find("li").eq(count).fadeIn(setting.atime);//显示点击查看的图片
}else{
$("#slider").find("li").eq(count).show(setting.atime);//显示点击查看的图片
}
$(this).addClass('cur');//添加点击后的序号的样式
html=$("#img"+num).html();
$("#li-title").html(html);
});
t=setInterval(showAuto,setting.showtime);
$("#slider").hover(function(){clearInterval(t);},function(){t=setInterval(showAuto,setting.showtime);});
function showAuto(){
n=n>=(length-1)?0:n+1;
$("#slider").find("span").eq(n).trigger("click");
}
    }
})(jQuery);
;(function($){
    //提示信息
    $.mtceo.tip = function(options) {
		console.log(options);
        var settings = {
            content: '',
            icon: 'success',
            time: 2000,
            close: false,
            zindex: 2999
        };
        if(options) {
            $.extend(settings, options);
        }
        if(settings.close){
            $(".tipbox").hide();
            return;
        }
        if(!$('.tipbox')[0]){
            $('body').append('<div class="tipbox"><div class="tip-l"></div><div class="tip-c"></div><div class="tip-r"></div></div>');
            $('.tipbox').css('z-index', parseInt(settings.zindex));
        }
        $('.tipbox').attr('class', 'tipbox tip-' + settings.icon);
        $('.tipbox .tip-c').html(settings.content);
        $('.tipbox').css('z-index', parseInt($('.tipbox').css('z-index'))+1).setmiddle().show();
        
        if(settings.time>0){
            setTimeout(function() {
                $(".tipbox").fadeOut()
            }, settings.time);
        }
    }
})(jQuery);

;(function($) {
    //焦点图
    $.mtceo.photo_slide = function() {
        var f = arguments.length;
        if (! (f != 1 && f < 4)) {
            var a = {},
            a = f >= 4 ? {
                listID: arguments[0],
                listBtnID: arguments[1],
                feedClassName: arguments[2],
                feedWidth: arguments[3],
                feedBoxClass: arguments[4]
            }: arguments[0];
            if (!$.mtceo.util.empty(a) && !$.mtceo.util.empty(a.listID) && !$.mtceo.util.empty(a.listBtnID) && !$.mtceo.util.empty(a.feedClassName) && !$.mtceo.util.empty(a.feedWidth) && $("#" + a.listID).size() != 0) {
                var e = 0,
                d = 1,
                j = null,
                h = [],
                g = null,
                g = $.mtceo.util.empty(a.feedBoxClass) ? $("#" + a.listID + " ul") : $("#" + a.listID + " ." + a.feedBoxClass),
                k = function() {
                    $("#" + a.listBtnID + " li").removeClass("c");
                    $("#" + a.listBtnID + " li").eq(d % e).addClass("c");
                    g.animate({
                        left: "-" + a.feedWidth * 2 + "px"
                    },
                    150, i());
                    d++;
                    d > e && (d = 1)
                },
                f = function() {
                    $("#" + a.listBtnID + " li").each(function(b) {
                        $(this).click(function() {
                            clearInterval(j);
                            $("#" + a.listBtnID + " li").removeClass("c");
                            $(this).addClass("c");
                            b + 1 > d ? (i(b + 1), g.animate({
                                left: "-" + a.feedWidth * 2 + "px"
                            },
                            150)) : b + 1 < d && (i(null, b + 1), g.animate({
                                left: "0px"
                            },
                            150));
                            d = b + 1;
                            j = setInterval(k, 5E3)
                        })
                    })
                },
                i = function(b, c) {
                    if (b == null || b == void 0) b = d % e + 1;
                    if (c == null || b == void 0) c = d - 1 == 0 ? e: d - 1;
                    g.html("").append(h[c - 1].clone()).append(h[d - 1].clone()).append(h[b - 1].clone()).css({
                        left: "-" + a.feedWidth + "px"
                    })
                },
                l = function() {
                    for (var b = $("#" + a.listID + " ." + a.feedClassName).clone(), d = 0; d < b.length; d++) h[d] = b.eq(d)
                },
                m = function() {
                    if (e > 1) for (var b = 0; b < e - 1; b++) $("#" + a.listBtnID + ">ul").append("<li>●</li>")
                },
                e = $("#" + a.listID + " ." + a.feedClassName).size();
                e > 0 && (m(), e > 1 && (l(), f(), i()));
                e > 1 && (j = setInterval(k, 5E3))
            }
        }
    }
})(jQuery);



/* artDialog 5 */
(function(h,k,l){if("BackCompat"===document.compatMode)throw Error("artDialog: Document types require more than xhtml1.0");var m,q=0,p="artDialog"+ +new Date,u=k.VBArray&&!k.XMLHttpRequest,t="createTouch"in document&&!("onmousemove"in document)||/(iPhone|iPad|iPod)/i.test(navigator.userAgent),n=!u&&!t,e=function(a,b,c){a=a||{};if("string"===typeof a||1===a.nodeType)a={content:a,fixed:!t};var d;d=e.defaults;var f=a.follow=1===this.nodeType&&this||a.follow,g;for(g in d)a[g]===l&&(a[g]=d[g]);a.id=f&&
f[p+"follow"]||a.id||p+q;if(d=e.list[a.id])return f&&d.follow(f),d.zIndex().focus(),d;if(!n)a.fixed=!1;if(!a.button||!a.button.push)a.button=[];if(b!==l)a.ok=b;a.ok&&a.button.push({id:"ok",value:a.okValue,callback:a.ok,focus:!0});if(c!==l)a.cancel=c;a.cancel&&a.button.push({id:"cancel",value:a.cancelValue,callback:a.cancel});e.defaults.zIndex=a.zIndex;q++;return e.list[a.id]=m?m.constructor(a):new e.fn.constructor(a)};e.version="5.0";e.fn=e.prototype={constructor:function(a){var b;this.closed=!1;
this.config=a;this.dom=b=this.dom||this._getDom();a.skin&&b.wrap.addClass(a.skin);b.wrap.css("position",a.fixed?"fixed":"absolute");b.close[!1===a.cancel?"hide":"show"]();b.content.css("padding",a.padding);this.button.apply(this,a.button);this.title(a.title).content(a.content).size(a.width,a.height).time(a.time);a.follow?this.follow(a.follow):this.position();this.zIndex();a.lock&&this.lock();this._addEvent();this[a.visible?"visible":"hidden"]().focus();m=null;a.initialize&&a.initialize.call(this);
return this},content:function(a){var b,c,d,f,g=this,e=this.dom.content,j=e[0];this._elemBack&&(this._elemBack(),delete this._elemBack);if("string"===typeof a)e.html(a);else if(a&&1===a.nodeType)f=a.style.display,b=a.previousSibling,c=a.nextSibling,d=a.parentNode,this._elemBack=function(){b&&b.parentNode?b.parentNode.insertBefore(a,b.nextSibling):c&&c.parentNode?c.parentNode.insertBefore(a,c):d&&d.appendChild(a);a.style.display=f;g._elemBack=null},e.html(""),j.appendChild(a),h(a).show();return this.position()},
title:function(a){var b=this.dom,c=b.outer,b=b.title;!1===a?(b.hide().html(""),c.addClass("d-state-noTitle")):(b.show().html(a),c.removeClass("d-state-noTitle"));return this},position:function(){var a=this.dom,b=a.wrap[0],c=a.window,d=a.document,f=this.config.fixed,a=f?0:d.scrollLeft(),d=f?0:d.scrollTop(),f=c.width(),e=c.height(),h=b.offsetHeight,c=(f-b.offsetWidth)/2+a,f=f=(h<4*e/7?0.382*e-h/2:(e-h)/2)+d,b=b.style;b.left=Math.max(c,a)+"px";b.top=Math.max(f,d)+"px";return this},size:function(a,b){var c=
this.dom.main[0].style;"number"===typeof a&&(a+="px");"number"===typeof b&&(b+="px");c.width=a;c.height=b;return this},follow:function(a){var b=h(a),c=this.config;if(!a||!a.offsetWidth&&!a.offsetHeight)return this.position(this._left,this._top);var d=c.fixed,e=p+"follow",g=this.dom,s=g.window,j=g.document,g=s.width(),s=s.height(),r=j.scrollLeft(),j=j.scrollTop(),i=b.offset(),b=a.offsetWidth,k=d?i.left-r:i.left,i=d?i.top-j:i.top,o=this.dom.wrap[0],m=o.style,l=o.offsetWidth,o=o.offsetHeight,n=k-(l-
b)/2,q=i+a.offsetHeight,r=d?0:r,d=d?0:j;m.left=(n<r?k:n+l>g&&k-l>r?k-l+b:n)+"px";m.top=(q+o>s+d&&i-o>d?i-o:q)+"px";this._follow&&this._follow.removeAttribute(e);this._follow=a;a[e]=c.id;return this},button:function(){for(var a=this.dom.buttons,b=a[0],c=this._listeners=this._listeners||{},d=[].slice.call(arguments),e=0,g,k,j,l,i;e<d.length;e++){g=d[e];k=g.value;j=g.id||k;l=!c[j];i=!l?c[j].elem:document.createElement("input");i.type="button";i.className="d-button";c[j]||(c[j]={});if(k)i.value=k;if(g.width)i.style.width=
g.width;if(g.callback)c[j].callback=g.callback;if(g.focus)this._focus&&this._focus.removeClass("d-state-highlight"),this._focus=h(i).addClass("d-state-highlight"),this.focus();i[p+"callback"]=j;i.disabled=!!g.disabled;if(l)c[j].elem=i,b.appendChild(i)}a[0].style.display=d.length?"":"none";return this},visible:function(){this.dom.wrap.css("visibility","visible");this.dom.outer.addClass("d-state-visible");this._isLock&&this._lockMask.show();return this},hidden:function(){this.dom.wrap.css("visibility",
"hidden");this.dom.outer.removeClass("d-state-visible");this._isLock&&this._lockMask.hide();return this},close:function(){if(this.closed)return this;var a=this.dom,b=a.wrap,c=e.list,d=this.config.beforeunload,f=this.config.follow;if(d&&!1===d.call(this))return this;if(e.focus===this)e.focus=null;f&&f.removeAttribute(p+"follow");this._elemBack&&this._elemBack();this.time();this.unlock();this._removeEvent();delete c[this.config.id];if(m)b.remove();else{m=this;a.title.html("");a.content.html("");a.buttons.html("");
b[0].className=b[0].style.cssText="";a.outer[0].className="d-outer";b.css({left:0,top:0,position:n?"fixed":"absolute"});for(var g in this)this.hasOwnProperty(g)&&"dom"!==g&&delete this[g];this.hidden()}this.closed=!0;return this},time:function(a){var b=this,c=this._timer;c&&clearTimeout(c);if(a)this._timer=setTimeout(function(){b._click("cancel")},a);return this},focus:function(){if(this.config.focus)try{var a=this._focus&&this._focus[0]||this.dom.close[0];a&&a.focus()}catch(b){}return this},zIndex:function(){var a=
this.dom,b=e.focus,c=e.defaults.zIndex++;a.wrap.css("zIndex",c);this._lockMask&&this._lockMask.css("zIndex",c-1);b&&b.dom.outer.removeClass("d-state-focus");e.focus=this;a.outer.addClass("d-state-focus");return this},lock:function(){if(this._isLock)return this;var a=this,b=this.dom,c=document.createElement("div"),d=h(c),f=e.defaults.zIndex-1;this.zIndex();b.outer.addClass("d-state-lock");d.css({zIndex:f,position:"fixed",left:0,top:0,width:"100%",height:"100%",overflow:"hidden"}).addClass("d-mask");
n||d.css({position:"absolute",width:h(k).width()+"px",height:h(document).height()+"px"});d.bind("click",function(){a._reset()}).bind("dblclick",function(){a._click("cancel")});document.body.appendChild(c);this._lockMask=d;this._isLock=!0;return this},unlock:function(){if(!this._isLock)return this;this._lockMask.unbind();this._lockMask.hide();this._lockMask.remove();this.dom.outer.removeClass("d-state-lock");this._isLock=!1;return this},_getDom:function(){var a=document.body;if(!a)throw Error('artDialog: "documents.body" not ready');
var b=document.createElement("div");b.style.cssText="position:absolute;left:0;top:0";b.innerHTML=e._templates;a.insertBefore(b,a.firstChild);for(var c=0,d={},f=b.getElementsByTagName("*"),g=f.length;c<g;c++)(a=f[c].className.split("d-")[1])&&(d[a]=h(f[c]));d.window=h(k);d.document=h(document);d.wrap=h(b);return d},_click:function(a){a=this._listeners[a]&&this._listeners[a].callback;return"function"!==typeof a||!1!==a.call(this)?this.close():this},_reset:function(){var a=this.config.follow;a?this.follow(a):
this.position()},_addEvent:function(){var a=this,b=this.dom;b.wrap.bind("click",function(c){c=c.target;if(c.disabled)return!1;if(c===b.close[0])return a._click("cancel"),!1;(c=c[p+"callback"])&&a._click(c)}).bind("mousedown",function(){a.zIndex()})},_removeEvent:function(){this.dom.wrap.unbind()}};e.fn.constructor.prototype=e.fn;h.fn.dialog=h.fn.artDialog=function(){var a=arguments;this[this.on?"on":"bind"]("click",function(){e.apply(this,a);return!1});return this};e.focus=null;e.get=function(a){return a===
l?e.list:e.list[a]};e.list={};h(document).bind("keydown",function(a){var b=a.target,c=b.nodeName,d=/^input|textarea$/i,f=e.focus,a=a.keyCode;f&&f.config.esc&&!(d.test(c)&&"button"!==b.type)&&27===a&&f._click("cancel")});h(k).bind("resize",function(){var a=e.list,b;for(b in a)a[b]._reset()});e._templates='<div class="d-outer"><table class="d-border"><tbody><tr><td class="d-nw"></td><td class="d-n"></td><td class="d-ne"></td></tr><tr><td class="d-w"></td><td class="d-c"><div class="d-inner"><table class="d-dialog"><tbody><tr><td class="d-header"><div class="d-titleBar"><div class="d-title"></div><a class="d-close" href="javascript:;">\u00d7</a></div></td></tr><tr><td class="d-main"><div class="d-content"></div></td></tr><tr><td class="d-footer"><div class="d-buttons"></div></td></tr></tbody></table></div></td><td class="d-e"></td></tr><tr><td class="d-sw"></td><td class="d-s"></td><td class="d-se"></td></tr></tbody></table></div>';
e.defaults={content:'<div class="d-loading"><span>loading..</span></div>',title:"message",button:null,ok:null,cancel:null,initialize:null,beforeunload:null,okValue:"ok",cancelValue:"cancel",width:"auto",height:"auto",padding:"20px 25px",skin:null,time:null,esc:!0,focus:!0,visible:!0,follow:null,lock:!1,fixed:!1,zIndex:99};this.artDialog=h.dialog=h.artDialog=e})(this.art||this.jQuery,this);

/* artDialog plugins */
(function(c){c.alert=c.dialog.alert=function(b,a){return c.dialog({id:"Alert",fixed:!0,lock:!0,content:b,ok:!0,beforeunload:a})};c.confirm=c.dialog.confirm=function(b,a,m){return c.dialog({id:"Confirm",fixed:!0,lock:!0,content:b,ok:a,cancel:m})};c.prompt=c.dialog.prompt=function(b,a,m){var d;return c.dialog({id:"Prompt",fixed:!0,lock:!0,content:['<div style="margin-bottom:5px;font-size:12px">',b,'</div><div><input type="text" class="d-input-text" value="',m||"",'" style="width:18em;padding:6px 4px" /></div>'].join(""),
initialize:function(){d=this.dom.content.find(".d-input-text")[0];d.select();d.focus()},ok:function(){return a&&a.call(this,d.value)},cancel:function(){}})};c.dialog.prototype.shake=function(){var b=function(a,b,c){var h=+new Date,e=setInterval(function(){var f=(+new Date-h)/c;1<=f?(clearInterval(e),b(f)):a(f)},13)},a=function(c,d,g,h){var e=h;void 0===e&&(e=6,g/=e);var f=parseInt(c.style.marginLeft)||0;b(function(a){c.style.marginLeft=f+(d-f)*a+"px"},function(){0!==e&&a(c,1===e?0:1.3*(d/e-d),g,--e)},
g)};return function(){a(this.dom.wrap[0],40,600);return this}}();var o=function(){var b=this,a=function(a){var c=b[a];b[a]=function(){return c.apply(b,arguments)}};a("start");a("over");a("end")};o.prototype={start:function(b){c(document).bind("mousemove",this.over).bind("mouseup",this.end);this._sClientX=b.clientX;this._sClientY=b.clientY;this.onstart(b.clientX,b.clientY);return!1},over:function(b){this._mClientX=b.clientX;this._mClientY=b.clientY;this.onover(b.clientX-this._sClientX,b.clientY-this._sClientY);
return!1},end:function(b){c(document).unbind("mousemove",this.over).unbind("mouseup",this.end);this.onend(b.clientX,b.clientY);return!1}};var j=c(window),k=c(document),i=document.documentElement,p=!!("minWidth"in i.style)&&"onlosecapture"in i,q="setCapture"in i,r=function(){return!1},n=function(b){var a=new o,c=artDialog.focus,d=c.dom,g=d.wrap,h=d.title,e=g[0],f=h[0],i=d.main[0],l=e.style,s=i.style,t=b.target===d.se[0]?!0:!1,u=(d="fixed"===e.style.position)?0:k.scrollLeft(),v=d?0:k.scrollTop(),n=
j.width()-e.offsetWidth+u,A=j.height()-e.offsetHeight+v,w,x,y,z;a.onstart=function(){t?(w=i.offsetWidth,x=i.offsetHeight):(y=e.offsetLeft,z=e.offsetTop);k.bind("dblclick",a.end).bind("dragstart",r);p?h.bind("losecapture",a.end):j.bind("blur",a.end);q&&f.setCapture();g.addClass("d-state-drag");c.focus()};a.onover=function(a,b){if(t){var c=a+w,d=b+x;l.width="auto";s.width=Math.max(0,c)+"px";l.width=e.offsetWidth+"px";s.height=Math.max(0,d)+"px"}else c=Math.max(u,Math.min(n,a+y)),d=Math.max(v,Math.min(A,
b+z)),l.left=c+"px",l.top=d+"px"};a.onend=function(){k.unbind("dblclick",a.end).unbind("dragstart",r);p?h.unbind("losecapture",a.end):j.unbind("blur",a.end);q&&f.releaseCapture();g.removeClass("d-state-drag")};a.start(b)};c(document).bind("mousedown",function(b){var a=artDialog.focus;if(a){var c=b.target,d=a.config,a=a.dom;if(!1!==d.drag&&c===a.title[0]||!1!==d.resize&&c===a.se[0])return n(b),!1}})})(this.art||this.jQuery);