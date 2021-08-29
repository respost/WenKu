/**
 * **********************顶部折叠广告位************************
 */
$(function(){
	//将内容插入到body开始处，页面加载完毕后自动展开
	$('.top-adver').slideDown(1500);
	//设置延时函数
	function adsUp(){
		$('.top-adver').animate({height:'0px'						 
		},1000);	
	}
	//五秒钟后自动收起
	var t = setTimeout(adsUp,5000);
});