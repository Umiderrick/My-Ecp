/*	
标题：帮助中心文件
作者：xucaihua
创建日期：2013年12月03日  
*/
/* begin 左侧菜单 */

$(function(){
  $(".help_menu_wrap h3").click(function(){ 
		  $(this).next().toggleClass("hide");	
			if ($(this).next().attr("class") == "hide") 
			{
				 $(this).children("i").removeClass("icon_plus").addClass("icon_add01");
			}
			else{ 
				  $(this).children("i").removeClass("icon_add01").addClass("icon_plus");	
				}
		    })
		
		 $("li").hover(function(){
				 $(this).children("a").children("i").removeClass("icon_list").addClass("icon_list_hover");
			},function(){
				 $(this).children("a").children("i").removeClass("icon_list_hover").addClass("icon_list");	
			});
}); 
/* end 左侧菜单 */