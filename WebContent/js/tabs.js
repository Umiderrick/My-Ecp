// JavaScript Document
function tabs(){
	$(".tab_change>a").click(function(){
		$(this).addClass("cur").siblings("a").removeClass("cur");	
		var index=$(".tab_change>a").index(this);
		$(".tab_change_con>div.tab_con").eq(index).show().siblings().hide();
		return false;
	})
	$(".tab_change>a").each(function(index) {
		if($(this).hasClass("cur")){
			$(".tab_change_con>div.tab_con").eq(index).show();
		}
	});	
}
function fChangeTab(){
	var oSpan=$(".tab_con").eq(0).find("span:contains(我要投诉)").parent();
	oSpan.click(function(){
		$(".page_wrap").hide();
		$(".tab_change>a:last").fadeIn().trigger("click");
		$(".tab_change>a:not(:last)").on("click",function(){
			$(".tab_change>a:last").fadeOut()	
		})
		$("#submit").bind("click",function(){
			$(this).parents("div.tab_con").fadeOut();	
			$(".tab_change>a").eq(2).fadeOut();
			$(".tab_change>a").eq(1).trigger("click");
			$("#submit").children("span").unbind("click");
			$(".page_wrap").show();
		})
	})	
}
$(function(){
	tabs();	
})