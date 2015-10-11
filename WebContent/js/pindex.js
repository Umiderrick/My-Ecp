// JavaScript Document
/*	
标题：商户首页js文件
作者：xucaihua
创建日期：2013年11月19日  
*/
/* begin 水灵动漫商户首页 浏览器的自适应 */
$(function(){	  
	$(".tip_nav>li:has(.second)").on({"mouseenter":function(){
		var offset_btn=window.offset_btn.call(this);
		client_l=offset_btn.client_l;
		$(".ui_commercial_index").show().css("left",(client_l+10)+"px");
		},"mouseleave":function(){
			$(".ui_commercial_index").hide();
		}
	})
	//
	$(".ui_commercial_index").on({"mouseenter":function(){
		//var offset_btn=window.offset_btn.call(this);
		client_l=offset_btn.client_l;
		$(this).show().css("left",(client_l+10)+"px");
		},"mouseleave":function(){
			$(this).hide();
		}
	})
});
/* end 水灵动漫商户首页 浏览器的自适应 */


/* begin 实现鼠标放上图片呈现阴影效果*/
function img_hover(dom){
	dom.children().mouseover(function(){
		$(this).addClass("hove").siblings().removeClass("hove");	
	})	
	dom.mouseout(function(){
		$(this).children("li").removeClass("hove");
	})
} 
$(function(){
	img_hover($(".filter_goods"));	
})
/* end 实现鼠标放上图片呈现阴影效果*/


/* begin 上一页下一页鼠标放上切换*/
 $(function(){
		$("#pre").hover(function(){
				 $(this).removeClass("pre_disabled").addClass("pre_able");
				 $("#next").removeClass("next_able").addClass("next_disabled");
			},function(){
				 $(this).removeClass("pre_able").addClass("pre_disabled");	
				  $("#next").removeClass("next_disabled").addClass("next_able");
				 
			});
				$("#next").hover(function(){
				 $(this).removeClass("next_disabled").addClass("next_able");
				 $("#pre").removeClass("pre_able").addClass("pre_disabled");
			},function(){
				 $(this).removeClass("next_able").addClass("next_disabled");	
				  $("#pre").removeClass("pre_disabled").addClass("pre_able"); 
			});
		
	})	
/* end 上一页下一页鼠标放上切换*/

/* begin 左侧菜单点击特效*/
$(document).ready(function() {
		$(".pindex_menu_wrap h3").click(function(){
			if ($(this).attr("class") == "open") 
			{
				 $(this).addClass("close").removeClass("open");
			 
			}
			else{
				  $(this).addClass("open").removeClass("close");	
				}
			$(this).next().toggleClass("hide");	
		})
});
/* end 左侧菜单点击特效*/
    
/* begin 点击切换页签效果 并给价格页签增加上下箭头切换效果*/	
   $(function(){
	$(".order>dl>dd").click(function(){
	   //点击切换背景颜色  
	   $(this).children('a').addClass('cur');
	   $(this).siblings().children('a').css("padding-right","12px").removeClass('cur').children('i').removeClass();
	   //点击价格出现上下箭头 并切换
	   if($(this).children('a').children('i').attr("class")=="icon_orderdown")
		{   //点击价格出现下箭头 切换成上箭头
			 $(this).children('a').css("padding-right","20px").children('i').removeClass("icon_orderdown").addClass("icon_orderup");	 
		} else {
				if($(this).children('a').children('i').attr("class")=="icon_orderup")
				{    //点击价格出现上箭头 切换成下箭头
					  $(this).children('a').css("padding-right","20px").children('i').removeClass("icon_orderup").addClass("icon_orderdown");	 
				}else{ 
					   //点击价格增加上箭头 
					   if($(this).attr("class")=="price")
					   {
							$(this).children('a').css("padding-right","20px").addClass('cur').children('i').addClass("icon_orderup");
					   } 
					}
	   }//end if else
	})
  })
 /* begin 点击切换页签效果 并给价格页签增加上下箭头切换效果*/	 


