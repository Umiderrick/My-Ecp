// JavaScript Document

/*	
标题：购物车文件
作者：Hanxianwei
创建日期：2013年11月26日  
*/
$(function(){
	//xiugai_nav
	//点击
	function nav_xg(nav_xg){
		$(nav_xg).parent().siblings(".moren_info").toggleClass("hide");
		$(nav_xg).parent().siblings(".modify_info").toggleClass("hide");
	}
	//如果已经有hide  $(this).parent().next().hasClass("hide");
	function nav_xg_hashide(nav_xg_hashide){
		$(nav_xg_hashide).parents(".order_step").addClass("bor3px");
		$(nav_xg_hashide).parents(".order_step").siblings(".order_step").removeClass("bor3px");
		$(nav_xg_hashide).parents(".order_step").siblings().children("h4").children("a").hide();
	}
	//如果没有hide $(this).parent().next().hasClass("hide");
	function nav_xg_nohide(nav_xg_nohide){
		$(nav_xg_nohide).parents(".order_step").removeClass("bor3px");
		$(nav_xg_nohide).parents(".order_step").siblings().children("h4").children("a").show();
		$(nav_xg_nohide).parents(".order_step").siblings().children("h4").children("span").remove();
	}
	
	//a1点击 分别调 nav_xg()/nav_xg_hashide()/nav_xg_nohide()
	$(".a1").click(function(){
		nav_xg(this);
		if($(this).parent().next().hasClass("hide")){
			nav_xg_hashide(this)
			$(this).html("保存收货人信息");
			$(this).parents(".order_step").siblings(".order_step").children("h4").append("<span>如需修改，请先保存联系人信息！</span>")
		}else{
			nav_xg_nohide(this)
			$(this).html("[修改]");
		}
	})
	//a2点击 分别调 nav_xg()/nav_xg_hashide()/nav_xg_nohide()
	$(".a2").click(function(){
		nav_xg(this);
		if($(this).parent().next().hasClass("hide")){
			nav_xg_hashide(this);
			$(this).html("保存支付及配送方式");
			$(this).parents(".order_step").siblings(".order_step").children("h4").append("<span>如需修改，请先保存支付及配送方式！</span>");
		}else{
			nav_xg_nohide(this);
			$(this).html("[修改]");
		}
	})
	//a3点击 分别调 nav_xg()/nav_xg_hashide()/nav_xg_nohide()
	$(".a3").click(function(){
		nav_xg(this);
		if($(this).parent().next().hasClass("hide")){
			nav_xg_hashide(this);
			$(this).html("保存发票信息");
			$(this).parents(".order_step").siblings(".order_step").children("h4").append("<span>如需修改，请先保存发票信息！</span>")
		}else{
			nav_xg_nohide(this);
			$(this).html("[修改]");
		}
	})
	
	//点击保存按钮 分别调 nav_xg_hashide()/nav_xg_nohide()

	$(".btn_address").click(function(){
		$(this).parent().prev(".moren_info").toggleClass("hide");
		$(this).parent(".modify_info").toggleClass("hide");
		if($(this).parent().prev().hasClass("hide")){
			nav_xg_hashide(this);
		}else{
			nav_xg_nohide(this);
			$(this).parent().siblings("h4").children(".xiugai_nav").html("[修改]");
		}
	})
	
	//添加新地址
	$(".use_add_new").click(function(){
		$(this).parent().next().removeClass("hide")	
		$(this).parent().css("background","#fff7ea");
		$(this).parent().siblings().css("background","none");
	})	
	$(".add_bg").click(function(){
		$(this).parent().parent().css("background-color","#fff7ea");
		$(this).parent().parent().siblings().css("background-color","#fff");
	})	
	//选择已有的时候隐藏添加新的
	$(".use_add_new_yy").click(function(){		
		$(this).parents().siblings(".add_new").addClass("hide")
		$(this).parent().css("background","#fff7ea");
		$(this).parent().siblings().css("background","none");
	})
	
	//131224 xianwei
	//选择货到付款，显示货到付款的下一级
	$(".hdfukuan_all").click(function(){
		if($(this).is("input:checked")){
			$(".hdfukuan>dt").children("input:first").attr("checked", "checked");
		}
	})	
	$(".hdfukuan_fz1").click(function(){
		if($(this).is("input:checked")){
			$(".hdfukuan_all").attr("checked", "checked");
		}
	})	
	$(".qtfkfs").click(function(){
		if($(this).is("input:checked")){
			$(".hdfukuan_fz1").removeAttr("checked", "checked");
		}
	})	
	
})
