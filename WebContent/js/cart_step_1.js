// JavaScript Document
/*	
标题：img_scroll文件
作者：hanxianwei
创建日期：2013年11月25日  
*/
$(function(){
	//复选框的js
	$(".cart_list").click(function (evt) {
		var evtEle = $(evt.target).closest("input:checkbox");
		if (!evtEle[0]) {//点击非复选框区域，return	???????????????
			return;
		}
		//点击全选选中所有的
		evtEle.parents(".cart_thead").siblings(".cart_tbody_con").find("input:checkbox").attr("checked", evtEle[0].checked);
			
		//判断是否全部选中，如果全部选中，则"全选"为选中状态 否则取消"全选"的选中！
		if (evtEle.is("input:checked")) {
			//判断父级添加全选
			$(".cart_tbody").each(function () {
				!$(".cart_tbody .row1").children("input:checkbox").filter(function () {
					return !this.checked;					
				})[0]&& $(".cart_thead .row1").children("input:checkbox").attr("checked", "checked");				
			});
		} else {
			//父级取消全选状态
			$(".cart_thead .row1").children("input:checkbox").attr("checked", false);			
		}
	})
//****************************************************************************************************************************************
	//点击显示赠品弹出框
	$(".gift_dialog_nav").click(function(){
		$(this).next().toggleClass("hide");
		$(this).siblings(".gift_dialog").css("z-index","1001");
	})
	//点击隐藏赠品弹出框
	$(".close_gift_dialog").click(function(){
		$(this).parent().toggleClass("hide")
		$(this).parents(".gift_dialog").removeAttr("style");
	})
	//点击删除 弹出框里的取消
	$(".del_goods_qx").click(function(){
		$(this).parents(".alert_del_goods_box").addClass("hide");
		$(".del_goods_ok").unbind("click");/*添加 2013-12-16 xch*/
	})
	//点击删除 弹出框里的关闭
	$(".close_dialog").click(function(){
		$(this).parents(".alert_del_goods_box").addClass("hide");
		$(".del_goods_ok").unbind("click");/*添加 2013-12-16 xch*/
	})
//****************************************************************************************************************************************
	//如果删除到最后一条商品，删除 cart_list
	function del_last_goods(del_last_goods){
		var goods_length = $(".cart_tbody").length;
		if(goods_length == 1){
			$(".cart_list").remove();
			$(".cart_empty").show();
		}else{
			$(del_last_goods).parents(".cart_tbody").remove();
		}
	}
	//套装里的删除
		//套装
		var tz_length = $(".cart_tbody_tz").children(".cart_tbody").length;
		if(tz_length == 2){
			//删除套装，套装里如果最后一个被删除，整个套装框都被删除
			$(".cart_tbody_tz").remove();
		}

	//点击删除弹出确认对话框
	function del_fun(del_obj){
		//点击确认删除
		$(".del_goods_ok").click(function(){
			//在这里做判断，如果删除到最后一个商品的时候，就删除表头、统计这些，也就是整个的 $(".cart_list").remove();
			//del_tz_good(del_obj)
			del_last_goods(del_obj)
			$(".alert_del_goods_box").addClass("hide");
		})
	}
	
	
	//点击右侧"删除"
	$(".alert_del_goods").click(function(){
		var a_top = $(this).offset().top;
		var a_left = $(this).offset().left;
		$(".alert_del_goods_box").css("top",a_top-200+"px");
		$(".alert_del_goods_box").css("left",a_left-900+"px");
		$(".alert_del_goods_box").removeClass("hide");
		//删除对应的商品
		del_fun(this)
	})
	
//****************************************************************************************************************************************
//
	var g_checked = false;
	//定义空的数组，用来保存勾选的商品数据
	var checked_con = []
	//检查是否有选中的商品，如果有，保存到 checked_con 中
	function haschecked(){
		$(".cart_tbody_con").find(":checkbox").each(function (){
			if ($(this).is(":checked")) {
				//如果有选中的，g_checked为 true	
				g_checked = true;
				//把有checked的保存到checked_con中		   
				checked_con = $(".cart_tbody_con").find(":checked");
			}
		});
	}
	
	//点击左侧"删除选中的商品"
	$(".del_goods_checked").click(function(){
		haschecked()
		//判断是否有选中的checkbox 商品
		//如果有可以删除
		if(g_checked){
			//alert("有商品被选中")
			var a_top = $(this).offset().top;
			var a_left = $(this).offset().left;
			$(".alert_del_goods_box").css("top",a_top+20+"px");
			$(".alert_del_goods_box").css("left",a_left+"px");
			$(".alert_del_goods_box").removeClass("hide");
			//执行删除
			del_checked_goods()
		}
		//如果没有，弹出提示
		else{
			alert("请至少选择一款商品")	
		}
	})
	//点击删除弹出确认对话框
	function del_checked_goods(){
		//点击确认删除
		$(".del_goods_ok").click(function(){
			//查找里面的商品个数 和被选中商品个数
			var num_all_checkbox = $(".cart_tbody_con").find(":checkbox").length;
			var num_checked_checkbox = $(".cart_tbody_con").find(":checked").length;
			//判断是部分被选中，还是全部选中，如果全部选中，同时删除标题和统计标签并且显示空购物车提示
			if(num_all_checkbox!=num_checked_checkbox){
				//被选中的父级为 cart_tbody 的删除
				$(checked_con).parents(".cart_tbody").remove();		
				$(".alert_del_goods_box").addClass("hide")		
			}
			else{//如果全部选中，同时删除标题和统计标签并且显示空购物车提示
				$(".cart_list").remove();
				$(".cart_empty").show();						
			}
		})
	}
	//****************************************************************************************************************************************
	//点击加减号增加商品数量
	//减商品个数
	$(".jian_goods").click(function(){
		var g_num = $(this).siblings(".num").val() - 1;
		if(g_num < 1){				
			alert("是否删除此商品？")
			//goods_length 购物车商品个数
			del_last_goods(this)
		}else{
			$(this).siblings(".num").val(g_num)
		}
		var price = $(this).parent().parent().siblings(".row3").find(".p_price").text();
		var old_sum = $("#price_sum").text();
		var new_sum = parseFloat(old_sum) - parseFloat(price);
		if(new_sum < 0) new_sum = 0;
		$("#price_sum").text(new_sum);
	})
	//加商品个数
	$(".jia_goods").click(function(){
		var num = parseInt($(this).siblings(".num").val())+1;
		$(this).siblings(".num").val(num);
		var price = $(this).parent().parent().siblings(".row3").find(".p_price").text();
		var old_sum = $("#price_sum").text();
		$("#price_sum").text(parseFloat(old_sum) + parseFloat(price));
	})
	
	
	function caculateSum() {
		var cl_nums = $(".num");
		var cl_prices = $(".p_price");
		var sum = 0;
		if(cl_nums.length==cl_prices.length) {
			for(var i = 0; i < cl_nums.length; i++) {
				var num = parseInt(cl_nums.eq(i).val());
				var price = parseFloat(cl_prices.eq(i).text());
				sum += num*price;
			}
		}
		$("#price_sum").text(sum);
	}
	caculateSum();
})


