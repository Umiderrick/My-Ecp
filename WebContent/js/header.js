// JavaScript Document
/*	
标题：index文件
作者：yuxingyang
创建日期：2013年11月29日  
*/
function offset_btn(){
	var client_rect=$(this).offset();
	var client_l=client_rect.left;
	var self_w=$(this).outerWidth();
	return {client_l:client_l,self_w:self_w};
}
function litile_pic(){
		$(this).addClass("cur").siblings().removeClass("cur");
		return false;
	}
function fScrollTop(){
	var 
		top_tip=$(".top_Tip"),
		time_stop,
		pageY;
	window.onscroll=function(){
	pageY=window.pageYOffset||document.documentElement.scrollTop;
		if(!pageY){
			top_tip.hide();	
			clearInterval(time_stop);
			return;
		}	
		top_tip.show();
	}
	top_tip.click(function(){
		time_stop=setInterval(function(){
			window.scrollBy(0,-100);		
		},10)
		return false;
	})
}
function func_btn(){
		var m=$(".ui_header_logo_posi_cart").find(".wrap_middle_one");
		$(".gowuche").children("i").text(m.length);
		$(".middle_one_close").click(function(){
			$(this).parent(".wrap_middle_one").remove();	
			var m=$(".ui_header_logo_posi_cart").find(".wrap_middle_one");
			$(".gowuche").children("i").text(m.length);
			var ss=$(this).parents(".wrap_middle_one").eq(0).parent();
			if(m.length<=0){
				var sc=$(this).parent();
				$("div.ui_header_logo_posi_cart").eq(0).remove();
				$("div.ui_header_logo_posi_cart.kong").show().css("left",client_l+"px");
			}
		})
		$(".ui_header_logo_func>a").hover(function(){
			$(this).addClass("cur").siblings("a").removeClass("cur");
			var n=$(".ui_header_logo_func>a").index(this);
			
			var offset_btn=window.offset_btn.call(this);
			var div_w=$(".ui_header_logo_posi>div").eq(n).outerWidth();
			client_l=offset_btn.client_l-div_w+offset_btn.self_w;
			
			if(n==1&&m.length==0){
				var div_w=$(".ui_header_logo_posi>div.kong").outerWidth();
				client_l=offset_btn.client_l-div_w+offset_btn.self_w;
				$(".ui_header_logo_posi>div.kong").css("left",client_l+"px").show();	
				return;
			}
			$(".ui_header_logo_posi>div").eq(n).show().css("left",client_l+"px").siblings().hide();
		},function(){
				$(this).removeClass("cur");	
				var n=$(".ui_header_logo_func>a").index(this);
				if(n==1&&m.length==0){
					$(".ui_header_logo_posi>div.kong").hide();	
					return;
				}
				$(".ui_header_logo_posi>div").eq(n).hide();
		})
		if(IeBrowser(6.0)){
			$(".ui_header_logo_posi>div").hide();
		}
			$(".ui_header_logo_posi>div").hover(function(){
				$(this).show();
				var n=$(".ui_header_logo_posi>div").index(this);
				if(n==2&&m.length==0){
					$(".ui_header_logo_func>a").eq(1).addClass("cur");
					return;
				}
				$(".ui_header_logo_func>a").eq(n).addClass("cur");
		},function(){
				$(this).hide();
				var n=$(".ui_header_logo_posi>div").index(this);
				if(n==2&&m.length==0){
					$(".ui_header_logo_func>a").eq(1).removeClass("cur");
					return;
				}
				$(".ui_header_logo_func>a").eq(n).removeClass("cur");
		})	
	}
function colorChange(){
	$(".second_menu li:odd").css("background","#f1f1f1");	
}
$(function(){
	colorChange();
	func_btn();	
})

