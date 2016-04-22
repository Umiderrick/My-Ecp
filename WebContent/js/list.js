// JavaScript Document
/*	
标题：商品列表页js文件
作者：umiderrick
*/
 
/* begin 左侧菜单点击特效*/
$(document).ready(function() {
		 $(".list_menu_wrap h3").click(function(){
			$(this).next().toggleClass("hide");	
		})
});
/* end 左侧菜单点击特效*/
	   

/* begin 右侧商品筛选  */
$(function() {	
        var f = $("#select_brand .content"), 
        h = $("#select_hold"),	
        g = "77px",
		k=$(".extra"),
		len=f.find(".all_txt>a").length;
	    f.css("height", g); 
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


  
  
  
/* 商品展示*/	  
	function show(itemid) {
		$.post("../item/ItemshowServlet", {
			"itemid" : itemid
		}, window.location.href = '../item/pshow.jsp');
	}

/* 关键字查询*/
	function listsearch() {
		var pattern = document.getElementById('search').value;
			if(pattern==""){
				window.location.href = "list_search_noresult.jsp"
			}else{
				$.post("../IndexServlet", {
					"pattern" : pattern
				},window.location.href = "list_search.jsp");
			}
		}

	
/* 子类别查询*/
	function attrigsearch(attrigid) {
		$.post("ListSearchServlet", {
			"attrigid" : attrigid
		}, function() {
			window.location.href = 'list_search.jsp';
		});
	}
	
/* 分页查询*/	
	function topfilter(num) {
		$.get("ListSearchServlet", {
			"num" : num
		}, window.location.href = 'list_search.jsp');
	}


