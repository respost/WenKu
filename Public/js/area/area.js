;(function($){
/**
 * jQuery :  省市县联动插件
 * @author   kxt
 * @example  $("#test").province_city_county();
 */
$.fn.province_city_county = function(v_province,v_city,v_county){
	var myarea = this;
	//alert();
	//插入3个空的下拉框
	//myarea.append("<select id='province' name='province'></select>");
	//myarea.append("<select id='city' name='city'></select>");
	//myarea.append("<select id='county' name='county'></select>");
    myarea.html("<select id='province' name='province' style='width: 100px'></select>" +
    		"<select id='city' name='city' style='width: 100px'></select>" +
    		"<select id='county' name='county' style='width: 100px'></select>");
	//分别获取3个下拉框
	var sel1 = myarea.find("select").eq(0);
	var sel2 = myarea.find("select").eq(1);
	var sel3 = myarea.find("select").eq(2);
	//alert(ROOT_PATH+'/Public/js/area/province_city.xml');
	//定义3个默认值
	myarea.data("province",["请选择", ""]);
	myarea.data("city",["请选择", ""]);
	myarea.data("county",["请选择", ""]);
	//默认省级下拉
	if(myarea.data("province")){
		sel1.append("<option value='"+myarea.data("province")[1]+"'>"+myarea.data("province")[0]+"</option>");
	}
	//默认城市下拉
	if(myarea.data("city")){
		sel2.append("<option value='"+myarea.data("city")[1]+"'>"+myarea.data("city")[0]+"</option>");
	}
	//默认县区下拉
	if(myarea.data("county")){
		sel3.append("<option value='"+myarea.data("county")[1]+"'>"+myarea.data("county")[0]+"</option>");
	}
	$.get('./public/js/area/province_city.xml', function(data){
		var arrList = [];
		$(data).find('province').each(function(){
			var $province = $(this);
			sel1.append("<option value='"+$province.attr('value')+"'>"+$province.attr('value')+"</option>");
		});
		if(typeof v_province != 'undefined'){
			sel1.val(v_province);
			sel1.change();
		}
	});
	
	//省级联动控制
	var index1 = "" ;
	var provinceValue = "";
	var cityValue = "";
	sel1.change(function(){
		//清空其它2个下拉框
		sel2[0].options.length=0;
		sel3[0].options.length=0;
		index1 = this.selectedIndex;
		if(index1 == 0){	//当选择的为 "请选择" 时
			if(myarea.data("city")){
				sel2.append("<option value='"+myarea.data("city")[1]+"'>"+myarea.data("city")[0]+"</option>");
			}
			if(myarea.data("county")){
				sel3.append("<option value='"+myarea.data("county")[1]+"'>"+myarea.data("county")[0]+"</option>");
			}
		} else{
			provinceValue = $('#province').val();
			$.get('./public/js/area/province_city.xml', function(data){
				$(data).find("province[value='"+provinceValue+"'] > city").each(function(){
					var $city = $(this);
					sel2.append("<option value='"+$city.attr('value')+"'>"+$city.attr('value')+"</option>");
				});
				cityValue = $("#city").val();
				$(data).find("city[value='"+cityValue+"'] > county").each(function(){
					var $county = $(this);
					sel3.append("<option value='"+$county.attr('value')+"'>"+$county.attr('value')+"</option>");
				});

                if(typeof v_city != 'undefined'){
                    sel2.val(v_city);
                    sel2.change();
                }

                if(typeof v_county != 'undefined'){
                    sel3.val(v_county);
                }
			});
		}
	}).change();
	//城市联动控制
	sel2.change(function(){
		sel3[0].options.length=0;
		var cityValue2 = $('#city').val();
		$.get('./public/js/area/province_city.xml', function(data){
			$(data).find("city[value='"+cityValue2+"'] > county").each(function(){
				var $county = $(this);
				sel3.append("<option value='"+$county.attr('value')+"'>"+$county.attr('value')+"</option>");
			});
            if(typeof v_county != 'undefined'){
            	sel3.val(v_county);
            }
		});
	}).change();
	return myarea;
};
})(jQuery);