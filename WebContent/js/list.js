// JavaScript Document
/*	
标题：商品列表页js文件
作者：xucaihua
创建日期：2013年11月19日  
*/
 
/* begin 左侧菜单点击特效*/
$(document).ready(function() {
		 $(".list_menu_wrap h3").click(function(){
			$(this).next().toggleClass("hide");	
		})
});
/* end 左侧菜单点击特效*/
	   
/* begin 一周销量排行榜片鼠标划过特效  */
$(function (){
    var firstNode = $("#weekRank li").eq(0);
    function  bindEvent(linode,i){
	linode.bind('mouseover',function(){	
	$(this).find(".p_name>a").removeClass("ie_bug").end().siblings("li").find(".p_name>a").addClass("ie_bug");
			firstNode.removeClass('fore1').find('.p_img').hide();
			firstNode.find('.p_price').hide();
			linode.addClass('fore1').find('.p_img').show();
			linode.find('.p_price').show();
	}).bind('mouseout',function(){
					$(this).find(".p_name>a").addClass("ie_bug");
					linode.removeClass('fore1').find('.p_img').hide();
					linode.find('.p_price').hide();
					firstNode.addClass('fore1').find('.p_img').show();
					firstNode.find('.p_price').show();
					
			});
		$(".week_rank").mouseleave(function(){
			firstNode.find(".p_name>a").removeClass("ie_bug")
		})
	}
	$("#weekRank li").each(function(i){
		if(i!==0){
			$(this).find(".p_name>a").addClass("ie_bug");
		}
		var linode = $(this);
		bindEvent(linode,i);
	});
});

/* end 一周销量排行榜片鼠标划过特效  */

/* begin 右侧商品筛选  */
$(function() {	
        var f = $("#select_brand .content"), 
        h = $("#select_hold"),	
        g = "77px",
		k=$(".extra"),
		len=f.find(".all_txt>a").length;
	    f.css("height", g); 
		if($.browser.msie&&(($.browser.version == "6.0")||($.browser.version == "7.0"))){ f.css("height", "72px"); }
		if(len<=18){//少于3行隐藏展开与收起
				h.hide();
				if(len<=6){ f.css("height","30px"); }
				if(len<=12&&len>6){f.css("height","55px"); }
		}else{//多于3行出现展开与收起
			h.show();
		    h.bind("click",function() {
            if ($(this).attr("class") != "open") {
			  f.css("height", "auto");  
			  h.html("收起<i class='icon_arrowup'></i>").attr("class", "open")
            } else {
                f.css("height", g); 
				if($.browser.msie&&(($.browser.version == "6.0")||($.browser.version == "7.0"))){ f.css("height", "72px"); }
                h.html("展开<i class='icon_arrowdown'></i>").attr("class", "close");
            }//end else	
		   })
		}
		/*begin 重置筛选条件默认收起*/
		 k.bind("click",function() {
            if (h.attr("class") == "open") {
               f.css("height", g); 
			   if($.browser.msie&&($.browser.version == "7.0")){ f.css("height", "72px"); }
               h.html("展开<i class='icon_arrowdown'></i>").attr("class", "close")
            }
        });
	  /*end 重置筛选条件默认收起*/  
	  /*begin 选中品牌 添加背景颜色 字体变色*/  

	 
	   $(".brand").hover(function(){ 
	   if($(this).hasClass("curr"))
	   {
       $(this).removeClass("curr").addClass("no_bg");
	   }
	   $(this).addClass("hove");
		},function(){ 
		    if($(this).hasClass("no_bg"))
		    { 
			   $(this).removeClass("no_bg").addClass("curr");
		    }
			$(this).removeClass("hove");
		});
		
		

		
/*	 $(".content>.all_txt a span").mouseleave(function(){  
	  $(this).addClass("curr");
	 }) 
	 */
	 
/*	 $(".content>.all a").click(function(){
	  $(this).addClass("curr"); 
	  $(this).parent().next().children("a").children("span").removeClass("curr"); 
	  })
	*/
	 
	/* $(".content>.all_txt a span").mouseout((function(){  
	  $(this).addClass("curr");
	  })*/
	  
	 /* $(".content>.all_txt a span").click(function(){  
	  $(this).addClass("curr").parent().css("background-color","#fff");
	  $(this).parent().siblings().children("span").removeClass("curr"); 
	  $(this).parent("a").parent("div").prev().children("a").removeClass("curr"); 
	  }) 
	  $(".content>.all_txt a span").mouseover(function(){  
	  $(this).addClass("curr").parent().css("background-color","#fff");
	  $(this).parent().siblings().children("span").removeClass("curr"); 
	  $(this).parent("a").parent("div").prev().children("a").removeClass("curr"); 
	  }) 
	  $(".all_txt:not(:first) a").click(function(){
	  $(this).addClass("curr");
	  $(this).siblings().removeClass("curr"); 
	  $(this).parent().prev().children("a").removeClass("curr"); 
	  })  
	  $(".all:not(:first)> a").click(function(){
	  $(this).addClass("curr"); 
	  $(this).parent().next().children("a").removeClass("curr"); 
	  }) 
	  $(".content>.all a").click(function(){
	  $(this).addClass("curr"); 
	  $(this).parent().next().children("a").children("span").removeClass("curr"); 
	  })
	  $(".content>.all a").mouseover(function(){
	  $(this).addClass("curr"); 
	  $(this).parent().next().children("a").children("span").removeClass("curr"); 
	  })*/
	 /*end 选中品牌 添加背景颜色 字体变色*/
	 $(".tab>li a").click(function(){$(this).addClass("hove").parent("li").siblings().children("a").removeClass("hove");})
    });	
/* end 右侧商品筛选 */

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

/* begin 商品排序上一页下一页鼠标放上切换 */
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
/* end 商品排序上一页下一页鼠标放上切换*/		

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


