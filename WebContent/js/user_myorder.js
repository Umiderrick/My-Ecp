// JavaScript Document
/*	
标题：用户中心---我的订单js文件
作者：xucaihua
创建日期：2013年12月05日  
*/
 
/*  begin ============================等待发货弹出框的显示==================================    */
$(function(){
	$(".dialog_nav").hover(function(){
		$(this).next().removeClass("hide");
	})
	$(".myorder_list").hover(function(){
		$(".dialog").addClass("hide");
	})
	$(".close_dialog").click(function(){
		$(this).parent().toggleClass("hide").removeAttr("style")
	})
	
})
/*   end ============================等待发弹出框的显示货==================================   */

$(function(){
	//点击删除 弹出框里的取消
	$(".del_goods_qx").click(function(){
		$(this).parents(".alert_del_goods_box").addClass("hide");
		$(".del_goods_ok").unbind("click")
	})
	//点击删除 弹出框里的关闭
	$(".close_dialog").click(function(){
		$(this).parents(".alert_del_goods_box").addClass("hide");
		$(".del_goods_ok").unbind("click");
	})
	
//****************************************************************************************************************************************//
	//点击删除弹出确认对话框
	function del_fun(del_obj){
		//点击确认删除
		$(".del_goods_ok").click(function(){
			$(".alert_del_goods_box").addClass("hide")
			$(del_obj).parents("tr").remove();
		})	
	}
	//点击右侧"删除"
	$(".alert_del_goods").click(function(){
	    $(".cancel_order_goods_box").addClass("hide");
		var a_top = $(this).offset().top;
		//var a_left = $(this).offset().left;		
		$(".alert_del_goods_box").css("top",a_top-300+"px");
		$(".alert_del_goods_box").css("right",20+"px");
		$(".alert_del_goods_box").removeClass("hide");
		//删除对应的商品
		del_fun(this);		
	})
//---------------   取消订单  ---------------------------------------
	$(".cancel_order_goods").click(function(){
	    $(".alert_del_goods_box").addClass("hide");
		var a_top = $(this).offset().top;
		//var a_left = $(this).offset().left;		
		$(".cancel_order_goods_box").css("top",a_top-300+"px");
		$(".cancel_order_goods_box").css("right",20+"px");
		$(".cancel_order_goods_box").removeClass("hide");
		//删除对应的商品
		del_fun2(this);		
	})
	//点击删除弹出确认对话框
	function del_fun2(del_obj){
		//点击确认删除
		$(".cancel_order_ok").click(function(){
			$(".cancel_order_goods_box").addClass("hide")
			$(del_obj).parents("tr").remove();
		})
	}
})
$(function(){
	//点击删除 弹出框里的取消
	$(".cancel_order_qx").click(function(){
		$(this).parents(".cancel_order_goods_box").addClass("hide");
		$(".cancel_order_ok").unbind("click")
	})
	//点击删除 弹出框里的关闭
	$(".cancel_close_dialog").click(function(){
		$(this).parents(".cancel_order_goods_box").addClass("hide");
		$(".cancel_order_qx").unbind("click");
	})
})	