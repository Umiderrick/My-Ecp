/*	
标题：user_menu_list用户中心文件
作者：xucaihua
创建日期：2013年11月27日  
*/
/* begin 左侧菜单点击特效*/
$(document).ready(function() {
		$(".sort_menu_wrap h3").click(function(){
			if ($(this).attr("class") == "open") 
			{
				 $(this).addClass("close").removeClass("open");
				 $(this).children("i").next().removeClass("icon_arrowup").addClass("icon_arrowdown");
			 
			}
			else{
				
				  $(this).addClass("open").removeClass("close");
				  $(this).children("i").next().removeClass("icon_arrowdown").addClass("icon_arrowup");	
				
				}
			
			$(this).next().toggleClass("hide");	
		})
});
/* end 左侧菜单点击特效*/
